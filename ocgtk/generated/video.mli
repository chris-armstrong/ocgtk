(** Shows a [GtkMediaStream] with media controls.

    Its methods, signals and properties are on {!class-type-video_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Video}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Video].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Shows a [GtkMediaStream] with media controls.

    An example GtkVideo

    The controls are available separately as
    {{!Ocgtk.Media_controls.class-type-media_controls_t}[Gtk.MediaControls]}. If
    you just want to display a video without controls, you can treat it like any
    other paintable and for example put it into a
    {{!Ocgtk.Picture.class-type-picture_t}[Gtk.Picture]}.

    [GtkVideo] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does not
    have support for video overlays, multichannel audio, device selection, or
    input. If you are writing a full-fledged video player, you may want to use
    the {{!Ocgdk.Paintable.class-type-paintable_t}[Gdk.Paintable]} API and a
    media framework such as Gstreamer directly. *)
class type video_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_autoplay : unit -> bool
  (** Returns [true] if videos have been set to loop. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file played by [self] or [None] if not playing back a file. *)

  method get_graphics_offload : unit -> Enums.graphicsoffloadenabled
  (** Returns whether graphics offload is enabled.

      See [Gtk.GraphicsOffload] for more information on graphics offload. *)

  method get_loop : unit -> bool
  (** Returns [true] if videos have been set to loop. *)

  method get_media_stream : unit -> Media_stream.media_stream_t option
  (** Gets the media stream managed by [self] or [None] if none. *)

  method set_autoplay : bool -> unit
  (** Sets whether [self] automatically starts playback when it becomes visible
      or when a new file gets loaded. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Makes [self] play the given [file]. *)

  method set_filename : string option -> unit
  (** Makes [self] play the given [filename].

      This is a utility function that calls [gtk_video_set_file ()], *)

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

  (** {2:conversions Conversions} *)

  method as_video : Raw.Video.t
end

class video : Raw.Video.t -> video_t
(** Wraps a raw handle of {!Ocgtk.Raw.Video.t}. *)

(** {1:description Description}

    Shows a [GtkMediaStream] with media controls.

    An example GtkVideo

    The controls are available separately as
    {{!Ocgtk.Media_controls.class-type-media_controls_t}[Gtk.MediaControls]}. If
    you just want to display a video without controls, you can treat it like any
    other paintable and for example put it into a
    {{!Ocgtk.Picture.class-type-picture_t}[Gtk.Picture]}.

    [GtkVideo] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does not
    have support for video overlays, multichannel audio, device selection, or
    input. If you are writing a full-fledged video player, you may want to use
    the {{!Ocgdk.Paintable.class-type-paintable_t}[Gdk.Paintable]} API and a
    media framework such as Gstreamer directly. *)

(** {1:constructors Constructors} *)

val new_ : unit -> video_t
(** Creates a new empty [GtkVideo]. *)

val new_for_file : Ocgio.File.file_t option -> video_t
(** Creates a [GtkVideo] to play back the given [file]. *)

val new_for_filename : string option -> video_t
(** Creates a [GtkVideo] to play back the given [filename].

    This is a utility function that calls
    {{!Ocgtk.Video.val-new_for_file}[Gtk.Video.new_for_file]}, See that function
    for details. *)

val new_for_media_stream : Media_stream.media_stream_t option -> video_t
(** Creates a [GtkVideo] to play back the given [stream]. *)

val new_for_resource : string option -> video_t
(** Creates a [GtkVideo] to play back the resource at the given [resource_path].

    This is a utility function that calls
    {{!Ocgtk.Video.val-new_for_file}[Gtk.Video.new_for_file]}. *)
