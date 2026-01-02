(* GENERATED CODE - DO NOT EDIT *)
(* DmabufTextureBuilder: DmabufTextureBuilder *)

type t = [`dmabuf_texture_builder | `object_] Gobject.obj

(** Create a new DmabufTextureBuilder *)
external new_ : unit -> t = "ml_gdk_dmabuf_texture_builder_new"

(* Methods *)
(** Sets the width of the texture.

The width must be set before calling [method@Gdk.GLTextureBuilder.build]. *)
external set_width : t -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_width"

(** Sets the texture to be updated by this texture. See
[method@Gdk.DmabufTextureBuilder.set_update_region] for an explanation. *)
external set_update_texture : t -> Texture.t option -> unit = "ml_gdk_dmabuf_texture_builder_set_update_texture"

(** Sets the stride for a plane.

The stride must be set for all planes before calling [method@Gdk.GLTextureBuilder.build]. *)
external set_stride : t -> int -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_stride"

(** Sets whether the data is premultiplied.

Unless otherwise specified, all formats including alpha channels are assumed
to be premultiplied. *)
external set_premultiplied : t -> bool -> unit = "ml_gdk_dmabuf_texture_builder_set_premultiplied"

(** Sets the offset for a plane. *)
external set_offset : t -> int -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_offset"

(** Sets the number of planes of the texture. *)
external set_n_planes : t -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_n_planes"

(** Sets the height of the texture.

The height must be set before calling [method@Gdk.GLTextureBuilder.build]. *)
external set_height : t -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_height"

(** Sets the file descriptor for a plane. *)
external set_fd : t -> int -> int -> unit = "ml_gdk_dmabuf_texture_builder_set_fd"

(** Sets the display that this texture builder is
associated with.

The display is used to determine the supported
dma-buf formats. *)
external set_display : t -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t -> unit = "ml_gdk_dmabuf_texture_builder_set_display"

(** Gets the width previously set via gdk_dmabuf_texture_builder_set_width() or
0 if the width wasn't set. *)
external get_width : t -> int = "ml_gdk_dmabuf_texture_builder_get_width"

(** Gets the texture previously set via gdk_dmabuf_texture_builder_set_update_texture() or
%NULL if none was set. *)
external get_update_texture : t -> Texture.t option = "ml_gdk_dmabuf_texture_builder_get_update_texture"

(** Gets the stride value for a plane. *)
external get_stride : t -> int -> int = "ml_gdk_dmabuf_texture_builder_get_stride"

(** Whether the data is premultiplied. *)
external get_premultiplied : t -> bool = "ml_gdk_dmabuf_texture_builder_get_premultiplied"

(** Gets the offset value for a plane. *)
external get_offset : t -> int -> int = "ml_gdk_dmabuf_texture_builder_get_offset"

(** Gets the number of planes. *)
external get_n_planes : t -> int = "ml_gdk_dmabuf_texture_builder_get_n_planes"

(** Gets the height previously set via gdk_dmabuf_texture_builder_set_height() or
0 if the height wasn't set. *)
external get_height : t -> int = "ml_gdk_dmabuf_texture_builder_get_height"

(** Gets the file descriptor for a plane. *)
external get_fd : t -> int -> int = "ml_gdk_dmabuf_texture_builder_get_fd"

(** Returns the display that this texture builder is
associated with. *)
external get_display : t -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t = "ml_gdk_dmabuf_texture_builder_get_display"

(* Properties *)

