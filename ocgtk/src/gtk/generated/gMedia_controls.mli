class type media_controls_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_media_stream : unit -> GMedia_stream.media_stream_t option
    method set_media_stream : GMedia_stream.media_stream_t option -> unit
    method as_media_controls : Media_controls.t
end

class media_controls : Media_controls.t -> media_controls_t

val new_ : GMedia_stream.media_stream_t option -> media_controls_t
