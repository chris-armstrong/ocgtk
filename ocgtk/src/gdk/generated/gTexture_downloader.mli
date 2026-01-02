class texture_downloader : Texture_downloader.t ->
  object
    method copy : unit -> Texture_downloader.t
    method free : unit -> unit
    method get_format : unit -> Gdk_enums.memoryformat
    method get_texture : unit -> GTexture.texture
    method set_format : Gdk_enums.memoryformat -> unit
    method set_texture : #GTexture.texture -> unit
    method as_texture_downloader : Texture_downloader.t
  end

