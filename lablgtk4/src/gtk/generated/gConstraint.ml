(* High-level class for Constraint *)
class constraint_ (obj : Constraint.t) = object (self)

  method get_constant : unit -> float =
    fun () ->
      (Constraint.get_constant obj)

  method get_multiplier : unit -> float =
    fun () ->
      (Constraint.get_multiplier obj)

  method get_relation : unit -> Gtk_enums.constraintrelation =
    fun () ->
      (Constraint.get_relation obj)

  method get_source : unit -> GConstraint_target.constraint_target option =
    fun () ->
      Option.map (fun ret -> new GConstraint_target.constraint_target ret) (Constraint.get_source obj)

  method get_source_attribute : unit -> Gtk_enums.constraintattribute =
    fun () ->
      (Constraint.get_source_attribute obj)

  method get_strength : unit -> int =
    fun () ->
      (Constraint.get_strength obj)

  method get_target : unit -> GConstraint_target.constraint_target option =
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

