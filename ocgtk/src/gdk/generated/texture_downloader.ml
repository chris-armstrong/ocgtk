(* GENERATED CODE - DO NOT EDIT *)
(* TextureDownloader: TextureDownloader *)

type t = [ `texture_downloader ] Gobject.obj
(** The `GdkTextureDownloader` is used to download the contents of a
    [class@Gdk.Texture].

    It is intended to be created as a short-term object for a single download,
    but can be used for multiple downloads of different textures or with
    different settings.

    `GdkTextureDownloader` can be used to convert data between different
    formats. Create a `GdkTexture` for the existing format and then download it
    in a different format. *)

external new_ : Texture.t -> t = "ml_gdk_texture_downloader_new"
(** Create a new TextureDownloader *)

(* Methods *)

external set_texture : t -> Texture.t -> unit
  = "ml_gdk_texture_downloader_set_texture"
(** Changes the texture the downloader will download. *)

external set_format : t -> Gdk_enums.memoryformat -> unit
  = "ml_gdk_texture_downloader_set_format"
(** Sets the format the downloader will download.

    By default, GDK_MEMORY_DEFAULT is set. *)

external get_texture : t -> Texture.t = "ml_gdk_texture_downloader_get_texture"
(** Gets the texture that the downloader will download. *)

external get_format : t -> Gdk_enums.memoryformat
  = "ml_gdk_texture_downloader_get_format"
(** Gets the format that the data will be downloaded in. *)

external free : t -> unit = "ml_gdk_texture_downloader_free"
(** Frees the given downloader and all its associated resources. *)

external download_bytes : t -> Glib_bytes.t * Gsize.t
  = "ml_gdk_texture_downloader_download_bytes"
(** Downloads the given texture pixels into a `GBytes`. The rowstride will be
    stored in the stride value.

    This function will abort if it tries to download a large texture and fails
    to allocate memory. If you think that may happen, you should handle memory
    allocation yourself and use [method@Gdk.TextureDownloader.download_into]
    once allocation succeeded. *)

external copy : t -> t = "ml_gdk_texture_downloader_copy"
(** Creates a copy of the downloader.

    This function is meant for language bindings. *)
