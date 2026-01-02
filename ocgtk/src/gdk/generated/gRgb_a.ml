(* High-level class for RGBA *)
class rgb_a (obj : Rgb_a.t) = object (self)

  method copy : unit -> Rgb_a.t =
    fun () ->
      (Rgb_a.copy obj)

  method equal : Rgb_a.t -> bool =
    fun p2 ->
      (Rgb_a.equal obj p2)

  method free : unit -> unit =
    fun () ->
      (Rgb_a.free obj)

  method hash : unit -> int =
    fun () ->
      (Rgb_a.hash obj)

  method is_clear : unit -> bool =
    fun () ->
      (Rgb_a.is_clear obj)

  method is_opaque : unit -> bool =
    fun () ->
      (Rgb_a.is_opaque obj)

  method parse : string -> bool =
    fun spec ->
      (Rgb_a.parse obj spec)

  method to_string : unit -> string =
    fun () ->
      (Rgb_a.to_string obj)

    method as_rgb_a = obj
end

