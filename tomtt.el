(custom-set-variables
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta)))

;; Load file for sensitive data not to be checked into source control
(setq user-personal-config (concat dotfiles-dir user-login-name "-personal.el"))
(if (file-exists-p user-personal-config) (load user-personal-config))

;; Give buffers with the same filename unique buffer names based on location
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Rebind "\C-o" to opening line at end (default behavior pastes line
;; after point to new line, but I do not like that)
(defun open-line-at-end ()
  (interactive)
  (move-end-of-line 1)
  (open-line 1)
  (next-line)
  (indent-for-tab-command))

(global-set-key "\C-o" 'open-line-at-end)
(global-set-key "\M-k" 'kill-whole-line)

;; Code indent levels
(setq c-basic-offset 2)
(setq lisp-indent-offset 2)
(setq javascript-indent-level 2)

;; because it is hard to do "\C-x#" on a uk mac
(global-set-key "\C-x\\" 'server-edit)

;; Whitespace cleanup keybinding
(global-set-key "\C-xw" 'whitespace-cleanup)

;; It's so easy to accidentally press ^Z and minimize emacs...
(global-unset-key "\C-z")

(require 'gist)

;; Major Modes
;(require 'textile-mode)
;(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

;(require 'haml-mode)
;(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;(require 'sass-mode)
;(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(add-hook 'ruby-mode-hook 'whitespace-mode)

;(add-to-list 'load-path (concat vendor-path "/rinari"))
;(require 'rinari)

;(require 'feature-mode)
;(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))

;; Functions
(require 'whitespace)
;(require 'line-num)
;(require 'undo-tree)

;; Other
(prefer-coding-system 'utf-8)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'erc-mode '(lambda () (progn
                             (auto-fill-mode 0)
                             (yas/minor-mode 1))))

(defun frame-position-in-upper-left ()
  (interactive)
  (set-frame-position (selected-frame) 3 0))

(defun full-macbook-screen ()
  (interactive)
  (set-frame-size (selected-frame) 210 58)
  (frame-position-in-upper-left))

(defun full-macbookpro-screen ()
  (interactive)
  (set-frame-size (selected-frame) 234 65))

(defun full-screen ()
  (interactive)
  (if (string-equal (system-name) "tom-ten-thijs-macbook-pro")
    (full-macbookpro-screen)
    (full-macbook-screen)))

(defun full-24-screen ()
  (interactive)
  (set-frame-size (selected-frame) 314 88))

;; enable windmove keybindings
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq tab-width 2)
(setq rinari-tags-file-name "TAGS")

; emacsclient server
(server-start)

; chrome "Edit with emacs" extension
;(require 'edit-server)
;(edit-server-start)
;(setq edit-server-new-frame nil)

; remove hooks that emacs-starter-kit thinks are nifty but are just annoying
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)
(remove-hook 'prog-mode-hook 'esk-add-watchwords)
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)

(setq ffip-limit 5000)

;; Whitespace cleanup keybinding
(global-set-key "\C-xw" 'whitespace-cleanup)

(setq whitespace-line-column 160)
