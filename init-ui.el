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

;;设置主题
(load-theme 'monokai t)
;;(load-theme 'solarized-dark t)
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-billw)

;;开始以全屏(it do not work)
(setq default-frame-alist (quote ((fullscreen . maximize-window))))
;;光标形式改为"|"
(setq-default cursor-type 'bar)
(provide 'init-ui)
