(** Preserves the aspect ratio of its child.

    The frame can respect the aspect ratio of the child widget, or use its own
    aspect ratio.

    {b CSS nodes}

    [GtkAspectFrame] uses a CSS node with name [aspectframe].

    {b Accessibility}

    Until GTK 4.10, [GtkAspectFrame] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkAspectFrame] uses the
    [Gtk.AccessibleRole.generic] role.

    Its methods, signals and properties are on {!class-type-aspect_frame_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Aspect_frame}. *)

(** The methods, signals and properties of a [AspectFrame]. *)
class type aspect_frame_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [self]. *)

  method get_obey_child : unit -> bool
  (** Returns whether the child's size request should override the set aspect
      ratio of the [GtkAspectFrame]. *)

  method get_ratio : unit -> float
  (** Returns the desired aspect ratio of the child. *)

  method get_xalign : unit -> float
  (** Returns the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method get_yalign : unit -> float
  (** Returns the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [self]. *)

  method set_obey_child : bool -> unit
  (** Sets whether the aspect ratio of the child's size request should override
      the set aspect ratio of the [GtkAspectFrame]. *)

  method set_ratio : float -> unit
  (** Sets the desired aspect ratio of the child. *)

  method set_xalign : float -> unit
  (** Sets the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_yalign : float -> unit
  (** Sets the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method as_aspect_frame : Raw.Aspect_frame.t
end

class aspect_frame : Raw.Aspect_frame.t -> aspect_frame_t
(** Wraps a raw handle of {!Ocgtk.Raw.Aspect_frame.t}. *)

(** {2:constructors Constructors} *)

val new_ : float -> float -> float -> bool -> aspect_frame_t
(** Create a new [GtkAspectFrame]. *)
