(** An event controller to initiate Drag-And-Drop operations.

    Its methods, signals and properties are on {!class-type-drag_source_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Drag_source}. *)

(** {1:class Class} *)

class type drag_source_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_drag_begin :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drag source when a drag is started.

      It can be used to e.g. set a custom drag icon with
      [Gtk.DragSource.set_icon]. *)

  method on_drag_cancel :
    ?after:bool ->
    callback:
      (drag:Ocgdk.Drag.drag_t -> reason:Ocgdk.Enums.dragcancelreason -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted on the drag source when a drag has failed.\n\n\
     The signal handler may handle a failed drag operation based on\n\
     the type of error. It should return [true] if the failure has been handled\n\
     and the default \"drag operation failed\" animation should not be shown."]

  method on_drag_end :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> delete_data:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drag source when a drag is finished.

      A typical reason to connect to this signal is to undo things done in
      [Gtk.DragSource::prepare] or [Gtk.DragSource::drag-begin] handlers. *)

  method on_prepare :
    ?after:bool ->
    callback:
      (x:float -> y:float -> Ocgdk.Content_provider.content_provider_t option) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drag is about to be initiated.

      It returns the [GdkContentProvider] to use for the drag that is about to
      start. The default handler for this signal returns the value of the
      [Gtk.DragSource:content] property, so if you set up that property ahead of
      time, you don't need to connect to this signal. *)

  (** {2:methods Methods} *)

  method drag_cancel : unit -> unit
  (** Cancels a currently ongoing drag operation. *)

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that are currently set on the [GtkDragSource]. *)

  method get_content : unit -> Ocgdk.Content_provider.content_provider_t option
  (** Gets the current content provider of a [GtkDragSource]. *)

  method get_drag : unit -> Ocgdk.Drag.drag_t option
  (** Returns the underlying [GdkDrag] object for an ongoing drag. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions on the [GtkDragSource].

      During a DND operation, the actions are offered to potential drop targets.
      If [actions] include [GDK_ACTION_MOVE], you need to listen to the
      [Gtk.DragSource::drag-end] signal and handle [delete_data] being [true].

      This function can be called before a drag is started, or in a handler for
      the [Gtk.DragSource::prepare] signal. *)

  method set_content : Ocgdk.Content_provider.content_provider_t option -> unit
  (** Sets a content provider on a [GtkDragSource].

      When the data is requested in the cause of a DND operation, it will be
      obtained from the content provider.

      This function can be called before a drag is started, or in a handler for
      the [Gtk.DragSource::prepare] signal.

      You may consider setting the content provider back to [None] in a
      [Gtk.DragSource::drag-end] signal handler. *)

  method set_icon : Ocgdk.Paintable.paintable_t option -> int -> int -> unit
  (** Sets a paintable to use as icon during DND operations.

      The hotspot coordinates determine the point on the icon that gets aligned
      with the hotspot of the cursor.

      If [paintable] is [None], a default icon is used.

      This function can be called before a drag is started, or in a
      [Gtk.DragSource::prepare] or [Gtk.DragSource::drag-begin] signal handler.
  *)

  (** {2:conversions Conversions} *)

  method as_drag_source : Raw.Drag_source.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DragSource].}\n\n\
     Inherits from: \
     {{!Ocgtk.Gesture_single.class-type-gesture_single_t}Ocgtk.Gesture_single}\n\n\
     An event controller to initiate Drag-And-Drop operations.\n\n\
     [GtkDragSource] can be set up with the necessary\n\
     ingredients for a DND operation ahead of time. This includes\n\
     the source for the data that is being transferred, in the form\n\
     of a [Gdk.ContentProvider], the desired action, and the icon to\n\
     use during the drag operation. After setting it up, the drag\n\
     source must be added to a widget as an event controller, using\n\
     [Gtk.Widget.add_controller].\n\n\
     {[\n\
     static void\n\
     my_widget_init (MyWidget *self)\n\
     {\n\
    \  GtkDragSource *drag_source = gtk_drag_source_new ();\n\n\
    \  g_signal_connect (drag_source, \"prepare\", G_CALLBACK \
     (on_drag_prepare), self);\n\
    \  g_signal_connect (drag_source, \"drag-begin\", G_CALLBACK \
     (on_drag_begin), self);\n\n\
    \  gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER \
     (drag_source));\n\
     }\n\
     ]}\n\n\
     Setting up the content provider and icon ahead of time only makes\n\
     sense when the data does not change. More commonly, you will want\n\
     to set them up just in time. To do so, [GtkDragSource] has\n\
     [Gtk.DragSource::prepare] and [Gtk.DragSource::drag-begin]\n\
     signals.\n\n\
     The ::prepare signal is emitted before a drag is started, and\n\
     can be used to set the content provider and actions that the\n\
     drag should be started with.\n\n\
     {[\n\
     static GdkContentProvider *\n\
     on_drag_prepare (GtkDragSource *source,\n\
    \                 double         x,\n\
    \                 double         y,\n\
    \                 MyWidget      *self)\n\
     {\n\
    \  // This widget supports two types of content: GFile objects\n\
    \  // and GdkPixbuf objects; GTK will handle the serialization\n\
    \  // of these types automatically\n\
    \  GFile *file = my_widget_get_file (self);\n\
    \  GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);\n\n\
    \  return gdk_content_provider_new_union ((GdkContentProvider *[2]) {\n\
    \      gdk_content_provider_new_typed (G_TYPE_FILE, file),\n\
    \      gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),\n\
    \    }, 2);\n\
     }\n\
     ]}\n\n\
     The ::drag-begin signal is emitted after the [GdkDrag] object has\n\
     been created, and can be used to set up the drag icon.\n\n\
     {[\n\
     static void\n\
     on_drag_begin (GtkDragSource *source,\n\
    \               GdkDrag       *drag,\n\
    \               MyWidget      *self)\n\
     {\n\
    \  // Set the widget as the drag icon\n\
    \  GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));\n\
    \  gtk_drag_source_set_icon (source, paintable, 0, 0);\n\
    \  g_object_unref (paintable);\n\
     }\n\
     ]}\n\n\
     During the DND operation, [GtkDragSource] emits signals that\n\
     can be used to obtain updates about the status of the operation,\n\
     but it is not normally necessary to connect to any signals,\n\
     except for one case: when the supported actions include\n\
     [GDK_ACTION_MOVE], you need to listen for the\n\
     [Gtk.DragSource::drag-end] signal and delete the\n\
     data after it has been transferred."]

class drag_source : Raw.Drag_source.t -> drag_source_t
(** Wraps a raw handle of {!Ocgtk.Raw.Drag_source.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 An event controller to initiate Drag-And-Drop operations.\n\n\
 [GtkDragSource] can be set up with the necessary\n\
 ingredients for a DND operation ahead of time. This includes\n\
 the source for the data that is being transferred, in the form\n\
 of a [Gdk.ContentProvider], the desired action, and the icon to\n\
 use during the drag operation. After setting it up, the drag\n\
 source must be added to a widget as an event controller, using\n\
 [Gtk.Widget.add_controller].\n\n\
 {[\n\
 static void\n\
 my_widget_init (MyWidget *self)\n\
 {\n\
\  GtkDragSource *drag_source = gtk_drag_source_new ();\n\n\
\  g_signal_connect (drag_source, \"prepare\", G_CALLBACK (on_drag_prepare), \
 self);\n\
\  g_signal_connect (drag_source, \"drag-begin\", G_CALLBACK (on_drag_begin), \
 self);\n\n\
\  gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER \
 (drag_source));\n\
 }\n\
 ]}\n\n\
 Setting up the content provider and icon ahead of time only makes\n\
 sense when the data does not change. More commonly, you will want\n\
 to set them up just in time. To do so, [GtkDragSource] has\n\
 [Gtk.DragSource::prepare] and [Gtk.DragSource::drag-begin]\n\
 signals.\n\n\
 The ::prepare signal is emitted before a drag is started, and\n\
 can be used to set the content provider and actions that the\n\
 drag should be started with.\n\n\
 {[\n\
 static GdkContentProvider *\n\
 on_drag_prepare (GtkDragSource *source,\n\
\                 double         x,\n\
\                 double         y,\n\
\                 MyWidget      *self)\n\
 {\n\
\  // This widget supports two types of content: GFile objects\n\
\  // and GdkPixbuf objects; GTK will handle the serialization\n\
\  // of these types automatically\n\
\  GFile *file = my_widget_get_file (self);\n\
\  GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);\n\n\
\  return gdk_content_provider_new_union ((GdkContentProvider *[2]) {\n\
\      gdk_content_provider_new_typed (G_TYPE_FILE, file),\n\
\      gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),\n\
\    }, 2);\n\
 }\n\
 ]}\n\n\
 The ::drag-begin signal is emitted after the [GdkDrag] object has\n\
 been created, and can be used to set up the drag icon.\n\n\
 {[\n\
 static void\n\
 on_drag_begin (GtkDragSource *source,\n\
\               GdkDrag       *drag,\n\
\               MyWidget      *self)\n\
 {\n\
\  // Set the widget as the drag icon\n\
\  GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));\n\
\  gtk_drag_source_set_icon (source, paintable, 0, 0);\n\
\  g_object_unref (paintable);\n\
 }\n\
 ]}\n\n\
 During the DND operation, [GtkDragSource] emits signals that\n\
 can be used to obtain updates about the status of the operation,\n\
 but it is not normally necessary to connect to any signals,\n\
 except for one case: when the supported actions include\n\
 [GDK_ACTION_MOVE], you need to listen for the\n\
 [Gtk.DragSource::drag-end] signal and delete the\n\
 data after it has been transferred."]

(** {1:constructors Constructors} *)

val new_ : unit -> drag_source_t
(** Creates a new [GtkDragSource] object. *)
