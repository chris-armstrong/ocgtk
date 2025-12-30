(* High-level class for Native *)
class native (obj : Native.t) = object (self)

  method realize : unit -> unit =
    fun () ->
      (Native.realize obj)

  method unrealize : unit -> unit =
    fun () ->
      (Native.unrealize obj)

    method as_native = obj
end

