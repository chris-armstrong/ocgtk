class native : Native.t ->
  object
    method realize : unit -> unit
    method unrealize : unit -> unit
    method as_native : Native.t
  end

