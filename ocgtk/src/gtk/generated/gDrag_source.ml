class type drag_source_t = object
    inherit GGesture_single.gesture_single_t
    method on_drag_begin : ?after:bool -> callback:(drag:Ocgtk_gdk.Gdk.Drag.drag_t -> unit) -> unit -> Gobject.Signal.handler_id
    method on_drag_cancel : ?after:bool -> callback:(drag:Ocgtk_gdk.Gdk.Drag.drag_t -> reason:Ocgtk_gdk.Gdk_enums.dragcancelreason -> bool) -> unit -> Gobject.Signal.handler_id
    method on_drag_end : ?after:bool -> callback:(drag:Ocgtk_gdk.Gdk.Drag.drag_t -> delete_data:bool -> unit) -> unit -> Gobject.Signal.handler_id
    method on_prepare : ?after:bool -> callback:(x:float -> y:float -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t option) -> unit -> Gobject.Signal.handler_id
    method drag_cancel : unit -> unit
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_content : unit -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t option
    method get_drag : unit -> Ocgtk_gdk.Gdk.Drag.drag_t option
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_content : Ocgtk_gdk.Gdk.Content_provider.content_provider_t option -> unit
    method set_icon : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> int -> int -> unit
    method as_drag_source : Drag_source.t
end

(* High-level class for DragSource *)
class drag_source (obj : Drag_source.t) : drag_source_t = object (self)
  inherit GGesture_single.gesture_single (obj :> Gesture_single.t)
  method on_drag_begin ?(after = false) ~callback () =
    Drag_source.on_drag_begin ~after self#as_drag_source
      ~callback:(fun ~drag -> callback ~drag:(new Ocgtk_gdk.Gdk.Drag.drag drag))

  method on_drag_cancel ?(after = false) ~callback () =
    Drag_source.on_drag_cancel ~after self#as_drag_source
      ~callback:(fun ~drag ~reason -> callback ~drag:(new Ocgtk_gdk.Gdk.Drag.drag drag) ~reason)

  method on_drag_end ?(after = false) ~callback () =
    Drag_source.on_drag_end ~after self#as_drag_source
      ~callback:(fun ~drag ~delete_data -> callback ~drag:(new Ocgtk_gdk.Gdk.Drag.drag drag) ~delete_data)

  method on_prepare ?(after = false) ~callback () =
    Drag_source.on_prepare ~after self#as_drag_source
      ~callback:(fun ~x ~y -> (Option.map (fun w -> w#as_content_provider) (callback ~x ~y)))


  method drag_cancel : unit -> unit =
    fun () ->
      (Drag_source.drag_cancel obj)

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drag_source.get_actions obj)

  method get_content : unit -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Content_provider.content_provider ret) (Drag_source.get_content obj)

  method get_drag : unit -> Ocgtk_gdk.Gdk.Drag.drag_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Drag.drag ret) (Drag_source.get_drag obj)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drag_source.set_actions obj actions)

  method set_content : Ocgtk_gdk.Gdk.Content_provider.content_provider_t option -> unit =
    fun content ->
      let content = Option.map (fun (c) -> c#as_content_provider) content in
      (Drag_source.set_content obj content)

  method set_icon : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> int -> int -> unit =
    fun paintable hot_x hot_y ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Drag_source.set_icon obj paintable hot_x hot_y)

    method as_drag_source = obj
end

let new_ () : drag_source_t =
  new drag_source (Drag_source.new_ ())

