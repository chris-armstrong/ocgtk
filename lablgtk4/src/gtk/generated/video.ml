(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Video *)

type t = [`video | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Video *)
external new_ : unit -> t = "ml_gtk_video_new"

(** Create a new Video *)
external new_for_file : unit -> t = "ml_gtk_video_new_for_file"

(** Create a new Video *)
external new_for_filename : unit -> t = "ml_gtk_video_new_for_filename"

(** Create a new Video *)
external new_for_media_stream : Media_stream.t option -> t = "ml_gtk_video_new_for_media_stream"

(** Create a new Video *)
external new_for_resource : string option -> t = "ml_gtk_video_new_for_resource"

(* Methods *)
(** Makes @self play the resource at the given @resource_path.

This is a utility function that calls [method@Gtk.Video.set_file]. *)
external set_resource : t -> string option -> unit = "ml_gtk_video_set_resource"

(** Sets the media stream to be played back.

@self will take full control of managing the media stream. If you
want to manage a media stream yourself, consider using a
[class@Gtk.Picture] for display.

If you want to display a file, consider using [method@Gtk.Video.set_file]
instead. *)
external set_media_stream : t -> Media_stream.t option -> unit = "ml_gtk_video_set_media_stream"

(** Sets whether new files loaded by @self should be set to loop. *)
external set_loop : t -> bool -> unit = "ml_gtk_video_set_loop"

(** Sets whether to enable graphics offload.

See [class@Gtk.GraphicsOffload] for more information on graphics offload. *)
external set_graphics_offload : t -> Gtk_enums.graphicsoffloadenabled -> unit = "ml_gtk_video_set_graphics_offload"

(** Sets whether @self automatically starts playback when it
becomes visible or when a new file gets loaded. *)
external set_autoplay : t -> bool -> unit = "ml_gtk_video_set_autoplay"

(** Gets the media stream managed by @self or %NULL if none. *)
external get_media_stream : t -> Media_stream.t option = "ml_gtk_video_get_media_stream"

(** Returns %TRUE if videos have been set to loop. *)
external get_loop : t -> bool = "ml_gtk_video_get_loop"

(** Returns whether graphics offload is enabled.

See [class@Gtk.GraphicsOffload] for more information on graphics offload. *)
external get_graphics_offload : t -> Gtk_enums.graphicsoffloadenabled = "ml_gtk_video_get_graphics_offload"

(** Returns %TRUE if videos have been set to loop. *)
external get_autoplay : t -> bool = "ml_gtk_video_get_autoplay"

(* Properties *)

