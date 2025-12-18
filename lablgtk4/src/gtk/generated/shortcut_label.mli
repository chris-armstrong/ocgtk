(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutLabel *)

type t = [`shortcut_label | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ShortcutLabel *)
external new_ : string -> t = "ml_gtk_shortcut_label_new"

(* Properties *)

(** Get property: accelerator *)
external get_accelerator : t -> string = "ml_gtk_shortcut_label_get_accelerator"

(** Set property: accelerator *)
external set_accelerator : t -> string -> unit = "ml_gtk_shortcut_label_set_accelerator"

(** Get property: disabled-text *)
external get_disabled_text : t -> string = "ml_gtk_shortcut_label_get_disabled_text"

(** Set property: disabled-text *)
external set_disabled_text : t -> string -> unit = "ml_gtk_shortcut_label_set_disabled_text"

