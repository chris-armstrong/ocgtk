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

(* High-level class for Border *)
class border (obj : Border.t) : border_t =
  object (self)
    method get_left : Int16.t = Border.get_left obj
    method set_left : Int16.t -> unit = fun v -> Border.set_left obj v
    method get_right : Int16.t = Border.get_right obj
    method set_right : Int16.t -> unit = fun v -> Border.set_right obj v
    method get_top : Int16.t = Border.get_top obj
    method set_top : Int16.t -> unit = fun v -> Border.set_top obj v
    method get_bottom : Int16.t = Border.get_bottom obj
    method set_bottom : Int16.t -> unit = fun v -> Border.set_bottom obj v
    method as_border = obj
  end

let new_ () : border_t = new border (Border.new_ ())

let make (left : Int16.t) (right : Int16.t) (top : Int16.t) (bottom : Int16.t) :
    border_t =
  new border (Border.make left right top bottom)
