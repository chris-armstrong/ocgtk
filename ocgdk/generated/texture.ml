class type texture_t = object
  inherit Paintable.paintable_t
  inherit Ocgio.Icon.icon_t
  inherit Ocgio.Loadable_icon.loadable_icon_t

  method get_color_state : unit -> Raw.Color_state.t
  (** Returns the color state associated with the texture. *)

  method get_format : unit -> Enums.memoryformat
  (** Gets the memory format most closely associated with the data of the
      texture.

      Note that it may not be an exact match for texture data stored on the GPU
      or with compression.

      The format can give an indication about the bit depth and opacity of the
      texture and is useful to determine the best format for downloading the
      texture. *)

  method get_height : unit -> int
  (** Returns the height of the [texture], in pixels. *)

  method get_width : unit -> int
  (** Returns the width of [texture], in pixels. *)

  method save_to_png : string -> bool
  (** Store the given [texture] to the [filename] as a PNG file.

      This is a utility function intended for debugging and testing. If you want
      more control over formats, proper error handling or want to store to a
      [Gio.File] or other location, you might want to use
      [Gdk.Texture.save_to_png_bytes] or look into the libglycin library. *)

  method save_to_png_bytes : unit -> Glib_bytes.t
  (** Store the given [texture] in memory as a PNG file.

      Use [Gdk.Texture.new_from_bytes] to read it back.

      If you want to serialize a texture, this is a convenient and portable way
      to do that.

      If you need more control over the generated image, such as attaching
      metadata, you should look into an image handling library such as the
      libglycin library.

      If you are dealing with high dynamic range float data, you might also want
      to consider [Gdk.Texture.save_to_tiff_bytes] instead. *)

  method save_to_tiff : string -> bool
  (** Store the given [texture] to the [filename] as a TIFF file.

      GTK will attempt to store data without loss. *)

  method save_to_tiff_bytes : unit -> Glib_bytes.t
  (** Store the given [texture] in memory as a TIFF file.

      Use [Gdk.Texture.new_from_bytes] to read it back.

      This function is intended to store a representation of the texture's data
      that is as accurate as possible. This is particularly relevant when
      working with high dynamic range images and floating-point texture data.

      If that is not your concern and you are interested in a smaller size and a
      more portable format, you might want to use
      [Gdk.Texture.save_to_png_bytes]. *)

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
