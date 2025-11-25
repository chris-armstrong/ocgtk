(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scale *)

type t = [`scale | `range | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Scale *)
external new_ : Gtk_enums.orientation -> Gtk.widget option -> t = "ml_gtk_scale_new"

(** Create a new Scale *)
external new_with_range : Gtk_enums.orientation -> float -> float -> float -> t = "ml_gtk_scale_new_with_range"

(* Properties *)

(** Sets the position in which the current value is displayed. *)
external set_value_pos : t -> Gtk_enums.positiontype -> unit = "ml_gtk_scale_set_value_pos"

(** Sets whether the scale has an origin.

If [property@Gtk.Scale:has-origin] is set to %TRUE (the default),
the scale will highlight the part of the trough between the origin
(bottom or left side) and the current value. *)
external set_has_origin : t -> bool -> unit = "ml_gtk_scale_set_has_origin"

(** Specifies whether the current value is displayed as a string next
to the slider. *)
external set_draw_value : t -> bool -> unit = "ml_gtk_scale_set_draw_value"

(** Sets the number of decimal places that are displayed in the value.

Also causes the value of the adjustment to be rounded to this number
of digits, so the retrieved value matches the displayed one, if
[property@Gtk.Scale:draw-value] is %TRUE when the value changes. If
you want to enforce rounding the value when [property@Gtk.Scale:draw-value]
is %FALSE, you can set [property@Gtk.Range:round-digits] instead.

Note that rounding to a small number of digits can interfere with
the smooth autoscrolling that is built into `GtkScale`. As an alternative,
you can use [method@Gtk.Scale.set_format_value_func] to format the displayed
value yourself. *)
external set_digits : t -> int -> unit = "ml_gtk_scale_set_digits"

(** Gets the position in which the current value is displayed. *)
external get_value_pos : t -> Gtk_enums.positiontype = "ml_gtk_scale_get_value_pos"

(** Returns whether the scale has an origin. *)
external get_has_origin : t -> bool = "ml_gtk_scale_get_has_origin"

(** Returns whether the current value is displayed as a string
next to the slider. *)
external get_draw_value : t -> bool = "ml_gtk_scale_get_draw_value"

(** Gets the number of decimal places that are displayed in the value. *)
external get_digits : t -> int = "ml_gtk_scale_get_digits"

(** Removes any marks that have been added. *)
external clear_marks : t -> unit = "ml_gtk_scale_clear_marks"

(** Adds a mark at @value.

A mark is indicated visually by drawing a tick mark next to the scale,
and GTK makes it easy for the user to position the scale exactly at the
marks value.

If @markup is not %NULL, text is shown next to the tick mark.

To remove marks from a scale, use [method@Gtk.Scale.clear_marks]. *)
external add_mark : t -> float -> Gtk_enums.positiontype -> string option -> unit = "ml_gtk_scale_add_mark"

