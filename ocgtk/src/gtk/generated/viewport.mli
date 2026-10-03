(* GENERATED CODE - DO NOT EDIT *)
(* Viewport: Viewport *)

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
    role. *)

type t = [ `viewport | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : Adjustment.t option -> Adjustment.t option -> t
  = "ml_gtk_viewport_new"
(** Create a new Viewport *)

(* Methods *)

external set_scroll_to_focus : t -> bool -> unit
  = "ml_gtk_viewport_set_scroll_to_focus"
(** Sets whether the viewport should automatically scroll to keep the focused
    child in view. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_viewport_set_child"
(** Sets the child widget of [viewport]. *)

external scroll_to :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Scroll_info.t option ->
  unit = "ml_gtk_viewport_scroll_to"
(** Scrolls a descendant of the viewport into view.

    The viewport and the descendant must be visible and mapped for this function
    to work, otherwise no scrolling will be performed. *)

external get_scroll_to_focus : t -> bool = "ml_gtk_viewport_get_scroll_to_focus"
(** Gets whether the viewport is scrolling to keep the focused child in view. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_viewport_get_child"
(** Gets the child widget of [viewport]. *)

(* Properties *)
