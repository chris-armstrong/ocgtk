(** Uses closures for size negotiation.

    Its methods, signals and properties are on {!class-type-custom_layout_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Custom_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CustomLayout].}

    Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions. *)
class type custom_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method as_custom_layout : Raw.Custom_layout.t
end

class custom_layout : Raw.Custom_layout.t -> custom_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Custom_layout.t}. *)

(** {1:description Description}

    Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions. *)
