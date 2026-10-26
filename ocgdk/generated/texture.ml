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

(* High-level class for Texture *)
class texture (obj : Raw.Texture.t) : texture_t =
  object (self)
    inherit Paintable.paintable (Raw.Paintable.from_gobject obj)
    inherit Ocgio.Icon.icon (Ocgio.Raw.Icon.from_gobject obj)

    inherit
      Ocgio.Loadable_icon.loadable_icon
        (Ocgio.Raw.Loadable_icon.from_gobject obj)

    method get_color_state : unit -> Raw.Color_state.t =
      fun () -> Raw.Texture.get_color_state obj

    method get_format : unit -> Enums.memoryformat =
      fun () -> Raw.Texture.get_format obj

    method get_height : unit -> int = fun () -> Raw.Texture.get_height obj
    method get_width : unit -> int = fun () -> Raw.Texture.get_width obj

    method save_to_png : string -> bool =
      fun filename -> Raw.Texture.save_to_png obj filename

    method save_to_png_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Texture.save_to_png_bytes obj

    method save_to_tiff : string -> bool =
      fun filename -> Raw.Texture.save_to_tiff obj filename

    method save_to_tiff_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Texture.save_to_tiff_bytes obj

    method as_texture = obj
  end

let new_for_pixbuf (pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t) : texture_t =
  let pixbuf = pixbuf#as_pixbuf in
  let obj_ = Raw.Texture.new_for_pixbuf pixbuf in
  new texture obj_

let new_from_bytes (bytes : Glib_bytes.t) : (texture_t, GError.t) result =
  let obj_ = Raw.Texture.new_from_bytes bytes in
  Result.map (fun obj_ -> new texture obj_) obj_

let new_from_file (file : Ocgio.File.file_t) : (texture_t, GError.t) result =
  let file = file#as_file in
  let obj_ = Raw.Texture.new_from_file file in
  Result.map (fun obj_ -> new texture obj_) obj_

let new_from_filename (path : string) : (texture_t, GError.t) result =
  let obj_ = Raw.Texture.new_from_filename path in
  Result.map (fun obj_ -> new texture obj_) obj_

let new_from_resource (resource_path : string) : texture_t =
  let obj_ = Raw.Texture.new_from_resource resource_path in
  new texture obj_
