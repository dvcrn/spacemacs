;;; packages.el --- jekyll Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq jekyll-packages
    '(
      hyde
      markdown-mode
      ))

;; List of packages to exclude.
(setq jekyll-excluded-packages '())

;; For each package, define a function jekyll/init-<package-name>
;;
;; (defun jekyll/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun jekyll/init-hyde ()
   "Initialize my package"
   (use-package hyde
     :defer t
     :init
     (progn
       (require 'hyde)
       (defvar hyde-home nil)
       (define-derived-mode jekyll-mode hyde-markdown-mode "jekyll")

       (add-to-list 'magic-mode-alist '("---" . jekyll-mode)))
     :config
     (progn
       (evil-leader/set-key-for-mode 'jekyll-mode "mh" 'hyde)
       (evil-leader/set-key-for-mode 'jekyll-mode "ms" 'hyde/serve)
       (evil-leader/set-key-for-mode 'jekyll-mode "mS" 'hyde/stop-serve)
       (evil-leader/set-key-for-mode 'jekyll-mode "mj" 'hyde/run-jekyll)

       (evil-leader/set-key-for-mode 'hyde/hyde-mode "mh" 'hyde)
       (evil-leader/set-key-for-mode 'hyde/hyde-mode "ms" 'hyde/serve)
       (evil-leader/set-key-for-mode 'hyde/hyde-mode "mS" 'hyde/stop-serve)
       (evil-leader/set-key-for-mode 'hyde/hyde-mode "mj" 'hyde/run-jekyll)

       (evil-define-key 'normal hyde-mode-map (kbd "RET") 'hyde/open-post-maybe)
       (evil-define-key 'normal hyde-mode-map "g" 'hyde/load-posts)
       (evil-define-key 'normal hyde-mode-map "D" 'hyde/delete-post)
       (evil-define-key 'normal hyde-mode-map "p" 'hyde/promote-to-post)
       (evil-define-key 'normal hyde-mode-map "q" 'hyde/quit)
       (evil-define-key 'normal hyde-mode-map "n" 'hyde/new-post))))

;;; jekyll-mode ends here
