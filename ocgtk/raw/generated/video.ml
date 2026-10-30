(* GENERATED CODE - DO NOT EDIT *)
(* Video: Video *)

(** Shows a [GtkMediaStream] with media controls.

    An example GtkVideo

    The controls are available separately as
    {{!Ocgtk.Raw.Media_controls}[Gtk.MediaControls]}. If you just want to
    display a video without controls, you can treat it like any other paintable
    and for example put it into a {{!Ocgtk.Raw.Picture}[Gtk.Picture]}.

    [GtkVideo] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does not
    have support for video overlays, multichannel audio, device selection, or
    input. If you are writing a full-fledged video player, you may want to use
    the {{!Ocgdk.Raw.Paintable}[Gdk.Paintable]} API and a media framework such
    as Gstreamer directly.

    The class built on this module is in {!Ocgtk.Video}. *)

type t = [ `video | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_video_get_type"

external new_ : unit -> t = "ml_gtk_video_new"
(** Creates a new empty [GtkVideo]. *)

external new_for_file : Ocgio_raw.File.t option -> t
  = "ml_gtk_video_new_for_file"
(** Creates a [GtkVideo] to play back the given [file]. *)

external new_for_filename : string option -> t = "ml_gtk_video_new_for_filename"
(** Creates a [GtkVideo] to play back the given [filename].

    This is a utility function that calls
    {{!Ocgtk.Raw.Video.val-new_for_file}[Gtk.Video.new_for_file]}, See that
    function for details. *)

external new_for_media_stream : Media_stream.t option -> t
  = "ml_gtk_video_new_for_media_stream"
(** Creates a [GtkVideo] to play back the given [stream]. *)

external new_for_resource : string option -> t = "ml_gtk_video_new_for_resource"
(** Creates a [GtkVideo] to play back the resource at the given [resource_path].

    This is a utility function that calls
    {{!Ocgtk.Raw.Video.val-new_for_file}[Gtk.Video.new_for_file]}. *)

(* Methods *)

external set_resource : t -> string option -> unit = "ml_gtk_video_set_resource"
(** Makes [self] play the resource at the given [resource_path].

    This is a utility function that calls
    {{!Ocgtk.Raw.Video.val-set_file}[Gtk.Video.set_file]}. *)

external set_media_stream : t -> Media_stream.t option -> unit
  = "ml_gtk_video_set_media_stream"
(** Sets the media stream to be played back.

    [self] will take full control of managing the media stream. If you want to
    manage a media stream yourself, consider using a
    {{!Ocgtk.Raw.Picture}[Gtk.Picture]} for display.

    If you want to display a file, consider using
    {{!Ocgtk.Raw.Video.val-set_file}[Gtk.Video.set_file]} instead. *)

external set_loop : t -> bool -> unit = "ml_gtk_video_set_loop"
(** Sets whether new files loaded by [self] should be set to loop. *)

external set_graphics_offload : t -> Ocgtk_enums.graphicsoffloadenabled -> unit
  = "ml_gtk_video_set_graphics_offload"
(** Sets whether to enable graphics offload.

    See {{!Ocgtk.Raw.Graphics_offload}[Gtk.GraphicsOffload]} for more
    information on graphics offload. *)

external set_filename : t -> string option -> unit = "ml_gtk_video_set_filename"
(** Makes [self] play the given [filename].

    This is a utility function that calls
    {{!Ocgtk.Raw.Video.val-set_file}[gtk_video_set_file ()]}, *)

external set_file : t -> Ocgio_raw.File.t option -> unit
  = "ml_gtk_video_set_file"
(** Makes [self] play the given [file]. *)

external set_autoplay : t -> bool -> unit = "ml_gtk_video_set_autoplay"
(** Sets whether [self] automatically starts playback when it becomes visible or
    when a new file gets loaded. *)

external get_media_stream : t -> Media_stream.t option
  = "ml_gtk_video_get_media_stream"
(** Gets the media stream managed by [self] or [None] if none. *)

external get_loop : t -> bool = "ml_gtk_video_get_loop"
(** Returns [true] if videos have been set to loop. *)

external get_graphics_offload : t -> Ocgtk_enums.graphicsoffloadenabled
  = "ml_gtk_video_get_graphics_offload"
(** Returns whether graphics offload is enabled.

    See {{!Ocgtk.Raw.Graphics_offload}[Gtk.GraphicsOffload]} for more
    information on graphics offload. *)

external get_file : t -> Ocgio_raw.File.t option = "ml_gtk_video_get_file"
(** Gets the file played by [self] or [None] if not playing back a file. *)

external get_autoplay : t -> bool = "ml_gtk_video_get_autoplay"
(** Returns [true] if videos have been set to loop. *)

(* Properties *)
