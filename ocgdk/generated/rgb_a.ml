class type rgb_a_t = object
  method equal : Raw.Rgb_a.t -> bool
  method hash : unit -> int
  method is_clear : unit -> bool
  method is_opaque : unit -> bool
  method parse : string -> bool
  method to_string : unit -> string
  method as_rgb_a : Raw.Rgb_a.t
end

(* High-level class for RGBA *)
class rgb_a (obj : Raw.Rgb_a.t) : rgb_a_t =
  object (self)
    method equal : Raw.Rgb_a.t -> bool = fun p2 -> Raw.Rgb_a.equal obj p2
    method hash : unit -> int = fun () -> Raw.Rgb_a.hash obj
    method is_clear : unit -> bool = fun () -> Raw.Rgb_a.is_clear obj
    method is_opaque : unit -> bool = fun () -> Raw.Rgb_a.is_opaque obj
    method parse : string -> bool = fun spec -> Raw.Rgb_a.parse obj spec
    method to_string : unit -> string = fun () -> Raw.Rgb_a.to_string obj
    method as_rgb_a = obj
  end
