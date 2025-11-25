(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooserDialog *)

type t = [`font_chooser_dialog | `dialog | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new FontChooserDialog *)
external new_ : string option -> Gtk.widget option -> t = "ml_gtk_font_chooser_dialog_new"

