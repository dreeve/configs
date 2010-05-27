;; color themes
(load "~/.emacs.d/vendor/color-theme/color-theme.el")
(load "~/.emacs.d/vendor/psvn.el")

(color-theme-initialize)
;; set the color theme here:
(color-theme-clarity)

(global-set-key "\C-cr" 'org-remember)

(setq org-directory "~/org/")
(setq org-default-notes-file "~/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-remember-templates
    '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org/todo.org" "Tasks")
      ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/org/journal.org")
      ("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/org/journal.org")
      ("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/org/someday.org")
     )
)

(setq org-tag-alist '(("bug" . ?b) ("config" . ?c) ("maintenance" . ?m) ("planning" . ?p)))

(load "~/.emacs.d/vendor/twittering-mode/twittering-mode.el")
 (require 'twittering-mode)
 (setq twittering-username "derekreeve")

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key "\C-cs" 'svn-status)
;; only in java-mode
;; (define-key java-mode-map (kbd  "TAB") 'self-insert-command)


(add-to-list 'load-path "~/.emacs.d/vendor/jump.el")
(require 'jump)

;;; rhtml-mode
     (add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
     (require 'rhtml-mode)
     (add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)
(global-set-key "\C-c\ \C-s" 'twittering-update-status-interactive)

;; sudo port install gnutls
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-jabber")
(require 'jabber-autoloads)

(setq jabber-account-list
    '(("dereknreeve@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))
