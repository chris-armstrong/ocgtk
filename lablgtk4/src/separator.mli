(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Separator *)

type t = [`separator | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Separator *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_separator_new"

