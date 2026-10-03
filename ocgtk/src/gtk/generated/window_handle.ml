(* GENERATED CODE - DO NOT EDIT *)
(* WindowHandle: WindowHandle *)

(** Implements titlebar functionality for a window.

    When added into a window, it can be dragged to move the window, and it
    implements the right click, double click and middle click behaviors that are
    expected of a titlebar.

    {b CSS nodes}

    [GtkWindowHandle] has a single CSS node with the name [windowhandle].

    {b Accessibility}

    Until GTK 4.10, [GtkWindowHandle] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkWindowHandle] uses the
    [Gtk.AccessibleRole.generic] role. *)

type t =
  [ `window_handle | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_window_handle_new"
(** Create a new WindowHandle *)

(* Methods *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_window_handle_set_child"
(** Sets the child widget of [self]. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_window_handle_get_child"
(** Gets the child widget of [self]. *)

(* Properties *)
