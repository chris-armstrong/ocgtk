(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MessageDialog *)

type t = Gtk.Widget.t

(** Create a new MessageDialog *)
external new_ : Gtk.Widget.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_bytecode" "ml_gtk_message_dialog_new_native"

(** Create a new MessageDialog *)
external new_with_markup : Gtk.Widget.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_with_markup_bytecode" "ml_gtk_message_dialog_new_with_markup_native"

(* Properties *)

(** Get property: secondary-text *)
external get_secondary_text : t -> string = "ml_gtk_message_dialog_get_secondary_text"

(** Set property: secondary-text *)
external set_secondary_text : t -> string -> unit = "ml_gtk_message_dialog_set_secondary_text"

(** Get property: secondary-use-markup *)
external get_secondary_use_markup : t -> bool = "ml_gtk_message_dialog_get_secondary_use_markup"

(** Set property: secondary-use-markup *)
external set_secondary_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_secondary_use_markup"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_message_dialog_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_message_dialog_set_text"

(** Get property: use-markup *)
external get_use_markup : t -> bool = "ml_gtk_message_dialog_get_use_markup"

(** Set property: use-markup *)
external set_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_use_markup"

external set_markup : t -> string -> unit = "ml_gtk_message_dialog_set_markup"

external get_message_area : t -> Gtk.Widget.t = "ml_gtk_message_dialog_get_message_area"

