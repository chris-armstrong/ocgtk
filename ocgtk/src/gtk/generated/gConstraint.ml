class type constraint__t = object
    method get_constant : unit -> float
    method get_multiplier : unit -> float
    method get_relation : unit -> Gtk_enums.constraintrelation
    method get_source : unit -> GConstraint_target.constraint_target_t option
    method get_source_attribute : unit -> Gtk_enums.constraintattribute
    method get_strength : unit -> int
    method get_target : unit -> GConstraint_target.constraint_target_t option
    method get_target_attribute : unit -> Gtk_enums.constraintattribute
    method is_attached : unit -> bool
    method is_constant : unit -> bool
    method is_required : unit -> bool
    method as_constraint_ : Constraint.t
end

(* High-level class for Constraint *)
class constraint_ (obj : Constraint.t) : constraint__t = object (self)

  method get_constant : unit -> float =
    fun () ->
      (Constraint.get_constant obj)

  method get_multiplier : unit -> float =
    fun () ->
      (Constraint.get_multiplier obj)

  method get_relation : unit -> Gtk_enums.constraintrelation =
    fun () ->
      (Constraint.get_relation obj)

  method get_source : unit -> GConstraint_target.constraint_target_t option =
    fun () ->
      Option.map (fun ret -> new GConstraint_target.constraint_target ret) (Constraint.get_source obj)

  method get_source_attribute : unit -> Gtk_enums.constraintattribute =
    fun () ->
      (Constraint.get_source_attribute obj)

  method get_strength : unit -> int =
    fun () ->
      (Constraint.get_strength obj)

  method get_target : unit -> GConstraint_target.constraint_target_t option =
    fun () ->
      Option.map (fun ret -> new GConstraint_target.constraint_target ret) (Constraint.get_target obj)

  method get_target_attribute : unit -> Gtk_enums.constraintattribute =
    fun () ->
      (Constraint.get_target_attribute obj)

  method is_attached : unit -> bool =
    fun () ->
      (Constraint.is_attached obj)

  method is_constant : unit -> bool =
    fun () ->
      (Constraint.is_constant obj)

  method is_required : unit -> bool =
    fun () ->
      (Constraint.is_required obj)

    method as_constraint_ = obj
end

let new_ (target : GConstraint_target.constraint_target_t option) (target_attribute : Gtk_enums.constraintattribute) (relation : Gtk_enums.constraintrelation) (source : GConstraint_target.constraint_target_t option) (source_attribute : Gtk_enums.constraintattribute) (multiplier : float) (constant : float) (strength : int) : constraint__t =
  let target = Option.map (fun c -> c#as_constraint_target) target in
  let source = Option.map (fun c -> c#as_constraint_target) source in
  let obj_ = Constraint.new_ target target_attribute relation source source_attribute multiplier constant strength in
  new constraint_ obj_

let new_constant (target : GConstraint_target.constraint_target_t option) (target_attribute : Gtk_enums.constraintattribute) (relation : Gtk_enums.constraintrelation) (constant : float) (strength : int) : constraint__t =
  let target = Option.map (fun c -> c#as_constraint_target) target in
  let obj_ = Constraint.new_constant target target_attribute relation constant strength in
  new constraint_ obj_

