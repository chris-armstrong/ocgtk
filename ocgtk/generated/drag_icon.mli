(** A [GtkRoot] implementation for drag icons.

    Its methods, signals and properties are on {!class-type-drag_icon_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Drag_icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DragIcon].}

    A [GtkRoot] implementation for drag icons.

    A drag icon moves with the pointer during a Drag-and-Drop operation and is
    destroyed when the drag ends.

    To set up a drag icon and associate it with an ongoing drag operation, use
    [Gtk.DragIcon.get_for_drag] to get the icon for a drag. You can then use it
    like any other widget and use [Gtk.DragIcon.set_child] to set whatever
    widget should be used for the drag icon.

    Keep in mind that drag icons do not allow user input. *)
class type drag_icon_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t

  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .root_t

  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the widget currently used as drag icon. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the widget to display as the drag icon. *)

  (** {2:conversions Conversions} *)

  method as_drag_icon : Raw.Drag_icon.t
end

class drag_icon : Raw.Drag_icon.t -> drag_icon_t
(** Wraps a raw handle of {!Ocgtk.Raw.Drag_icon.t}. *)

(** {1:description Description}

    A [GtkRoot] implementation for drag icons.

    A drag icon moves with the pointer during a Drag-and-Drop operation and is
    destroyed when the drag ends.

    To set up a drag icon and associate it with an ongoing drag operation, use
    [Gtk.DragIcon.get_for_drag] to get the icon for a drag. You can then use it
    like any other widget and use [Gtk.DragIcon.set_child] to set whatever
    widget should be used for the drag icon.

    Keep in mind that drag icons do not allow user input. *)

(** {1:constructors Constructors} *)

val get_for_drag : Ocgdk.Drag.drag_t -> drag_icon_t
(** Gets the [GtkDragIcon] in use with [drag].

    If no drag icon exists yet, a new one will be created and shown. *)
