class constraint_guide : Constraint_guide.t ->
  object
    method get_name : unit -> string option
    method get_strength : unit -> Gtk_enums.constraintstrength
    method set_max_size : int -> int -> unit
    method set_min_size : int -> int -> unit
    method set_name : string option -> unit
    method set_nat_size : int -> int -> unit
    method set_strength : Gtk_enums.constraintstrength -> unit
    method as_constraint_guide : Constraint_guide.t
  end

