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

(* High-level class for MediaStream *)
class media_stream (obj : Raw.Media_stream.t) : media_stream_t =
  object (self)
    inherit Ocgdk.Paintable.paintable (Ocgdk.Raw.Paintable.from_gobject obj)

    method gerror : GError.t -> unit =
      fun error -> Raw.Media_stream.gerror obj error

    method get_duration : unit -> int64 =
      fun () -> Raw.Media_stream.get_duration obj

    method get_ended : unit -> bool = fun () -> Raw.Media_stream.get_ended obj

    method get_error : unit -> GError.t option =
      fun () -> Raw.Media_stream.get_error obj

    method get_loop : unit -> bool = fun () -> Raw.Media_stream.get_loop obj
    method get_muted : unit -> bool = fun () -> Raw.Media_stream.get_muted obj

    method get_playing : unit -> bool =
      fun () -> Raw.Media_stream.get_playing obj

    method get_timestamp : unit -> int64 =
      fun () -> Raw.Media_stream.get_timestamp obj

    method get_volume : unit -> float =
      fun () -> Raw.Media_stream.get_volume obj

    method has_audio : unit -> bool = fun () -> Raw.Media_stream.has_audio obj
    method has_video : unit -> bool = fun () -> Raw.Media_stream.has_video obj

    method is_prepared : unit -> bool =
      fun () -> Raw.Media_stream.is_prepared obj

    method is_seekable : unit -> bool =
      fun () -> Raw.Media_stream.is_seekable obj

    method is_seeking : unit -> bool = fun () -> Raw.Media_stream.is_seeking obj
    method pause : unit -> unit = fun () -> Raw.Media_stream.pause obj
    method play : unit -> unit = fun () -> Raw.Media_stream.play obj

    method realize : Ocgdk.Surface.surface_t -> unit =
      fun surface ->
        let surface = surface#as_surface in
        Raw.Media_stream.realize obj surface

    method seek : int64 -> unit =
      fun timestamp -> Raw.Media_stream.seek obj timestamp

    method seek_failed : unit -> unit =
      fun () -> Raw.Media_stream.seek_failed obj

    method seek_success : unit -> unit =
      fun () -> Raw.Media_stream.seek_success obj

    method set_loop : bool -> unit =
      fun loop -> Raw.Media_stream.set_loop obj loop

    method set_muted : bool -> unit =
      fun muted -> Raw.Media_stream.set_muted obj muted

    method set_playing : bool -> unit =
      fun playing -> Raw.Media_stream.set_playing obj playing

    method set_volume : float -> unit =
      fun volume -> Raw.Media_stream.set_volume obj volume

    method stream_ended : unit -> unit =
      fun () -> Raw.Media_stream.stream_ended obj

    method stream_prepared : bool -> bool -> bool -> int64 -> unit =
      fun has_audio has_video seekable duration ->
        Raw.Media_stream.stream_prepared obj has_audio has_video seekable
          duration

    method stream_unprepared : unit -> unit =
      fun () -> Raw.Media_stream.stream_unprepared obj

    method unrealize : Ocgdk.Surface.surface_t -> unit =
      fun surface ->
        let surface = surface#as_surface in
        Raw.Media_stream.unrealize obj surface

    method update : int64 -> unit =
      fun timestamp -> Raw.Media_stream.update obj timestamp

    method as_media_stream = obj
  end
