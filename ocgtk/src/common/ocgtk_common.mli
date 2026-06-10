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

(** Common utility modules for ocgtk GTK4 bindings.

    This module re-exports hand-written common modules shared across all ocgtk
    binding libraries (Gtk, Gio, Gdk, etc.). Each module is also available as a
    flat top-level module (e.g. [Gobject]) in the [ocgtk.common] library. *)

module GError = GError
(** Error type for GTK/GLib functions. See {!GError}. *)

module Gpointer = Gpointer
(** Enum conversion and boxed pointer utilities. See {!Gpointer}. *)

module Gobject = Gobject
(** GObject type system, properties, and signals. See {!Gobject}. *)

module Gvariant = Gvariant
(** GVariant structured data serialization. See {!Gvariant}. *)

module Gvariant_type = Gvariant_type
(** GVariant type descriptions. See {!Gvariant_type}. *)
