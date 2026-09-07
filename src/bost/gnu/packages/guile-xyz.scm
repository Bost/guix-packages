;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2012-2026 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2015, 2018 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2015, 2017, 2022 Christine Lemmer-Webber <cwebber@dustycloud.org>
;;; Copyright © 2016, 2025 Alex Sassmannshausen <alex@pompo.co>
;;; Copyright © 2016-2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016 Erik Edrosa <erik.edrosa@gmail.com>
;;; Copyright © 2016, 2019-2021, 2023 Eraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016, 2017, 2021 Alex Kost <alezost@gmail.com>
;;; Copyright © 2016, 2017 Adonay "adfeno" Felipe Nogueira <https://libreplanet.org/wiki/User:Adfeno> <adfeno@openmailbox.org>
;;; Copyright © 2016, 2021 Amirouche <amirouche@hypermove.net>
;;; Copyright © 2016, 2019, 2021, 2023, 2024-2026 Janneke Nieuwenhuizen <janneke@gnu.org>
;;; Copyright © 2017 Andy Wingo <wingo@igalia.com>
;;; Copyright © 2017 David Thompson <davet@gnu.org>
;;; Copyright © 2017, 2018, 2019, 2020 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2017 Theodoros Foradis <theodoros@foradis.org>
;;; Copyright © 2017 Nikita <nikita@n0.is>
;;; Copyright © 2017, 2018, 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018, 2021-2025 Maxim Cournoyer <maxim@guixotic.coop>
;;; Copyright © 2018–2026 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Pierre-Antoine Rouby <pierre-antoine.rouby@inria.fr>
;;; Copyright © 2018 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2019 swedebugia <swedebugia@riseup.net>
;;; Copyright © 2019, 2020 Amar Singh <nly@disroot.org>
;;; Copyright © 2019, 2021 Timothy Sample <samplet@ngyro.com>
;;; Copyright © 2019, 2020 Martin Becze <mjbecze@riseup.net>
;;; Copyright © 2020 Evan Straw <evan.straw99@gmail.com>
;;; Copyright © 2020 Jack Hill <jackhill@jackhill.us>
;;; Copyright © 2020 Julien Lepiler <julien@lepiller.eu>
;;; Copyright © 2020 Marius Bakke <marius@gnu.org>
;;; Copyright © 2020, 2021 Masaya Tojo <masaya@tojo.tokyo>
;;; Copyright © 2020 Jesse Gibbons <jgibbons2357@gmail.com>
;;; Copyright © 2020 Mike Rosset <mike.rosset@gmail.com>
;;; Copyright © 2020, 2025 Liliana Marie Prikler <liliana.prikler@gmail.com>
;;; Copyright © 2020, 2021, 2022 pukkamustard <pukkamustard@posteo.net>
;;; Copyright © 2021 Bonface Munyoki Kilyungi <me@bonfacemunyoki.com>
;;; Copyright © 2021 Xinglu Chen <public@yoctocell.xyz>
;;; Copyright © 2021 Leo Le Bouter <lle-bout@zaclys.net>
;;; Copyright © 2021 Zelphir Kaltstahl <zelphirkaltstahl@posteo.de>
;;; Copyright © 2021 Oleg Pykhalov <go.wigust@gmail.com>
;;; Copyright © 2021, 2022, 2024, 2025, 2026 Artyom V. Poptsov <poptsov.artyom@gmail.com>
;;; Copyright © 2022 Maxime Devos <maximedevos@telenet.be>
;;; Copyright © 2022 Zhu Zihao <all_but_last@163.com>
;;; Copyright © 2022 Antero Mejr <antero@mailbox.org>
;;; Copyright © 2022 Taiju HIGASHI <higashi@taiju.info>
;;; Copyright © 2022, 2023, 2026 Zheng Junjie <z572@z572.online>
;;; Copyright © 2022, 2025-2026 Evgeny Pisemsky <mail@pisemsky.site>
;;; Copyright © 2022, 2026 jgart <jgart@dismail.de>
;;; Copyright © 2023 Andrew Tropin <andrew@trop.in>
;;; Copyright © 2024 Ilya Chernyshov <ichernyshovvv@gmail.com>
;;; Copyright © 2024 Artyom Bologov <mail@aartaka.me>
;;; Copyright © 2024 Felix Lechner <felix.lechner@lease-up.com>
;;; Copyright © 2024 Alec Barreto <mrh57@posteo.net>
;;; Copyright © 2024 Josep Bigorra <jjbigorra@gmail.com>
;;; Copyright © 2024 Ashish SHUKLA <ashish.is@lostca.se>
;;; Copyright © 2025, 2026 Florian Pelz <pelzflorian@pelzflorian.de>
;;; Copyright © 2025 Libre en Communs <contact@a-lec.org>
;;; Copyright © 2025 Noé Lopez <noelopez@free.fr>
;;; Copyright © 2025 Giacomo Leidi <therewasa@fishinthecalculator.me>
;;; Copyright © 2025 Andy Tai <atai@atai.org>
;;; Copyright © 2025 Ekaitz Zarraga <ekaitz@elenq.tech>
;;; Copyright © 2026 Matt Wette <matt.wette@gmail.com>
;;; Copyright © 2026 Dzianis Jackievič <mail@miesta.by>
;;; Copyright © 2026 Thomas Bennett <thomas.bennett@caminu.fr>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (bost gnu packages guile-xyz)
  #:use-module (gnu packages guile-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages check)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell-xyz)         ;pandoc
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libunistring)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mes)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages noweb)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages search)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages slang)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system guile)
  #:use-module (guix build-system meson)
  #:use-module (guix utils)
  #:use-module ((guix build utils) #:select (alist-replace))
  #:use-module (ice-9 match)
  #:use-module ((srfi srfi-1) #:select (alist-delete))
  #:use-module (srfi srfi-26))

(define-public guile-lsp-server
  (package
    (name "guile-lsp-server")
    (version "0.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/rgherdt/scheme-lsp-server")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1v4za2phmrka2d467591pyl2vjisgj1ifzksd1kfbmacc8vnlh67"))))
    (build-system gnu-build-system)
     (arguments
      (list
       #:phases
       #~(modify-phases %standard-phases
                        (add-after 'unpack 'move-to-guile-directory
                                   (lambda _
                                     (chdir "./guile"))))))
     (native-inputs
      (list autoconf
            automake
            pkg-config
            texinfo
            guile-3.0-latest))
    (propagated-inputs
     (list guile-scheme-json-rpc
           guile-srfi-145
           guile-srfi-180
           guile-irregex
           guile-3.0-latest))
    (synopsis "LSP (Language Server Protocol) server for Guile")
    (description "This package provides a library (lsp-server) and an
executable @code{guile-lsp-server} that can be used by LSP clients in
order to provide IDE functionality for Guile Scheme.")
    (home-page "https://codeberg.org/rgherdt/scheme-lsp-server")
    (license license:expat)))
