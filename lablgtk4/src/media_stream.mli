(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MediaStream *)

type t = Gtk.widget

(* Properties *)

(** Get property: ended *)
external get_ended : t -> bool = "ml_gtk_media_stream_get_ended"

(** Get property: has-audio *)
external get_has_audio : t -> bool = "ml_gtk_media_stream_get_has_audio"

(** Get property: has-video *)
external get_has_video : t -> bool = "ml_gtk_media_stream_get_has_video"

(** Get property: loop *)
external get_loop : t -> bool = "ml_gtk_media_stream_get_loop"

(** Set property: loop *)
external set_loop : t -> bool -> unit = "ml_gtk_media_stream_set_loop"

(** Get property: muted *)
external get_muted : t -> bool = "ml_gtk_media_stream_get_muted"

(** Set property: muted *)
external set_muted : t -> bool -> unit = "ml_gtk_media_stream_set_muted"

(** Get property: playing *)
external get_playing : t -> bool = "ml_gtk_media_stream_get_playing"

(** Set property: playing *)
external set_playing : t -> bool -> unit = "ml_gtk_media_stream_set_playing"

(** Get property: prepared *)
external get_prepared : t -> bool = "ml_gtk_media_stream_get_prepared"

(** Set property: prepared *)
external set_prepared : t -> bool -> unit = "ml_gtk_media_stream_set_prepared"

(** Get property: seekable *)
external get_seekable : t -> bool = "ml_gtk_media_stream_get_seekable"

(** Get property: seeking *)
external get_seeking : t -> bool = "ml_gtk_media_stream_get_seeking"

(** Get property: volume *)
external get_volume : t -> float = "ml_gtk_media_stream_get_volume"

(** Set property: volume *)
external set_volume : t -> float -> unit = "ml_gtk_media_stream_set_volume"

external unprepared : t -> unit = "ml_gtk_media_stream_unprepared"

external stream_unprepared : t -> unit = "ml_gtk_media_stream_stream_unprepared"

external stream_ended : t -> unit = "ml_gtk_media_stream_stream_ended"

external seek_success : t -> unit = "ml_gtk_media_stream_seek_success"

external seek_failed : t -> unit = "ml_gtk_media_stream_seek_failed"

external play : t -> unit = "ml_gtk_media_stream_play"

external pause : t -> unit = "ml_gtk_media_stream_pause"

external is_seeking : t -> bool = "ml_gtk_media_stream_is_seeking"

external is_seekable : t -> bool = "ml_gtk_media_stream_is_seekable"

external is_prepared : t -> bool = "ml_gtk_media_stream_is_prepared"

external has_video : t -> bool = "ml_gtk_media_stream_has_video"

external has_audio : t -> bool = "ml_gtk_media_stream_has_audio"

external ended : t -> unit = "ml_gtk_media_stream_ended"

