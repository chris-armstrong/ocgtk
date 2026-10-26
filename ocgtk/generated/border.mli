class type border_t = object
  method as_border : Border.t
end

class border : Border.t -> border_t

val new_ : unit -> border_t
