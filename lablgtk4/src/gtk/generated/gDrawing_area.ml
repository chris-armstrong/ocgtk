(* Signal class defined in gdrawing_area_signals.ml *)

(* High-level class for DrawingArea *)
class drawing_area (obj : Drawing_area.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Drawing_area.as_widget obj)
  inherit Gdrawing_area_signals.drawing_area_signals obj

  method content_height = Drawing_area.get_content_height obj
  method set_content_height v = Drawing_area.set_content_height obj v

  method content_width = Drawing_area.get_content_width obj
  method set_content_width v = Drawing_area.set_content_width obj v

  method as_widget = (Drawing_area.as_widget obj)
    method as_drawing_area = obj
end

