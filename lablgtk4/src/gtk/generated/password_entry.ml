(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PasswordEntry *)

type t = [`password_entry | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new PasswordEntry *)
external new_ : unit -> t = "ml_gtk_password_entry_new"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_password_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_password_entry_set_activates_default"

(** Get property: placeholder-text *)
external get_placeholder_text : t -> string = "ml_gtk_password_entry_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> string -> unit = "ml_gtk_password_entry_set_placeholder_text"

(** Get property: show-peek-icon *)
external get_show_peek_icon : t -> bool = "ml_gtk_password_entry_get_show_peek_icon"

(** Set property: show-peek-icon *)
external set_show_peek_icon : t -> bool -> unit = "ml_gtk_password_entry_set_show_peek_icon"

