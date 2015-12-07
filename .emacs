;; update script thing
(define-key special-event-map [sigusr1]
  (lambda ()
    (interactive)
    (revert-buffer t t)))
;;    (save-buffer)))

(defun save-buffer-during-auto (&optional args)
  "Save the current buffer for real during autosave"
  (interactive)
  (if (buffer-file-name)
      (save-buffer)))

;;(add-hook 'auto-save-hook 'save-buffer-during-auto)
;;(add-hook 'post-command-hook 'save-buffer-during-auto) ;; updates even though nothing happens

(defvar last-post-command-position 0
  "Holds the cursor position from the last run of post-command-hooks.")

(make-variable-buffer-local 'last-post-command-position)

(defun do-stuff-if-moved-post-command ()
  (unless (equal (point) last-post-command-position)
  (interactive)
  (if (buffer-file-name)
      (save-buffer)))
  (setq last-post-command-position (point)))

(add-to-list 'post-command-hook 'do-stuff-if-moved-post-command)
  
;;; revert
(global-auto-revert-mode 1)
(setq revert-without-query '("*"))
(setq auto-revert-verbose nil) 

;; Autosave like crazy 
(setq auto-save-interval 1
      auto-save-timeout 1)
