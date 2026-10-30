class type rectangle_t = object
  (** {2:conversions Conversions} *)

  method as_rectangle : Raw.Rectangle.t
end

(* High-level class for Rectangle *)
class rectangle (obj : Raw.Rectangle.t) : rectangle_t =
  object (self)
    method as_rectangle = obj
  end
