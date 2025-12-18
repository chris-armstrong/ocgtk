(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scale *)

type t = [`scale | `range | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Scale *)
external new_ : Gtk_enums.orientation -> Adjustment.t option -> t = "ml_gtk_scale_new"

(** Create a new Scale *)
external new_with_range : Gtk_enums.orientation -> float -> float -> float -> t = "ml_gtk_scale_new_with_range"

(* Properties *)

(** Get property: digits *)
external get_digits : t -> int = "ml_gtk_scale_get_digits"

(** Set property: digits *)
external set_digits : t -> int -> unit = "ml_gtk_scale_set_digits"

(** Get property: draw-value *)
external get_draw_value : t -> bool = "ml_gtk_scale_get_draw_value"

(** Set property: draw-value *)
external set_draw_value : t -> bool -> unit = "ml_gtk_scale_set_draw_value"

(** Get property: has-origin *)
external get_has_origin : t -> bool = "ml_gtk_scale_get_has_origin"

(** Set property: has-origin *)
external set_has_origin : t -> bool -> unit = "ml_gtk_scale_set_has_origin"

(** Sets the position in which the current value is displayed. *)
external set_value_pos : t -> Gtk_enums.positiontype -> unit = "ml_gtk_scale_set_value_pos"

(** Gets the position in which the current value is displayed. *)
external get_value_pos : t -> Gtk_enums.positiontype = "ml_gtk_scale_get_value_pos"

(** Removes any marks that have been added. *)
external clear_marks : t -> unit = "ml_gtk_scale_clear_marks"

(** Adds a mark at @value.

A mark is indicated visually by drawing a tick mark next to the scale,
and GTK makes it easy for the user to position the scale exactly at the
marks value.

If @markup is not %NULL, text is shown next to the tick mark.

To remove marks from a scale, use [method@Gtk.Scale.clear_marks]. *)
external add_mark : t -> float -> Gtk_enums.positiontype -> string option -> unit = "ml_gtk_scale_add_mark"

