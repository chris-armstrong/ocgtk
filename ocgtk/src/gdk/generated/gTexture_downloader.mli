class type texture_downloader_t = object
  method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
  method get_format : unit -> Gdk_enums.memoryformat
  method get_texture : unit -> GTexture.texture_t
  method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
  method set_format : Gdk_enums.memoryformat -> unit
  method set_texture : GTexture.texture_t -> unit
  method as_texture_downloader : Texture_downloader.t
end

class texture_downloader : Texture_downloader.t -> texture_downloader_t

val new_ : GTexture.texture_t -> texture_downloader_t
