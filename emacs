(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq c-default-style "linux"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(require 'sr-speedbar)
(global-linum-mode 1)

(custom-set-faces
  '(my-tab-face            ((((class color)) (:background "grey80"))) t)
  '(my-trailing-space-face ((((class color)) (:background "red"))) t)
  '(my-long-line-face ((((class color)) (:background "gray80"))) t))

(add-hook 'font-lock-mode-hook
		  (function
			(lambda ()
			  (setq font-lock-keywords
					(append font-lock-keywords
							'(("^.\\{81,\\}$" (0 'my-long-line-face t))
							  ("[ \t]+$"      (0 'my-trailing-space-face t))))))))

(require 'fill-column-indicator)
(setq fci-rule-color "darkblue")
(add-hook 'after-change-major-mode-hook 'fci-mode)
