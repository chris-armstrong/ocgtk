class type texture_downloader_t = object
  method get_color_state : unit -> Raw.Color_state.t
  (** Gets the color state that the data will be downloaded in. *)

  method get_format : unit -> Enums.memoryformat
  (** Gets the format that the data will be downloaded in. *)

  method get_texture : unit -> Texture.texture_t
  (** Gets the texture that the downloader will download. *)

  method set_color_state : Raw.Color_state.t -> unit
  (** Sets the color state the downloader will convert the data to.

      By default, the sRGB colorstate returned by [ColorState.get_srgb] is used.
  *)

  method set_format : Enums.memoryformat -> unit
  (** Sets the format the downloader will download.

      By default, GDK_MEMORY_DEFAULT is set. *)

  method set_texture : Texture.texture_t -> unit
  (** Changes the texture the downloader will download. *)

  method as_texture_downloader : Raw.Texture_downloader.t
end

(* High-level class for TextureDownloader *)
class texture_downloader (obj : Raw.Texture_downloader.t) : texture_downloader_t
  =
  object (self)
    method get_color_state : unit -> Raw.Color_state.t =
      fun () -> Raw.Texture_downloader.get_color_state obj

    method get_format : unit -> Enums.memoryformat =
      fun () -> Raw.Texture_downloader.get_format obj

    method get_texture : unit -> Texture.texture_t =
      fun () -> new Texture.texture (Raw.Texture_downloader.get_texture obj)

    method set_color_state : Raw.Color_state.t -> unit =
      fun color_state -> Raw.Texture_downloader.set_color_state obj color_state

    method set_format : Enums.memoryformat -> unit =
      fun format -> Raw.Texture_downloader.set_format obj format

    method set_texture : Texture.texture_t -> unit =
      fun texture ->
        let texture = texture#as_texture in
        Raw.Texture_downloader.set_texture obj texture

    method as_texture_downloader = obj
  end

let new_ (texture : Texture.texture_t) : texture_downloader_t =
  let texture = texture#as_texture in
  let obj_ = Raw.Texture_downloader.new_ texture in
  new texture_downloader obj_
