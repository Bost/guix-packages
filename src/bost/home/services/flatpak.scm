;;; Copyright © 2023 aurtzy <aurtzy@gmail.com>
;;; Copyright © 2025 Rostislav Svoboda <Rostislav.Svoboda@gmail.com>
;;; Copyright © 2026 Rostislav Svoboda <Rostislav.Svoboda@posteo.net>
;;;
;;; This file is NOT part of GNU Guix.
;;;
;;; This program is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by the Free
;;; Software Foundation; either version 3 of the License, or (at your option)
;;; any later version.
;;;
;;; This program is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;;; for more details.
;;;
;;; You should have received a copy of the GNU General Public License along
;;; with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;
;;; Home services for Flatpak, the Linux software deployment utility

(define-module (bost home services flatpak)
  #:use-module (bost utils)
  #:use-module (gnu services)
  #:use-module (guix gexp)         ; program-file local-file
  #:use-module (gnu home services) ; simple-service
  #:use-module (srfi srfi-1)       ; list-processing procedures
  #:use-module (ice-9 pretty-print)
)

(define m (module-name-for-logging))
(evaluating-module)

;; (define-public (flatpak-service)
;;   ;; return a service of <type>, having <configuration> as its value
;;   (service home-flatpak-service-type
;;            (home-flatpak-configuration
;;             (remotes
;;              '((flathub
;;                 . "https://flathub.org/repo/flathub.flatpakrepo"))))))

;; ;; Extend the home-flatpak-profile-service-type with  '(...)
;; ;; and call the extension 'home-flatpak-browsers
;; (simple-service 'home-flatpak-browsers
;;                 home-flatpak-profile-service-type
;;                 '((flathub "org.mozilla.firefox")
;;                   (flathub "com.brave.Browser")))


(def-public (telegram-from-flatpak-service)
  (service
   (@(bost home services package-management) home-flatpak-service-type)
   ((@(bost home services package-management) home-flatpak-configuration)
    (remotes
     '((flathub-remote
        . "https://flathub.org/repo/flathub.flatpakrepo")))

    (profile
     '((flathub-remote "org.telegram.desktop")))
    )))
;;; TODO do not try to run flatpak update when no internet available
;;; TODO XDG_DATA_DIRS contains flatpak relevant information e.g. /var/lib/flatpak/exports/share, etc.
;;; This should be a part of the flatpak service
#|
#<
  <service>
  type: #<service-type home-flatpak 7f451952fa40>
  value: #<
           <home-flatpak-configuration>
           flatpak: #<package flatpak@1.16.0 gnu/packages/package-management.scm:2199 7f450b0ef000>
           remotes: ((flathub-remote . "https://flathub.org/repo/flathub.flatpakrepo"))
           profile: ((flathub-remote "org.telegram.desktop"))
          >
 >
|#

(module-evaluated)
