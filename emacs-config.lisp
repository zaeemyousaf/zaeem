;; ;; start the initial fram maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; ;;------------today
(setq package-check-signature nil)

;; ;; (require 'package)
;; ;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; ;; (package-initialize)								
;; ;; ;; auto-complete mode
;; ;; (require 'auto-complete)
;; ;; (require 'auto-complete-config)
;; ;; (ac-config-default)
;; ;;------------today

;; ;;============== added to remove tab completion
;; ;; (define-key ac-mode-map (kbd "TAB") nil)
;; ;; (define-key ac-completing-map (kbd "TAB") nil)
;; ;; (define-key ac-completing-map [tab] nil)
;; ;;==============

;; ;; set up yasnippet
;; ;;------------today
;; ;; (require 'yasnippet)
;; ;; (yas-global-mode 1)
;; ;;------------today
;; ;;auto-complete for c/c++ headers
;; ;;------------today
;; ;; (defun my:auto-complete-headers()
;; ;;   (require 'auto-complete-c-headers)
;; ;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;; ;;   (add-to-list 'achead:include-directories '"/usr/include/c++/9")
;; ;;   (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/9")
;; ;;   (add-to-list 'achead:include-directories '"/usr/include/c++/9/backward")
;; ;;   (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/9/include")
;; ;;   (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
;; ;;   (add-to-list 'achead:include-directories '"/usr/local/include"))
;; ;; (add-hook 'c++-mode-hook 'my:auto-complete-headers)
;; ;; (add-hook 'c-mode-hook 'my:auto-complete-headers)
;; ;;------------today

;; ;; ;; semantic mode to use intellisence
;; ;; (semantic-mode 1)
;; ;; (defun my:add-semantic-to-autocomplete()
;; ;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; ;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; ;; (global-ede-mode 1)

;; ;;------------today
;; ;; (custom-set-variables
;; ;;  ;; custom-set-variables was added by Custom.
;; ;;  ;; If you edit it by hand, you could mess it up, so be careful.
;; ;;  ;; Your init file should contain only one such instance.
;; ;;  ;; If there is more than one, they won't work right.
;; ;;  '(ansi-color-faces-vector
;; ;;    [default default default italic underline success warning error])
;; ;;  '(ansi-color-names-vector
;; ;;    ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
;; ;;  '(custom-enabled-themes (quote (dracula)))
;; ;;  '(custom-safe-themes
;; ;;    (quote
;; ;;     ("b54bf2fa7c33a63a009f249958312c73ec5b368b1094e18e5953adb95ad2ec3a" default)))
;; ;;  '(desktop-save-mode nil)
;; ;;  '(ede-project-directories
;; ;;    (quote
;; ;;     ("/tmp/myproject/include" "/tmp/myproject/src" "/tmp/myproject" "/home/zaeem/Desktop" "/home/zaeem")))
;; ;;  '(package-selected-packages
;; ;;    (quote
;; ;;     (rjsx-mode js-auto-beautify magit web-completion-data show-css ob-browser ac-html impatient-mode yasnippet-snippets atom-dark-theme dracula-theme gruvbox-theme atom-one-dark-theme prettier web-mode markdown-mode emmet-mode ac-js2 dummyparens flex-autopair dumb-jump android-mode android-env zygospore ws-butler volatile-highlights use-package undo-tree tabbar plantuml-mode php-quickhelp org-bullets ob-prolog ob-napkin memoize indent-guide iedit highlight-indent-guides helm-swoop helm-projectile helm-gtags ghci-completion flymake-php flymake-haskell-multi flycheck-php-noverify flycheck-haskell flycheck-ghcmod flycheck-clang-analyzer ess-view-data ess-r-insert-obj ess-R-data-view ediprolog dtrt-indent cpp-auto-include company-php comment-dwim-2 clean-aindent-mode auto-indent-mode auto-complete-clang-async auto-complete-clang auto-complete-c-headers anzu ac-php ac-haskell-process ac-clang)))
;; ;;  '(speedbar-default-position (quote left)))

;; ;; '(global-visual-line-mode t)
;; ;; '(highlight-indent-guides-method (quote bitmap))
;; ;; '(indent-tabs-mode t)
;; ;; '(jdee-server-dir "~/jdee-server/")
;; ;; '(org-src-preserve-indentation nil)
;; ;; '(package-archives
;; ;;   (quote
;; ;;    (("gnu" . "https://elpa.gnu.org/packages/")
;; ;;     ("melpa" . "https://melpa.org/packages/"))))
;; ;; '(package-selected-packages
;; ;;   (quote
;; ;;    (org-bullets ada-mode ghci-completion flymake-haskell-multi flycheck-haskell flycheck-ghcmod ac-haskell-process flycheck-clang-analyzer cpp-auto-include php-quickhelp flycheck-php-noverify flymake-php company-php ac-php ediprolog tabbar ess ess-R-data-view ess-r-insert-obj ess-view-data plantuml-mode ob-napkin ob-prolog iedit ac-clang ripgrep ac-helm wgrep counsel-ag-popup highlight-indent-guides htmlize auto-complete-c-headers ac-html-bootstrap gnu-elpa-keyring-update yasnippet gnu-elpa auto-complete)))
;; ;; (custom-set-faces
;; ;;  ;; custom-set-faces was added by Custom.
;; ;;  ;; If you edit it by hand, you could mess it up, so be careful.
;; ;;  ;; Your init file should contain only one such instance.
;; ;;  ;; If there is more than one, they won't work right.
;; ;;  '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 173 :width normal))))
;; ;;  '(fixed-pitch ((t (:family "Fira Code Retina" :height 160))))
;; ;;  '(org-document-title ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif" :height 2.0 :underline nil))))
;; ;;  '(org-level-1 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif" :height 1.75))))
;; ;;  '(org-level-2 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif" :height 1.5))))
;; ;;  '(org-level-3 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif" :height 1.25))))
;; ;;  '(org-level-4 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif" :height 1.1))))
;; ;;  '(org-level-5 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif"))))
;; ;;  '(org-level-6 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif"))))
;; ;;  '(org-level-7 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif"))))
;; ;;  '(org-level-8 ((t (:inherit default :weight bold :foreground "white smoke" :family "Sans Serif"))))
;; ;;  '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin)))))
;; ;;------------today

;; ;; remove scroll bar from right
;; (scroll-bar-mode 0)
;; ;; remove tool bar
;; (tool-bar-mode 0)
;; ;; remove menu bar
;; (menu-bar-mode 0)
;; ;;turn on icomplete mode
;; (icomplete-mode 1)
;; ;; tabbar-mode
;; ;(tabbar-mode t)
;; ;; fontfiy
;; (setq org-src-fontify-natively t)
;; ;; enabling bable languages
;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((C . t)))
;; ;; babale org mode for sh
;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((shell . t)))
;; ;; for Python
;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((python . t)))
;; ;; for prolog
;; (add-to-list 'load-path "/path/to/ob-prolog-dir")
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((prolog . t)))
;; ;; org-babel for java
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((java . t)))

;; ;; macro for compile and run a make file and run in separate buffer
;; (fset ':compile
;;       "\C-x\C-s\370compile")

;; ;; set global key for :compile as shortcut
;; (global-set-key (kbd "C-,") ':compile)
;; ;; kbd-macro to open cpp test file
;; (fset ':test-cpp
;;       [?\C-x ?\C-f ?D ?e ?s ?k ?t ?o ?p ?/ ?t ?e ?s ?t ?/ ?c ?p ?p ?/ ?t ?e ?s ?t ?_ ?m ?a ?i ?n ?. ?c ?p ?p return])
;; ;; disable iniital start up message
;; (setq inhibit-startup-message t) 
;; (setq initial-scratch-message nil)
;; ;; comment region
;; (global-set-key (kbd "C-c C-c C-c") 'comment-region)
;; (global-set-key (kbd "C-c C-c C-u") 'uncomment-region)
;; ;; highlight indentation mode
;; ;; (add-to-list 'load-path "~/.emacs.d/highlight-indentation")
;; ;; ;; functions which sets its minor modes
;; ;; (defun my:highlight-indent()
;; ;;   (require 'highlight-indentation)
;; ;;   (highlight-indentation-mode 1)
;; ;;   (highlight-indentation-current-column-mode 1))
;; ;; ;; highlight-indentation hook for c/c++
;; ;; (add-hook 'c++-mode-hook 'my:highlight-indent)
;; ;; (add-hook 'c-mode-hook 'my:highlight-indent)

;; ;; highlight-indentation another one
;; ;; (require 'indent-guide)
;; ;; (indent-guide-global-mode)
;; ;; ;;(set-face-background 'indent-guide-face "dimgray")
;; ;; ;(setq indent-guide-char ":")

;; ;; ;; (add-to-list 'load-path "~/.emacs.d/highlight-indentation/highlight-indent-guides-master")
;; ;; ;; (require 'highlight-indent-guides)
;; ;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; ;; ;; hide-show mode
;; ;; (add-hook 'prog-mode-hook #'hs-minor-mode)

;; ;; revert buffer after each time file updated
;; (global-auto-revert-mode 1)
;; ;; helm

;; ;;(require 'ac-helm) ;; Not necessary if using ELPA package
;; (global-set-key (kbd "C-:") 'ac-complete-with-helm)
;; (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
;; ;;kill-compilation
;; (global-set-key (kbd "C-.") 'kill-compilation)
;; ;;; Always do syntax highlighting 
;; (global-font-lock-mode 1) 

;; ;;; Also highlight parens 
;; (setq show-paren-delay 0 show-paren-style 'parenthesis) (show-paren-mode 1) 

;; ;;; This is the binary name of my scheme implementation 
;; (setq scheme-program-name "mzscheme")
;; ;; cpp init
;; (fset 'init-cpp
;;       [?# ?i ?n ?c ?l ?u ?d ?e ?< ?i ?o ?s ?t ?r ?e ?a ?m ?> return ?u ?s ?i ?n ?g ?  ?n ?m ?a backspace backspace ?a ?m ?e ?s ?p ?a ?c ?e ?  ?s ?t ?d ?\; return return ?i ?n ?t ?  ?m ?a ?i ?n ?\( ?\) ?\{ ?\} ?\C-b return return ?\C-p tab])

;; ;; it opesn a file which has memory diagram
;; (fset 'draw-mem
;;       [?\C-x ?1 ?\C-x ?2 ?\C-x ?o ?\C-x ?b ?* ?s ?c ?r ?a ?t ?c ?h ?* ?\C-m ?\M-x ?t ?e ?x ?t ?- ?m ?o ?d ?e ?\C-m ?\C-x ?i ?\C-a ?\C-k ?~ ?/ ?t ?e ?a ?c ?h ?i ?n ?g ?/ ?e ?m ?a ?c ?s ?_ ?c ?o ?n ?f ?/ ?m ?e ?m ?. ?t ?x ?t ?\C-m ?\M-x ?o ?v ?e ?r ?w ?r ?i ?t ?e ?- ?m ?o ?d ?e ?\C-m])
;; ;; org-babel for ditaa
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ditaa . t)))
;; ;; org-bael for plantuml
;; (setq org-plantuml-jar-path (expand-file-name "/usr/local/bin/plantuml.jar"))

;; (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
;; (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
;; ;; correctly load org-babel for plantuml
;; (with-eval-after-load 'org
;;   (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
;;                                                            (plantuml . t)
;;                                                            )))
;; ;; left aligned table
;; (setq org-latex-tables-centered nil)
;; ;; increase tab width
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
;; (setq c-default-style "linux") 
;; (setq c-basic-offset 4) 
;; (c-set-offset 'comment-intro 0)
;; ;; load prolog
;; (require 'ediprolog)
;; (global-set-key [f10] 'ediprolog-dwim)
;; ;; adding php stuff
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (require 'company-php)
;;              (company-mode t)
;;              (add-to-list 'company-backends 'company-ac-php-backend)))

;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (auto-complete-mode t)
;;              (require 'ac-php)
;;              (setq ac-sources '(ac-source-php))
;;              (yas-global-mode 1)

;;              (define-key php-mode-map (kbd "C-]")
;;                'ac-php-find-symbol-at-point)
;;              (define-key php-mode-map (kbd "C-t")
;;                'ac-php-location-stack-back)))
;; ;; flymake for php
;; (require 'flymake-php)
;; (add-hook 'php-mode-hook 'flymake-php-load)
;; ;; flycheck for clang
;; (with-eval-after-load 'flycheck
;;   (require 'flycheck-clang-analyzer)
;;   (flycheck-clang-analyzer-setup))
;; ;; haskell development mode
;; (eval-after-load 'flycheck '(require 'flycheck-ghcmod))
;; ;; flymake check for haskell
;; (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

;; (require 'flymake-haskell-multi)
;; (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)
;; ;; ghci auto-completion
;; (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)
;; ;; bug fix for python org babel
;; (with-eval-after-load 'python
;;   (defun python-shell-completion-native-try ()
;;     "Return non-nil if can trigger native completion."
;;     (let ((python-shell-completion-native-enable t)
;;           (python-shell-completion-native-output-timeout
;;            python-shell-completion-native-try-output-timeout))
;;       (python-shell-completion-native-get-completions
;;        (get-buffer-process (current-buffer))
;;        nil "_"))))
;; ;;to set box around source code block when exporting to pdf
;;                                         ;inside .emacs file
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '(("" "minted"))
;;       org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; (add-hook 'text-mode-hook 'visual-line-mode)
;; ;; activate dumb-jump
;; ;; its shortcut is M-.
;; (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(
;; ;; insert closing brackets and double quotes
;; (require 'flex-autopair)
;; (flex-autopair-mode 1)
;; ;; skeleton-insert
;; (add-to-list 'load-path "~/.emacs.d/skeleton.el")
;; ;; to display emacs refcard manual in current buffer
;; (fset 'refcard
;;       "\C-x\C-f/home/zaeem/zyousaf/programming/emacs/refcard.pdf\C-m")
;; ;;========================
;; ;; https://timunkert.net/2021/12/emacs-setup.html
;; ;; load theme
;; (load-theme 'atom-one-dark t)
;; ;; emmet-mode
;; (add-to-list 'load-path "~/Emacs/emmet/")
;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'html-mode-hook 'emmet-mode)
;; (add-hook 'css-mode-hook  'emmet-mode)

;; ;; web mode
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2)
;;   )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)
;; ;; c-x c-b focus other windows as well
;; (define-key global-map [remap list-buffers] 'buffer-menu-other-window)
;; ;; as soon as web-mode is selected make sure to run the daemon mode for interactive dev
;; ;; (add-hook 'web-mode-hook
;; ;;           '(lambda ()
;; ;;           (emmet-mode 1)
;; ;;           (httpd-start)
;; ;;           (impatient-mode t)
;; ;;           (eval-after-load 'impatient-mode
;; ;;             (browse-url "http://localhost:8080/imp/"))))

;; ;; show-css
;; (defun sm/toggle-showcss()
;;   "Toggle showcss-mode"
;;   (interactive)
;;   (if (derived-mode-p
;;        'html-mode
;;        'nxml-mode
;;        'nxhtml-mode
;;        'web-mode
;;        'handlebars-mode)
;;       (showcss-mode 'toggle)
;;     (message "Not in an html mode")))
;; (global-set-key (kbd "C-c C-k") 'sm/toggle-showcss)

;; create dir for a fiverr client
(defun fiverr-create-dir (folderName1 username)
  "Create a directory with the name of folderName1 and a subdirectory with the name of username."
  (interactive "sEnter Language name: \nsEnter ClientName: ")
  (let ((dir (concat "/home/zaeem/git/private/fiverr/" folderName1 "/" username)))    
    (make-directory dir)
    (dired dir)))

;; open fiver language folder
(defun fiverr-open-dir (language)
  "opens a folder in specific language"
  (interactive "sEnter Language name: ")
  (let ((dir (concat "/home/zaeem/git/private/fiverr/" language)))
    (dired dir)))

;;emacs config for reactjs
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode zenburn-theme json-mode))
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))
(load-theme 'zenburn t)
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

;; jump to definition in reactjs
(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))
