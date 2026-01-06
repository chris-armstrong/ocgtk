(* High-level class for Texture *)
class texture (obj : Texture.t) = object (self)

  method get_format : unit -> Gdk_enums.memoryformat =
    fun () ->
      (Texture.get_format obj)

  method get_height : unit -> int =
    fun () ->
      (Texture.get_height obj)

  method get_width : unit -> int =
    fun () ->
      (Texture.get_width obj)

  method save_to_png : string -> bool =
    fun filename ->
      (Texture.save_to_png obj filename)

  method save_to_tiff : string -> bool =
    fun filename ->
      (Texture.save_to_tiff obj filename)

    method as_texture = obj
end

