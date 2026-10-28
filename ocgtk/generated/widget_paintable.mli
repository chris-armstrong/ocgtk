(** A [GdkPaintable] that displays the contents of a widget.

    Its methods, signals and properties are on {!class-type-widget_paintable_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Widget_paintable}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [WidgetPaintable].}

    Implements:
    - {{!Ocgdk.Paintable.class-type-paintable_t}Ocgdk.Paintable}

    A [GdkPaintable] that displays the contents of a widget.

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
    [Gtk.Picture:can-shrink] property is set to [true] or you might end up with
    an infinitely growing widget. *)
class type widget_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t

  (** {2:methods Methods} *)

  method get_widget : unit -> Widget.widget_t option
  (** Returns the widget that is observed or [None] if none. *)

  method set_widget : Widget.widget_t option -> unit
  (** Sets the widget that should be observed. *)

  (** {2:conversions Conversions} *)

  method as_widget_paintable : Raw.Widget_paintable.t
end

class widget_paintable : Raw.Widget_paintable.t -> widget_paintable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Widget_paintable.t}. *)

(** {1:description Description}

    A [GdkPaintable] that displays the contents of a widget.

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
    [Gtk.Picture:can-shrink] property is set to [true] or you might end up with
    an infinitely growing widget. *)

(** {1:constructors Constructors} *)

val new_ : Widget.widget_t option -> widget_paintable_t
(** Creates a new widget paintable observing the given widget. *)
