class type constraint_guide_t = object
  inherit Constraint_target.constraint_target_t

  method get_name : unit -> string option
  (** Retrieves the name set using gtk_constraint_guide_set_name(). *)

  method get_strength : unit -> Enums.constraintstrength
  (** Retrieves the strength set using gtk_constraint_guide_set_strength(). *)

  method set_max_size : int -> int -> unit
  (** Sets the maximum size of [guide].

      If [guide] is attached to a [GtkConstraintLayout], the constraints will be
      updated to reflect the new size. *)

  method set_min_size : int -> int -> unit
  (** Sets the minimum size of [guide].

      If [guide] is attached to a [GtkConstraintLayout], the constraints will be
      updated to reflect the new size. *)

  method set_name : string option -> unit
  (** Sets a name for the given [GtkConstraintGuide].

      The name is useful for debugging purposes. *)

  method set_nat_size : int -> int -> unit
  (** Sets the natural size of [guide].

      If [guide] is attached to a [GtkConstraintLayout], the constraints will be
      updated to reflect the new size. *)

  method set_strength : Enums.constraintstrength -> unit
  (** Sets the strength of the constraint on the natural size of the given
      [GtkConstraintGuide]. *)

  method max_height : int
  (** The maximum height of the guide. *)

  method set_max_height : int -> unit
  (** The maximum height of the guide. *)

  method max_width : int
  (** The maximum width of the guide. *)

  method set_max_width : int -> unit
  (** The maximum width of the guide. *)

  method min_height : int
  (** The minimum height of the guide. *)

  method set_min_height : int -> unit
  (** The minimum height of the guide. *)

  method min_width : int
  (** The minimum width of the guide. *)

  method set_min_width : int -> unit
  (** The minimum width of the guide. *)

  method nat_height : int
  (** The preferred, or natural, height of the guide. *)

  method set_nat_height : int -> unit
  (** The preferred, or natural, height of the guide. *)

  method nat_width : int
  (** The preferred, or natural, width of the guide. *)

  method set_nat_width : int -> unit
  (** The preferred, or natural, width of the guide. *)

  method as_constraint_guide : Raw.Constraint_guide.t
end

(* High-level class for ConstraintGuide *)
class constraint_guide (obj : Raw.Constraint_guide.t) : constraint_guide_t =
  object (self)
    inherit
      Constraint_target.constraint_target
        (Raw.Constraint_target.from_gobject obj)

    method get_name : unit -> string option =
      fun () -> Raw.Constraint_guide.get_name obj

    method get_strength : unit -> Enums.constraintstrength =
      fun () -> Raw.Constraint_guide.get_strength obj

    method set_max_size : int -> int -> unit =
      fun width height -> Raw.Constraint_guide.set_max_size obj width height

    method set_min_size : int -> int -> unit =
      fun width height -> Raw.Constraint_guide.set_min_size obj width height

    method set_name : string option -> unit =
      fun name -> Raw.Constraint_guide.set_name obj name

    method set_nat_size : int -> int -> unit =
      fun width height -> Raw.Constraint_guide.set_nat_size obj width height

    method set_strength : Enums.constraintstrength -> unit =
      fun strength -> Raw.Constraint_guide.set_strength obj strength

    method max_height = Raw.Constraint_guide.get_max_height obj
    method set_max_height v = Raw.Constraint_guide.set_max_height obj v
    method max_width = Raw.Constraint_guide.get_max_width obj
    method set_max_width v = Raw.Constraint_guide.set_max_width obj v
    method min_height = Raw.Constraint_guide.get_min_height obj
    method set_min_height v = Raw.Constraint_guide.set_min_height obj v
    method min_width = Raw.Constraint_guide.get_min_width obj
    method set_min_width v = Raw.Constraint_guide.set_min_width obj v
    method nat_height = Raw.Constraint_guide.get_nat_height obj
    method set_nat_height v = Raw.Constraint_guide.set_nat_height obj v
    method nat_width = Raw.Constraint_guide.get_nat_width obj
    method set_nat_width v = Raw.Constraint_guide.set_nat_width obj v
    method as_constraint_guide = obj
  end

let new_ () : constraint_guide_t =
  new constraint_guide (Raw.Constraint_guide.new_ ())
