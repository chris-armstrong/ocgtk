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
    an infinitely growing widget.

    Its methods, signals and properties are on {!class-type-widget_paintable_t}.
    The functions it is built on are in {!Ocgtk.Raw.Widget_paintable}. *)

(** The methods, signals and properties of a [GtkWidgetPaintable]. *)
class type widget_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the widget that is observed or [NULL] if none. *)

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the widget that should be observed. *)

  method as_widget_paintable : Raw.Widget_paintable.t
end

class widget_paintable : Raw.Widget_paintable.t -> widget_paintable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Widget_paintable.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkWidgetPaintable], give one already wrapped. *)

val new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .widget_t
  option ->
  widget_paintable_t
