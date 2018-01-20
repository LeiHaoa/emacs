;;----------------------------defun myself---------------------------
;;��ʽ�������ļ�����09
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
;;�����ļ�ϵͳ�е�^M���� 
;; (defun hidden-dos-eol ()
;;   "do not show ^M in this file"
;;   (interactive)
;;   (setq buffer-display-table (make-display-table))
;;   (aset buffer-display-table ?/^M [])
;;   ) 
;;ɾ��unix�ļ�ϵͳ�е�^M����
(defun remove-dos-elo ()
  "Replace DOS end od lines CR with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match ""))
  )
;;-----------------------------key bandings (kbd)----------------------
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "C-o") 'nextline)
(global-set-key (kbd "C-<") 'shrink-window-horizontally)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)  ;;��������ļ�
(global-set-key [f5] 'hs-toggle-hiding) ;;�۵���������
(global-set-key [f8] 'neotree-toggle)    ;;neotree����
(global-set-key [f7] 'imenu-list-smart-toggle) ;;��ʽ������buffer
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "C-v") 'set-mark-command)
(global-set-key (kbd "C-x C-p") 'pop-global-mark)
(global-set-key (kbd "M-{") 'backward-sexp)
(global-set-key (kbd "M-}") 'forward-sexp)


;;-------------cj-----------
;;----------------------------bind my key like spacemace----------------g
(define-prefix-command 'ctl-j-map)
(global-set-key (kbd "C-j") 'ctl-j-map)
(global-set-key (kbd "C-j SPC") 'counsel-M-x)
(bind-keys :prefix-map buffer-prefix-map
             :prefix "C-j b"
			 ("b" . ivy-switch-buffer)
			 ("k" . kill-this-buffer)
			 )


(bind-keys :prefix-map file-prefix-map
		     :prefix "C-j f"
			 ("f" . counsel-find-file)
			 ("g" . counsel-ag))

(bind-keys :prefix-map find-prefix-map
		     :prefix "C-j i"
			 ("i" . counsel-imenu)
			 ("o" . occur))



(provide 'init-key-bandings)
