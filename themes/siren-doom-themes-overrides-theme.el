;;; siren-doom-themes-theme.el --- jimeh's Emacs Siren: doom-themes.  -*- lexical-binding: nil; -*-

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
  '(vertical-border (&all :background bg)
                    (&light :foreground vertical-bar)
                    (&dark :foreground (doom-darken vertical-bar
                                                    (if window-system 0.4 0))))

  '(font-lock-comment-face :foreground (doom-lighten comments 0.15))
  '(font-lock-function-call-face :foreground (doom-blend functions keywords 0.7))
  '(font-lock-operator-face :inherit 'font-lock-keyword-face)
  '(font-lock-property-name-face :inherit 'font-lock-variable-name-face)
  '(font-lock-property-use-face :inherit 'font-lock-variable-name-face)
  '(font-lock-variable-name-face :foreground (doom-lighten blue 0.25))

  ;; built-in completion faces, based on doom-themes' defaults for orderless
  '(completions-common-part :weight 'bold
                            :foreground (doom-blend blue fg 0.6)
                            :background (doom-blend blue bg 0.1))

  ;; whitespace-mode
  '(whitespace-tab :foreground (doom-color base4)
                   :background (doom-color bg))
  '(trailing-whitespace :foregroup (doom-color base4)
                        :background (doom-color red))

  ;; tab-bar
  '(tab-bar-tab-group-current :foreground (doom-darken violet 0.3))

  ;; inverted tab-bar and tab-line
  '(tab-line :background bg :foreground bg)
  '(tab-line-tab :background bg-alt :foreground fg-alt)
  '(tab-line-tab-inactive :background bg :foreground fg)
  '(tab-line-tab-inactive-alternate :background bg :foreground fg)
  '(tab-line-tab-current :background bg-alt :foreground fg-alt)
  '(tab-line-highlight :background bg-alt :foreground fg-alt)
  '(tab-bar :background bg :foreground fg)
  '(tab-bar-tab :background bg-alt :foreground fg-alt)
  '(tab-bar-tab-inactive :background bg :foreground fg)
  '(siren-tab-bar-tab-hint :inherit 'tab-bar-tab :foreground fg-alt)
  '(siren-tab-bar-tab-hint-inactive :inherit 'tab-bar-tab-inactive :foreground fg-alt)

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
  '(tree-sitter-hl-face:function.call :inherit 'font-lock-function-call-face)

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

  ;; symbol-overlay
  '(symbol-overlay-default-face
    (&dark  :background (doom-lighten region 0.1) :distant-foreground bg)
    (&light :background (doom-lighten region 0.1) :distant-foreground fg-alt))
  '(symbol-overlay-face-1 :background (doom-blend blue bg 0.38)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-2 :background (doom-blend violet bg 0.4)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-3 :background (doom-blend yellow bg 0.35)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-4 :background (doom-blend orange bg 0.375)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-5 :background (doom-blend red bg 0.38)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-6 :background (doom-blend magenta bg 0.38)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-7 :background (doom-blend green bg 0.38)
                          :distant-foreground fg-alt)
  '(symbol-overlay-face-8 :background (doom-blend cyan bg 0.3)
                          :distant-foreground fg-alt)

  ;; lsp-mode
  '(lsp-face-highlight-textual :foreground 'unspecified
                               :distant-foreground 'unspecified
                               :background 'unspecified)

  ;; nerd-icons
  '(nerd-icons-blue       :foreground blue)
  '(nerd-icons-blue-alt   :foreground teal)
  '(nerd-icons-cyan       :foreground cyan)
  '(nerd-icons-cyan-alt   :foreground cyan)
  '(nerd-icons-dblue      :foreground dark-blue)
  '(nerd-icons-dcyan      :foreground dark-cyan)
  '(nerd-icons-dgreen     :foreground (doom-darken green 0.3))
  '(nerd-icons-dmaroon    :foreground (doom-darken magenta 0.3))
  '(nerd-icons-dorange    :foreground (doom-darken orange 0.3))
  '(nerd-icons-dpink      :foreground (doom-lighten red 0.15))
  '(nerd-icons-dpurple    :foreground (doom-darken violet 0.3))
  '(nerd-icons-dred       :foreground (doom-darken red 0.3))
  '(nerd-icons-dsilver    :foreground (doom-lighten grey 0.1))
  '(nerd-icons-dyellow    :foreground (doom-darken yellow 0.3))
  '(nerd-icons-green      :foreground green)
  '(nerd-icons-lblue      :foreground (doom-lighten blue 0.3))
  '(nerd-icons-lcyan      :foreground (doom-lighten cyan 0.3))
  '(nerd-icons-lgreen     :foreground (doom-lighten green 0.3))
  '(nerd-icons-lmaroon    :foreground (doom-lighten magenta 0.3))
  '(nerd-icons-lorange    :foreground (doom-lighten orange 0.3))
  '(nerd-icons-lpink      :foreground (doom-lighten red 0.55))
  '(nerd-icons-lpurple    :foreground (doom-lighten violet 0.3))
  '(nerd-icons-lred       :foreground (doom-lighten red 0.3))
  '(nerd-icons-lsilver    :foreground (doom-lighten grey 0.7))
  '(nerd-icons-lyellow    :foreground (doom-lighten yellow 0.3))
  '(nerd-icons-maroon     :foreground magenta)
  '(nerd-icons-orange     :foreground orange)
  '(nerd-icons-pink       :foreground (doom-lighten red 0.35))
  '(nerd-icons-purple     :foreground violet)
  '(nerd-icons-purple-alt :foreground (doom-blend violet grey 0.15))
  '(nerd-icons-red        :foreground red)
  '(nerd-icons-red-alt    :foreground (doom-blend red grey 0.15))
  '(nerd-icons-silver     :foreground (doom-lighten grey 0.45))
  '(nerd-icons-yellow     :foreground yellow)
  ;;;; nerd-icons-completion
  '(nerd-icons-completion-dir-face :foreground doc-comments)
  ;;;; nerd-icons-dired
  '(nerd-icons-dired-dir-face :foreground doc-comments)
  ;;;; treemacs-nerd-icons
  '(treemacs-nerd-icons-file-face :foreground doc-comments)
  '(treemacs-nerd-icons-root-face :inherit 'font-lock-string-face :weight 'bold :height 1.2)

  ;; go-mode
  '(go-dot-mod-module-name :inherit font-lock-constant-face)
  '(go-dot-mod-module-version :inherit font-lock-type-face)
  '(go-dot-mod-module-semver (&inherit go-dot-mod-module-version))

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

  ;; dirvish
  '(dirvish-hl-line :background region
                    :extend t)

  ;; solaire-mode
  '(solaire-hl-line-face :inherit 'hl-line
                         :background (doom-blend region bg-alt 0.35)
                         :extend t)

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
