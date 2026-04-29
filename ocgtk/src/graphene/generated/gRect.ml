class type rect_t = object
  method contains_point : Point.t -> bool
  method contains_rect : Rect.t -> bool
  method equal : Rect.t -> bool
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

(* High-level class for Rect *)
class rect (obj : Rect.t) : rect_t =
  object (self)
    method contains_point : Point.t -> bool = fun p -> Rect.contains_point obj p
    method contains_rect : Rect.t -> bool = fun b -> Rect.contains_rect obj b
    method equal : Rect.t -> bool = fun b -> Rect.equal obj b
    method get_area : unit -> float = fun () -> Rect.get_area obj
    method get_height : unit -> float = fun () -> Rect.get_height obj
    method get_width : unit -> float = fun () -> Rect.get_width obj
    method get_x : unit -> float = fun () -> Rect.get_x obj
    method get_y : unit -> float = fun () -> Rect.get_y obj

    method init : float -> float -> float -> float -> Rect.t =
      fun x y width height -> Rect.init obj x y width height

    method init_from_rect : Rect.t -> Rect.t =
      fun src -> Rect.init_from_rect obj src

    method inset : float -> float -> Rect.t =
      fun d_x d_y -> Rect.inset obj d_x d_y

    method normalize : unit -> Rect.t = fun () -> Rect.normalize obj

    method offset : float -> float -> Rect.t =
      fun d_x d_y -> Rect.offset obj d_x d_y

    method round_to_pixel : unit -> Rect.t = fun () -> Rect.round_to_pixel obj
    method as_rect = obj
  end
