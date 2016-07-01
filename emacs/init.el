(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t)

(require 'package)
(add-to-list 'package-archives '("org" .   "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(require 'evil)
(evil-mode 1)
(package-initialize)
