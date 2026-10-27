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
  (** Returns [TRUE] if videos have been set to loop. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file played by [self] or [NULL] if not playing back a file. *)

  method get_graphics_offload : unit -> Enums.graphicsoffloadenabled
  (** Returns whether graphics offload is enabled.

      See [Gtk.GraphicsOffload] for more information on graphics offload. *)

  method get_loop : unit -> bool
  (** Returns [TRUE] if videos have been set to loop. *)

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [self] or [NULL] if none. *)

  method set_autoplay : bool -> unit
  (** Sets whether [self] automatically starts playback when it becomes visible
      or when a new file gets loaded. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Makes [self] play the given [file]. *)

  method set_filename : string option -> unit
  (** Makes [self] play the given [filename].

      This is a utility function that calls gtk_video_set_file(), *)

  method set_graphics_offload : Enums.graphicsoffloadenabled -> unit
  (** Sets whether to enable graphics offload.

      See [Gtk.GraphicsOffload] for more information on graphics offload. *)

  method set_loop : bool -> unit
  (** Sets whether new files loaded by [self] should be set to loop. *)

  method set_media_stream : Media_stream.media_stream_t option -> unit
  (** Sets the media stream to be played back.

      [self] will take full control of managing the media stream. If you want to
      manage a media stream yourself, consider using a [Gtk.Picture] for
      display.

      If you want to display a file, consider using [Gtk.Video.set_file]
      instead. *)

  method set_resource : string option -> unit
  (** Makes [self] play the resource at the given [resource_path].

      This is a utility function that calls [Gtk.Video.set_file]. *)

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
