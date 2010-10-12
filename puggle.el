(server-mode)

(push "/usr/local/bin/" exec-path)

(setq c-basic-offset 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;;(setq-default indent-tabs-mode t)
;;(require 'tramp-cmds)

(global-set-key (kbd "RET") 'newline-and-indent)
(setq c-default-style '"cc-mode")

(add-to-list 'load-path
             "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

;; color themes
(load "~/.emacs.d/vendor/color-theme/color-theme.el")
(color-theme-initialize)
;; set the color theme here:
(color-theme-clarity)
;;(color-theme-hober)

(load "~/.emacs.d/vendor/autopair.el")
(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers 

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "#222222"))) "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

;;(add-hook 'ruby-mode-hook (flyspell-mode 0))
(add-hook 'ruby-mode-hook 'turn-off-auto-fill)

;; Magit
(require 'magit)
(require 'egg)

;; Remember
(add-to-list 'load-path "~/.emacs.d/vendor/remember")
(require 'remember)

;; org mode
(setq load-path (cons "~/emacs.d/vendor/org-mode/lisp" load-path))
(setq load-path (cons "~/emacs.d/vendor/org-mode/contrib/lisp" load-path))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-c\M-l" 'org-store-link)
(global-set-key "\C-c\M-a" 'org-agenda)
(global-set-key "\C-c\M-b" 'org-iswitchb)
(define-key global-map "\C-c\M-l" 'org-store-link)
(define-key global-map "\C-c\M-a" 'org-agenda)

(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(transient-mark-mode 1)
(setq org-log-done t)

;; org mode plus remember
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

;; edit this path to your local org mode files (I keep mine in ~/org)
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

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


;;(add-to-list 'load-path "~/.emacs.d/vendor/scala.el")

(add-hook 'html-mode-hook 'turn-off-auto-fill)
(setq kill-whole-line t)

;; peeopen
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
;;(add-to-list 'load-path "~/.emacs.d/vendor/peepopen.el")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'peepopen)
(textmate-mode 1)
(setq ns-pop-up-frames nil)

(load "~/.emacs.d/vendor/highlight-symbol.el")
(require 'highlight-symbol)
(global-set-key (kbd "C-x *") 'highlight-symbol-next)
(global-set-key (kbd "C-*") 'highlight-symbol-prev)


(setq ffap-machine-p-known 'accept)  ; no pinging in C-x C-f
(setq ffap-url-regexp nil)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)


(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer)))
(global-set-key [f1] 'switch-to-previous-buffer)


(add-to-list 'load-path "~/.emacs.d/vendor")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/ac-dict")
;;(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode.el")
(require 'haml-mode)
(setq haml-backspace-backdents-nesting nil)

(require 'undo-tree)
(global-undo-tree-mode)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/vendor/mysql.el")
(require 'mysql)
