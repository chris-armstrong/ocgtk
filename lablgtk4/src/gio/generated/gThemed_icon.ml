(* High-level class for ThemedIcon *)
class themed_icon (obj : Themed_icon.t) = object (self)

  method append_name : string -> unit =
    fun iconname ->
      (Themed_icon.append_name obj iconname)

  method prepend_name : string -> unit =
    fun iconname ->
      (Themed_icon.prepend_name obj iconname)

  method name = Themed_icon.get_name obj

  method use_default_fallbacks = Themed_icon.get_use_default_fallbacks obj

    method as_themed_icon = obj
end

