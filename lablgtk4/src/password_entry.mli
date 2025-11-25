(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PasswordEntry *)

type t = [`password_entry | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new PasswordEntry *)
external new_ : unit -> t = "ml_gtk_password_entry_new"

(* Properties *)

(** Sets whether the entry should have a clickable icon
to reveal the contents.

Setting this to %FALSE also hides the text again. *)
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"

(** Returns whether the entry is showing an icon to
reveal the contents. *)
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"

