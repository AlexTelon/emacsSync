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

(add-hook 'auto-save-hook 'save-buffer-during-auto)

;;; revert
(global-auto-revert-mode 1)
(setq revert-without-query '("*"))
(setq auto-revert-verbose nil) 

;; Autosave like crazy 
(setq auto-save-interval 1
      auto-save-timeout 1)
;; 1 2 3 4 5
