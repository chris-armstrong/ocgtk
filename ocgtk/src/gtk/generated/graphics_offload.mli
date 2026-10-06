(* GENERATED CODE - DO NOT EDIT *)
(* GraphicsOffload: GraphicsOffload *)

(** Bypasses gsk rendering by passing the content of its child directly to the
    compositor.

    Graphics offload is an optimization to reduce overhead and battery use that
    is most useful for video content. It only works on some platforms and in
    certain situations. GTK will automatically fall back to normal rendering if
    it doesn't.

    Graphics offload is most efficient if there are no controls drawn on top of
    the video content.

    You should consider using graphics offload for your main widget if it shows
    frequently changing content (such as a video, or a VM display) and you
    provide the content in the form of dmabuf textures (see
    [Gdk.DmabufTextureBuilder]), in particular if it may be fullscreen.

    Numerous factors can prohibit graphics offload:

    - Unsupported platforms. Currently, graphics offload only works on Linux
      with Wayland.

    - Clipping, such as rounded corners that cause the video content to not be
      rectangular

    - Unsupported dmabuf formats (see [Gdk.Display.get_dmabuf_formats])

    - Translucent video content (content with an alpha channel, even if it isn't
      used)

    - Transforms that are more complex than translations and scales

    - Filters such as opacity, grayscale or similar

    To investigate problems related graphics offload, GTK offers debug flags to
    print out information about graphics offload and dmabuf use:

    GDK_DEBUG=offload GDK_DEBUG=dmabuf

    The GTK inspector provides a visual debugging tool for graphics offload. *)

type t =
  [ `graphics_offload | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  t = "ml_gtk_graphics_offload_new"
(** Create a new GraphicsOffload *)

(* Methods *)

external set_enabled : t -> Gtk_enums.graphicsoffloadenabled -> unit
  = "ml_gtk_graphics_offload_set_enabled"
(** Sets whether this GtkGraphicsOffload widget will attempt to offload the
    content of its child widget. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_graphics_offload_set_child"
(** Sets the child of [self]. *)

external set_black_background : t -> bool -> unit
  = "ml_gtk_graphics_offload_set_black_background"
(** Sets whether this GtkGraphicsOffload widget will draw a black background.

    A main use case for this is {b _letterboxing_} where black bars are visible
    next to the content if the aspect ratio of the content does not match the
    dimensions of the monitor.

    Using this property for letterboxing instead of CSS allows compositors to
    show content with maximum efficiency, using direct scanout to avoid extra
    copies in the compositor.

    On Wayland, this is implemented using the
    {{:https://wayland.app/protocols/single-pixel-buffer-v1}single-pixel buffer}
    protocol. *)

external get_enabled : t -> Gtk_enums.graphicsoffloadenabled
  = "ml_gtk_graphics_offload_get_enabled"
(** Returns whether offload is enabled for [self]. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_graphics_offload_get_child"
(** Gets the child of [self]. *)

external get_black_background : t -> bool
  = "ml_gtk_graphics_offload_get_black_background"
(** Returns whether the widget draws a black background.

    See [Gtk.GraphicsOffload.set_black_background]. *)

(* Properties *)
