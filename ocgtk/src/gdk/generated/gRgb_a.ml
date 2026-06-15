class type rgb_a_t = object
  method equal : Rgb_a.t -> bool
  method hash : unit -> int
  method is_clear : unit -> bool
  method is_opaque : unit -> bool
  method parse : string -> bool
  method to_string : unit -> string
  method get_red : float
  method set_red : float -> unit
  method get_green : float
  method set_green : float -> unit
  method get_blue : float
  method set_blue : float -> unit
  method get_alpha : float
  method set_alpha : float -> unit
  method as_rgb_a : Rgb_a.t
end

(* High-level class for RGBA *)
class rgb_a (obj : Rgb_a.t) : rgb_a_t =
  object (self)
    method equal : Rgb_a.t -> bool = fun p2 -> Rgb_a.equal obj p2
    method hash : unit -> int = fun () -> Rgb_a.hash obj
    method is_clear : unit -> bool = fun () -> Rgb_a.is_clear obj
    method is_opaque : unit -> bool = fun () -> Rgb_a.is_opaque obj
    method parse : string -> bool = fun spec -> Rgb_a.parse obj spec
    method to_string : unit -> string = fun () -> Rgb_a.to_string obj
    method get_red : float = Rgb_a.get_red obj
    method set_red : float -> unit = fun v -> Rgb_a.set_red obj v
    method get_green : float = Rgb_a.get_green obj
    method set_green : float -> unit = fun v -> Rgb_a.set_green obj v
    method get_blue : float = Rgb_a.get_blue obj
    method set_blue : float -> unit = fun v -> Rgb_a.set_blue obj v
    method get_alpha : float = Rgb_a.get_alpha obj
    method set_alpha : float -> unit = fun v -> Rgb_a.set_alpha obj v
    method as_rgb_a = obj
  end

let make (red : float) (green : float) (blue : float) (alpha : float) : rgb_a_t
    =
  new rgb_a (Rgb_a.make red green blue alpha)
