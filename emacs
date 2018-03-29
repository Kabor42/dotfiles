;; init.el -- Emacs configuration

;; INSTALL PACKAGES
;; -----------------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my:Packages
  '(auto-complete
    auto-complete-c-headers
    better-defaults
    cedet
    cmake-ide
    ein
    elpy
    google-c-style
    flycheck
    flymake-cursor
    flymake-google-cpplint
    iedit
;;    irony
    material-theme
    py-autopep8
    rtags
    yasnippet))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my:Packages)

;; BASIC CUSTOMIZATION
;; -----------------------------------------------

(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(eval-after-load 'flymake '(require 'flymake-cursor))
;;(flymake-cursor-auto-enable 1)

;;
;; USER experience
;;
;; easy keys for split windows
(global-set-key (kbd "M-3") 'delete-other-windows) ; 【Alt+3】 unsplit all
(global-set-key (kbd "M-4") 'split-window-below)
(global-set-key (kbd "M-$") 'split-window-right)
(global-set-key (kbd "M-RET") 'other-window) ; 【Alt+Return】 move cursor to next pane
(global-set-key (kbd "M-0") 'delete-window)  ; remove current pane

;; PYTHON CONFIGURATION
;; --------------------------------------------------

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; C/C++ CONFIGURATION
;; --------------------------------------------------

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Turn on semantic completion
(semantic-mode 1)
(global-semantic-idle-scheduler-mode 1)
(defun my:add-semantic-to-ac ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-ac)

;; Irony mode C/C++ completion
;;(require 'irony)
;;(irony-enable 'ac)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)
;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)

;; Init.el ends
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#3a3a3a")
 '(flymake-google-cpplint-command "/usr/bin/cpplint")
 '(hl-sexp-background-color "#121212")
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized ac-rtags company-rtags flycheck-rtags rtags cmake-ide company-c-headers irony flymake-cppcheck ac-clang auto-complete-clang auto-complete-clang-async clang-format flycheck flycheck-clang-analyzer flycheck-clang-tidy google-c-style flymake-cursor flymake-google-cpplint iedit yasnippet yasnippet-snippets auto-complete-c-headers)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
