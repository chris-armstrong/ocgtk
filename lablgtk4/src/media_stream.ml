(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MediaStream *)

type t = Gtk.widget

(* Properties *)

external get_ended : t -> bool = "ml_gtk_media_stream_get_ended"

external get_has_audio : t -> bool = "ml_gtk_media_stream_get_has_audio"

external get_has_video : t -> bool = "ml_gtk_media_stream_get_has_video"

external get_loop : t -> bool = "ml_gtk_media_stream_get_loop"

external set_loop : t -> bool -> unit = "ml_gtk_media_stream_set_loop"

external get_muted : t -> bool = "ml_gtk_media_stream_get_muted"

external set_muted : t -> bool -> unit = "ml_gtk_media_stream_set_muted"

external get_playing : t -> bool = "ml_gtk_media_stream_get_playing"

external set_playing : t -> bool -> unit = "ml_gtk_media_stream_set_playing"

external get_prepared : t -> bool = "ml_gtk_media_stream_get_prepared"

external set_prepared : t -> bool -> unit = "ml_gtk_media_stream_set_prepared"

external get_seekable : t -> bool = "ml_gtk_media_stream_get_seekable"

external get_seeking : t -> bool = "ml_gtk_media_stream_get_seeking"

external get_volume : t -> float = "ml_gtk_media_stream_get_volume"

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

