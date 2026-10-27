class type icon_t = object
  method equal : icon_t option -> bool
  method hash : unit -> int
  method serialize : unit -> Gvariant.t option
  method to_string : unit -> string option
  method as_icon : Raw.Icon.t
end

class icon : Raw.Icon.t -> icon_t
