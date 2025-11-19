(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PasswordEntry *)

type t = Gtk.Widget.t

(** Create a new PasswordEntry *)
external new_ : unit -> t = "ml_gtk_password_entry_new"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_password_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_password_entry_set_activates_default"

(** Get property: show-peek-icon *)
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"

(** Set property: show-peek-icon *)
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"

external set_extra_menu : t -> unit -> unit = "ml_gtk_password_entry_set_extra_menu"

external get_extra_menu : t -> unit = "ml_gtk_password_entry_get_extra_menu"

external get_placeholder_text : t -> string = "ml_gtk_password_entry_get_placeholder_text"

external set_placeholder_text : t -> string option -> unit = "ml_gtk_password_entry_set_placeholder_text"

(* GtkEditable interface methods *)
external get_text : t -> string = "ml_gtk_editable_get_text"

external set_text : t -> string -> unit = "ml_gtk_editable_set_text"

