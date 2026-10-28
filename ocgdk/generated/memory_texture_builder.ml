class type memory_texture_builder_t = object
  method build : unit -> Texture.texture_t
  (** Builds a new [GdkTexture] with the values set up in the builder.

      Note that it is a programming error to call this function if any mandatory
      property has not been set.

      It is possible to call this function multiple times to create multiple
      textures, possibly with changing properties in between. *)

  method get_bytes : unit -> Glib_bytes.t option
  (** Gets the bytes previously set via gdk_memory_texture_builder_set_bytes()
      or [NULL] if none was set. *)

  method get_color_state : unit -> Raw.Color_state.t
  (** Gets the colorstate previously set via
      gdk_memory_texture_builder_set_color_state(). *)

  method get_format : unit -> Enums.memoryformat
  (** Gets the format previously set via
      gdk_memory_texture_builder_set_format(). *)

  method get_height : unit -> int
  (** Gets the height previously set via gdk_memory_texture_builder_set_height()
      or 0 if the height wasn't set. *)

  method get_offset : int -> Gsize.t
  (** Gets the offset previously set via
      gdk_memory_texture_builder_set_offset(). *)

  method get_stride : unit -> Gsize.t
  (** Gets the stride previously set via
      gdk_memory_texture_builder_set_stride(). *)

  method get_stride_for_plane : int -> Gsize.t
  (** Gets the stride previously set via
      gdk_memory_texture_builder_set_stride_for_plane(). *)

  method get_update_region : unit -> Occairo.Region.region_t option
  (** Gets the region previously set via
      gdk_memory_texture_builder_set_update_region() or [NULL] if none was set.
  *)

  method get_update_texture : unit -> Texture.texture_t option
  (** Gets the texture previously set via
      gdk_memory_texture_builder_set_update_texture() or [NULL] if none was set.
  *)

  method get_width : unit -> int
  (** Gets the width previously set via gdk_memory_texture_builder_set_width()
      or 0 if the width wasn't set. *)

  method set_bytes : Glib_bytes.t option -> unit
  (** Sets the data to be shown but the texture.

      The bytes must be set before calling [Gdk.MemoryTextureBuilder.build]. *)

  method set_color_state : Raw.Color_state.t -> unit
  (** Sets the colorstate describing the data.

      By default, the sRGB colorstate is used. If you don't know what
      colorstates are, this is probably the right thing. *)

  method set_format : Enums.memoryformat -> unit
  (** Sets the format of the bytes.

      The default is [GDK_MEMORY_R8G8B8A8_PREMULTIPLIED]. *)

  method set_height : int -> unit
  (** Sets the height of the texture.

      The height must be set before calling [Gdk.MemoryTextureBuilder.build] and
      conform to size requirements of the provided format. *)

  method set_offset : int -> Gsize.t -> unit
  (** Sets the offset of the texture for [plane]. *)

  method set_stride : Gsize.t -> unit
  (** Sets the rowstride of the bytes used.

      The rowstride must be set before calling [Gdk.MemoryTextureBuilder.build].
  *)

  method set_stride_for_plane : int -> Gsize.t -> unit
  (** Sets the stride of the texture for [plane]. *)

  method set_update_region : Occairo.Region.region_t option -> unit
  (** Sets the region to be updated by this texture.

      Together with [Gdk.MemoryTextureBuilder:update-texture], this describes an
      update of a previous texture.

      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties, so
      that GTK can avoid rerendering parts that did not change.

      An example would be a screen recording where only the mouse pointer moves.
  *)

  method set_update_texture : Texture.texture_t option -> unit
  (** Sets the texture to be updated by this texture.

      See [Gdk.MemoryTextureBuilder.set_update_region] for an explanation. *)

  method set_width : int -> unit
  (** Sets the width of the texture.

      The width must be set before calling [Gdk.MemoryTextureBuilder.build] and
      conform to size requirements of the provided format. *)

  method as_memory_texture_builder : Raw.Memory_texture_builder.t
end

(* High-level class for MemoryTextureBuilder *)
class memory_texture_builder (obj : Raw.Memory_texture_builder.t) :
  memory_texture_builder_t =
  object (self)
    method build : unit -> Texture.texture_t =
      fun () -> new Texture.texture (Raw.Memory_texture_builder.build obj)

    method get_bytes : unit -> Glib_bytes.t option =
      fun () -> Raw.Memory_texture_builder.get_bytes obj

    method get_color_state : unit -> Raw.Color_state.t =
      fun () -> Raw.Memory_texture_builder.get_color_state obj

    method get_format : unit -> Enums.memoryformat =
      fun () -> Raw.Memory_texture_builder.get_format obj

    method get_height : unit -> int =
      fun () -> Raw.Memory_texture_builder.get_height obj

    method get_offset : int -> Gsize.t =
      fun plane -> Raw.Memory_texture_builder.get_offset obj plane

    method get_stride : unit -> Gsize.t =
      fun () -> Raw.Memory_texture_builder.get_stride obj

    method get_stride_for_plane : int -> Gsize.t =
      fun plane -> Raw.Memory_texture_builder.get_stride_for_plane obj plane

    method get_update_region : unit -> Occairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Region.region ret)
          (Raw.Memory_texture_builder.get_update_region obj)

    method get_update_texture : unit -> Texture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new Texture.texture ret)
          (Raw.Memory_texture_builder.get_update_texture obj)

    method get_width : unit -> int =
      fun () -> Raw.Memory_texture_builder.get_width obj

    method set_bytes : Glib_bytes.t option -> unit =
      fun bytes -> Raw.Memory_texture_builder.set_bytes obj bytes

    method set_color_state : Raw.Color_state.t -> unit =
      fun color_state ->
        Raw.Memory_texture_builder.set_color_state obj color_state

    method set_format : Enums.memoryformat -> unit =
      fun format -> Raw.Memory_texture_builder.set_format obj format

    method set_height : int -> unit =
      fun height -> Raw.Memory_texture_builder.set_height obj height

    method set_offset : int -> Gsize.t -> unit =
      fun plane offset -> Raw.Memory_texture_builder.set_offset obj plane offset

    method set_stride : Gsize.t -> unit =
      fun stride -> Raw.Memory_texture_builder.set_stride obj stride

    method set_stride_for_plane : int -> Gsize.t -> unit =
      fun plane stride ->
        Raw.Memory_texture_builder.set_stride_for_plane obj plane stride

    method set_update_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Memory_texture_builder.set_update_region obj region

    method set_update_texture : Texture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Raw.Memory_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Raw.Memory_texture_builder.set_width obj width

    method as_memory_texture_builder = obj
  end

let new_ () : memory_texture_builder_t =
  new memory_texture_builder (Raw.Memory_texture_builder.new_ ())
