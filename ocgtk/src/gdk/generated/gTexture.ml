class type texture_t = object
    method get_format : unit -> Gdk_enums.memoryformat
    method get_height : unit -> int
    method get_width : unit -> int
    method save_to_png : string -> bool
    method save_to_png_bytes : unit -> Glib_bytes.t
    method save_to_tiff : string -> bool
    method save_to_tiff_bytes : unit -> Glib_bytes.t
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

  method save_to_png_bytes : unit -> Glib_bytes.t =
    fun () ->
      (Texture.save_to_png_bytes obj)

  method save_to_tiff : string -> bool =
    fun filename ->
      (Texture.save_to_tiff obj filename)

  method save_to_tiff_bytes : unit -> Glib_bytes.t =
    fun () ->
      (Texture.save_to_tiff_bytes obj)

    method as_texture = obj
end

let new_for_pixbuf (pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t) : texture_t =
  let pixbuf = pixbuf#as_pixbuf in
  let obj_ = Texture.new_for_pixbuf pixbuf in
  new texture obj_

let new_from_bytes (bytes : Glib_bytes.t) : (texture_t, GError.t) result =
  let obj_ = Texture.new_from_bytes bytes in
Result.map (fun obj_ ->  new texture obj_) obj_

let new_from_file (file : Ocgtk_gio.Gio.File.file_t) : (texture_t, GError.t) result =
  let file = file#as_file in
  let obj_ = Texture.new_from_file file in
Result.map (fun obj_ ->  new texture obj_) obj_

let new_from_filename (path : string) : (texture_t, GError.t) result =
  let obj_ = Texture.new_from_filename path in
Result.map (fun obj_ ->  new texture obj_) obj_

let new_from_resource (resource_path : string) : texture_t =
  let obj_ = Texture.new_from_resource resource_path in
  new texture obj_

