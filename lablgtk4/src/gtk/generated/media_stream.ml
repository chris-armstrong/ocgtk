(* GENERATED CODE - DO NOT EDIT *)
(* MediaStream: MediaStream *)

type t = [`media_stream | `object_] Gobject.obj

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

(** Same as gtk_media_stream_stream_unprepared(). *)
external unprepared : t -> unit = "ml_gtk_media_stream_unprepared"

(** Resets a given media stream implementation.

[method@Gtk.MediaStream.stream_prepared] can then be called again.

This function will also reset any error state the stream was in. *)
external stream_unprepared : t -> unit = "ml_gtk_media_stream_stream_unprepared"

(** Pauses the media stream and marks it as ended.

This is a hint only, calls to [method@Gtk.MediaStream.play]
may still happen.

The media stream must be prepared when this function is called. *)
external stream_ended : t -> unit = "ml_gtk_media_stream_stream_ended"

(** Ends a seek operation started via GtkMediaStream.seek() successfully.

This function will unset the GtkMediaStream:ended property
if it was set.

See [method@Gtk.MediaStream.seek_failed] for the other way of
ending a seek. *)
external seek_success : t -> unit = "ml_gtk_media_stream_seek_success"

(** Ends a seek operation started via GtkMediaStream.seek() as a failure.

This will not cause an error on the stream and will assume that
playback continues as if no seek had happened.

See [method@Gtk.MediaStream.seek_success] for the other way of
ending a seek. *)
external seek_failed : t -> unit = "ml_gtk_media_stream_seek_failed"

(** Starts playing the stream.

If the stream is in error or already playing, do nothing. *)
external play : t -> unit = "ml_gtk_media_stream_play"

(** Pauses playback of the stream.

If the stream is not playing, do nothing. *)
external pause : t -> unit = "ml_gtk_media_stream_pause"

(** Checks if there is currently a seek operation going on. *)
external is_seeking : t -> bool = "ml_gtk_media_stream_is_seeking"

(** Checks if a stream may be seekable.

This is meant to be a hint. Streams may not allow seeking even if
this function returns %TRUE. However, if this function returns
%FALSE, streams are guaranteed to not be seekable and user interfaces
may hide controls that allow seeking.

It is allowed to call [method@Gtk.MediaStream.seek] on a non-seekable
stream, though it will not do anything. *)
external is_seekable : t -> bool = "ml_gtk_media_stream_is_seekable"

(** Returns whether the stream has finished initializing.

At this point the existence of audio and video is known. *)
external is_prepared : t -> bool = "ml_gtk_media_stream_is_prepared"

(** Returns whether the stream has video. *)
external has_video : t -> bool = "ml_gtk_media_stream_has_video"

(** Returns whether the stream has audio. *)
external has_audio : t -> bool = "ml_gtk_media_stream_has_audio"

(** Pauses the media stream and marks it as ended.

This is a hint only, calls to [method@Gtk.MediaStream.play]
may still happen.

The media stream must be prepared when this function is called. *)
external ended : t -> unit = "ml_gtk_media_stream_ended"

