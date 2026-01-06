class rectangle : Rectangle.t ->
  object
    method contains_point : int -> int -> bool
    method equal : Rectangle.t -> bool
    method as_rectangle : Rectangle.t
  end

