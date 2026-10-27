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

(* High-level class for Rect *)
class rect (obj : Raw.Rect.t) : rect_t =
  object (self)
    method contains_point : Raw.Point.t -> bool =
      fun p -> Raw.Rect.contains_point obj p

    method contains_rect : Raw.Rect.t -> bool =
      fun b -> Raw.Rect.contains_rect obj b

    method equal : Raw.Rect.t -> bool = fun b -> Raw.Rect.equal obj b
    method get_area : unit -> float = fun () -> Raw.Rect.get_area obj
    method get_height : unit -> float = fun () -> Raw.Rect.get_height obj
    method get_width : unit -> float = fun () -> Raw.Rect.get_width obj
    method get_x : unit -> float = fun () -> Raw.Rect.get_x obj
    method get_y : unit -> float = fun () -> Raw.Rect.get_y obj

    method init : float -> float -> float -> float -> Raw.Rect.t =
      fun x y width height -> Raw.Rect.init obj x y width height

    method init_from_rect : Raw.Rect.t -> Raw.Rect.t =
      fun src -> Raw.Rect.init_from_rect obj src

    method inset : float -> float -> Raw.Rect.t =
      fun d_x d_y -> Raw.Rect.inset obj d_x d_y

    method normalize : unit -> Raw.Rect.t = fun () -> Raw.Rect.normalize obj

    method offset : float -> float -> Raw.Rect.t =
      fun d_x d_y -> Raw.Rect.offset obj d_x d_y

    method round_to_pixel : unit -> Raw.Rect.t =
      fun () -> Raw.Rect.round_to_pixel obj

    method as_rect = obj
  end
