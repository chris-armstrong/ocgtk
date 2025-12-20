(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorButton *)

type t = [`color_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ColorButton *)
external new_ : unit -> t = "ml_gtk_color_button_new"

(** Create a new ColorButton *)
external new_with_rgba : unit -> t = "ml_gtk_color_button_new_with_rgba"

(* Methods *)
(** Sets the title for the color chooser dialog. *)
external set_title : t -> string -> unit = "ml_gtk_color_button_set_title"

(** Sets whether the dialog should be modal. *)
external set_modal : t -> bool -> unit = "ml_gtk_color_button_set_modal"

(** Gets the title of the color chooser dialog. *)
external get_title : t -> string = "ml_gtk_color_button_get_title"

(** Gets whether the dialog is modal. *)
external get_modal : t -> bool = "ml_gtk_color_button_get_modal"

(* Properties *)

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_button_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_button_set_show_editor"

