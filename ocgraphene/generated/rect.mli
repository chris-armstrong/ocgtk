class type rect_t = object
  method contains_point : Raw.Point.t -> bool
  method contains_rect : Raw.Rect.t -> bool
  method equal : Raw.Rect.t -> bool
  method get_area : unit -> float
  method get_height : unit -> float
  method get_width : unit -> float
  method get_x : unit -> float
  method get_y : unit -> float
  method init : float -> float -> float -> float -> Raw.Rect.t
  method init_from_rect : Raw.Rect.t -> Raw.Rect.t
  method inset : float -> float -> Raw.Rect.t
  method normalize : unit -> Raw.Rect.t
  method offset : float -> float -> Raw.Rect.t
  method round_to_pixel : unit -> Raw.Rect.t
  method as_rect : Raw.Rect.t
end

class rect : Raw.Rect.t -> rect_t
