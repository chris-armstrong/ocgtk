(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontButton *)

type t = [`font_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new FontButton *)
external new_ : unit -> t = "ml_gtk_font_button_new"

(** Create a new FontButton *)
external new_with_font : string -> t = "ml_gtk_font_button_new_with_font"

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_font_button_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_font_button_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_font_button_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_font_button_set_title"

(** Get property: use-font *)
external get_use_font : t -> bool = "ml_gtk_font_button_get_use_font"

(** Set property: use-font *)
external set_use_font : t -> bool -> unit = "ml_gtk_font_button_set_use_font"

(** Get property: use-size *)
external get_use_size : t -> bool = "ml_gtk_font_button_get_use_size"

(** Set property: use-size *)
external set_use_size : t -> bool -> unit = "ml_gtk_font_button_set_use_size"

