(** Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions.

    Its methods, signals and properties are on {!class-type-custom_layout_t}.
    The functions it is built on are in {!Ocgtk.Raw.Custom_layout}. *)

(** The methods, signals and properties of a [CustomLayout]. *)
class type custom_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method as_custom_layout : Raw.Custom_layout.t
end

class custom_layout : Raw.Custom_layout.t -> custom_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Custom_layout.t}. *)
