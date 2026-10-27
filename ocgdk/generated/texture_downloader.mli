(** Used to download the contents of a [Gdk.Texture].

    It is intended to be created as a short-term object for a single download,
    but can be used for multiple downloads of different textures or with
    different settings.

    [GdkTextureDownloader] can be used to convert data between different
    formats. Create a [GdkTexture] for the existing format and then download it
    in a different format.

    Its methods, signals and properties are on
    {!class-type-texture_downloader_t}. The functions it is built on are in
    {!Ocgdk.Raw.Texture_downloader}. *)

(** The methods, signals and properties of a [GdkTextureDownloader]. *)
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
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Texture_downloader.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkTextureDownloader], give one already wrapped. *)

val new_ : Texture.texture_t -> texture_downloader_t
