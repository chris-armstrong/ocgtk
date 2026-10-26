class type constraint__t = object
  method get_constant : unit -> float
  method get_multiplier : unit -> float
  method get_relation : unit -> Enums.constraintrelation
  method get_source : unit -> Constraint_target.constraint_target_t option
  method get_source_attribute : unit -> Enums.constraintattribute
  method get_strength : unit -> int
  method get_target : unit -> Constraint_target.constraint_target_t option
  method get_target_attribute : unit -> Enums.constraintattribute
  method is_attached : unit -> bool
  method is_constant : unit -> bool
  method is_required : unit -> bool
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
