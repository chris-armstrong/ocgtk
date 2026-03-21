class type icon_t = object
    method hash : unit -> int
    method to_string : unit -> string option
    method as_icon : Icon.t
end

class icon : Icon.t -> icon_t

