;;; siren-doom-themes-theme.el --- jimeh's Emacs Siren: doom-themes.

;;; Commentary:

;; Custom overrides for doom-themes.
;;
;; This theme is only to be used as a secondary theme applied after applying a
;; theme from the doom-themes package.  It adds customizations for a few things
;; not covered by doom-themes, and also customizes a number of minor things more
;; to my liking.

;;; Code:

(deftheme siren-doom-themes-overrides
  "Siren overrides for doom-themes.")

(custom-theme-set-faces
 'siren-doom-themes-overrides

 `(font-lock-variable-name-face ((t (:foreground ,(doom-lighten 'blue 0.25)))))
 `(vertical-border ((t ( :foreground ,(doom-darken 'vertical-bar 0.5)
                         :background ,(doom-color 'bg) ))))
 `(font-lock-comment-face ((t ( :foreground ,(doom-lighten 'comments 0.15) ))))

 ;; whitespace-mode
 `(whitespace-tab ((t ( :foreground ,(doom-color 'base4)
                        :background ,(doom-color 'bg) ))))

 ;; fill-column-indicator
 `(fill-column-indicator ((t ( :foreground ,(doom-lighten 'base3 0.10) ))))

 ;; diff-hl
 `(diff-hl-insert ((t ( :foreground ,(doom-blend 'vc-added 'bg 0.7)
                        :background ,(doom-blend 'vc-added 'bg 0.2)))))
 `(diff-hl-delete ((t ( :foreground ,(doom-blend 'vc-deleted 'bg 0.7)
                        :background ,(doom-blend 'vc-deleted 'bg 0.2)))))
 `(diff-hl-change ((t ( :foreground ,(doom-blend 'vc-modified 'bg 0.7)
                        :background ,(doom-blend 'vc-modified 'bg 0.2)))))

 `(siren-diff-hl-insert ((t ( :foreground ,(doom-blend 'vc-added 'bg 0.7)
                              :background ,(doom-color 'bg)))))
 `(siren-diff-hl-delete ((t ( :foreground ,(doom-blend 'vc-deleted 'bg 0.8)
                              :background ,(doom-color 'bg)))))
 `(siren-diff-hl-change ((t ( :foreground ,(doom-blend 'vc-modified 'bg 0.7)
                              :background ,(doom-color 'bg)))))

 ;; diff-hl-margin
 `(diff-hl-margin-insert ((t ( :foreground ,(doom-blend 'vc-added 'bg 0.6)
                               :background ,(doom-color 'bg)))))
 `(diff-hl-margin-delete ((t ( :foreground ,(doom-blend 'vc-deleted 'bg 0.7)
                               :background ,(doom-color 'bg)))))
 `(diff-hl-margin-change ((t ( :foreground ,(doom-blend 'vc-modified 'bg 0.6)
                               :background ,(doom-color 'bg)))))

 ;; git-gutter
 `(git-gutter:added ((t ( :foreground ,(doom-blend 'vc-added 'bg 0.9) ))))
 `(git-gutter:deleted ((t ( :foreground ,(doom-blend 'vc-deleted 'bg 0.9) ))))
 `(git-gutter:modified ((t ( :foreground ,(doom-blend 'vc-modified 'bg 0.7) ))))

 ;; git-gutter-fringe
 `(git-gutter-fr:added ((t ( :foreground ,(doom-blend 'vc-added 'bg 0.7)
                             :background ,(doom-blend 'vc-added 'bg 0.0) ))))
 `(git-gutter-fr:deleted ((t ( :foreground ,(doom-blend 'vc-deleted 'bg 0.7)
                               :background
                               ,(doom-blend 'vc-deleted 'bg 0.0) ))))
 `(git-gutter-fr:modified ((t ( :foreground ,(doom-blend 'vc-modified 'bg 0.7)
                                :background
                                ,(doom-blend 'vc-modified 'bg 0.0) ))))

 ;; hideshowvis
 `(hideshowvis-hidable-face ((t ( :foreground ,(doom-color 'base7) ))))

 ;; auto-highlight-symbol
 `(ahs-definition-face ((t ( :foreground 'unspecified
                             :background ,(doom-lighten 'bg 0.1)
                             :underline t ))))
 `(ahs-edit-mode-face ((t ( :foreground ,(doom-lighten 'fg 1.0)
                            :background ,(doom-darken 'red 0.25) ))))
 `(ahs-face ((t ( :foreground 'unspecified
                  :background ,(doom-lighten 'bg 0.1) ))))
 `(ahs-plugin-bod-face ((t ( :foreground 'unspecified
                             :background ,(doom-color 'bg-alt) ))))
 `(ahs-plugin-defalt-face ((t ( :foreground 'unspecified
                                :background ,(doom-color 'bg-alt) ))))
 `(ahs-plugin-whole-buffer-face ((t ( :foreground 'unspecified
                                      :background ,(doom-color 'bg-alt) ))))
 `(ahs-warning-face ((t ( :foreground ,(doom-color 'red)
                          :background 'unspecified ))))

 ;; dired+
 `(diredp-dir-heading ((t ( ;; :weight 'bold
                            :foreground ,(doom-color 'magenta) ))))
 `(diredp-dir-name ((t ( ;; :weight 'bold
                         :foreground ,(doom-lighten 'magenta 0.25) ))))
 `(diredp-flag-mark ((t ( :foreground ,(doom-color 'green)
                          :background ,(doom-blend 'bg 'orange 0.5) ))))
 `(diredp-flag-mark-line ((t ( :foreground ,(doom-color 'base8)
                               :background ,(doom-blend 'bg 'orange 0.7) ))))
 `(diredp-deletion ((t ( :foreground ,(doom-color 'yellow)
                         :background ,(doom-darken 'red 0.25) ))))
 `(diredp-deletion-file-name ((t ( :foreground ,(doom-color 'red) ))))
 `(diredp-compressed-file-name ((t ( :foreground ,(doom-color 'blue) )))))

(custom-theme-set-variables
 'siren-doom-themes-overrides

 ;; fill-column-indicator
 `(fci-rule-color ,(doom-lighten 'base3 0.10))

 ;; zoom-window
 `(zoom-window-mode-line-color ,(doom-blend 'magenta 'bg 0.2))

 ;; xterm-color
 `(xterm-color-names
   [,(doom-color 'bg)      ; black
    ,(doom-color 'red)     ; red
    ,(doom-color 'green)   ; green
    ,(doom-color 'yellow)  ; yellow
    ,(doom-color 'blue)    ; blue
    ,(doom-color 'magenta) ; magenta
    ,(doom-color 'cyan)    ; cyan
    ,(doom-color 'fg)]     ; white
   )
 `(xterm-color-names-bright
   [,(doom-lighten 'bg 0.25)      ; black
    ,(doom-lighten 'red 0.25)     ; red
    ,(doom-lighten 'green 0.25)   ; green
    ,(doom-lighten 'yellow 0.25)  ; yellow
    ,(doom-lighten 'blue 0.25)    ; blue
    ,(doom-lighten 'magenta 0.25) ; magenta
    ,(doom-lighten 'cyan 0.25)    ; cyan
    ,(doom-lighten 'fg 0.25)]     ; white
   ))

(provide-theme 'siren-doom-themes-overrides)
