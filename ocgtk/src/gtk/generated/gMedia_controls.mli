class type media_controls_t = object
    method get_media_stream : unit -> GMedia_stream.media_stream_t option
    method set_media_stream : GMedia_stream.media_stream_t option -> unit
    method as_media_controls : Media_controls.t
end

class media_controls : Media_controls.t -> media_controls_t

