(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PasswordEntry *)

type t = [`password_entry | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

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

