(** An invisible layout element in a [GtkConstraintLayout].

    The [GtkConstraintLayout] treats guides like widgets. They can be used as
    the source or target of a [GtkConstraint].

    Guides have a minimum, maximum and natural size. Depending on the
    constraints that are applied, they can act like a guideline that widgets can
    be aligned to, or like {i flexible space}.

    Unlike a [GtkWidget], a [GtkConstraintGuide] will not be drawn.

    Its methods, signals and properties are on {!class-type-constraint_guide_t}.
    The functions it is built on are in {!Ocgtk.Raw.Constraint_guide}. *)

(** The methods, signals and properties of a [GtkConstraintGuide]. *)
class type constraint_guide_t = object
  inherit Constraint_target.constraint_target_t
  method get_name : unit -> string option
  method get_strength : unit -> Enums.constraintstrength
  method set_max_size : int -> int -> unit
  method set_min_size : int -> int -> unit
  method set_name : string option -> unit
  method set_nat_size : int -> int -> unit
  method set_strength : Enums.constraintstrength -> unit
  method max_height : int
  method set_max_height : int -> unit
  method max_width : int
  method set_max_width : int -> unit
  method min_height : int
  method set_min_height : int -> unit
  method min_width : int
  method set_min_width : int -> unit
  method nat_height : int
  method set_nat_height : int -> unit
  method nat_width : int
  method set_nat_width : int -> unit
  method as_constraint_guide : Raw.Constraint_guide.t
end

class constraint_guide : Raw.Constraint_guide.t -> constraint_guide_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Constraint_guide.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkConstraintGuide], give one already wrapped. *)

val new_ : unit -> constraint_guide_t
