(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                         *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License version 2, as published by the                       *)
(*    Free Software Foundation with the exception described in file       *)
(*    COPYING which comes with the library.                               *)
(*                                                                        *)
(*    Based on lablgtk3 (https://github.com/garrigue/lablgtk)             *)
(*                                                                        *)
(**************************************************************************)

(** Top-level OCaml GTK4 bindings library.

    This module re-exports all namespaces as sub-modules. Access individual
    widgets, types, and functions through the corresponding sub-module, e.g.
    [Ocgtk.Gtk.Widget], [Ocgtk.Gio.Volume_monitor], etc. *)

module Cairo = Ocgtk_cairo.Cairo
module Gdk = Ocgtk_gdk.Gdk
module GdkPixbuf = Ocgtk_gdkpixbuf.GdkPixbuf
module Gio = Ocgtk_gio.Gio
module Graphene = Ocgtk_graphene.Graphene
module Gsk = Ocgtk_gsk.Gsk
module Gtk = Ocgtk_gtk.Gtk
module Pango = Ocgtk_pango.Pango
module PangoCairo = Ocgtk_pangocairo.PangoCairo
module GMain = Ocgtk_gtk.GMain
module Common = Ocgtk_common
