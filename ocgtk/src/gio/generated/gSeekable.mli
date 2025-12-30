class seekable : Seekable.t ->
  object
    method can_seek : unit -> bool
    method can_truncate : unit -> bool
    method as_seekable : Seekable.t
  end

