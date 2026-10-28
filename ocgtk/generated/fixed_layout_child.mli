(** [GtkLayoutChild] subclass for children in a [GtkFixedLayout].

    Its methods, signals and properties are on
    {!class-type-fixed_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Fixed_layout_child}. *)

(** {b The methods, signals and properties of a [FixedLayoutChild].}

    [GtkLayoutChild] subclass for children in a [GtkFixedLayout]. *)
class type fixed_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_transform : unit -> Ocgsk.Transform.transform_t option
  (** Retrieves the transformation of the child. *)

  method set_transform : Ocgsk.Transform.transform_t -> unit
  (** Sets the transformation of the child of a [GtkFixedLayout]. *)

  method as_fixed_layout_child : Raw.Fixed_layout_child.t
end

class fixed_layout_child : Raw.Fixed_layout_child.t -> fixed_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Fixed_layout_child.t}. *)
