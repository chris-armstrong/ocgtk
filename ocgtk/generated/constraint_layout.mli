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

class constraint_layout : Raw.Constraint_layout.t -> constraint_layout_t

val new_ : unit -> constraint_layout_t
