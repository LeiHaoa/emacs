;;-------------------------------better default------------------------------------------

;;;;ÔÚÐÐÊ×Ö´ÐÐC-kÊ±½«¸ÃÐÐÉ¾³ý
(setq-default kill-whole-line t)

;;Éè¶¨²»²úÊÇ±¸·ÝÎÄ¼þ
(setq make-backup-files nil)

;;ÏÔÊ¾ÐÐÁÐºÅ
(global-linum-mode t)
;;¹Ø±Õ·äÃùÉù
(setq ring-bell-function 'ignore)

;;¸ßÁÁÏÔÊ¾µ±Ç°ÐÐ
;(global-hl-line-mode t)

;;Ëõ½øÎÊÌâ
(setq indent-tabs-mode nil) ;;²»²åÈëtab×Ö·û£¬ÒòÎªTABÊÇÐ°¶ñµÄ;ÊµÔÚÐèÒªTAB¼üÔòÓÃC-q TAB
(setq default-tab-width 4) ;;Ã¿´ÎËõ½ø4¸ö¿Õ¸ñ
(setq tab-width 4)

;;abbrev-table
(define-abbrev-table 'global-abbrev-table '(
											))
;;hipppie-expend
(setq hippie-expand-try-functions-list '(
                                         try-expand-dabbrev
										 try-expand-dabbrev-all-buffers
										 try-expand-dabbrev-from-kill
										 try-complete-file-name-partially
										 try-complete-file-name
										 try-expand-all-abbrevs
										 try-expand-list
										 try-expand-line
										 try-complete-lisp-symbol-partially
										 try-complete-lisp-symbol
										 semantic-ia-complete-symbol
										 ))

;;¼¤»î C-x C-j À´´ò¿ªÎÄ¼þËùÔÚÄ¿Â¼
(require 'dired-x)
;;yes-no --> y-n
(fset 'yes-or-no-p 'y-or-n-p)
;;Ñ¡ÖÐÌæ»»Ä£Ê½
(delete-selection-mode t)

;;dired mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;hook
(add-hook 'c-mode-common-hook 'hs-minor-mode)  ;ÔÚc-modeÏÂ½«hs-minor-mode´ò¿ª
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)





(provide 'init-better-default)
