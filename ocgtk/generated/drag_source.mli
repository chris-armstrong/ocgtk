class type drag_source_t = object
  inherit Gesture_single.gesture_single_t

  method on_drag_begin :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_cancel :
    ?after:bool ->
    callback:
      (drag:Ocgdk.Drag.drag_t -> reason:Ocgdk.Enums.dragcancelreason -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_end :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> delete_data:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_prepare :
    ?after:bool ->
    callback:
      (x:float -> y:float -> Ocgdk.Content_provider.content_provider_t option) ->
    unit ->
    Gobject.Signal.handler_id

  method drag_cancel : unit -> unit
  method get_actions : unit -> Ocgdk.Enums.dragaction
  method get_content : unit -> Ocgdk.Content_provider.content_provider_t option
  method get_drag : unit -> Ocgdk.Drag.drag_t option
  method set_actions : Ocgdk.Enums.dragaction -> unit
  method set_content : Ocgdk.Content_provider.content_provider_t option -> unit
  method set_icon : Ocgdk.Paintable.paintable_t option -> int -> int -> unit
  method as_drag_source : Raw.Drag_source.t
end

class drag_source : Raw.Drag_source.t -> drag_source_t

val new_ : unit -> drag_source_t
