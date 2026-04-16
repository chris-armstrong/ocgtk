class type themed_icon_t = object
  inherit GIcon.icon_t
  method append_name : string -> unit
  method get_names : unit -> string array
  method prepend_name : string -> unit
  method use_default_fallbacks : bool
  method as_themed_icon : Themed_icon.t
end

class themed_icon : Themed_icon.t -> themed_icon_t

val new_ : string -> themed_icon_t
val new_from_names : string array -> int -> themed_icon_t
val new_with_default_fallbacks : string -> themed_icon_t
