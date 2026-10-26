class type texture_t = object
  inherit Paintable.paintable_t
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_height : unit -> int
  method get_width : unit -> int
  method save_to_png : string -> bool
  method save_to_png_bytes : unit -> Glib_bytes.t
  method save_to_tiff : string -> bool
  method save_to_tiff_bytes : unit -> Glib_bytes.t
  method as_texture : Raw.Texture.t
end

class texture : Raw.Texture.t -> texture_t

val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> texture_t
val new_from_bytes : Glib_bytes.t -> (texture_t, GError.t) result
val new_from_file : Ocgio.File.file_t -> (texture_t, GError.t) result
val new_from_filename : string -> (texture_t, GError.t) result
val new_from_resource : string -> texture_t
