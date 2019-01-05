(require 'package)
(package-refresh-contents)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-list '(evil company rust-mode racer cargo flycheck flycheck-rust))
(package-initialize)

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)

; helm
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)

; evil
(evil-mode 1)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook  #'company-mode)
(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

; (add-hook 'rust-mode-hook
;     '(lambda ()
;         (setq racer-cmd (concat (getenv "HOME") "/.rust-dev/racer/target/release/racer"))
; 	      (setq racer-rust-src-path (concat (getenv "HOME") "/.rust-dev/rust/src"))
;         (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
; 	      (electric-pair-mode 1)))

(provide 'init-rust)

(setq rust-format-on-save t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(setq-default save-place t)

;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-mode-manager ## helm-core helm racer go-mode flycheck-rust evil company cargo atom-one-dark-theme async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
