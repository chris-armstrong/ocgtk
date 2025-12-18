class media_stream : Media_stream.t ->
  object
    method ended : bool
    method has_audio : bool
    method has_video : bool
    method loop : bool
    method set_loop : bool -> unit
    method muted : bool
    method set_muted : bool -> unit
    method playing : bool
    method set_playing : bool -> unit
    method prepared : bool
    method set_prepared : bool -> unit
    method seekable : bool
    method seeking : bool
    method volume : float
    method set_volume : float -> unit
    method is_prepared : unit -> bool
    method is_seekable : unit -> bool
    method is_seeking : unit -> bool
    method pause : unit -> unit
    method play : unit -> unit
    method seek_failed : unit -> unit
    method seek_success : unit -> unit
    method stream_ended : unit -> unit
    method stream_unprepared : unit -> unit
    method unprepared : unit -> unit
    method as_media_stream : Media_stream.t
  end

