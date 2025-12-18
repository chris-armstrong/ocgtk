(* High-level class for ConstraintGuide *)
class constraint_guide (obj : Constraint_guide.t) = object (self)

  method max_height = Constraint_guide.get_max_height obj
  method set_max_height v = Constraint_guide.set_max_height obj v

  method max_width = Constraint_guide.get_max_width obj
  method set_max_width v = Constraint_guide.set_max_width obj v

  method min_height = Constraint_guide.get_min_height obj
  method set_min_height v = Constraint_guide.set_min_height obj v

  method min_width = Constraint_guide.get_min_width obj
  method set_min_width v = Constraint_guide.set_min_width obj v

  method name = Constraint_guide.get_name obj
  method set_name v = Constraint_guide.set_name obj v

  method nat_height = Constraint_guide.get_nat_height obj
  method set_nat_height v = Constraint_guide.set_nat_height obj v

  method nat_width = Constraint_guide.get_nat_width obj
  method set_nat_width v = Constraint_guide.set_nat_width obj v

  method get_strength : unit -> Gtk_enums.constraintstrength = fun () -> (Constraint_guide.get_strength obj )

  method set_max_size : int -> int -> unit = fun width height -> (Constraint_guide.set_max_size obj width height)

  method set_min_size : int -> int -> unit = fun width height -> (Constraint_guide.set_min_size obj width height)

  method set_nat_size : int -> int -> unit = fun width height -> (Constraint_guide.set_nat_size obj width height)

  method set_strength : Gtk_enums.constraintstrength -> unit = fun strength -> (Constraint_guide.set_strength obj strength)

    method as_constraint_guide = obj
end

