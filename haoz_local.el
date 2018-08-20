(setq-default kill-whole-line t)

;;(global-linum-mode t)
;;don't make any sounds when emacs warning or error
(setq ring-bell-function 'ignore)


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


;;------------------------key binding----------------
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-c C-j") 'imenu)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "C-<") 'shrink-window-horizontally)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "C-x C-p") 'pop-global-mark)
(global-set-key (kbd "M-[") 'backward-sexp)
(global-set-key (kbd "M-]") 'forward-sexp)
;;(global-set-key (kbd "M-j") 'counsel-ag)


;;-----------------------UI--------------------------
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(setq-default cursor-type 'box)
(blink-cursor-mode (- (*) (*) (*)))
