(* High-level class for Seekable *)
class seekable (obj : Seekable.t) = object (self)

  method can_seek : unit -> bool =
    fun () ->
      (Seekable.can_seek obj)

  method can_truncate : unit -> bool =
    fun () ->
      (Seekable.can_truncate obj)

    method as_seekable = obj
end

