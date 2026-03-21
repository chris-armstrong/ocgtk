(* GENERATED CODE - DO NOT EDIT *)
(* Stroke: Stroke *)

(** A `GskStroke` struct collects the parameters that influence
the operation of stroking a path. *)
type t = [`stroke] Gobject.obj

(** Create a new Stroke *)
external new_ : float -> t = "ml_gsk_stroke_new"

(* Methods *)
(** A helper function that sets the stroke parameters
of @cr from the values found in @self. *)
external to_cairo : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t -> unit = "ml_gsk_stroke_to_cairo"

(** Sets the limit for the distance from the corner where sharp
turns of joins get cut off.

The miter limit is in units of line width and must be non-negative.

For joins of type `GSK_LINE_JOIN_MITER` that exceed the miter
limit, the join gets rendered as if it was of type
`GSK_LINE_JOIN_BEVEL`. *)
external set_miter_limit : t -> float -> unit = "ml_gsk_stroke_set_miter_limit"

(** Sets the line width to be used when stroking.

The line width must be > 0. *)
external set_line_width : t -> float -> unit = "ml_gsk_stroke_set_line_width"

(** Sets the line join to be used when stroking.

See [enum@Gsk.LineJoin] for details. *)
external set_line_join : t -> Gsk_enums.linejoin -> unit = "ml_gsk_stroke_set_line_join"

(** Sets the line cap to be used when stroking.

See [enum@Gsk.LineCap] for details. *)
external set_line_cap : t -> Gsk_enums.linecap -> unit = "ml_gsk_stroke_set_line_cap"

(** Sets the offset into the dash pattern where dashing should begin.

This is an offset into the length of the path, not an index into
the array values of the dash array.

See [method@Gsk.Stroke.set_dash] for more details on dashing. *)
external set_dash_offset : t -> float -> unit = "ml_gsk_stroke_set_dash_offset"

(** Returns the miter limit of a `GskStroke`. *)
external get_miter_limit : t -> float = "ml_gsk_stroke_get_miter_limit"

(** Gets the line width used. *)
external get_line_width : t -> float = "ml_gsk_stroke_get_line_width"

(** Gets the line join used.

See [enum@Gsk.LineJoin] for details. *)
external get_line_join : t -> Gsk_enums.linejoin = "ml_gsk_stroke_get_line_join"

(** Gets the line cap used.

See [enum@Gsk.LineCap] for details. *)
external get_line_cap : t -> Gsk_enums.linecap = "ml_gsk_stroke_get_line_cap"

(** Returns the dash_offset of a `GskStroke`. *)
external get_dash_offset : t -> float = "ml_gsk_stroke_get_dash_offset"

(** Frees a `GskStroke`. *)
external free : t -> unit = "ml_gsk_stroke_free"

(** Creates a copy of the given @other stroke. *)
external copy : t -> t = "ml_gsk_stroke_copy"

