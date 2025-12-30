class icon : Icon.t ->
  object
    method hash : unit -> int
    method to_string : unit -> string option
    method as_icon : Icon.t
  end

