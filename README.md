# Very rudimentary sync thing. (if you are on the same filesystem mind you)

Ok, first of, this does NOT synch files for you. It only makes emacs update for file changes so you can see what your friend is editing while you are at home sick or some such (this is why I did it). Though take a look at google docs API or some other such service for real background synching which you should be able to combine with this.

The python file is form https://bitbucket.org/denilsonsa/small_scripts/src/bdb5b72d3fd5e1cf4a2abe5716beae76245f463a/sleep_until_modified.py?at=default&fileviewer=file-view-default
Thanks for the good work!


There is two basic ways of doing this, either you add the following to a local .emacs file to the folder where you want to synch (that way you dont clog down your global one):

    ;;;;;;;;;;;;;;;;;;;;;;;;; BEGIN
    ;;; revert
    (global-auto-revert-mode 1)
    (setq revert-without-query '("*"))
    (setq auto-revert-verbose nil) ;; I think this is not needed in this case
    
    ;; Autosave like crazy 
    (setq auto-save-interval 1
          auto-save-timeout 1)
    
    (defun save-buffer-during-auto (&optional args)
      "Save the current buffer for real during autosave"
      (interactive)
      (if (buffer-file-name)
          (save-buffer)))
    
    (add-hook 'auto-save-hook 'save-buffer-during-auto)
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;; END
    
This should give both a view of what is happening. Though you will lose stuff if both write at the same time. The other option is same in all regards but I had (/have) hopes that it can be faster.

The other option is to use the whole .emacs file as is with the added scripts. Right now its very hardcoded, will fix.

Anyways I think I should be able to tinker with it to increase the speed. Also the python file uses polling right now, that could be improved as well for further performance.

use this to run it. 5199 is the PID of the program u want to be updated.
while ./sleep_until_modified.py testfile || sleep 1; do ./signal.sh 5199 ; done

signal.sh has a gawk version that is in the comments, it is from http://www.emacswiki.org/emacs/AutoSave