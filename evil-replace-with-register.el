;;; evil-replace-with-register.el --- Port of vim plugin ReplaceWithRegister

;; Copyright (C) 2014 by Dewdrops

;; Author: Dewdrops <v_v_4474@126.com>
;; URL: https://github.com/Dewdrops/evil-ReplaceWithRegister
;; Version: 0.1
;; Keywords: evil, plugin
;; Package-Requires: ((evil "1.0.8"))

;; This file is NOT part of GNU Emacs.

;;; License:
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Port of vim plugin ReplaceWithRegister
;; (http://www.vim.org/scripts/script.php?script_id=2703)
;;
;; Installation:
;;
;; put evil-replace-with-register.el somewhere in your load-path and add these
;; lines to your .emacs:
;; (require 'evil-replace-with-register)
;; ;; change default key bindings (if you want) HERE
;; ;; (setq evil-replace-with-register-key (kbd "gr"))
;; (evil-replace-with-register-install)

;;; Code:

(require 'evil)

(defgroup evil-replace-with-register nil
  "Replacing an existing text with the contents of a register"
  :prefix "evil-replace-with-register"
  :group 'evil)

(defcustom evil-replace-with-register-key (kbd "gR")
  "Default binding for evil-replace-with-register."
  :type `,(if (get 'key-sequence 'widget-type)
              'key-sequence
            'sexp)
  :group 'evil-replace-with-register)


;;;###autoload
(autoload 'evil-replace-with-register "evil-replace-with-register"
  "Replacing an existing text with the contents of a register" t)

(evil-define-operator evil-replace-with-register (count beg end type register)
  "Replacing an existing text with the contents of a register"
  :move-point nil
  (interactive "<vc><R><x>")
  (setq count (or count 1))
  (let ((text (if register
                  (evil-get-register register)
                (current-kill 0))))
    (if (eq type 'block)
        (evil-apply-on-block
         (lambda (begcol endcol)
           (let ((maxcol (evil-column (line-end-position))))
             (when (< begcol maxcol)
               (setq endcol (min endcol maxcol))
               (let ((beg (evil-move-to-column begcol nil t))
                     (end (evil-move-to-column endcol nil t)))
                 (delete-region beg end)
                 (dotimes (_ count)
                   (insert text)))))) 
         beg end t)
      (delete-region beg end)
      (dotimes (_ count)
        (insert text)))))

;;;###autoload
(defun evil-replace-with-register-install ()
  "Setting evil-replace-with-register key bindings."
  (define-key evil-normal-state-map
    evil-replace-with-register-key 'evil-replace-with-register)
  (define-key evil-visual-state-map
    evil-replace-with-register-key 'evil-replace-with-register))

(provide 'evil-replace-with-register)
;;; evil-replace-with-register.el ends here
