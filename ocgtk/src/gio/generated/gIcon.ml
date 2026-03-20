class type icon_t = object
    method hash : unit -> int
    method to_string : unit -> string option
    method as_icon : Icon.t
end

(* High-level class for Icon *)
class icon (obj : Icon.t) : icon_t = object (self)

  method hash : unit -> int =
    fun () ->
      (Icon.hash obj)

  method to_string : unit -> string option =
    fun () ->
      (Icon.to_string obj)

    method as_icon = obj
end

