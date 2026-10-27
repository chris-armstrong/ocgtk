(** The integration point for media playback inside GTK.

    GTK provides an implementation of the [GtkMediaStream] interface that is
    called [Gtk.MediaFile].

    Apart from application-facing API for stream playback, [GtkMediaStream] has
    a number of APIs that are only useful for implementations and should not be
    used in applications: [Gtk.MediaStream.prepared],
    [Gtk.MediaStream.unprepared], [Gtk.MediaStream.update],
    [Gtk.MediaStream.ended], [Gtk.MediaStream.seek_success],
    [Gtk.MediaStream.seek_failed], [Gtk.MediaStream.gerror],
    [Gtk.MediaStream.error], [Gtk.MediaStream.error_valist].

    Its methods, signals and properties are on {!class-type-media_stream_t}. The
    functions it is built on are in {!Ocgtk.Raw.Media_stream}. *)

(** The methods, signals and properties of a [GtkMediaStream]. *)
class type media_stream_t = object
  inherit Ocgdk.Paintable.paintable_t
  method gerror : GError.t -> unit
  method get_duration : unit -> int64
  method get_ended : unit -> bool
  method get_error : unit -> GError.t option
  method get_loop : unit -> bool
  method get_muted : unit -> bool
  method get_playing : unit -> bool
  method get_timestamp : unit -> int64
  method get_volume : unit -> float
  method has_audio : unit -> bool
  method has_video : unit -> bool
  method is_prepared : unit -> bool
  method is_seekable : unit -> bool
  method is_seeking : unit -> bool
  method pause : unit -> unit
  method play : unit -> unit
  method realize : Ocgdk.Surface.surface_t -> unit
  method seek : int64 -> unit
  method seek_failed : unit -> unit
  method seek_success : unit -> unit
  method set_loop : bool -> unit
  method set_muted : bool -> unit
  method set_playing : bool -> unit
  method set_volume : float -> unit
  method stream_ended : unit -> unit
  method stream_prepared : bool -> bool -> bool -> int64 -> unit
  method stream_unprepared : unit -> unit
  method unrealize : Ocgdk.Surface.surface_t -> unit
  method update : int64 -> unit
  method as_media_stream : Raw.Media_stream.t
end

class media_stream : Raw.Media_stream.t -> media_stream_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Media_stream.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkMediaStream], give one already wrapped. *)
