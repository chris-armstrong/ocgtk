(* GENERATED CODE - DO NOT EDIT *)
(* MediaFile: MediaFile *)

type t = [`media_file | `media_stream | `object_] Gobject.obj

(** Create a new MediaFile *)
external new_ : unit -> t = "ml_gtk_media_file_new"

(** Create a new MediaFile *)
external new_for_file : unit -> t = "ml_gtk_media_file_new_for_file"

(** Create a new MediaFile *)
external new_for_filename : string -> t = "ml_gtk_media_file_new_for_filename"

(** Create a new MediaFile *)
external new_for_input_stream : unit -> t = "ml_gtk_media_file_new_for_input_stream"

(** Create a new MediaFile *)
external new_for_resource : string -> t = "ml_gtk_media_file_new_for_resource"

(* Methods *)
(** Sets the `GtkMediaFile to play the given resource.

This is a utility function that converts the given @resource_path
to a `GFile` and calls [method@Gtk.MediaFile.set_file]. *)
external set_resource : t -> string option -> unit = "ml_gtk_media_file_set_resource"

(** Sets the `GtkMediaFile to play the given file.

This is a utility function that converts the given @filename
to a `GFile` and calls [method@Gtk.MediaFile.set_file]. *)
external set_filename : t -> string option -> unit = "ml_gtk_media_file_set_filename"

(** Resets the media file to be empty. *)
external clear : t -> unit = "ml_gtk_media_file_clear"

(* Properties *)

