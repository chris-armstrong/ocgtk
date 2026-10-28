(** Bypasses gsk rendering by passing the content of its child directly to the
    compositor.

    Its methods, signals and properties are on {!class-type-graphics_offload_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Graphics_offload}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GraphicsOffload].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Bypasses gsk rendering by passing the content of its child directly to the
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
class type graphics_offload_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_black_background : unit -> bool
  (** Returns whether the widget draws a black background.

      See [Gtk.GraphicsOffload.set_black_background]. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child of [self]. *)

  method get_enabled : unit -> Enums.graphicsoffloadenabled
  (** Returns whether offload is enabled for [self]. *)

  method set_black_background : bool -> unit
  (** Sets whether this GtkGraphicsOffload widget will draw a black background.

      A main use case for this is {b _letterboxing_} where black bars are
      visible next to the content if the aspect ratio of the content does not
      match the dimensions of the monitor.

      Using this property for letterboxing instead of CSS allows compositors to
      show content with maximum efficiency, using direct scanout to avoid extra
      copies in the compositor.

      On Wayland, this is implemented using the
      {{:https://wayland.app/protocols/single-pixel-buffer-v1}single-pixel
       buffer} protocol. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child of [self]. *)

  method set_enabled : Enums.graphicsoffloadenabled -> unit
  (** Sets whether this GtkGraphicsOffload widget will attempt to offload the
      content of its child widget. *)

  (** {2:conversions Conversions} *)

  method as_graphics_offload : Raw.Graphics_offload.t
end

class graphics_offload : Raw.Graphics_offload.t -> graphics_offload_t
(** Wraps a raw handle of {!Ocgtk.Raw.Graphics_offload.t}. *)

(** {1:description Description}

    Bypasses gsk rendering by passing the content of its child directly to the
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

(** {1:constructors Constructors} *)

val new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .widget_t
  option ->
  graphics_offload_t
(** Creates a new GtkGraphicsOffload widget. *)
