;;--------------------------------------------------ui设置------------------------------------------------------
;;启动设置
;(setq default-frame-alist
;	  '((vertical-scroll-bars)
;		(top . 25)
;		(left . 45)
;		(width . 120)
;		(height . 35)))
;(setq default-frame-alist (quote ((fullscreen . maximize-window))))
(setq visible-bell t)
;;关闭烦人的错误提示音

;;去掉工具栏
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
;;关闭guns启动时的画面
(setq inhibit-startup-message t)

;;关闭guns启动时的画面
(setq gnus-inhibit-startup-message t)

;;theme
;;(load-theme 'monokai t)
;;(load-theme 'solarized-dark t)
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-billw)
(defun my-set-font (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (if (string-equal system-type "windows-nt")
	;; 下面是用于Windows的配置。
	(progn
	  ;; 设置英文字体为Inconsolata，并指定字号18。
	  ;; 因为不同操作系统下字体显示的大小不一样(DPI的问题)，所以分开设置。
	  (set-face-attribute 'default nil :font "Consolas 12")
	  ;; 给相应的字符集设置中文字体，这里的字体是冬青黑体简体中文 W3。
	  (dolist (charset '(han cjk-misc chinese-gbk))
	    (set-fontset-font "fontset-default"
			      charset (font-spec :family "微软雅黑")))
	  ;; 设置默认字体和用于显示特殊符号的字体，如果不需要下面三句可以删除。
	  (set-fontset-font "fontset-default"
			    'unicode "Segoe UI Symbol" nil 'append)
	  (set-fontset-font "fontset-default"
			    '(#x1F600 . #x1F64F) "Segoe UI Symbol") ; Emoji
	  (set-fontset-font "fontset-default"
			    '(#xE000 . #xF8FF) "STIX")) ; Private Use Areas
      ;; 下面是Linux的配置，道理类似。
      (set-face-attribute
       'default nil :font "Inconsolata 14")
      (dolist (charset '(kana han cjk-misc bopomofo))
	(set-fontset-font "fontset-default"
			  charset (font-spec :name "Hiragino Sans GB")))))

  ;; 对于特定的符号设置字体，不分操作系统。我的个人爱好，可以删除。
  (set-fontset-font "fontset-default" ?– "Symbola")
  (set-fontset-font "fontset-default" ?— "Symbola")
  (set-fontset-font "fontset-default" ?′ "Symbola")
  (set-fontset-font "fontset-default" ?″ "Symbola"))

;; 运行一下立即设置字体。
(my-set-font)

;; 对于新建的frame应用设置。
(add-hook 'after-make-frame-functions 'my-set-font)


(setq-default cursor-type 'box)
(blink-cursor-mode (- (*) (*) (*)))
(provide 'init-ui)
