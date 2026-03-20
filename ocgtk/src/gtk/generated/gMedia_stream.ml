class type media_stream_t = object
    method get_ended : unit -> bool
    method get_loop : unit -> bool
    method get_muted : unit -> bool
    method get_playing : unit -> bool
    method get_volume : unit -> float
    method has_audio : unit -> bool
    method has_video : unit -> bool
    method is_prepared : unit -> bool
    method is_seekable : unit -> bool
    method is_seeking : unit -> bool
    method pause : unit -> unit
    method play : unit -> unit
    method realize : Ocgtk_gdk.Gdk.surface_t -> unit
    method seek_failed : unit -> unit
    method seek_success : unit -> unit
    method set_loop : bool -> unit
    method set_muted : bool -> unit
    method set_playing : bool -> unit
    method set_volume : float -> unit
    method stream_ended : unit -> unit
    method stream_unprepared : unit -> unit
    method unrealize : Ocgtk_gdk.Gdk.surface_t -> unit
    method prepared : bool
    method set_prepared : bool -> unit
    method seekable : bool
    method seeking : bool
    method as_media_stream : Media_stream.t
end

(* High-level class for MediaStream *)
class media_stream (obj : Media_stream.t) : media_stream_t = object (self)

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

  method realize : Ocgtk_gdk.Gdk.surface_t -> unit =
    fun surface ->
      let surface = surface#as_surface in
      (Media_stream.realize obj surface)

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

  method unrealize : Ocgtk_gdk.Gdk.surface_t -> unit =
    fun surface ->
      let surface = surface#as_surface in
      (Media_stream.unrealize obj surface)

  method prepared = Media_stream.get_prepared obj
  method set_prepared v =  Media_stream.set_prepared obj v

  method seekable = Media_stream.get_seekable obj

  method seeking = Media_stream.get_seeking obj

    method as_media_stream = obj
end

