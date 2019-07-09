(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

; helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(helm-mode 1)

; evil
(require 'evil)
(evil-mode 1)

; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  ","  'helm-M-x
  "l"  'helm-find-files)

; (require 'company)
; (setq company-global-modes '(not lisp-mode))
; (global-company-mode 1)
; (add-hook 'after-init-hook 'global-company-mode)

; Reduce the time after which the company auto completion popup opens
; (setq company-idle-delay 0.1)

; Reduce the number of characters before company kicks in
; (setq company-minimum-prefix-length 1)

; (with-eval-after-load 'company
;   (define-key company-active-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
;   (define-key company-active-map (kbd "TAB") (lambda () (interactive) (company-complete-common-or-cycle 1)))
;   (define-key company-active-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1))))

(use-package rust-mode
    :mode "\\.rs\\'"
    :init
    (setq rust-format-on-save t))

; racer
(use-package racer
  :config (progn
            (setq company-tooltip-align-annotations t ;
                  racer-cmd (expand-file-name "~/.cargo/bin/racer")
                  racer-rust-src-path (expand-file-name (getenv "RUST_SRC_PATH")))
            (add-hook 'rust-mode-hook  #'racer-mode)
            (add-hook 'racer-mode-hook #'eldoc-mode)
            (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
            (add-hook 'racer-mode-hook #'company-mode)))

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)

; Highlights matching parenthesis
(show-paren-mode 1)

; When you visit a file, point goes to the last place where it
; was when you previously visited the same file.
; http://www.emacswiki.org/emacs/SavePlace
(setq-default save-place t)

; keep track of saved places in ~/.emacs.d/places
; (setq save-place-file (concat user-emacs-directory "places"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (## monokai-alt-theme spacemacs-theme go-mode flycheck-rust elixir-mode list-packages-ext dracula-theme cargo racer company rust-mode helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
