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
;; in an Org mode file called config.org.

;;; Code:

(require 'org)
(org-babel-load-file (concat user-emacs-directory "config.org"))

;;; init.el ends here
