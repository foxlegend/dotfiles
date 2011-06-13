;;;-----------------------------------------------
;; Sets emacs appearance
; Removes the menu bar
(menu-bar-mode nil)

; Removes the tool bar
(tool-bar-mode nil)

; Removes the scroll bar
(scroll-bar-mode nil)

; Changes emacs frame title format
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

; Enables the syntax highlighting by default
(global-font-lock-mode t)
(setq font-lock-maximum-size nil) ; Gives a lot of color

; Highlight the selected region
(transient-mark-mode 1)

; Change emacs font
(set-default-font "Inconsolata-g-9")

;;;-----------------------------------------------
;; Enables theme
; Add themes path
(add-to-list 'load-path "~/.emacs.d/themes/")

; Enable gruber darker theme
(require 'color-theme-gruber-darker)
(color-theme-gruber-darker)