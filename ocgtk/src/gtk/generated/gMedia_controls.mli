class media_controls : Media_controls.t ->
  object
    method get_media_stream : unit -> GMedia_stream.media_stream option
    method set_media_stream : #GMedia_stream.media_stream option -> unit
    method as_media_controls : Media_controls.t
  end

