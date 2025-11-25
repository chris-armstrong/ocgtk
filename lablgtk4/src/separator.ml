(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Separator *)

type t = [`separator | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Separator *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_separator_new"

