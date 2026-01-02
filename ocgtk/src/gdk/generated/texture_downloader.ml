(* GENERATED CODE - DO NOT EDIT *)
(* TextureDownloader: TextureDownloader *)

(** The `GdkTextureDownloader` is used to download the contents of a
[class@Gdk.Texture].

It is intended to be created as a short-term object for a single download,
but can be used for multiple downloads of different textures or with different
settings.

`GdkTextureDownloader` can be used to convert data between different formats.
Create a `GdkTexture` for the existing format and then download it in a
different format. *)
type t = [`texture_downloader] Gobject.obj

(** Create a new TextureDownloader *)
external new_ : Texture.t -> t = "ml_gdk_texture_downloader_new"

(* Methods *)
(** Changes the texture the downloader will download. *)
external set_texture : t -> Texture.t -> unit = "ml_gdk_texture_downloader_set_texture"

(** Sets the format the downloader will download.

By default, GDK_MEMORY_DEFAULT is set. *)
external set_format : t -> Gdk_enums.memoryformat -> unit = "ml_gdk_texture_downloader_set_format"

(** Gets the texture that the downloader will download. *)
external get_texture : t -> Texture.t = "ml_gdk_texture_downloader_get_texture"

(** Gets the format that the data will be downloaded in. *)
external get_format : t -> Gdk_enums.memoryformat = "ml_gdk_texture_downloader_get_format"

(** Frees the given downloader and all its associated resources. *)
external free : t -> unit = "ml_gdk_texture_downloader_free"

(** Creates a copy of the downloader.

This function is meant for language bindings. *)
external copy : t -> t = "ml_gdk_texture_downloader_copy"

