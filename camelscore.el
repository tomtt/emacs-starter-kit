(defun split-name-to-components (s)
  (split-string
    (let ((case-fold-search nil))
      (downcase
        (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
    "[^A-Za-z0-9]+"))

(defun camelcase  (s) (mapconcat 'capitalize (split-name-to-components s) ""))
(defun underscore (s) (mapconcat 'downcase   (split-name-to-components s) "_"))
(defun dasherize  (s) (mapconcat 'downcase   (split-name-to-components s) "-"))
(defun colonize   (s) (mapconcat 'capitalize (split-name-to-components s) "::"))

(defun camelscore (s)	
  (cond
    ((string-match-p "\:" s) (camelcase s))
    ((string-match-p "-"  s) (colonize s))
    ((string-match-p "_"  s) (dasherize s))
    (t (underscore s))))

(defun camel-change-word-at-point (function)
  (let* ((case-fold-search nil)
          (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
          (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
          (txt (buffer-substring beg end))
          (cml (funcall function txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))

(defun camelize-word-at-point ()
  (interactive)
  (camel-change-word-at-point 'camelcase))

(defun dasherize-word-at-point ()
  (interactive)
  (camel-change-word-at-point 'dasherize))

(defun underscore-word-at-point ()
  (interactive)
  (camel-change-word-at-point 'underscore))

(defun colonize-word-at-point ()
  (interactive)
  (camel-change-word-at-point 'colonize))

(defun camelscore-word-at-point ()
  (interactive)
  (camel-change-word-at-point 'camelscore))

(provide 'camelscore)
