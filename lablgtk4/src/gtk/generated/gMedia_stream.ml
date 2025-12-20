(* High-level class for MediaStream *)
class media_stream (obj : Media_stream.t) = object (self)

  method ended : unit -> unit =
    fun () ->
      (Media_stream.ended obj)

  method get_ended : unit -> bool =
    fun () ->
      (Media_stream.get_ended obj)

  method get_loop : unit -> bool =
    fun () ->
      (Media_stream.get_loop obj)

  method get_muted : unit -> bool =
    fun () ->
      (Media_stream.get_muted obj)

  method get_playing : unit -> bool =
    fun () ->
      (Media_stream.get_playing obj)

  method get_volume : unit -> float =
    fun () ->
      (Media_stream.get_volume obj)

  method has_audio : unit -> bool =
    fun () ->
      (Media_stream.has_audio obj)

  method has_video : unit -> bool =
    fun () ->
      (Media_stream.has_video obj)

  method is_prepared : unit -> bool =
    fun () ->
      (Media_stream.is_prepared obj)

  method is_seekable : unit -> bool =
    fun () ->
      (Media_stream.is_seekable obj)

  method is_seeking : unit -> bool =
    fun () ->
      (Media_stream.is_seeking obj)

  method pause : unit -> unit =
    fun () ->
      (Media_stream.pause obj)

  method play : unit -> unit =
    fun () ->
      (Media_stream.play obj)

  method seek_failed : unit -> unit =
    fun () ->
      (Media_stream.seek_failed obj)

  method seek_success : unit -> unit =
    fun () ->
      (Media_stream.seek_success obj)

  method set_loop : bool -> unit =
    fun loop ->
      (Media_stream.set_loop obj loop)

  method set_muted : bool -> unit =
    fun muted ->
      (Media_stream.set_muted obj muted)

  method set_playing : bool -> unit =
    fun playing ->
      (Media_stream.set_playing obj playing)

  method set_volume : float -> unit =
    fun volume ->
      (Media_stream.set_volume obj volume)

  method stream_ended : unit -> unit =
    fun () ->
      (Media_stream.stream_ended obj)

  method stream_unprepared : unit -> unit =
    fun () ->
      (Media_stream.stream_unprepared obj)

  method unprepared : unit -> unit =
    fun () ->
      (Media_stream.unprepared obj)

  method prepared = Media_stream.get_prepared obj
  method set_prepared v =  Media_stream.set_prepared obj v

  method seekable = Media_stream.get_seekable obj

  method seeking = Media_stream.get_seeking obj

    method as_media_stream = obj
end

