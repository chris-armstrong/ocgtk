(** [GtkLayoutChild] subclass for children in a [GtkFixedLayout].

    Its methods, signals and properties are on
    {!class-type-fixed_layout_child_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Fixed_layout_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FixedLayoutChild].}

    Inherits from:
    {{!Ocgtk.Layout_child.class-type-layout_child_t}Ocgtk.Layout_child}

    [GtkLayoutChild] subclass for children in a [GtkFixedLayout]. *)
class type fixed_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  (** {2:methods Methods} *)

  method get_transform : unit -> Ocgsk.Transform.transform_t option
  (** Retrieves the transformation of the child. *)

  method set_transform : Ocgsk.Transform.transform_t -> unit
  (** Sets the transformation of the child of a [GtkFixedLayout]. *)

  (** {2:conversions Conversions} *)

  method as_fixed_layout_child : Raw.Fixed_layout_child.t
end

class fixed_layout_child : Raw.Fixed_layout_child.t -> fixed_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Fixed_layout_child.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
