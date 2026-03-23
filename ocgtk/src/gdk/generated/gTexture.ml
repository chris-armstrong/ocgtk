class type texture_t = object
    method get_format : unit -> Gdk_enums.memoryformat
    method get_height : unit -> int
    method get_width : unit -> int
    method save_to_png : string -> bool
    method save_to_tiff : string -> bool
    method as_texture : Texture.t
end

(* High-level class for Texture *)
class texture (obj : Texture.t) : texture_t = object (self)

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

let new_for_pixbuf (pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t) : texture_t =
  let pixbuf = pixbuf#as_pixbuf in
  new texture (Texture.new_for_pixbuf pixbuf)

let new_from_resource (resource_path : string) : texture_t =
  new texture (Texture.new_from_resource resource_path)

