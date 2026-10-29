class type constraint__t = object
  (** {2:methods Methods} *)

  method get_constant : unit -> float
  (** Retrieves the constant factor added to the source attributes' value. *)

  method get_multiplier : unit -> float
  (** Retrieves the multiplication factor applied to the source attribute's
      value. *)

  method get_relation : unit -> Enums.constraintrelation
  (** The order relation between the terms of the constraint. *)

  method get_source : unit -> Constraint_target.constraint_target_t option
  (** Retrieves the [Gtk.ConstraintTarget] used as the source for the
      constraint.

      If the source is set to [NULL] at creation, the constraint will use the
      widget using the [Gtk.ConstraintLayout] as the source. *)

  method get_source_attribute : unit -> Enums.constraintattribute
  (** Retrieves the attribute of the source to be read by the constraint. *)

  method get_strength : unit -> int
  (** Retrieves the strength of the constraint. *)

  method get_target : unit -> Constraint_target.constraint_target_t option
  (** Retrieves the [Gtk.ConstraintTarget] used as the target for the
      constraint.

      If the targe is set to [NULL] at creation, the constraint will use the
      widget using the [Gtk.ConstraintLayout] as the target. *)

  method get_target_attribute : unit -> Enums.constraintattribute
  (** Retrieves the attribute of the target to be set by the constraint. *)

  method is_attached : unit -> bool
  (** Checks whether the constraint is attached to a [Gtk.ConstraintLayout], and
      it is contributing to the layout. *)

  method is_constant : unit -> bool
  (** Checks whether the constraint describes a relation between an attribute on
      the [Gtk.Constraint:target] and a constant value. *)

  method is_required : unit -> bool
  (** Checks whether the constraint is a required relation for solving the
      constraint layout. *)

  (** {2:conversions Conversions} *)

  method as_constraint_ : Raw.Constraint.t
end

(* High-level class for Constraint *)
class constraint_ (obj : Raw.Constraint.t) : constraint__t =
  object (self)
    method get_constant : unit -> float =
      fun () -> Raw.Constraint.get_constant obj

    method get_multiplier : unit -> float =
      fun () -> Raw.Constraint.get_multiplier obj

    method get_relation : unit -> Enums.constraintrelation =
      fun () -> Raw.Constraint.get_relation obj

    method get_source : unit -> Constraint_target.constraint_target_t option =
      fun () ->
        Option.map
          (fun ret -> new Constraint_target.constraint_target ret)
          (Raw.Constraint.get_source obj)

    method get_source_attribute : unit -> Enums.constraintattribute =
      fun () -> Raw.Constraint.get_source_attribute obj

    method get_strength : unit -> int =
      fun () -> Raw.Constraint.get_strength obj

    method get_target : unit -> Constraint_target.constraint_target_t option =
      fun () ->
        Option.map
          (fun ret -> new Constraint_target.constraint_target ret)
          (Raw.Constraint.get_target obj)

    method get_target_attribute : unit -> Enums.constraintattribute =
      fun () -> Raw.Constraint.get_target_attribute obj

    method is_attached : unit -> bool = fun () -> Raw.Constraint.is_attached obj
    method is_constant : unit -> bool = fun () -> Raw.Constraint.is_constant obj
    method is_required : unit -> bool = fun () -> Raw.Constraint.is_required obj
    method as_constraint_ = obj
  end

let new_ (target : Constraint_target.constraint_target_t option)
    (target_attribute : Enums.constraintattribute)
    (relation : Enums.constraintrelation)
    (source : Constraint_target.constraint_target_t option)
    (source_attribute : Enums.constraintattribute) (multiplier : float)
    (constant : float) (strength : int) : constraint__t =
  let target = Option.map (fun c -> c#as_constraint_target) target in
  let source = Option.map (fun c -> c#as_constraint_target) source in
  let obj_ =
    Raw.Constraint.new_ target target_attribute relation source source_attribute
      multiplier constant strength
  in
  new constraint_ obj_

let new_constant (target : Constraint_target.constraint_target_t option)
    (target_attribute : Enums.constraintattribute)
    (relation : Enums.constraintrelation) (constant : float) (strength : int) :
    constraint__t =
  let target = Option.map (fun c -> c#as_constraint_target) target in
  let obj_ =
    Raw.Constraint.new_constant target target_attribute relation constant
      strength
  in
  new constraint_ obj_
