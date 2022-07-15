;;; siren-doom-themes-theme.el --- jimeh's Emacs Siren: doom-themes.

;;; Commentary:

;; Custom overrides for doom-themes.
;;
;; This theme is only to be used as a secondary theme applied after applying a
;; theme from the doom-themes package.  It adds customizations for a few things
;; not covered by doom-themes, and also customizes a number of minor things more
;; to my liking.

;;; Code:

(require 'doom-themes)

(deftheme siren-doom-themes-overrides
  "Siren overrides for doom-themes.")

(doom-themes-set-faces
  'siren-doom-themes-overrides
  '(font-lock-variable-name-face :foreground (doom-lighten blue 0.25))
  '(vertical-border :foreground (doom-darken vertical-bar
                                              (if window-system 0.4 0.0))
                    :background (doom-color bg) )
  '(font-lock-comment-face :foreground (doom-lighten comments 0.15))

  ;; whitespace-mode
  '(whitespace-tab :foreground (doom-color base4)
                   :background (doom-color bg))
  '(trailing-whitespace :foregroup (doom-color base4)
                        :background (doom-color red))

  ;; fill-column-indicator
  '(fill-column-indicator :foreground (doom-lighten base3 0.10))

  ;; magit
  '(magit-diff-hunk-heading :foreground (doom-color violet)
                            :background (doom-blend violet bg 0.3))

  ;; diff-hl
  '(diff-hl-insert :foreground (doom-blend vc-added bg 0.7)
                   :background (doom-blend vc-added bg 0.2))
  '(diff-hl-delete :foreground (doom-blend vc-deleted bg 0.7)
                   :background (doom-blend vc-deleted bg 0.2))
  '(diff-hl-change :foreground (doom-blend vc-modified bg 0.7)
                   :background (doom-blend vc-modified bg 0.2))

  '(siren-diff-hl-insert :foreground (doom-blend vc-added bg 0.7)
                         :background (doom-color bg))
  '(siren-diff-hl-delete :foreground (doom-blend vc-deleted bg 0.8)
                         :background (doom-color bg))
  '(siren-diff-hl-change :foreground (doom-blend vc-modified bg 0.7)
                         :background (doom-color bg))

  ;; diff-hl-margin
  '(diff-hl-margin-insert :foreground (doom-blend vc-added bg 0.6)
                          :background (doom-color bg))
  '(diff-hl-margin-delete :foreground (doom-blend vc-deleted bg 0.7)
                          :background (doom-color bg))
  '(diff-hl-margin-change :foreground (doom-blend vc-modified bg 0.6)
                          :background (doom-color bg))

  ;; git-gutter
  '(git-gutter:added :foreground (doom-blend vc-added bg 0.9))
  '(git-gutter:deleted :foreground (doom-blend vc-deleted bg 0.9))
  '(git-gutter:modified :foreground (doom-blend vc-modified bg 0.7))

  ;; git-gutter-fringe
  '(git-gutter-fr:added :foreground (doom-blend vc-added bg 0.7)
                        :background (doom-blend vc-added bg 0.0))
  '(git-gutter-fr:deleted :foreground (doom-blend vc-deleted bg 0.7)
                          :background (doom-blend vc-deleted bg 0.0))
  '(git-gutter-fr:modified :foreground (doom-blend vc-modified bg 0.7)
                           :background (doom-blend vc-modified bg 0.0))


  ;; tree-sitter
  '(tree-sitter-hl-face:property :inherit font-lock-constant-face) ;; disable italic
  '(tree-sitter-hl-face:method.call  :foreground (doom-blend functions keywords 0.6))
  '(tree-sitter-hl-face:function.call  :foreground (doom-blend functions keywords 0.8))

  ;; highlight-indent-guides
  '(highlight-indent-guides-odd-face :background (doom-lighten bg 0.06))
  '(highlight-indent-guides-top-odd-face :background (doom-lighten bg 0.12))
  '(highlight-indent-guides-stack-odd-face :background (doom-lighten bg 0.12))
  '(highlight-indent-guides-even-face :background (doom-lighten bg 0.07))
  '(highlight-indent-guides-top-even-face :background (doom-lighten bg 0.14))
  '(highlight-indent-guides-stack-even-face :background (doom-lighten bg 0.14))
  '(highlight-indent-guides-character-face :foreground (doom-lighten bg 0.12))
  '(highlight-indent-guides-top-character-face :foreground (doom-lighten bg 0.25))
  '(highlight-indent-guides-stack-character-face :foreground (doom-lighten bg 0.25))

  ;; hideshowvis
  '(hideshowvis-hidable-face :foreground (doom-color base7))

  ;; auto-highlight-symbol
  '(ahs-definition-face :foreground 'unspecified
                        :background (doom-lighten bg 0.1)
                        :underline t)
  '(ahs-edit-mode-face :foreground (doom-lighten fg 1.0)
                       :background (doom-darken red 0.25))
  '(ahs-face :foreground 'unspecified
             :background (doom-lighten bg 0.1))
  '(ahs-plugin-bod-face :foreground 'unspecified
                        :background (doom-color bg-alt))
  '(ahs-plugin-defalt-face :foreground 'unspecified
                           :background (doom-color bg-alt))
  '(ahs-plugin-whole-buffer-face :foreground 'unspecified
                                 :background (doom-color bg-alt))
  '(ahs-warning-face :foreground (doom-color red)
                     :background 'unspecified)

  ;; dired+
  '(diredp-dir-heading :foreground (doom-color magenta))
  '(diredp-dir-name :foreground (doom-lighten magenta 0.25))
  '(diredp-flag-mark :foreground (doom-color green)
                     :background (doom-blend bg orange 0.5))
  '(diredp-flag-mark-line :foreground (doom-color base8)
                          :background (doom-blend bg orange 0.7))
  '(diredp-deletion :foreground (doom-color yellow)
                    :background (doom-darken red 0.25))
  '(diredp-deletion-file-name :foreground (doom-color red))
  '(diredp-compressed-file-name :foreground (doom-color blue))

  ;; treemacs
  '(siren-treemacs-line-highlight :background (doom-blend violet bg 0.2)
                                  :extend t)

  ;; selectrum
  '(selectrum-current-candidate :background (doom-blend violet bg 0.2)
                                 :foreground (doom-blend violet fg 0.3)
                                 :distant-foreground nil
                                 :extend t)
  '(selectrum-prescient-primary-highlight :foreground (doom-lighten magenta 0.15)
                                           :weight 'light)
  '(selectrum-prescient-secondary-highlight :foreground (doom-blend magenta red 0.6)
                                             :weight 'bold)

  ;; vertico
  '(vertico-current :background (doom-blend violet bg 0.2)
                    :foreground (doom-blend violet fg 0.3)
                    :distant-foreground nil
                    :extend t)

  ;; orderless
  '(orderless-match-face-0 :foreground (doom-lighten magenta 0.15))
  '(orderless-match-face-1 :foreground (doom-lighten magenta 0.3))
  '(orderless-match-face-2 :foreground (doom-blend magenta red 0.4))
  '(orderless-match-face-3 :foreground (doom-blend magenta red 0.7))

  ;; helm
  '(helm-selection :inherit 'bold
                   :background (doom-blend violet bg 0.2)
                   :extend t)
  '(helm-posframe-border :background (doom-color dark-blue)))

(custom-theme-set-variables
 'siren-doom-themes-overrides

 ;; lsp-ui
 `(lsp-ui-doc-border ,(doom-blend 'blue 'bg 0.75))

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
