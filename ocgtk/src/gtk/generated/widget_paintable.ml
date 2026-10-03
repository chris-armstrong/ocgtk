(* GENERATED CODE - DO NOT EDIT *)
(* WidgetPaintable: WidgetPaintable *)

(** A [GdkPaintable] that displays the contents of a widget.

    [GtkWidgetPaintable] will also take care of the widget not being in a state
    where it can be drawn (like when it isn't shown) and just draw nothing or
    where it does not have a size (like when it is hidden) and report no size in
    that case.

    Of course, [GtkWidgetPaintable] allows you to monitor widgets for size
    changes by emitting the [Gdk.Paintable::invalidate-size] signal whenever the
    size of the widget changes as well as for visual changes by emitting the
    [Gdk.Paintable::invalidate-contents] signal whenever the widget changes.

    You can use a [GtkWidgetPaintable] everywhere a [GdkPaintable] is allowed,
    including using it on a [GtkPicture] (or one of its parents) that it was set
    on itself via gtk_picture_set_paintable(). The paintable will take care of
    recursion when this happens. If you do this however, ensure that the
    [Gtk.Picture:can-shrink] property is set to [TRUE] or you might end up with
    an infinitely growing widget. *)

type t = [ `widget_paintable | `object_ ] Gobject.obj

external new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  t = "ml_gtk_widget_paintable_new"
(** Create a new WidgetPaintable *)

(* Methods *)

external set_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_widget_paintable_set_widget"
(** Sets the widget that should be observed. *)

external get_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_widget_paintable_get_widget"
(** Returns the widget that is observed or [NULL] if none. *)

(* Properties *)
