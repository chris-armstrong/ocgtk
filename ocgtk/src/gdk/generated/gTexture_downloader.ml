class type texture_downloader_t = object
    method copy : unit -> Texture_downloader.t
    method free : unit -> unit
    method get_format : unit -> Gdk_enums.memoryformat
    method get_texture : unit -> GTexture.texture_t
    method set_format : Gdk_enums.memoryformat -> unit
    method set_texture : GTexture.texture_t -> unit
    method as_texture_downloader : Texture_downloader.t
end

(* High-level class for TextureDownloader *)
class texture_downloader (obj : Texture_downloader.t) : texture_downloader_t = object (self)

  method copy : unit -> Texture_downloader.t =
    fun () ->
      (Texture_downloader.copy obj)

  method free : unit -> unit =
    fun () ->
      (Texture_downloader.free obj)

  method get_format : unit -> Gdk_enums.memoryformat =
    fun () ->
      (Texture_downloader.get_format obj)

  method get_texture : unit -> GTexture.texture_t =
    fun () ->
      new  GTexture.texture(Texture_downloader.get_texture obj)

  method set_format : Gdk_enums.memoryformat -> unit =
    fun format ->
      (Texture_downloader.set_format obj format)

  method set_texture : GTexture.texture_t -> unit =
    fun texture ->
      let texture = texture#as_texture in
      (Texture_downloader.set_texture obj texture)

    method as_texture_downloader = obj
end

let new_ (texture : GTexture.texture_t) : texture_downloader_t =
  let texture = texture#as_texture in
  let obj_ = Texture_downloader.new_ texture in
  new texture_downloader obj_

