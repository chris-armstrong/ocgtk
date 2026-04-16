class type texture_downloader_t = object
  method copy : unit -> Texture_downloader.t
  method free : unit -> unit
  method get_format : unit -> Gdk_enums.memoryformat
  method get_texture : unit -> GTexture.texture_t
  method set_format : Gdk_enums.memoryformat -> unit
  method set_texture : GTexture.texture_t -> unit
  method as_texture_downloader : Texture_downloader.t
end

class texture_downloader : Texture_downloader.t -> texture_downloader_t

val new_ : GTexture.texture_t -> texture_downloader_t
