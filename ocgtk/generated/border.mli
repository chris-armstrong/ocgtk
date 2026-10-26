class type border_t = object
  method as_border : Raw.Border.t
end

class border : Raw.Border.t -> border_t

val new_ : unit -> border_t
