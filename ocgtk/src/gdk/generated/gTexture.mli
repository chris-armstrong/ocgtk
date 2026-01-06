class texture : Texture.t ->
  object
    method get_format : unit -> Gdk_enums.memoryformat
    method get_height : unit -> int
    method get_width : unit -> int
    method save_to_png : string -> bool
    method save_to_tiff : string -> bool
    method as_texture : Texture.t
  end

