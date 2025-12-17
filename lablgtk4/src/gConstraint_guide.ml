(* High-level class for ConstraintGuide *)
class constraint_guide (obj : Constraint_guide.t) = object (self)

  method get_name : unit -> string option = fun () -> (Constraint_guide.get_name obj )

  method get_strength : unit -> Gtk_enums.constraintstrength = fun () -> (Constraint_guide.get_strength obj )

  method set_max_size : int -> int -> unit = fun width height -> (Constraint_guide.set_max_size obj width height)

  method set_min_size : int -> int -> unit = fun width height -> (Constraint_guide.set_min_size obj width height)

  method set_name : string option -> unit = fun name -> (Constraint_guide.set_name obj name)

  method set_nat_size : int -> int -> unit = fun width height -> (Constraint_guide.set_nat_size obj width height)

  method set_strength : Gtk_enums.constraintstrength -> unit = fun strength -> (Constraint_guide.set_strength obj strength)

    method as_constraint_guide = obj
end

