(* High-level class for TextureDownloader *)
class texture_downloader (obj : Texture_downloader.t) = object (self)

  method copy : unit -> Texture_downloader.t =
    fun () ->
      (Texture_downloader.copy obj)

  method free : unit -> unit =
    fun () ->
      (Texture_downloader.free obj)

  method get_format : unit -> Gdk_enums.memoryformat =
    fun () ->
      (Texture_downloader.get_format obj)

  method get_texture : unit -> GTexture.texture =
    fun () ->
      new  GTexture.texture(Texture_downloader.get_texture obj)

  method set_format : Gdk_enums.memoryformat -> unit =
    fun format ->
      (Texture_downloader.set_format obj format)

  method set_texture : 'p1. (#GTexture.texture as 'p1) -> unit =
    fun texture ->
      let texture = texture#as_texture in
      (Texture_downloader.set_texture obj texture)

    method as_texture_downloader = obj
end

