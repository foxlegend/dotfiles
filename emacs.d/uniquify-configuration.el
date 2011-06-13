;;;-----------------------------------------------
;; Uniquify (renames buffers with the same name)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-separator "|" ; useless with the post-forward-angle-brackets 
                             ; option
      uniquify-after-kill-buffer-p t ; reeorganize buffer names after a buffer
                                     ; has been killed
      uniquify-ignore-buffers-re "^\\*") ; Do not rename buffers corresponding
                                         ; to the pattern

