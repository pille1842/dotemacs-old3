;;; init.el --- Emacs configuration file of Eric Haberstroh  -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Eric Haberstroh

;; Author: Eric Haberstroh <gpg@erixpage.de>
;; Keywords: config dotemacs
;; URL: https://github.com/pille1842/dotemacs/

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This init file simply loads the actual configuration, which resides
;; in an Org mode file called config.org.  The initial configuration
;; of the package system needs to be done in this file, too.  That's
;; because we cannot load the correct Org mode, i.e. the one installed
;; from the package archives instead of the one that's shipped with
;; Emacs, before initializing the package system.

;;; Code:

;; This configuration relies on the
;; [[https://github.com/jwiegley/use-package][use-package]] macro.  In
;; order for the configuration to be portable, use-package will be
;; installed if it is not already present.  So first, let's initialize
;; the package system, including the [[https://melpa.org/][MELPA]]
;; package archive.  Then let's check if use-package is installed and
;; install it if necessary.

;; We'll also add the [[https://orgmode.org/elpa.html][Org ELPA]] at
;; this point because we'll later require some Org mode packages from
;; it.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Before initializing the package system, add the Org ELPA.
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Similarly to what we did above with use-package itself, use-package
;; can ensure that any packages we select in this configuration will
;; be installed if they are not already present on the local system.
;; This can either be done for each package separately via the
;; =:ensure t= option, or it can be enabled for all packages, which is
;; what I prefer.
(setq use-package-always-ensure t)

;; Now, finally, we can load the actual configuration from the Org
;; mode file called config.org.
(org-babel-load-file (concat user-emacs-directory "config.org"))

;;; init.el ends here
