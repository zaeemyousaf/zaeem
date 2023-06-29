(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(visual-line-mode t)
;; ;; lsp-mode indentation tab is disabled
;; (setq lsp-enable-indentation nil)
;; (setq lsp-enable-on-type-formatting nil)

;; comment region
(global-set-key (kbd "C-c C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-c C-u") 'uncomment-region)

;; veritical markers
(add-to-list 'load-path "~/.emacs.d/highlight-indent-guides")
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; make ibuffer default instead of buffer-menu
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'ibuf-ext)
;; do not show buffers with *, it will remove the clutter
(add-to-list 'ibuffer-never-show-predicates "^\\*")
;; auto-pair closing brackets
(require 'flex-autopair)
(flex-autopair-mode 1)
;;;; auto-complete mode for lisp mode
(defun my-auto-complete-fun ()
  (lambda ()
    (setq helm-mode nil)
    (company-mode)
    (require 'auto-complete)
    (require 'auto-complete-config)
    (ac-config-default)
    (define-key ac-mode-map (kbd "TAB") nil)
    (define-key ac-completing-map (kbd "TAB") nil)
    (define-key ac-completing-map [tab] nil))
  )

(add-hook 'lisp-mode-hook 'my-auto-complete-fun)
(add-hook 'emacs-lisp-mode-hook 'my-auto-complete-fun)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 173 :width normal))))
 '(fixed-pitch ((t (:family "Fira Code Retina" :height 160))))
 '(highlight ((t (:background "dim gray")))))
;; change the color of selection text
(set-face-attribute 'region nil :background "#777")

;; ;; start the initial fram maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; ;;------------today
(setq package-check-signature nil)

;; ;; remove scroll bar from right
(scroll-bar-mode 0)
;; remove tool bar
(tool-bar-mode 0)
;; remove menu bar
(menu-bar-mode 0)
;;turn on icomplete mode
;;(icomplete-mode 0)
;; tabbar-mode
;;(tabbar-mode t)
;; ;; fontfiy
(setq org-src-fontify-natively t)
;; enabling bable languages
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))
;; babale org mode for sh
(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t)))
;; for Python
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))
;; org-babel for java
(org-babel-do-load-languages
 'org-babel-load-languages
 '((java . t)))
;; macro for compile and run a make file and run in separate buffer
(fset ':compile
      "\C-x\C-s\370compile")

;; set global key for :compile as shortcut
(global-set-key (kbd "C-,") ':compile)
;; kbd-macro to open cpp test file
(fset ':test-cpp
      [?\C-x ?\C-f ?D ?e ?s ?k ?t ?o ?p ?/ ?t ?e ?s ?t ?/ ?c ?p ?p ?/ ?t ?e ?s ?t ?_ ?m ?a ?i ?n ?. ?c ?p ?p return])
;; disable iniital start up message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
;; revert buffer after each time file updated
(global-auto-revert-mode 1)
;;; Also highlight parens 
(setq show-paren-delay 0 show-paren-style 'parenthesis) (show-paren-mode 1)
;; cpp init
(fset 'init-cpp
      [?# ?i ?n ?c ?l ?u ?d ?e ?< ?i ?o ?s ?t ?r ?e ?a ?m ?> return ?u ?s ?i ?n ?g ?  ?n ?m ?a backspace backspace ?a ?m ?e ?s ?p ?a ?c ?e ?  ?s ?t ?d ?\; return return ?i ?n ?t ?  ?m ?a ?i ?n ?\( ?\) ?\{ ?\} ?\C-b return return ?\C-p tab])
;; it opesn a file which has memory diagram
(fset 'draw-mem
      [?\C-x ?1 ?\C-x ?2 ?\C-x ?o ?\C-x ?b ?* ?s ?c ?r ?a ?t ?c ?h ?* ?\C-m ?\M-x ?t ?e ?x ?t ?- ?m ?o ?d ?e ?\C-m ?\C-x ?i ?\C-a ?\C-k ?~ ?/ ?t ?e ?a ?c ?h ?i ?n ?g ?/ ?e ?m ?a ?c ?s ?_ ?c ?o ?n ?f ?/ ?m ?e ?m ?. ?t ?x ?t ?\C-m ?\M-x ?o ?v ?e ?r ?w ?r ?i ?t ?e ?- ?m ?o ?d ?e ?\C-m])
;; org-babel for ditaa
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))
;; org-bael for plantuml
(setq org-plantuml-jar-path (expand-file-name "/usr/local/bin/plantuml.jar"))

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
;; correctly load org-babel for plantuml
(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
                                                           (plantuml . t)
                                                           )))
;; left aligned table
(setq org-latex-tables-centered nil)
;; increase tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux") 
(setq c-basic-offset 4)
(c-set-offset 'comment-intro 0)

;; bug fix for python org babel
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

;;to set box around source code block when exporting to pdf
;;inside .emacs file
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; to display emacs refcard manual in current buffer
(fset 'refcard
      "\C-x\C-f/home/zaeem/zyousaf/programming/emacs/refcard.pdf\C-m")

;; ;; c-x c-b focus other windows as well
(define-key global-map [remap list-buffers] 'buffer-menu-other-window)
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
(which-key-setup-side-window-right)
(setq lsp-keymap-prefix "C-c C-a") ;; remap original s-l
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "b54bf2fa7c33a63a009f249958312c73ec5b368b1094e18e5953adb95ad2ec3a" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" default)))
 '(fci-rule-color "#3E4451")
 '(highlight-indent-guides-method (quote bitmap))
 '(lsp-warn-no-matched-clients nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (pug-mode flycheck-grammarly react-snippets prettier-js lsp-java lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode zenburn-theme json-mode)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828")))
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

;; emmet mode for react closing tag
(add-to-list 'load-path "~/Emacs/emmet/")
(require 'emmet-mode)
;; It assummes that lsp-mode is enabled
(add-hook 'lsp-mode-hook 'emmet-mode) ;; Auto-start on any markup modes

;; add server script to run reactjs server
(fset 'init-react-server
      "const express = require('express');
const app = express();
app.use(express.static('public'));
app.listen(3000, function () {
    console.log('App started on port 3000');
});
"
      )
;; bug fix for python org babel
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(add-to-list 'load-path "~/") ;; to reset the manual path to homedir
;; treat js file as jsx
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-jsx-mode))
;; enable lisp mode in scratch mode
(add-to-list 'auto-mode-alist '("\\*scratch*\\'" . lisp-mode))
