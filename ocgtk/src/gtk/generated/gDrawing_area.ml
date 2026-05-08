class type drawing_area_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_resize :
    callback:(width:int -> height:int -> unit) -> Gobject.Signal.handler_id

  method get_content_height : unit -> int
  method get_content_width : unit -> int
  method set_content_height : int -> unit
  method set_content_width : int -> unit
  method as_drawing_area : Drawing_area.t
end

(* High-level class for DrawingArea *)
class drawing_area (obj : Drawing_area.t) : drawing_area_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method on_resize ~callback =
      Drawing_area.on_resize self#as_drawing_area ~callback

    method get_content_height : unit -> int =
      fun () -> Drawing_area.get_content_height obj

    method get_content_width : unit -> int =
      fun () -> Drawing_area.get_content_width obj

    method set_content_height : int -> unit =
      fun height -> Drawing_area.set_content_height obj height

    method set_content_width : int -> unit =
      fun width -> Drawing_area.set_content_width obj width

    method as_drawing_area = obj
  end

let new_ () : drawing_area_t = new drawing_area (Drawing_area.new_ ())
