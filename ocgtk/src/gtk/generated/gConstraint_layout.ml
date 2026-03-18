(* High-level class for ConstraintLayout *)
class constraint_layout (obj : Constraint_layout.t) = object (self)

  method add_constraint : 'p1. (#GConstraint.constraint_ as 'p1) -> unit =
    fun constraint_ ->
      let constraint_ = constraint_#as_constraint_ in
      (Constraint_layout.add_constraint obj constraint_)

  method add_guide : 'p1. (#GConstraint_guide.constraint_guide as 'p1) -> unit =
    fun guide ->
      let guide = guide#as_constraint_guide in
      (Constraint_layout.add_guide obj guide)

  method observe_constraints : unit -> Ocgtk_gio.Gio.list_model =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(Constraint_layout.observe_constraints obj)

  method observe_guides : unit -> Ocgtk_gio.Gio.list_model =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(Constraint_layout.observe_guides obj)

  method remove_all_constraints : unit -> unit =
    fun () ->
      (Constraint_layout.remove_all_constraints obj)

  method remove_constraint : 'p1. (#GConstraint.constraint_ as 'p1) -> unit =
    fun constraint_ ->
      let constraint_ = constraint_#as_constraint_ in
      (Constraint_layout.remove_constraint obj constraint_)

  method remove_guide : 'p1. (#GConstraint_guide.constraint_guide as 'p1) -> unit =
    fun guide ->
      let guide = guide#as_constraint_guide in
      (Constraint_layout.remove_guide obj guide)

    method as_constraint_layout = obj
end

