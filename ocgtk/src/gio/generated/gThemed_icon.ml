class type themed_icon_t = object
    method append_name : string -> unit
    method get_names : unit -> string array
    method prepend_name : string -> unit
    method name : string
    method use_default_fallbacks : bool
    method as_themed_icon : Themed_icon.t
end

(* High-level class for ThemedIcon *)
class themed_icon (obj : Themed_icon.t) : themed_icon_t = object (self)

  method append_name : string -> unit =
    fun iconname ->
      (Themed_icon.append_name obj iconname)

  method get_names : unit -> string array =
    fun () ->
      (Themed_icon.get_names obj)

  method prepend_name : string -> unit =
    fun iconname ->
      (Themed_icon.prepend_name obj iconname)

  method name = Themed_icon.get_name obj

  method use_default_fallbacks = Themed_icon.get_use_default_fallbacks obj

    method as_themed_icon = obj
end

