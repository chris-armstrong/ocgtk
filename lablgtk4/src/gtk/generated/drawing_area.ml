(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DrawingArea *)

type t = [`drawing_area | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new DrawingArea *)
external new_ : unit -> t = "ml_gtk_drawing_area_new"

(* Properties *)

(** Get property: content-height *)
external get_content_height : t -> int = "ml_gtk_drawing_area_get_content_height"

(** Set property: content-height *)
external set_content_height : t -> int -> unit = "ml_gtk_drawing_area_set_content_height"

(** Get property: content-width *)
external get_content_width : t -> int = "ml_gtk_drawing_area_get_content_width"

(** Set property: content-width *)
external set_content_width : t -> int -> unit = "ml_gtk_drawing_area_set_content_width"

