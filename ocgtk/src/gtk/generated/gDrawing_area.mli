class type drawing_area_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gdrawing_area_signals.drawing_area_signals
    method get_content_height : unit -> int
    method get_content_width : unit -> int
    method set_content_height : int -> unit
    method set_content_width : int -> unit
    method as_drawing_area : Drawing_area.t
end

class drawing_area : Drawing_area.t -> drawing_area_t

val new_ : unit -> drawing_area_t
