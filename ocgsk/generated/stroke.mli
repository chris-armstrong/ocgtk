(** Collects the parameters that are needed when stroking a path.

    Its methods, signals and properties are on {!class-type-stroke_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Stroke}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Stroke].}

    Collects the parameters that are needed when stroking a path. *)
class type stroke_t = object
  (** {2:methods Methods} *)

  method get_dash_offset : unit -> float
  (** Gets the dash offset. *)

  method get_line_cap : unit -> Enums.linecap
  (** Gets the line cap used.

      See [Gsk.LineCap] for details. *)

  method get_line_join : unit -> Enums.linejoin
  (** Gets the line join used.

      See [Gsk.LineJoin] for details. *)

  method get_line_width : unit -> float
  (** Gets the line width used. *)

  method get_miter_limit : unit -> float
  (** Gets the miter limit. *)

  method set_dash : float array option -> Gsize.t -> unit
  [@@ocaml.doc
    "Sets the dash pattern to use.\n\n\
     A dash pattern is specified by an array of alternating non-negative\n\
     values. Each value provides the length of alternate \"on\" and \"off\"\n\
     portions of the stroke.\n\n\
     Each \"on\" segment will have caps applied as if the segment were a\n\
     separate contour. In particular, it is valid to use an \"on\" length\n\
     of 0 with [Gsk.LineCap.round] or [Gsk.LineCap.square]\n\
     to draw dots or squares along a path.\n\n\
     If [n_dash] is 0, if all elements in [dash] are 0, or if there are\n\
     negative values in [dash], then dashing is disabled.\n\n\
     If [n_dash] is 1, an alternating \"on\" and \"off\" pattern with the\n\
     single dash length provided is assumed.\n\n\
     If [n_dash] is uneven, the dash array will be used with the first\n\
     element in [dash] defining an \"on\" or \"off\" in alternating passes\n\
     through the array.\n\n\
     You can specify a starting offset into the dash with\n\
     [Gsk.Stroke.set_dash_offset]."]

  method set_dash_offset : float -> unit
  (** Sets the offset into the dash pattern where dashing should begin.

      This is an offset into the length of the path, not an index into the array
      values of the dash array.

      See [Gsk.Stroke.set_dash] for more details on dashing. *)

  method set_line_cap : Enums.linecap -> unit
  (** Sets the line cap to be used when stroking.

      See [Gsk.LineCap] for details. *)

  method set_line_join : Enums.linejoin -> unit
  (** Sets the line join to be used when stroking.

      See [Gsk.LineJoin] for details. *)

  method set_line_width : float -> unit
  (** Sets the line width to be used when stroking.

      The line width must be >= 0. *)

  method set_miter_limit : float -> unit
  (** Sets the miter limit to be used when stroking.

      The miter limit is the distance from the corner where sharp turns of joins
      get cut off.

      The limit is specfied in units of line width and must be non-negative.

      For joins of type [Gsk.LineJoin.miter] that exceed the miter limit, the
      join gets rendered as if it was of type [Gsk.LineJoin.bevel]. *)

  method to_cairo : Occairo.Context.context_t -> unit
  (** A helper function that sets the stroke parameters of a cairo context from
      a [GskStroke]. *)

  (** {2:conversions Conversions} *)

  method as_stroke : Raw.Stroke.t
end

class stroke : Raw.Stroke.t -> stroke_t
(** Wraps a raw handle of {!Ocgsk.Raw.Stroke.t}. *)

(** {1:constructors Constructors} *)

val new_ : float -> stroke_t
(** Creates a new [GskStroke] with the given [line_width]. *)
