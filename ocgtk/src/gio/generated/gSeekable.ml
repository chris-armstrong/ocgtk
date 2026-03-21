class type seekable_t = object
    method can_seek : unit -> bool
    method can_truncate : unit -> bool
    method as_seekable : Seekable.t
end

(* High-level class for Seekable *)
class seekable (obj : Seekable.t) : seekable_t = object (self)

  method can_seek : unit -> bool =
    fun () ->
      (Seekable.can_seek obj)

  method can_truncate : unit -> bool =
    fun () ->
      (Seekable.can_truncate obj)

    method as_seekable = obj
end

