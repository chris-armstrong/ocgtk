class type texture_t = object
  inherit GPaintable.paintable_t
  inherit Ocgtk_gio.Gio.Icon.icon_t
  inherit Ocgtk_gio.Gio.Loadable_icon.loadable_icon_t
  method get_format : unit -> Gdk_enums.memoryformat
  method get_height : unit -> int
  method get_width : unit -> int
  method save_to_png : string -> bool
  method save_to_png_bytes : unit -> Glib_bytes.t
  method save_to_tiff : string -> bool
  method save_to_tiff_bytes : unit -> Glib_bytes.t
  method as_texture : Texture.t
end

class texture : Texture.t -> texture_t

val new_for_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> texture_t
val new_from_bytes : Glib_bytes.t -> (texture_t, GError.t) result
val new_from_file : Ocgtk_gio.Gio.File.file_t -> (texture_t, GError.t) result
val new_from_filename : string -> (texture_t, GError.t) result
val new_from_resource : string -> texture_t
