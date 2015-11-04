(require 'package)
;;Add melpa repositories
;;---------------------------------
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;---------------------------------
(package-initialize)

;;Load packages
;; (require 'powerline)
;; (powerline-vim-theme)
(require 'evil)
(evil-mode 1)
;;(xclip-mode 1)
(require 'key-chord)
(key-chord-mode 1)  
(require 'evil-leader)
(global-evil-leader-mode)
;; (require 'auto-complete)
;; (global-auto-complete-mode t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/marcmarquez/.emacs.d/elpa/auto-complete-20*/dict")
(ac-config-default)
(require 'go-autocomplete)
(require 'go-eldoc)
    (add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'yasnippet)
(yas-global-mode 1)
(require 'auto-yasnippet)
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)
;;Enable ditta in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
  '((ditaa . t) ; this line activates ditaa
    (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "/usr/share/emacs/24.5/lisp/contrib/scripts/plantuml.jar"))
(require 'erlang-start)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; (when (require 'auto-complete nil t)
;;   (require 'auto-complete-yasnippet)
;;   (require 'auto-complete-python)
;;   (require 'auto-complete-css) 
;;   (require 'auto-complete-cpp)  
;;   (require 'auto-complete-emacs-lisp)  
;;   (require 'auto-complete-semantic)  
;;   (require 'auto-complete-gtags)

;;   (global-auto-complete-mode t)
;;   (setq ac-auto-start 3)
;;   (setq ac-dwim t)
;;   (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-symbols))
  
;;Disable top menu bar
(menu-bar-mode -99)

;;Disable  toolbar
(tool-bar-mode -1)

;;Workaround to have copy/paste using X11 when emacs in on a terminal.
;; https://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
;; I prefer using the "clipboard" selection (the one the
;; typically is used by c-c/c-v) before the primary selection
;; (that uses mouse-select/middle-button-click)
(setq x-select-enable-clipboard t)

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
  (when (getenv "DISPLAY")
    ;; Callback for when user cuts
    (defun xsel-cut-function (text &optional push)
      ;; Insert text to temp-buffer, and "send" content to xsel stdin
      (with-temp-buffer
	(insert text)
	;; I prefer using the "clipboard" selection (the one the
	;; typically is used by c-c/c-v) before the primary selection
	;; (that uses mouse-select/middle-button-click)
	(call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
    ;; Call back for when user pastes
    (defun xsel-paste-function()
      ;; Find out what is current selection by xsel. If it is different
      ;; from the top of the kill-ring (car kill-ring), then return
      ;; it. Else, nil is returned, so whatever is in the top of the
      ;; kill-ring will be used. 
      (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
	(unless (string= (car kill-ring) xsel-output)
	  xsel-output )))
    ;; Attach callbacks to hooks
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)
    ;; Idea from
    ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
    ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
    ))

;;Evil settings
;;;;;;;;;;;;;;

;;Change 'ESC' key combination
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;;Evil-leader settings
(evil-leader/set-leader "<SPC>")

;;;;;;;;;;;;;;;;;;;;;;;;
;;CUSTOM (DON'T TOUCH);;
;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

