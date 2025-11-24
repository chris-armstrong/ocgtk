(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MediaFile *)

type t = Gtk.Widget.t

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

(* Properties *)

external set_resource : t -> string option -> unit = "ml_gtk_media_file_set_resource"

external set_filename : t -> string option -> unit = "ml_gtk_media_file_set_filename"

external clear : t -> unit = "ml_gtk_media_file_clear"

