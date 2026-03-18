(* GENERATED CODE - DO NOT EDIT *)
(* FileChooserDialog: FileChooserDialog *)

type t = [`file_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

(** Create a new FileChooserDialog *)
external new_ : string option -> Application_and__window_and__window_group.Window.t option -> Gtk_enums.filechooseraction -> string option -> unit -> t = "ml_gtk_file_chooser_dialog_new"

(* Methods *)
