(* GENERATED CODE - DO NOT EDIT *)
(* BinLayout: BinLayout *)

type t = [ `bin_layout | `layout_manager | `object_ ] Gobject.obj
(** A layout manager for widgets with a single child.

    [GtkBinLayout] will stack each child of a widget on top of each other, using
    the [Gtk.Widget:hexpand], [Gtk.Widget:vexpand], [Gtk.Widget:halign], and
    [Gtk.Widget:valign] properties of each child to determine where they should
    be positioned. *)

external new_ : unit -> t = "ml_gtk_bin_layout_new"
(** Create a new BinLayout *)

(* Methods *)
