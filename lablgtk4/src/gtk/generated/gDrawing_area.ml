(* Signal class defined in gdrawing_area_signals.ml *)

(* High-level class for DrawingArea *)
class drawing_area (obj : Drawing_area.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Drawing_area.as_widget obj)
  inherit Gdrawing_area_signals.drawing_area_signals obj

  method get_content_height : unit -> int = fun () -> (Drawing_area.get_content_height obj )

  method get_content_width : unit -> int = fun () -> (Drawing_area.get_content_width obj )

  method set_content_height : int -> unit = fun height -> (Drawing_area.set_content_height obj height)

  method set_content_width : int -> unit = fun width -> (Drawing_area.set_content_width obj width)

  method as_widget = (Drawing_area.as_widget obj)
    method as_drawing_area = obj
end

