class type constraint_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  inherit Buildable.buildable_t
  method add_constraint : Constraint.constraint__t -> unit
  method add_guide : Constraint_guide.constraint_guide_t -> unit
  method observe_constraints : unit -> Ocgio.List_model.list_model_t
  method observe_guides : unit -> Ocgio.List_model.list_model_t
  method remove_all_constraints : unit -> unit
  method remove_constraint : Constraint.constraint__t -> unit
  method remove_guide : Constraint_guide.constraint_guide_t -> unit
  method as_constraint_layout : Raw.Constraint_layout.t
end

(* High-level class for ConstraintLayout *)
class constraint_layout (obj : Raw.Constraint_layout.t) : constraint_layout_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_manager
        (obj :> Raw.Layout_manager.t)

    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_constraint : Constraint.constraint__t -> unit =
      fun constraint_ ->
        let constraint_ = constraint_#as_constraint_ in
        Raw.Constraint_layout.add_constraint obj constraint_

    method add_guide : Constraint_guide.constraint_guide_t -> unit =
      fun guide ->
        let guide = guide#as_constraint_guide in
        Raw.Constraint_layout.add_guide obj guide

    method observe_constraints : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model
          (Raw.Constraint_layout.observe_constraints obj)

    method observe_guides : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model
          (Raw.Constraint_layout.observe_guides obj)

    method remove_all_constraints : unit -> unit =
      fun () -> Raw.Constraint_layout.remove_all_constraints obj

    method remove_constraint : Constraint.constraint__t -> unit =
      fun constraint_ ->
        let constraint_ = constraint_#as_constraint_ in
        Raw.Constraint_layout.remove_constraint obj constraint_

    method remove_guide : Constraint_guide.constraint_guide_t -> unit =
      fun guide ->
        let guide = guide#as_constraint_guide in
        Raw.Constraint_layout.remove_guide obj guide

    method as_constraint_layout = obj
  end

let new_ () : constraint_layout_t =
  new constraint_layout (Raw.Constraint_layout.new_ ())
