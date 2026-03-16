class rect : Rect.t ->
  object
    method contains_point : Point.t -> bool
    method contains_rect : Rect.t -> bool
    method equal : Rect.t -> bool
    method free : unit -> unit
    method get_area : unit -> float
    method get_height : unit -> float
    method get_width : unit -> float
    method get_x : unit -> float
    method get_y : unit -> float
    method init : float -> float -> float -> float -> Rect.t
    method init_from_rect : Rect.t -> Rect.t
    method inset : float -> float -> Rect.t
    method normalize : unit -> Rect.t
    method offset : float -> float -> Rect.t
    method round_to_pixel : unit -> Rect.t
    method as_rect : Rect.t
  end

