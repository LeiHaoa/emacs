;;;;-------------------------------pachages------------------------------------- 
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
  )

(require 'cl)
;;add whatever paclage you want here
(defvar zh/packages '(
					  ;;add my packageds to download
					  smartparens
					  ;swiper
					  counsel
					  expand-region
					  flycheck 
					  window-numbering
					  which-key
					  hydra
					  company
					  yasnippet
					  ace-jump-mode
					  sr-speedbar
					  neotree
					  monokai-theme
					  solarized-theme
					  imenu+
					  popwin
					  elpy
					  popup
					  ) "Default packages")
(defun zh/packages-installed-p ()
  (loop for pkg in zh/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))
(unless (zh/packages-installed-p)
  (message "%s" "Refreshing package database... ")
  (package-refresh-contents)
  (dolist (pkg zh/packages)
	(when (not (package-installed-p pkg))
	  (package-install pkg))))

;;--------------------------------¾ßÌåpackageÅäÖÃ----------------------
;; smartparens
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;; yasnippet 
(add-to-list 'load-path 
			 "~/.emacs.d/yasnippet") 
(require 'yasnippet)
(setq auto-save-mode nil)

(yas-global-mode 1)
;;company-mode 
(add-hook 'after-init-hook 'global-company-mode)  
;;elpy
(require 'package)
(add-hook 'python-mode-hook 'elpy-enable)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)

;;expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;window-numbering
(window-numbering-mode 1)
;; which-key
(which-key-mode)
;;popwin-mode
(require 'popwin)
(popwin-mode t)
;; hydra
(defhydra hydra-hick (:color blue							 
                             :hint nil)
  "
^Utl^                  ^Unmark^           ^Actions^          
^^^^^^^^-----------------------------------------------------------------
_s_: save-buffer      _0_:deletewindow    _k_: kill buffer
_f_: find-file        _c_:save&exit                         
"
  ("k" kill-buffer)
  ("s" save-buffer)
  ("f" find-file)
  ("c" save-buffers-kill-emacs)
  ("0" delete-window)
)


;;ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;;-----------sr-speedbar--------------------
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)


;;-----------------cedit------------

(custom-set-variables
 '(semantic-default-submodes (quote (global-semantic-decoration-mode global-semantic-idle-completions-mode
                                     global-semantic-idle-scheduler-mode global-semanticdb-minor-mode
                                     global-semantic-idle-summary-mode global-semantic-mru-bookmark-mode)))
 '(semantic-idle-scheduler-idle-time 3))

;;; gcc setup
(require 'semantic/bovine/gcc)

;;; smart complitions setup
(require 'semantic/ia)

;; TAGS Menu:Semantic 可以通过imenu集成到Emacs菜单中，
;;从而通过菜单来显示和访问函数、变量以及其他Tag的列表。
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'my-semantic-hook)
;;;; Semantic DataBase存储位置
;;(setq semanticdb-default-save-directory
;;      (expand-file-name "~/.emacs.d/semanticdb"))
;;; 快捷键
(defun my-cedet-hook()
(local-set-key [(control return)] 'semantic-ia-complete-symbol)

(local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
(local-set-key (kbd "M-n") 'semantic-ia-complete-symbol-menu)

(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;(local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)

(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
(local-set-key "\C-cd" 'semantic-ia-fast-jump)
(local-set-key "\C-cr" 'semantic-symref-symbol)
(local-set-key "\C-cR" 'semantic-symref)

;;; c/c++ setting
(local-set-key "." 'semantic-complete-self-insert)
(local-set-key ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'c-mode-common-hook 'semantic-mode)
;;
(global-flycheck-mode t)

(provide 'init-packages)
