(* GENERATED CODE - DO NOT EDIT *)
(* MediaFile: MediaFile *)

(** Implements the [GtkMediaStream] interface for files.

    This provides a simple way to play back video files with GTK.

    GTK provides a GIO extension point for [GtkMediaFile] implementations to
    allow for external implementations using various media frameworks.

    GTK itself includes an implementation using GStreamer.

    The class built on this module is in {!Ocgtk.Media_file}. *)

type t = [ `media_file | `media_stream | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_media_file_get_type"

external new_ : unit -> t = "ml_gtk_media_file_new"
(** Creates a new empty media file. *)

external new_for_file : Ocgio_raw.File.t -> t = "ml_gtk_media_file_new_for_file"
(** Creates a new media file to play [file]. *)

external new_for_filename : string -> t = "ml_gtk_media_file_new_for_filename"
(** Creates a new media file for the given filename.

    This is a utility function that converts the given [filename] to a [GFile]
    and calls [Gtk.MediaFile.new_for_file]. *)

external new_for_input_stream : Ocgio_raw.Input_stream.t -> t
  = "ml_gtk_media_file_new_for_input_stream"
(** Creates a new media file to play [stream].

    If you want the resulting media to be seekable, the stream should implement
    the [GSeekable] interface. *)

external new_for_resource : string -> t = "ml_gtk_media_file_new_for_resource"
(** Creates a new new media file for the given resource.

    This is a utility function that converts the given [resource] to a [GFile]
    and calls [Gtk.MediaFile.new_for_file]. *)

(* Methods *)

external set_resource : t -> string option -> unit
  = "ml_gtk_media_file_set_resource"
(** Sets the [GtkMediaFile] to play the given resource.

    This is a utility function that converts the given [resource_path] to a
    [GFile] and calls [Gtk.MediaFile.set_file]. *)

external set_input_stream : t -> Ocgio_raw.Input_stream.t option -> unit
  = "ml_gtk_media_file_set_input_stream"
(** Sets the [GtkMediaFile] to play the given stream.

    If anything is still playing, stop playing it.

    Full control about the [stream] is assumed for the duration of playback. The
    stream will not be closed. *)

external set_filename : t -> string option -> unit
  = "ml_gtk_media_file_set_filename"
(** Sets the [GtkMediaFile] to play the given file.

    This is a utility function that converts the given [filename] to a [GFile]
    and calls [Gtk.MediaFile.set_file]. *)

external set_file : t -> Ocgio_raw.File.t option -> unit
  = "ml_gtk_media_file_set_file"
(** Sets the [GtkMediaFile] to play the given file.

    If any file is still playing, stop playing it. *)

external get_input_stream : t -> Ocgio_raw.Input_stream.t option
  = "ml_gtk_media_file_get_input_stream"
(** Returns the stream that [self] is currently playing from.

    When [self] is not playing or not playing from a stream, [None] is returned.
*)

external get_file : t -> Ocgio_raw.File.t option = "ml_gtk_media_file_get_file"
(** Returns the file that [self] is currently playing from.

    When [self] is not playing or not playing from a file, [None] is returned.
*)

external clear : t -> unit = "ml_gtk_media_file_clear"
(** Resets the media file to be empty. *)

(* Properties *)
