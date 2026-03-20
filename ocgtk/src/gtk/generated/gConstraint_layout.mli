class type constraint_layout_t = object
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

