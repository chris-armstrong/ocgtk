(** Uses closures for size negotiation.

    Its methods, signals and properties are on {!class-type-custom_layout_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Custom_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CustomLayout].}

    Inherits from:
    {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}

    Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions. *)
class type custom_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_custom_layout : Raw.Custom_layout.t
end

class custom_layout : Raw.Custom_layout.t -> custom_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Custom_layout.t}. *)

(** {1:description Description}

    Uses closures for size negotiation.

    A [GtkCustomLayout] uses closures matching to the old [GtkWidget] virtual
    functions for size negotiation, as a convenience API to ease the porting
    towards the corresponding [GtkLayoutManager] virtual functions. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
