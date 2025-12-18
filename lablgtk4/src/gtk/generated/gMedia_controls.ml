(* High-level class for MediaControls *)
class media_controls (obj : Media_controls.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Media_controls.as_widget obj)

  method get_media_stream : unit -> GMedia_stream.media_stream option = fun () -> Option.map (fun ret -> new GMedia_stream.media_stream ret) (Media_controls.get_media_stream obj )

  method set_media_stream : 'p1. (#GMedia_stream.media_stream as 'p1) option -> unit = fun stream -> (Media_controls.set_media_stream obj ( stream |> Option.map (fun x -> x#as_media_stream) ))

  method as_widget = (Media_controls.as_widget obj)
    method as_media_controls = obj
end

