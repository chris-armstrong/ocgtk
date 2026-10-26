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

(* High-level class for DragSource *)
class drag_source (obj : Raw.Drag_source.t) : drag_source_t =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_drag_begin ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_begin ~after self#as_drag_source
        ~callback:(fun ~drag -> callback ~drag:(new Ocgdk.Drag.drag drag))

    method on_drag_cancel ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_cancel ~after self#as_drag_source
        ~callback:(fun ~drag ~reason ->
          callback ~drag:(new Ocgdk.Drag.drag drag) ~reason)

    method on_drag_end ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_end ~after self#as_drag_source
        ~callback:(fun ~drag ~delete_data ->
          callback ~drag:(new Ocgdk.Drag.drag drag) ~delete_data)

    method on_prepare ?(after = false) ~callback () =
      Raw.Drag_source.on_prepare ~after self#as_drag_source
        ~callback:(fun ~x ~y ->
          Option.map (fun w -> w#as_content_provider) (callback ~x ~y))

    method drag_cancel : unit -> unit =
      fun () -> Raw.Drag_source.drag_cancel obj

    method get_actions : unit -> Ocgdk.Enums.dragaction =
      fun () -> Raw.Drag_source.get_actions obj

    method get_content :
        unit -> Ocgdk.Content_provider.content_provider_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Content_provider.content_provider ret)
          (Raw.Drag_source.get_content obj)

    method get_drag : unit -> Ocgdk.Drag.drag_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Drag.drag ret)
          (Raw.Drag_source.get_drag obj)

    method set_actions : Ocgdk.Enums.dragaction -> unit =
      fun actions -> Raw.Drag_source.set_actions obj actions

    method set_content :
        Ocgdk.Content_provider.content_provider_t option -> unit =
      fun content ->
        let content = Option.map (fun c -> c#as_content_provider) content in
        Raw.Drag_source.set_content obj content

    method set_icon : Ocgdk.Paintable.paintable_t option -> int -> int -> unit =
      fun paintable hot_x hot_y ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Drag_source.set_icon obj paintable hot_x hot_y

    method as_drag_source = obj
  end

let new_ () : drag_source_t = new drag_source (Raw.Drag_source.new_ ())
