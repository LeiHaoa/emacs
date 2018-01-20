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
 		  swiper
 		  counsel
		  use-package
 		  expand-region
 		  flycheck 
 		  window-numbering
 		  which-key
 		  company
 		  undo-tree
 		 ; yasnippet
 		  ace-jump-mode
 		  sr-speedbar
 		  neotree
 		  monokai-theme
 		  solarized-theme
 		  ;imenu+
 		  imenu-list
 		  popwin
 		  elpy
 		  popup
 		  ag
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


;; yasnippet 
;(add-to-list 'load-path 
;			 "~/.emacs.d/yasnippet") 
;(require 'yasnippet)

;(yas-global-mode 1)
;;company-mode 
(add-hook 'after-init-hook 'global-company-mode)  
(add-hook 'after-init-hook 'smartparens-global-mode)
(add-hook 'after-init-hook 'window-numbering-mode)
(add-hook 'after-init-hook 'which-key-mode)
;;elpy
;(require 'package)
(add-hook 'python-mode-hook 'elpy-enable)



;;-----------------cedit------------

(use-package swiper
   :init
     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
   :bind(("\C-s" . swiper)
     ("M-x" . counsel-M-x)
     ("C-c C-r" . ivy-resume)
     ("C-x C-f" . counsel-find-file)
     ("<f1> f" . counsel-describe-function)
     ("<f1> v" . counsel-describe-variable)
     ("<f1> l" . counsel-load-library)
   )
 )
;;expand-region
(use-package expand-region
  :defer t
  :bind(("C-=" . er/expand-region)
		)
   )
;;window-numbering
;;(window-numbering-mode 1)

;; which-key
;(use-package which-key
;    :config
;	   (which-key-mode)
;   )

;;(which-key-mode)
;;popwin-mode
(use-package popwin
    :defer t
    :config
    (popwin-mode t)
   )
;;ace-jump-mode
(use-package ace-jump-mode
      :defer t
      :bind(("C-c SPC" . ace-jump-mode)
	 )
   )
;;-----------sr-speedbar设置--------------------
(use-package sr-speedbar
  :defer t
  :config
  (setq sr-speedbar-right-side nil)
 )


;;-----------undo tree-----
(use-package undo-tree
  :defer t
  :init
  (global-undo-tree-mode)
  :bind(("C-x u" . undo-tree-visualize)
		)
  )

(provide 'init-packages)
