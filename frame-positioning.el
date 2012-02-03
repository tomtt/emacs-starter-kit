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

(provide 'frame-positioning)
