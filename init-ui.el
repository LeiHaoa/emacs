;;--------------------------------------------------ui����------------------------------------------------------
;;��������
;(setq default-frame-alist
;	  '((vertical-scroll-bars)
;		(top . 25)
;		(left . 45)
;		(width . 120)
;		(height . 35)))
;(setq default-frame-alist (quote ((fullscreen . maximize-window))))
(setq visible-bell t)
;;�رշ��˵Ĵ�����ʾ��

;;ȥ��������
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
;;�ر�guns����ʱ�Ļ���
(setq inhibit-startup-message t)

;;�ر�guns����ʱ�Ļ���
(setq gnus-inhibit-startup-message t)

;;��������
(load-theme 'monokai t)
;;(load-theme 'solarized-dark t)
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-billw)

;;��ʼ��ȫ��(it do not work)
(setq default-frame-alist (quote ((fullscreen . maximize-window))))
;;�����ʽ��Ϊ"|"
(setq-default cursor-type 'bar)
(provide 'init-ui)
