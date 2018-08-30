;;-------------------------------better default------------------------------------------

;;;;
(setq-default kill-whole-line t)

;;do not make any backup-files
(setq make-backup-files nil)

;;(global-linum-mode t)
;;don't make any sounds when emacs warning or error
(setq ring-bell-function 'ignore)

;;¸ßÁÁÏÔÊ¾µ±Ç°ÐÐ
;(global-hl-line-mode t)

;;about tabs 
(setq indent-tabs-mode nil) ;;do not use tab anymore , if you want use is , type <C-q> TAB instead
(setq default-tab-width 4) ;;set default tab width to 4
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

;;dired-x
(require 'dired-x)
;;yes-no --> y-n
(setq auto-save-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
;;delete selection when use backspace
(delete-selection-mode t)

;;dired mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;my own mode hook
(defun zh-shell-mode-hook ()
  (company-mode 0)
  )
(add-hook 'shell-mode-hook 'zh-shell-mode-hook)
;;hook
(add-hook 'c-mode-common-hook 'hs-minor-mode)  
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)





(provide 'init-better-default)
