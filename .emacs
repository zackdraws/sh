(setq inhibit-startup-echo-area-message "tychoish")
(setq inhibit-startup-message t)
(server-start)
(cua-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq org-agenda-files '("/mnt/c/S/EM/O"))
(setq openwith-associations
      '(("\\.mp4\\'" "mpv" (file))))
(setq cfw:org-agenda-schedule-args '(:timestamp))
(setq cfw:org-overwrite-default-keybinding t)
(setq org-duration-format 'h:mm)

(setq frame-title-format '((:eval default-directory)))
(global-set-key (kbd "C-c 2") #'fzf)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c q") 'make-directory)
(global-set-key (kbd "C-c t") 'set-frame-alpha)
(global-set-key (kbd "C-c l") #'org-store-link)    
(global-set-key (kbd "C-c a") #'org-agenda) 
(global-set-key (kbd "C-c c") #'org-capture)  
(global-set-key (kbd "C-c f") #'neotree-dir)
(global-set-key (kbd "C-c h") #'neotree-toggle)
(global-set-key (kbd "C-c g") #'0blayout-switch)
(global-set-key (kbd "C-c w") 'peep-dired)
(global-set-key (kbd "C-c h") 'httpd-serve-directory)
(global-set-key (kbd "C-c e") 'impatient-mode)
(global-set-key (kbd "C-c m") 'magit)
(global-set-key (kbd "C-c r") 'counsel-outline)
(global-set-key (kbd "C-c i") 'overwrite-mode)
(global-set-key (kbd "C-c d") 'org-clock-timestamps-down) 
(global-set-key (kbd "C-c e") 'org-clock-timestamps-up) 
(global-set-key (kbd "C-c e") 'org-clock-timestamps-up) 
(global-set-key (kbd "C-c q") 'make-directory)
(global-set-key (kbd "C-c t") 'set-frame-alpha)
(global-set-key (kbd "C-c l") #'org-store-link)    
(global-set-key (kbd "C-c a") #'org-agenda) 
(global-set-key (kbd "C-c c") #'org-capture)  
(global-set-key (kbd "C-c f") #'neotree-dir)
(global-set-key (kbd "C-c h") #'neotree-toggle)
(global-set-key (kbd "C-c g") #'0blayout-switch)
(global-set-key (kbd "C-c w") 'peep-dired)
(global-set-key (kbd "C-c h") 'httpd-serve-directory)
(global-set-key (kbd "C-c e") 'impatient-mode)
(global-set-key (kbd "C-c m") 'magit)
(global-set-key (kbd "C-c r") 'counsel-outline)
(global-set-key (kbd "C-c i") 'overwrite-mode)
(global-set-key (kbd "C-c d") 'org-clock-timestamps-down) 
(global-set-key (kbd "C-c e") 'org-clock-timestamps-up) 
(global-set-key (kbd "C-c e") 'org-clock-timestamps-up) 
(require 'dired-x)
(require 'org)

(add-to-list 'load-path "~/.emacs.d/compat")
(require 'compat)


(add-to-list 'load-path "~/.emacs.d/dash")
(add-to-list 'load-path "~/.emacs.d/transient/")
(add-to-list 'load-path "~/.emacs.d/with-editor")

;; Initialize the package system
(require 'package)



(require 'dash)
(require 'transient)
(require 'with-editor)
(ivy-mode 1)
