(require 'shared-settings)
(require 'frame-positioning)

;; Major Modes
;(require 'textile-mode)
;(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;(require 'undo-tree)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

;(require 'haml-mode)
;(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;(require 'sass-mode)
;(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;(add-to-list 'load-path (concat vendor-path "/rinari"))
;(require 'rinari)

;(require 'feature-mode)
;(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))

;; Functions
;(require 'line-num)

(add-hook 'erc-mode '(lambda () (progn
                             (auto-fill-mode 0)
                             (yas/minor-mode 1))))


(setq rinari-tags-file-name "TAGS")

; chrome "Edit with emacs" extension
;(require 'edit-server)
;(edit-server-start)
;(setq edit-server-new-frame nil)
