class type texture_downloader_t = object
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_texture : unit -> Texture.texture_t
  method set_color_state : Raw.Color_state.t -> unit
  method set_format : Enums.memoryformat -> unit
  method set_texture : Texture.texture_t -> unit
  method as_texture_downloader : Raw.Texture_downloader.t
end

class texture_downloader : Raw.Texture_downloader.t -> texture_downloader_t

val new_ : Texture.texture_t -> texture_downloader_t
