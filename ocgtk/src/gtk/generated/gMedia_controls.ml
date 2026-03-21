class type media_controls_t = object
    method get_media_stream : unit -> GMedia_stream.media_stream_t option
    method set_media_stream : GMedia_stream.media_stream_t option -> unit
    method as_media_controls : Media_controls.t
end

(* High-level class for MediaControls *)
class media_controls (obj : Media_controls.t) : media_controls_t = object (self)

  method get_media_stream : unit -> GMedia_stream.media_stream_t option =
    fun () ->
      Option.map (fun ret -> new GMedia_stream.media_stream ret) (Media_controls.get_media_stream obj)

  method set_media_stream : GMedia_stream.media_stream_t option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_media_stream) stream in
      (Media_controls.set_media_stream obj stream)

    method as_media_controls = obj
end

