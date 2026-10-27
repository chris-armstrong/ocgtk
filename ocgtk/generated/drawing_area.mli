(** Allows drawing with cairo.

    An example GtkDrawingArea

    It’s essentially a blank widget; you can draw on it. After creating a
    drawing area, the application may want to connect to:

    - The [Gtk.Widget::realize] signal to take any necessary actions when the
      widget is instantiated on a particular display. (Create GDK resources in
      response to this signal.)

    - The [Gtk.DrawingArea::resize] signal to take any necessary actions when
      the widget changes size.

    - Call [Gtk.DrawingArea.set_draw_func] to handle redrawing the contents of
      the widget.

    The following code portion demonstrates using a drawing area to display a
    circle in the normal widget foreground color.

    {b Simple GtkDrawingArea usage}

    {[
    static void
    draw_function (GtkDrawingArea *area,
                   cairo_t        *cr,
                   int             width,
                   int             height,
                   gpointer        data)
    {
      GdkRGBA color;

      cairo_arc (cr,
                 width / 2.0, height / 2.0,
                 MIN (width, height) / 2.0,
                 0, 2 * G_PI);

      gtk_widget_get_color (GTK_WIDGET (area),
                            &color);
      gdk_cairo_set_source_rgba (cr, &color);

      cairo_fill (cr);
    }

    int
    main (int argc, char **argv)
    {
      gtk_init ();

      GtkWidget *area = gtk_drawing_area_new ();
      gtk_drawing_area_set_content_width (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_content_height (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_draw_func (GTK_DRAWING_AREA (area),
                                      draw_function,
                                      NULL, NULL);
      return 0;
    }
    ]}

    The draw function is normally called when a drawing area first comes
    onscreen, or when it’s covered by another window and then uncovered. You can
    also force a redraw by adding to the “damage region” of the drawing area’s
    window using [Gtk.Widget.queue_draw]. This will cause the drawing area to
    call the draw function again.

    The available routines for drawing are documented in the
    {{:https://www.cairographics.org/manual/}Cairo documentation}; GDK offers
    additional API to integrate with Cairo, like [Gdk.cairo_set_source_rgba] or
    [Gdk.cairo_set_source_pixbuf].

    To receive mouse events on a drawing area, you will need to use event
    controllers. To receive keyboard events, you will need to set the
    “can-focus” property on the drawing area, and you should probably draw some
    user-visible indication that the drawing area is focused.

    If you need more complex control over your widget, you should consider
    creating your own [GtkWidget] subclass.

    Its methods, signals and properties are on {!class-type-drawing_area_t}. The
    functions it is built on are in {!Ocgtk.Raw.Drawing_area}. *)

(** The methods, signals and properties of a [GtkDrawingArea]. *)
class type drawing_area_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_resize :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_content_height : unit -> int
  (** Retrieves the content height of the [GtkDrawingArea]. *)

  method get_content_width : unit -> int
  (** Retrieves the content width of the [GtkDrawingArea]. *)

  method set_content_height : int -> unit
  (** Sets the desired height of the contents of the drawing area.

      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual height passed to your draw
      function is larger than the height set here. You can use
      [Gtk.Widget.set_valign] to avoid that.

      If the height is set to 0 (the default), the drawing area may disappear.
  *)

  method set_content_width : int -> unit
  (** Sets the desired width of the contents of the drawing area.

      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual width passed to your draw
      function is larger than the width set here. You can use
      [Gtk.Widget.set_halign] to avoid that.

      If the width is set to 0 (the default), the drawing area may disappear. *)

  method as_drawing_area : Raw.Drawing_area.t
end

class drawing_area : Raw.Drawing_area.t -> drawing_area_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drawing_area.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkDrawingArea], give one already wrapped. *)

val new_ : unit -> drawing_area_t
