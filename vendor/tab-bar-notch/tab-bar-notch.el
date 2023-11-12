;;; tab-bar-notch.el --- Adjust tab bar height for MacBook Pro notch -*- lexical-binding: t; -*-

;; Author: Jim Myhrberg <contact@jimeh.me>
;; URL: https://github.com/jimeh/.emacs.d/tree/master/vendor/tab-bar-notch
;; Package-Requires: ((emacs "27.1"))
;; Keywords: convenience, hardware
;; Version: 0.0.2

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

(defcustom tab-bar-notch-fullscreen-ratios '(1.539  ; 14-inch MacBook Pro
                                             1.547) ; 16-inch MacBook Pro
  "List of target width-to-height ratios.

When frame width vs height ratio matches any of these, and
fullscreen is enabled, we can relatively safely assume the frame
is being rendered behind the camera notch."
  :type '(repeat float)
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-fullscreen-ratio-tolerance 0.001
  "Tolerance for the target ratio to accommodate minor variations."
  :type 'float
  :group 'tab-bar-notch)

(defcustom tab-bar-notch-screen-height-percentage 3.51
  "Percentage of screen height covered by the physical notch.

Used to calculate the height of the tab-bar when in fullscreen
behind the notch."
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

(defface tab-bar-notch-spacer-face
  '((t :inherit nil))
  "Face for invisible character which can be used to modify bar height."
  :group 'tab-bar-notch)

(defvar tab-bar-notch--next-face-id 1
  "Internal variable to keep track of next face ID.")

;;;###autoload
(defun tab-bar-notch-spacer ()
  "Return an invisible character with custom face for setting height."
  (if (not (memq 'tab-bar-notch-adjust-height window-size-change-functions))
      (add-hook 'window-size-change-functions 'tab-bar-notch-adjust-height))

  (propertize " " 'face (tab-bar-notch--face-name)))

(defun tab-bar-notch-adjust-height (&optional frame)
  "Adjust the height of the tab bar of FRAME."
  (if (not (memq 'tab-bar-notch-spacer tab-bar-format))
      ;; Remove hook if notch spacer is not included in tab-bar-format.
      (remove-hook 'window-size-change-functions 'tab-bar-notch-adjust-height))

  (let* ((face-name (tab-bar-notch--face-name frame))
         (current-height (face-attribute face-name :height frame))
         (new-height (tab-bar-notch--calculate-face-height frame)))

    (if (not (tab-bar-notch--fequal current-height new-height))
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

(defun tab-bar-notch--fullscreen-ratio-p (width height)
  "Determine if WIDTH vs HEIGHT aspect ratio matches any target ratio in the list."
  (let ((frame-ratio (/ (float width) height)))
    (cl-some (lambda (ratio)
               (tab-bar-notch--fequal frame-ratio ratio
                                      tab-bar-notch-fullscreen-ratio-tolerance))
             tab-bar-notch-fullscreen-ratios)))

(defun tab-bar-notch--calculate-face-height (&optional frame)
  "Calculate the face height value of the tab bar of FRAME."
  (let* ((frame (or frame (selected-frame)))
         (height (if (tab-bar-notch--fullscreen-p frame)
                     (let ((frame-width (frame-pixel-width frame))
                           (frame-height (frame-pixel-height frame)))
                       (if (tab-bar-notch--fullscreen-ratio-p frame-width frame-height)
                           (tab-bar-notch--notch-multiplier frame-height
                                                            (frame-char-height frame))
                         tab-bar-notch-normal-fullscreen-height))
                   tab-bar-notch-normal-height)))
    (max 1.0 height)))

(defun tab-bar-notch--notch-multiplier (frame-height char-height)
  "Calculate the notch height multiplier.

FRAME-HEIGHT is the height of the frame in pixels and CHAR-HEIGHT
is the height of a single character in pixels."
  (let ((height (round (* frame-height
                          (/ tab-bar-notch-screen-height-percentage 100)))))
    (if (> height 0)
        (/ height (float char-height))
      tab-bar-notch-normal-height)))

(defun tab-bar-notch--fullscreen-p (&optional frame)
  "Determine if FRAME is in fullscreen mode."
  (not (eq (frame-parameter (or frame (selected-frame)) 'fullscreen) nil)))

(defun tab-bar-notch--fequal (float1 float2 &optional tolerance)
  "Check if FLOAT1 and FLOAT2 are nearly equal.

TOLERANCE specifies the maximum difference for them to be
considered equal. If TOLERANCE is nil, a default small value is
used."
  (let ((tolerance (or tolerance 1e-6))
        (float1 (if (floatp float1) float1 0.0))
        (float2 (if (floatp float2) float2 0.0)))
    (< (abs (- float1 float2)) tolerance)))

(provide 'tab-bar-notch)

;;; tab-bar-notch.el ends here
