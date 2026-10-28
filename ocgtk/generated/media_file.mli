(** Implements the [GtkMediaStream] interface for files.

    Its methods, signals and properties are on {!class-type-media_file_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Media_file}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MediaFile].}

    Implements the [GtkMediaStream] interface for files.

    This provides a simple way to play back video files with GTK.

    GTK provides a GIO extension point for [GtkMediaFile] implementations to
    allow for external implementations using various media frameworks.

    GTK itself includes an implementation using GStreamer. *)
class type media_file_t = object
  inherit Media_stream.media_stream_t

  method clear : unit -> unit
  (** Resets the media file to be empty. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Returns the file that [self] is currently playing from.

      When [self] is not playing or not playing from a file, [NULL] is returned.
  *)

  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t option
  (** Returns the stream that [self] is currently playing from.

      When [self] is not playing or not playing from a stream, [NULL] is
      returned. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Sets the [GtkMediaFile] to play the given file.

      If any file is still playing, stop playing it. *)

  method set_filename : string option -> unit
  (** Sets the [GtkMediaFile] to play the given file.

      This is a utility function that converts the given [filename] to a [GFile]
      and calls [Gtk.MediaFile.set_file]. *)

  method set_input_stream : Ocgio.Input_stream.input_stream_t option -> unit
  (** Sets the [GtkMediaFile] to play the given stream.

      If anything is still playing, stop playing it.

      Full control about the [stream] is assumed for the duration of playback.
      The stream will not be closed. *)

  method set_resource : string option -> unit
  (** Sets the [GtkMediaFile] to play the given resource.

      This is a utility function that converts the given [resource_path] to a
      [GFile] and calls [Gtk.MediaFile.set_file]. *)

  method as_media_file : Raw.Media_file.t
end

class media_file : Raw.Media_file.t -> media_file_t
(** Wraps a raw handle of {!Ocgtk.Raw.Media_file.t}. *)

(** {1:description Description}

    Implements the [GtkMediaStream] interface for files.

    This provides a simple way to play back video files with GTK.

    GTK provides a GIO extension point for [GtkMediaFile] implementations to
    allow for external implementations using various media frameworks.

    GTK itself includes an implementation using GStreamer. *)

(** {1:constructors Constructors} *)

val new_ : unit -> media_file_t
(** Creates a new empty media file. *)

val new_for_file : Ocgio.File.file_t -> media_file_t
(** Creates a new media file to play [file]. *)

val new_for_filename : string -> media_file_t
(** Creates a new media file for the given filename.

    This is a utility function that converts the given [filename] to a [GFile]
    and calls [Gtk.MediaFile.new_for_file]. *)

val new_for_input_stream : Ocgio.Input_stream.input_stream_t -> media_file_t
(** Creates a new media file to play [stream].

    If you want the resulting media to be seekable, the stream should implement
    the [GSeekable] interface. *)

val new_for_resource : string -> media_file_t
(** Creates a new new media file for the given resource.

    This is a utility function that converts the given [resource] to a [GFile]
    and calls [Gtk.MediaFile.new_for_file]. *)
