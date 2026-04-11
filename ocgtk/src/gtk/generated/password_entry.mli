(* GENERATED CODE - DO NOT EDIT *)
(* PasswordEntry: PasswordEntry *)

type t = [`password_entry | `widget | `initially_unowned | `object_] Gobject.obj

(** Create a new PasswordEntry *)
external new_ : unit -> t = "ml_gtk_password_entry_new"

(* Methods *)
(** Sets whether the entry should have a clickable icon
to reveal the contents.

Setting this to %FALSE also hides the text again. *)
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"

(** Sets a menu model to add when constructing
the context menu for @entry. *)
external set_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit = "ml_gtk_password_entry_set_extra_menu"

(** Returns whether the entry is showing an icon to
reveal the contents. *)
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"

(** Gets the menu model set with gtk_password_entry_set_extra_menu(). *)
external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option = "ml_gtk_password_entry_get_extra_menu"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_password_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_password_entry_set_activates_default"

(** Get property: placeholder-text *)
external get_placeholder_text : t -> string = "ml_gtk_password_entry_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> string -> unit = "ml_gtk_password_entry_set_placeholder_text"

