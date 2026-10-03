(* GENERATED CODE - DO NOT EDIT *)
(* DragSource: DragSource *)

(** An event controller to initiate Drag-And-Drop operations.

    [GtkDragSource] can be set up with the necessary ingredients for a DND
    operation ahead of time. This includes the source for the data that is being
    transferred, in the form of a [Gdk.ContentProvider], the desired action, and
    the icon to use during the drag operation. After setting it up, the drag
    source must be added to a widget as an event controller, using
    [Gtk.Widget.add_controller].

    {[
    static void
    my_widget_init (MyWidget *self)
    {
      GtkDragSource *drag_source = gtk_drag_source_new ();

      g_signal_connect (drag_source, “prepare”, G_CALLBACK (on_drag_prepare), self);
      g_signal_connect (drag_source, “drag-begin”, G_CALLBACK (on_drag_begin), self);

      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (drag_source));
    }
    ]}

    Setting up the content provider and icon ahead of time only makes sense when
    the data does not change. More commonly, you will want to set them up just
    in time. To do so, [GtkDragSource] has [Gtk.DragSource::prepare] and
    [Gtk.DragSource::drag-begin] signals.

    The ::prepare signal is emitted before a drag is started, and can be used to
    set the content provider and actions that the drag should be started with.

    {[
    static GdkContentProvider *
    on_drag_prepare (GtkDragSource *source,
                     double         x,
                     double         y,
                     MyWidget      *self)
    {
      // This widget supports two types of content: GFile objects
      // and GdkPixbuf objects; GTK will handle the serialization
      // of these types automatically
      GFile *file = my_widget_get_file (self);
      GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);

      return gdk_content_provider_new_union ((GdkContentProvider *[2]) {
          gdk_content_provider_new_typed (G_TYPE_FILE, file),
          gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),
        }, 2);
    }
    ]}

    The ::drag-begin signal is emitted after the [GdkDrag] object has been
    created, and can be used to set up the drag icon.

    {[
    static void
    on_drag_begin (GtkDragSource *source,
                   GdkDrag       *drag,
                   MyWidget      *self)
    {
      // Set the widget as the drag icon
      GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));
      gtk_drag_source_set_icon (source, paintable, 0, 0);
      g_object_unref (paintable);
    }
    ]}

    During the DND operation, [GtkDragSource] emits signals that can be used to
    obtain updates about the status of the operation, but it is not normally
    necessary to connect to any signals, except for one case: when the supported
    actions include [GDK_ACTION_MOVE], you need to listen for the
    [Gtk.DragSource::drag-end] signal and delete the data after it has been
    transferred. *)

type t =
  [ `drag_source | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_drag_source_new"
(** Create a new DragSource *)

(* Methods *)

external set_icon :
  t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option -> int -> int -> unit
  = "ml_gtk_drag_source_set_icon"
(** Sets a paintable to use as icon during DND operations.

    The hotspot coordinates determine the point on the icon that gets aligned
    with the hotspot of the cursor.

    If [paintable] is [NULL], a default icon is used.

    This function can be called before a drag is started, or in a
    [Gtk.DragSource::prepare] or [Gtk.DragSource::drag-begin] signal handler. *)

external set_content :
  t -> Ocgtk_gdk.Gdk.Wrappers.Content_provider.t option -> unit
  = "ml_gtk_drag_source_set_content"
(** Sets a content provider on a [GtkDragSource].

    When the data is requested in the cause of a DND operation, it will be
    obtained from the content provider.

    This function can be called before a drag is started, or in a handler for
    the [Gtk.DragSource::prepare] signal.

    You may consider setting the content provider back to [NULL] in a
    [Gtk.DragSource::drag-end] signal handler. *)

external set_actions : t -> Ocgtk_gdk.Gdk.dragaction -> unit
  = "ml_gtk_drag_source_set_actions"
(** Sets the actions on the [GtkDragSource].

    During a DND operation, the actions are offered to potential drop targets.
    If [actions] include [GDK_ACTION_MOVE], you need to listen to the
    [Gtk.DragSource::drag-end] signal and handle [delete_data] being [TRUE].

    This function can be called before a drag is started, or in a handler for
    the [Gtk.DragSource::prepare] signal. *)

external get_drag : t -> Ocgtk_gdk.Gdk.Wrappers.Drag.t option
  = "ml_gtk_drag_source_get_drag"
(** Returns the underlying [GdkDrag] object for an ongoing drag. *)

external get_content : t -> Ocgtk_gdk.Gdk.Wrappers.Content_provider.t option
  = "ml_gtk_drag_source_get_content"
(** Gets the current content provider of a [GtkDragSource]. *)

external get_actions : t -> Ocgtk_gdk.Gdk.dragaction
  = "ml_gtk_drag_source_get_actions"
(** Gets the actions that are currently set on the [GtkDragSource]. *)

external drag_cancel : t -> unit = "ml_gtk_drag_source_drag_cancel"
(** Cancels a currently ongoing drag operation. *)

(* Properties *)

val on_drag_begin :
  ?after:bool ->
  t ->
  callback:(drag:Ocgtk_gdk.Gdk.Wrappers.Drag.t -> unit) ->
  Gobject.Signal.handler_id

val on_drag_cancel :
  ?after:bool ->
  t ->
  callback:
    (drag:Ocgtk_gdk.Gdk.Wrappers.Drag.t ->
    reason:Ocgtk_gdk.Gdk_enums.dragcancelreason ->
    bool) ->
  Gobject.Signal.handler_id

val on_drag_end :
  ?after:bool ->
  t ->
  callback:(drag:Ocgtk_gdk.Gdk.Wrappers.Drag.t -> delete_data:bool -> unit) ->
  Gobject.Signal.handler_id

val on_prepare :
  ?after:bool ->
  t ->
  callback:
    (x:float -> y:float -> Ocgtk_gdk.Gdk.Wrappers.Content_provider.t option) ->
  Gobject.Signal.handler_id
