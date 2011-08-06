(setq load-path (cons "/home/fox/.emacs.d" load-path))
;;;-----------------------------------------------
;; emacs
; emacs appearance (display configuration and theme)
(load-file "~/.emacs.d/emacs-appearance.el")

; emacs global configuration (behaviour...)
(load-file "~/.emacs.d/emacs-configuration.el")

; emacs modes
(load-file "~/.emacs.d/emacs-modes.el")

; emacs shortcuts
(load-file "~/.emacs.d/emacs-shortcuts.el")

;;;-----------------------------------------------
;; calendar
(load-file "~/.emacs.d/calendar-configuration.el")

;;;-----------------------------------------------
;; ispell
(load-file "~/.emacs.d/ispell-dictionary-configuration.el")

;;;-----------------------------------------------
;; uniquify
(load-file "~/.emacs.d/uniquify-configuration.el")

;;;-----------------------------------------------
;; mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(setq mew-rc-file "~/.emacs.d/mew-configuration.el")

;;;-----------------------------------------------
;; auctex
(load "auctex.el" nil t t)
; To enable preview-latex, please emerge app-emacs/auctex
; with "preview-latex" flag.
; (load "preview-latex.el" nil t t)

;;;-----------------------------------------------
;; org-mode
(setq load-path (cons "/usr/share/emacs/site-lisp/org/lisp" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/org_contrib/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
