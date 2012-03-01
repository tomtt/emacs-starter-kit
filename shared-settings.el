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

(defun open-line-above ()
  (interactive)
  (indent-for-tab-command)  
  (previous-line)
  (open-line-at-end))

(global-set-key "\C-o" 'open-line-at-end)
(global-set-key "\M-o" 'open-line-above)
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

(global-set-key [C-tab] 'comment-or-uncomment-region)

(require 'gist)

(add-hook 'ruby-mode-hook 'whitespace-mode)
(require 'whitespace)

(prefer-coding-system 'utf-8)

;; enable windmove keybindings
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq tab-width 2)

;; Other
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

; remove hooks that emacs-starter-kit thinks are nifty but are just annoying
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)
(remove-hook 'prog-mode-hook 'esk-add-watchwords)
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)

(setq ruby-insert-encoding-magic-comment nil)

(setq ffip-limit 5000)

;;; rhtml mode
(add-to-list 'load-path "~/.emacs.d/lib/rhtml")
(require 'rhtml-mode)

;; Whitespace cleanup keybinding
(global-set-key "\C-xw" 'whitespace-cleanup)

(setq whitespace-line-column 160)

(menu-bar-mode 1)

(global-subword-mode 1)

(require 'camelscore)
(global-set-key "\C-cu" 'underscore-word-at-point)
(global-set-key "\C-cd" 'dasherize-word-at-point)
(global-set-key "\C-cc" 'camelize-word-at-point)
(global-set-key "\C-c:" 'colonize-word-at-point)
(global-set-key "\C-c;" 'colonize-word-at-point)
(global-set-key "\C-c/" 'camelscore-word-at-point)
(global-set-key "\C-cs" 'symbolize-word-at-point)
(global-set-key "\C-c'" 'quotify-word-at-point)
(global-set-key "\C-c\"" 'quotify-word-at-point)

(defun rocket ()
  (interactive)
  (insert " => "))

(global-set-key "\C-cl" 'rocket)

;; yasnippet
(require 'yasnippet-bundle)

; emacsclient server
(server-start)

(provide 'shared-settings)
;;; shared-settings.el ends here.
