;;;----------------------------------------------
;; System emacs configuration
; Inhibit the splash screen
(setq inhibit-splash-screen "~/")

; Stores backup files in a single directory
(setq backup-directory-alist '(("~/.emacs.d/emacs-backup-files/")))
 
; Color and number modes
(column-number-mode 1)
(line-number-mode 1)

; Uses google-chrome as browser in emacs
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

; When a frame is too small, displays the end of line on the next line
(setq truncate-partial-width-window nil)

; Auto-fill and avoid french cesures ('(', ':'...)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'fill-no-break-predicate 'fill-french-nobreak-p)

; 4 whitespaces for an indent
(setq c-basic-offset 4)

; Removes all whitespaces at the end of line
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

; Force UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

; Displays pictures and compressed files
(setq auto-image-file-mode t
      auto-compression-mode t)

; To not have to enter "yes or no" but "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

; Emacs completion improvements
(setq ido-confirm-unique-completion t)
(setq ido-default-buffer-method 'samewindow)
(setq ido-use-filename-at-point t)
(ido-mode t)
(ido-everywhere t)
(icomplete-mode 1)
