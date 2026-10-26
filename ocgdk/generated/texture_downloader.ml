class type texture_downloader_t = object
  method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
  method get_format : unit -> Gdk_enums.memoryformat
  method get_texture : unit -> GTexture.texture_t
  method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
  method set_format : Gdk_enums.memoryformat -> unit
  method set_texture : GTexture.texture_t -> unit
  method as_texture_downloader : Texture_downloader.t
end

(* High-level class for TextureDownloader *)
class texture_downloader (obj : Texture_downloader.t) : texture_downloader_t =
  object (self)
    method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
        =
      fun () -> Texture_downloader.get_color_state obj

    method get_format : unit -> Gdk_enums.memoryformat =
      fun () -> Texture_downloader.get_format obj

    method get_texture : unit -> GTexture.texture_t =
      fun () -> new GTexture.texture (Texture_downloader.get_texture obj)

    method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
        =
      fun color_state -> Texture_downloader.set_color_state obj color_state

    method set_format : Gdk_enums.memoryformat -> unit =
      fun format -> Texture_downloader.set_format obj format

    method set_texture : GTexture.texture_t -> unit =
      fun texture ->
        let texture = texture#as_texture in
        Texture_downloader.set_texture obj texture

    method as_texture_downloader = obj
  end

let new_ (texture : GTexture.texture_t) : texture_downloader_t =
  let texture = texture#as_texture in
  let obj_ = Texture_downloader.new_ texture in
  new texture_downloader obj_
