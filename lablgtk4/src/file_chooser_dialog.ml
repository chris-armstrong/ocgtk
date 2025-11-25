(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooserDialog *)

type t = [`file_chooser_dialog | `dialog | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new FileChooserDialog *)
external new_ : string option -> Gtk.widget option -> Gtk_enums.filechooseraction -> string option -> unit -> t = "ml_gtk_file_chooser_dialog_new"

