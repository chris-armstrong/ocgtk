class type seekable_t = object
  method can_seek : unit -> bool
  method can_truncate : unit -> bool
  method tell : unit -> int64

  method truncate :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method as_seekable : Raw.Seekable.t
end

class seekable : Raw.Seekable.t -> seekable_t
