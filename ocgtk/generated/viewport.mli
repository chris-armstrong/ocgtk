(** Implements scrollability for widgets that don't support scrolling on their
    own.

    Use [GtkViewport] to scroll child widgets such as [GtkGrid], [GtkBox], and
    so on.

    The [GtkViewport] will start scrolling content only if allocated less than
    the child widget’s minimum size in a given orientation.

    {b CSS nodes}

    [GtkViewport] has a single CSS node with name [viewport].

    {b Accessibility}

    Until GTK 4.10, [GtkViewport] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkViewport] uses the [Gtk.AccessibleRole.generic]
    role.

    Its methods, signals and properties are on {!class-type-viewport_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Viewport}. *)

(** {b The methods, signals and properties of a [Viewport].}

    Implements scrollability for widgets that don't support scrolling on their
    own.

    Use [GtkViewport] to scroll child widgets such as [GtkGrid], [GtkBox], and
    so on.

    The [GtkViewport] will start scrolling content only if allocated less than
    the child widget’s minimum size in a given orientation.

    {b CSS nodes}

    [GtkViewport] has a single CSS node with name [viewport].

    {b Accessibility}

    Until GTK 4.10, [GtkViewport] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkViewport] uses the [Gtk.AccessibleRole.generic]
    role. *)
class type viewport_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [viewport]. *)

  method get_scroll_to_focus : unit -> bool
  (** Gets whether the viewport is scrolling to keep the focused child in view.
  *)

  method scroll_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Raw.Scroll_info.t option ->
    unit
  (** Scrolls a descendant of the viewport into view.

      The viewport and the descendant must be visible and mapped for this
      function to work, otherwise no scrolling will be performed. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [viewport]. *)

  method set_scroll_to_focus : bool -> unit
  (** Sets whether the viewport should automatically scroll to keep the focused
      child in view. *)

  method as_viewport : Raw.Viewport.t
end

class viewport : Raw.Viewport.t -> viewport_t
(** Wraps a raw handle of {!Ocgtk.Raw.Viewport.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Adjustment.adjustment_t option -> Adjustment.adjustment_t option -> viewport_t
(** Creates a new [GtkViewport].

    The new viewport uses the given adjustments, or default adjustments if none
    are given. *)
