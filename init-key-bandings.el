;;----------------------------defun myself---------------------------
;;格式化整个文件函数09
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs"))
;;like O in vim
(defun nextline()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  )
;;隐藏文件系统中的^M符号 
;; (defun hidden-dos-eol ()
;;   "do not show ^M in this file"
;;   (interactive)
;;   (setq buffer-display-table (make-display-table))
;;   (aset buffer-display-table ?/^M [])
;;   ) 
;;删除unix文件系统中的^M符号
(defun remove-dos-elo ()
  "Replace DOS end od lines CR with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match ""))
  )
;;-----------------------------key bandings (kbd)----------------------
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "`") 'hydra-hick/body) ;;hydra的绑定功能快捷键，
(global-set-key (kbd "C-o") 'nextline)
(global-set-key (kbd "C-<") 'shrink-window-horizontally)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)  ;;打开最近打开文件
(global-set-key [f5] 'hs-toggle-hiding) ;;折叠开启开关
(global-set-key [f8] 'neotree-toggle)    ;;neotree开关
(global-set-key [f7] 'indent-buffer) ;;格式化整个buffer
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(provide 'init-key-bandings)
