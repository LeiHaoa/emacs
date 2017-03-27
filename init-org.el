
;;-----------------------------------org-mode设置----------------------------------

;; 设置org-mode 内部语法高亮
(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c a") 'org-agenda)
;; org-capture

(setq org-capture-templates
        `(("t" "todo" entry (file+headline "" "todo")  ; "" => org-default-notes-file
         "* TODO %?\n%t\n" :clock-resume t)
        ("n" "note" entry (file+headline "" "note" )
         "* %? :NOTE:\n%U\n%i\n" :clock-resume t)
		("a" "what todo today" entry (file+datetree "~/org/agenda.org")  
         "* TODO %?\n%t\n" :clock-resume t)
		))


(setq org-default-notes-file  "~/org/note.org")
(global-set-key (kbd "C-c c") 'org-capture)
;; org-mode auto change line
(add-hook 'org-mode-hook
(lambda () (setq truncate-lines nil)))

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

(provide 'init-org)
