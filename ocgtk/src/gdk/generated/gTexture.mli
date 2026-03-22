class type texture_t = object
    method get_format : unit -> Gdk_enums.memoryformat
    method get_height : unit -> int
    method get_width : unit -> int
    method save_to_png : string -> bool
    method save_to_tiff : string -> bool
    method as_texture : Texture.t
end

class texture : Texture.t -> texture_t

val new_for_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> texture_t
val new_from_resource : string -> texture_t
