(* High-level class for MediaStream *)
class media_stream (obj : Media_stream.t) = object (self)

  method ended = Media_stream.get_ended obj

  method has_audio = Media_stream.get_has_audio obj

  method has_video = Media_stream.get_has_video obj

  method loop = Media_stream.get_loop obj
  method set_loop v = Media_stream.set_loop obj v

  method muted = Media_stream.get_muted obj
  method set_muted v = Media_stream.set_muted obj v

  method playing = Media_stream.get_playing obj
  method set_playing v = Media_stream.set_playing obj v

  method prepared = Media_stream.get_prepared obj
  method set_prepared v = Media_stream.set_prepared obj v

  method seekable = Media_stream.get_seekable obj

  method seeking = Media_stream.get_seeking obj

  method volume = Media_stream.get_volume obj
  method set_volume v = Media_stream.set_volume obj v

  method is_prepared : unit -> bool = fun () -> (Media_stream.is_prepared obj )

  method is_seekable : unit -> bool = fun () -> (Media_stream.is_seekable obj )

  method is_seeking : unit -> bool = fun () -> (Media_stream.is_seeking obj )

  method pause : unit -> unit = fun () -> (Media_stream.pause obj )

  method play : unit -> unit = fun () -> (Media_stream.play obj )

  method seek_failed : unit -> unit = fun () -> (Media_stream.seek_failed obj )

  method seek_success : unit -> unit = fun () -> (Media_stream.seek_success obj )

  method stream_ended : unit -> unit = fun () -> (Media_stream.stream_ended obj )

  method stream_unprepared : unit -> unit = fun () -> (Media_stream.stream_unprepared obj )

  method unprepared : unit -> unit = fun () -> (Media_stream.unprepared obj )

    method as_media_stream = obj
end

