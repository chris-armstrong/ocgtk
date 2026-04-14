class type seekable_t = object
    method can_seek : unit -> bool
    method can_truncate : unit -> bool
    method tell : unit -> int64
    method truncate : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result
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

  method tell : unit -> int64 =
    fun () ->
      (Seekable.tell obj)

  method truncate : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun offset cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Seekable.truncate obj offset cancellable)

    method as_seekable = obj
end

