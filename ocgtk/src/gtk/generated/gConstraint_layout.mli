class type constraint_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method add_constraint : GConstraint.constraint__t -> unit
    method add_guide : GConstraint_guide.constraint_guide_t -> unit
    method observe_constraints : unit -> Ocgtk_gio.Gio.list_model_t
    method observe_guides : unit -> Ocgtk_gio.Gio.list_model_t
    method remove_all_constraints : unit -> unit
    method remove_constraint : GConstraint.constraint__t -> unit
    method remove_guide : GConstraint_guide.constraint_guide_t -> unit
    method as_constraint_layout : Constraint_layout.t
end

class constraint_layout : Constraint_layout.t -> constraint_layout_t

