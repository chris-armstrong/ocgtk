(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileChooserNative *)

type t = Gtk.widget

external new_ : string option -> Gtk.widget option -> Gtk_enums.filechooseraction -> string option -> string option -> t = "ml_gtk_file_chooser_native_new"

(* Properties *)

external get_accept_label : t -> string = "ml_gtk_file_chooser_native_get_accept_label"

external set_accept_label : t -> string -> unit = "ml_gtk_file_chooser_native_set_accept_label"

external get_cancel_label : t -> string = "ml_gtk_file_chooser_native_get_cancel_label"

external set_cancel_label : t -> string -> unit = "ml_gtk_file_chooser_native_set_cancel_label"

