(** Implements titlebar functionality for a window.

    When added into a window, it can be dragged to move the window, and it
    implements the right click, double click and middle click behaviors that are
    expected of a titlebar.

    {b CSS nodes}

    [GtkWindowHandle] has a single CSS node with the name [windowhandle].

    {b Accessibility}

    Until GTK 4.10, [GtkWindowHandle] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkWindowHandle] uses the
    [Gtk.AccessibleRole.generic] role.

    Its methods, signals and properties are on {!class-type-window_handle_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Window_handle}. *)

(** {b The methods, signals and properties of a [WindowHandle].}

    Implements titlebar functionality for a window.

    When added into a window, it can be dragged to move the window, and it
    implements the right click, double click and middle click behaviors that are
    expected of a titlebar.

    {b CSS nodes}

    [GtkWindowHandle] has a single CSS node with the name [windowhandle].

    {b Accessibility}

    Until GTK 4.10, [GtkWindowHandle] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkWindowHandle] uses the
    [Gtk.AccessibleRole.generic] role. *)
class type window_handle_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [self]. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [self]. *)

  method as_window_handle : Raw.Window_handle.t
end

class window_handle : Raw.Window_handle.t -> window_handle_t
(** Wraps a raw handle of {!Ocgtk.Raw.Window_handle.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> window_handle_t
(** Creates a new [GtkWindowHandle]. *)
