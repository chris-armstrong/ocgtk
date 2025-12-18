(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorButton *)

type t = [`color_button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ColorButton *)
external new_ : unit -> t = "ml_gtk_color_button_new"

(** Create a new ColorButton *)
external new_with_rgba : unit -> t = "ml_gtk_color_button_new_with_rgba"

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_color_button_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_color_button_set_modal"

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_button_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_button_set_show_editor"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_color_button_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_color_button_set_title"

