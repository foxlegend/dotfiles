;;;-----------------------------------------------
;; Mew configuration
; Mail accounts
(setq mew-config-alist

      '((gmail
	 (proto              "%"                 )
	 (name               "User Name"   )
	 (user               "user"   )
         (mail-domain        "gmail.com"         )
	 
	 (mew-imap-delete    nil                 )
	 (imap-server        "imap.gmail.com"    )
	 (imap-ssl           t                   )
	 (imap-port          "imap"              )
	 (imap-ssl-port      993                 )
	 (imap-user          "imap.user"   )
	 (smtp-user          "smtp.user"   )
	 (smtp-server        "smtp.gmail.com"    )
	 (smtp-port          "submission"        )
	 (smtp-ssl-port      "submission"        )
	 (fcc                "%Sent"             )
	 (inbox-folder       "%inbox"            )
	 (imap-queue-folder  "%queue"            )
	 (imap-trash-folder  "%trash"            ))
	(etu-unilim
	 (mail-domain        "etu.unilim.fr"     ))
	(xlim)
	(default
	  (proto             "%"                 )
	  (name              "User Name"   )
	  (user              "user"   )
	  (mail-domain       "xlim.fr"     )
	  (mew-imap-delete   nil                 )
	  (imap-server       "imap.server")
	  (imap-ssl          t                   )
	  (imap-port         "imap"              )
	  (imap-ssl-port     "imap"              )
	  (imap-user         "login"       )
	  (smtp-server       "smtp.server"    )
	  (smtp-user         "login"       )
	  (smtp-ssl          t                   )
	  (smtp-port         "submission"        )
	  (smtp-ssl-port     "submission"        )
	  (fcc               "%Sent"             )
	  (inbox-folder      "%inbox"            )
	  (imap-queue-folder "%queue"            )
	  (imap-trash-folder "%trash"            ))))

; Default pdf reader
(setq mew-prog-pdf "zathura")

; Ask for password when launching mew
(setq mew-use-cached-passwd t)

; Retrieve automatically mails
(setq mew-use-biff t)
(setq mew-use-biff-bell t)
(setq mew-biff-interval 1)

; Displays threads
(setq mew-use-fancy-thread t)

; Sign all mails
;(setq mew-protect-privacy-always t)
;(setq mew-protect-privacy-always-type 'pgp-signature)

; Encipher responses to enciphered mails
(setq mew-protect-privacy-encrypted t)
(setq mew-protect-privacy-encrypted-type 'pgp-encryption)

; Check server certificate
(setq mew-prog-ssl           "/usr/bin/stunnel"
      mew-ssl-verify-level   0 ; no check, try 2
      mew-ssl-cert-directory "/etc/ssl/certs")

; Use lower case to make sorting faster
(setq mew-use-fast-refile t)

; Defines a mew theme
(setq mew-summary-form '((5 date)" [" type "] " (50 from) " " t (0 subj)))

;(setq mew-thread-indent-strings
(setq mew-thread-indent-strings ["├>" "└>" "│ " "  "])
