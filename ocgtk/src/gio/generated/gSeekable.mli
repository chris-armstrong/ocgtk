class type seekable_t = object
    method can_seek : unit -> bool
    method can_truncate : unit -> bool
    method tell : unit -> int64
    method truncate : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_seekable : Seekable.t
end

class seekable : Seekable.t -> seekable_t

