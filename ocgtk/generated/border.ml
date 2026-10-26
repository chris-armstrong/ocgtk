class type border_t = object
  method as_border : Raw.Border.t
end

(* High-level class for Border *)
class border (obj : Raw.Border.t) : border_t =
  object (self)
    method as_border = obj
  end

let new_ () : border_t = new border (Raw.Border.new_ ())
