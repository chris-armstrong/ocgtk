(** Shows a [GtkMediaStream] with media controls.

    An example GtkVideo

    The controls are available separately as [Gtk.MediaControls]. If you just
    want to display a video without controls, you can treat it like any other
    paintable and for example put it into a [Gtk.Picture].

    [GtkVideo] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does not
    have support for video overlays, multichannel audio, device selection, or
    input. If you are writing a full-fledged video player, you may want to use
    the [Gdk.Paintable] API and a media framework such as Gstreamer directly.

    Its methods, signals and properties are on {!class-type-video_t}. The
    functions it is built on are in {!Ocgtk.Raw.Video}. *)

(** The methods, signals and properties of a [GtkVideo]. *)
class type video_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_autoplay : unit -> bool
  method get_file : unit -> Ocgio.File.file_t option
  method get_graphics_offload : unit -> Enums.graphicsoffloadenabled
  method get_loop : unit -> bool
  method get_media_stream : unit -> Media_stream.media_stream_t option
  method set_autoplay : bool -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_graphics_offload : Enums.graphicsoffloadenabled -> unit
  method set_loop : bool -> unit
  method set_media_stream : Media_stream.media_stream_t option -> unit
  method set_resource : string option -> unit
  method as_video : Raw.Video.t
end

class video : Raw.Video.t -> video_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Video.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkVideo], give one already wrapped. *)

val new_ : unit -> video_t
val new_for_file : Ocgio.File.file_t option -> video_t
val new_for_filename : string option -> video_t
val new_for_media_stream : Media_stream.media_stream_t option -> video_t
val new_for_resource : string option -> video_t
