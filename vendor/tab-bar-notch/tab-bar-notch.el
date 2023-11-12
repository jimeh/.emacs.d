;;; tab-bar-notch.el --- Adjust tab bar height for MacBook Pro notch -*- lexical-binding: t; -*-

;; Author: Jim Myhrberg <contact@jimeh.me>
;; URL: https://github.com/jimeh/.emacs.d/tree/master/vendor/tab-bar-notch
;; Package-Requires: ((emacs "27.1"))
;; Keywords: convenience, hardware
;; Version: 0.0.3

;; This file is not part of GNU Emacs.

;;; License:
;;
;; Copyright (c) 2023 Jim Myhrberg
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;;
;; Automatically resize height of tab-bar to match height of the physical notch
;; on modern MacBook Pro displays in fullscreen mode. This prevents buffer
;; content from being hidden behind the physical notch.
;;
;; To use, simply add 'tab-bar-notch-spacer to tab-bar-format. This will
;; automatically adjust the height of the tab bar as needed when the frame is
;; resized.

;;; Code:

(require 'cl-lib)

(defgroup tab-bar-notch nil
  "Adjust the tab bar height for MacBook Pro's camera notch."
  :group 'convenience
  :prefix "tab-bar-notch-")

(defcustom tab-bar-notch-screen-sizes '((1.539 . 3.513)  ; 14-inch MacBook Pro
                                        (1.547 . 3.088)) ; 16-inch MacBook Pro
  "List screen size ratios and their relative notch heights.

The first value is the width-to-height ratio, and the second
value is the height of camera notch as a percentage (0.0-100.0)
of the screen height."
  :type '(alist :key-type float :value-type float)
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-screen-ratio-tolerance 0.001
  "Tolerance for the target ratio to accommodate minor variations."
  :type 'float
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-normal-fullscreen-height 1.0
  "Height multiplier when in fullscreen without a notch."
  :type 'float
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-normal-height 1.0
  "Height multiplier when in not in fullscreen."
  :type 'float
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-max-height 10.0
  "Maximum height multiplier allowed."
  :type 'float
  :group 'tab-bar-notch)

(defvar tab-bar-notch--next-face-id 1
  "Internal variable to keep track of next face ID.")

;;;###autoload
(defun tab-bar-notch-spacer ()
  "Return an invisible character with custom face for setting height."
  (if (not window-system)
      " "
    (if (not (memq 'tab-bar-notch-adjust-height window-size-change-functions))
        (add-hook 'window-size-change-functions 'tab-bar-notch-adjust-height))

    (propertize " " 'face (tab-bar-notch--face-name))))

(defun tab-bar-notch-adjust-height (&optional frame)
  "Adjust the height of the tab bar of FRAME."
  (if (not (memq 'tab-bar-notch-spacer tab-bar-format))
      ;; Remove hook if notch spacer is not included in tab-bar-format.
      (remove-hook 'window-size-change-functions 'tab-bar-notch-adjust-height))

  (let* ((face-name (tab-bar-notch--face-name frame))
         (current-height (face-attribute face-name :height frame))
         (new-height (tab-bar-notch--calculate-face-height frame)))

    (if (not (tab-bar-notch--floateq current-height new-height))
        (set-face-attribute face-name nil :height new-height))))

(defun tab-bar-notch--face-name (&optional frame)
  "Return the name of the face used for the tab bar of FRAME."
  (let* ((frame (or frame (selected-frame)))
         (face-name (frame-parameter frame 'tab-bar-notch--face-name)))
    (if face-name
        face-name
      (setq face-name (intern (format "tab-bar-notch--face-%d"
                                      tab-bar-notch--next-face-id))
            tab-bar-notch--next-face-id (1+ tab-bar-notch--next-face-id))
      (make-face face-name)
      (set-face-attribute face-name nil :height 1.0)
      (set-frame-parameter frame 'tab-bar-notch--face-name face-name)
      face-name)))

(defun tab-bar-notch--notch-height (width height)
  "Return the notch height for the given screen WIDTH and HEIGHT.

Returns 0 if no aspect ratio match is found."
  (let* ((ratio (/ (float width) height))
         (matched-pair (cl-find-if (lambda (pair)
                                     (tab-bar-notch--floateq
                                      ratio (car pair)
                                      tab-bar-notch-screen-ratio-tolerance))
                                   tab-bar-notch-screen-sizes)))
    (if matched-pair
        (round (* height (/ (cdr matched-pair) 100)))
      0)))

(defun tab-bar-notch--calculate-face-height (&optional frame)
  "Calculate the face height value of the tab bar of FRAME."
  (let* ((frame (or frame (selected-frame)))
         (face-height (if (tab-bar-notch--fullscreen-p frame)
                          (let ((notch (tab-bar-notch--notch-height
                                        (frame-pixel-width frame)
                                        (frame-pixel-height frame))))
                            (if (> notch 0)
                                (/ notch (float (frame-char-height frame)))
                              tab-bar-notch-normal-fullscreen-height))
                        tab-bar-notch-normal-height)))
    (min (max face-height 1.0) tab-bar-notch-max-height)))

(defun tab-bar-notch--fullscreen-p (&optional frame)
  "Determine if FRAME is in fullscreen mode."
  (not (eq (frame-parameter (or frame (selected-frame)) 'fullscreen) nil)))

(defun tab-bar-notch--floateq (float1 float2 &optional tolerance)
  "Check if FLOAT1 and FLOAT2 are nearly equal.

TOLERANCE specifies the maximum difference for them to be
considered equal. If TOLERANCE is nil, 0.000001 will be used."
  (< (abs (- (if (floatp float1) float1 0.0)
             (if (floatp float2) float2 0.0)))
     (or tolerance 1e-6)))

(provide 'tab-bar-notch)

;;; tab-bar-notch.el ends here
