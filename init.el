(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(require 'mypackages)

;; You can keep system- or user-specific customizations here
(setq user-specific-color-theme (concat dotfiles-dir "color-theme-" user-login-name ".el"))
(if (file-exists-p user-specific-color-theme) (load user-specific-color-theme))
