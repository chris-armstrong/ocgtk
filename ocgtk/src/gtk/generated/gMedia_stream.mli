class type media_stream_t = object
  inherit Ocgtk_gdk.Gdk.Paintable.paintable_t
  method get_duration : unit -> int64
  method get_ended : unit -> bool
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
  method realize : Ocgtk_gdk.Gdk.Surface.surface_t -> unit
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
  method unrealize : Ocgtk_gdk.Gdk.Surface.surface_t -> unit
  method update : int64 -> unit
  method prepared : bool
  method set_prepared : bool -> unit
  method seekable : bool
  method seeking : bool
  method as_media_stream : Media_stream.t
end

class media_stream : Media_stream.t -> media_stream_t
