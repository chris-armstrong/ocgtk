(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MediaControls *)

type t = [`media_controls | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new MediaControls *)
external new_ : Media_stream.t option -> t = "ml_gtk_media_controls_new"

(* Methods *)
(** Sets the stream that is controlled by @controls. *)
external set_media_stream : t -> Media_stream.t option -> unit = "ml_gtk_media_controls_set_media_stream"

(** Gets the media stream managed by @controls or %NULL if none. *)
external get_media_stream : t -> Media_stream.t option = "ml_gtk_media_controls_get_media_stream"

(* Properties *)

