class type drawing_area_t = object
    inherit Gdrawing_area_signals.drawing_area_signals
    method get_content_height : unit -> int
    method get_content_width : unit -> int
    method set_content_height : int -> unit
    method set_content_width : int -> unit
    method as_drawing_area : Drawing_area.t
end

class drawing_area : Drawing_area.t -> drawing_area_t

