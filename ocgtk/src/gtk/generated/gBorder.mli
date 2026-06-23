class type border_t = object
  method get_left : Int16.t
  method set_left : Int16.t -> unit
  method get_right : Int16.t
  method set_right : Int16.t -> unit
  method get_top : Int16.t
  method set_top : Int16.t -> unit
  method get_bottom : Int16.t
  method set_bottom : Int16.t -> unit
  method as_border : Border.t
end

class border : Border.t -> border_t

val new_ : unit -> border_t
val make : Int16.t -> Int16.t -> Int16.t -> Int16.t -> border_t
