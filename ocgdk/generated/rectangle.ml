class type rectangle_t = object
  method contains_point : int -> int -> bool
  (** Returns [TRUE] if [rect] contains the point described by [x] and [y]. *)

  method equal : Raw.Rectangle.t -> bool
  (** Checks if the two given rectangles are equal. *)

  method as_rectangle : Raw.Rectangle.t
end

(* High-level class for Rectangle *)
class rectangle (obj : Raw.Rectangle.t) : rectangle_t =
  object (self)
    method contains_point : int -> int -> bool =
      fun x y -> Raw.Rectangle.contains_point obj x y

    method equal : Raw.Rectangle.t -> bool =
      fun rect2 -> Raw.Rectangle.equal obj rect2

    method as_rectangle = obj
  end
