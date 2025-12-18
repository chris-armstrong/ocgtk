class constraint_guide : Constraint_guide.t ->
  object
    method max_height : int
    method set_max_height : int -> unit
    method max_width : int
    method set_max_width : int -> unit
    method min_height : int
    method set_min_height : int -> unit
    method min_width : int
    method set_min_width : int -> unit
    method name : string
    method set_name : string -> unit
    method nat_height : int
    method set_nat_height : int -> unit
    method nat_width : int
    method set_nat_width : int -> unit
    method get_strength : unit -> Gtk_enums.constraintstrength
    method set_max_size : int -> int -> unit
    method set_min_size : int -> int -> unit
    method set_nat_size : int -> int -> unit
    method set_strength : Gtk_enums.constraintstrength -> unit
    method as_constraint_guide : Constraint_guide.t
  end

