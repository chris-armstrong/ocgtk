class type media_controls_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_media_stream : unit -> GMedia_stream.media_stream_t option
    method set_media_stream : GMedia_stream.media_stream_t option -> unit
    method as_media_controls : Media_controls.t
end

(* High-level class for MediaControls *)
class media_controls (obj : Media_controls.t) : media_controls_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_media_stream : unit -> GMedia_stream.media_stream_t option =
    fun () ->
      Option.map (fun ret -> new GMedia_stream.media_stream ret) (Media_controls.get_media_stream obj)

  method set_media_stream : GMedia_stream.media_stream_t option -> unit =
    fun stream ->
      let stream = Option.map (fun (c) -> c#as_media_stream) stream in
      (Media_controls.set_media_stream obj stream)

    method as_media_controls = obj
end

let new_ (stream : GMedia_stream.media_stream_t option) : media_controls_t =
  let stream = Option.map (fun c -> c#as_media_stream) stream in
  new media_controls (Media_controls.new_ stream)

