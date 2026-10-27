(** Used to download the contents of a [Gdk.Texture].

    It is intended to be created as a short-term object for a single download,
    but can be used for multiple downloads of different textures or with
    different settings.

    [GdkTextureDownloader] can be used to convert data between different
    formats. Create a [GdkTexture] for the existing format and then download it
    in a different format.

    Its methods, signals and properties are on
    {!class-type-texture_downloader_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Texture_downloader}. *)

(** The methods, signals and properties of a [GdkTextureDownloader]. *)
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

class texture_downloader : Raw.Texture_downloader.t -> texture_downloader_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Texture_downloader.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkTextureDownloader], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Texture.texture_t -> texture_downloader_t
(** Creates a new texture downloader for [texture].

    By default, the downloader will convert the data to the default memory
    format, and to the sRGB color state. *)
