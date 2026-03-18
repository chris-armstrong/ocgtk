(* High-level class for MediaControls *)
class media_controls (obj : Media_controls.t) = object (self)

  method get_media_stream : unit -> GMedia_stream.media_stream option =
    fun () ->
      Option.map (fun ret -> new GMedia_stream.media_stream ret) (Media_controls.get_media_stream obj)

  method set_media_stream : 'p1. (#GMedia_stream.media_stream as 'p1) option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_media_stream) stream in
      (Media_controls.set_media_stream obj stream)

    method as_media_controls = obj
end

