(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutLabel *)

type t = [`shortcut_label | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ShortcutLabel *)
external new_ : string -> t = "ml_gtk_shortcut_label_new"

(* Methods *)
(** Sets the text to be displayed by @self when no accelerator is set. *)
external set_disabled_text : t -> string -> unit = "ml_gtk_shortcut_label_set_disabled_text"

(** Sets the accelerator to be displayed by @self. *)
external set_accelerator : t -> string -> unit = "ml_gtk_shortcut_label_set_accelerator"

(** Retrieves the text that is displayed when no accelerator is set. *)
external get_disabled_text : t -> string option = "ml_gtk_shortcut_label_get_disabled_text"

(** Retrieves the current accelerator of @self. *)
external get_accelerator : t -> string option = "ml_gtk_shortcut_label_get_accelerator"

(* Properties *)

