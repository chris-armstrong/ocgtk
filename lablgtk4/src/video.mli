(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Video *)

type t = Gtk.widget

(** Create a new Video *)
external new_ : unit -> t = "ml_gtk_video_new"

(** Create a new Video *)
external new_for_file : unit -> t = "ml_gtk_video_new_for_file"

(** Create a new Video *)
external new_for_filename : string option -> t = "ml_gtk_video_new_for_filename"

(** Create a new Video *)
external new_for_media_stream : Gtk.widget option -> t = "ml_gtk_video_new_for_media_stream"

(** Create a new Video *)
external new_for_resource : string option -> t = "ml_gtk_video_new_for_resource"

(* Properties *)

(** Get property: autoplay *)
external get_autoplay : t -> bool = "ml_gtk_video_get_autoplay"

(** Set property: autoplay *)
external set_autoplay : t -> bool -> unit = "ml_gtk_video_set_autoplay"

(** Get property: loop *)
external get_loop : t -> bool = "ml_gtk_video_get_loop"

(** Set property: loop *)
external set_loop : t -> bool -> unit = "ml_gtk_video_set_loop"

external set_resource : t -> string option -> unit = "ml_gtk_video_set_resource"

external set_media_stream : t -> Gtk.widget option -> unit = "ml_gtk_video_set_media_stream"

external set_graphics_offload : t -> Gtk_enums.graphicsoffloadenabled -> unit = "ml_gtk_video_set_graphics_offload"

external set_filename : t -> string option -> unit = "ml_gtk_video_set_filename"

external get_media_stream : t -> Gtk.widget = "ml_gtk_video_get_media_stream"

external get_graphics_offload : t -> Gtk_enums.graphicsoffloadenabled = "ml_gtk_video_get_graphics_offload"

