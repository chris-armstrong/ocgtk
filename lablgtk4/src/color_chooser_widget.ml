(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorChooserWidget *)

type t = [`color_chooser_widget | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ColorChooserWidget *)
external new_ : unit -> t = "ml_gtk_color_chooser_widget_new"

(* Properties *)

