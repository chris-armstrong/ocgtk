(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MessageDialog *)

type t = Gtk.widget

external new_ : Gtk.widget option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_bytecode" "ml_gtk_message_dialog_new_native"

external new_with_markup : Gtk.widget option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_with_markup_bytecode" "ml_gtk_message_dialog_new_with_markup_native"

(* Properties *)

external get_secondary_text : t -> string = "ml_gtk_message_dialog_get_secondary_text"

external set_secondary_text : t -> string -> unit = "ml_gtk_message_dialog_set_secondary_text"

external get_secondary_use_markup : t -> bool = "ml_gtk_message_dialog_get_secondary_use_markup"

external set_secondary_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_secondary_use_markup"

external get_text : t -> string = "ml_gtk_message_dialog_get_text"

external set_text : t -> string -> unit = "ml_gtk_message_dialog_set_text"

external get_use_markup : t -> bool = "ml_gtk_message_dialog_get_use_markup"

external set_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_use_markup"

external set_markup : t -> string -> unit = "ml_gtk_message_dialog_set_markup"

external get_message_area : t -> Gtk.widget = "ml_gtk_message_dialog_get_message_area"

