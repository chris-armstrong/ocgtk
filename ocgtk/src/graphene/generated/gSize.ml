class type size_t = object
  method equal : Size.t -> bool
  method init : float -> float -> Size.t
  method init_from_size : Size.t -> Size.t
  method get_width : float
  method set_width : float -> unit
  method get_height : float
  method set_height : float -> unit
  method as_size : Size.t
end

(* High-level class for Size *)
class size (obj : Size.t) : size_t =
  object (self)
    method equal : Size.t -> bool = fun b -> Size.equal obj b

    method init : float -> float -> Size.t =
      fun width height -> Size.init obj width height

    method init_from_size : Size.t -> Size.t =
      fun src -> Size.init_from_size obj src

    method get_width : float = Size.get_width obj
    method set_width : float -> unit = fun v -> Size.set_width obj v
    method get_height : float = Size.get_height obj
    method set_height : float -> unit = fun v -> Size.set_height obj v
    method as_size = obj
  end

let alloc () : size_t = new size (Size.alloc ())

let make (width : float) (height : float) : size_t =
  new size (Size.make width height)
