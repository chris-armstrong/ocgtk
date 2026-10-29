(** Constructs [Gdk.Texture] objects from system memory provided via
    [GLib.Bytes].

    Its methods, signals and properties are on
    {!class-type-memory_texture_builder_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgdk.Raw.Memory_texture_builder}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MemoryTextureBuilder].}

    Constructs [Gdk.Texture] objects from system memory provided via
    [GLib.Bytes].

    The operation is quite simple: Create a texture builder, set all the
    necessary properties - keep in mind that the properties
    [Gdk.MemoryTextureBuilder:bytes], [Gdk.MemoryTextureBuilder:stride],
    [Gdk.MemoryTextureBuilder:width], and [Gdk.MemoryTextureBuilder:height] are
    mandatory - and then call [Gdk.MemoryTextureBuilder.build] to create the new
    texture.

    [GdkMemoryTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
*)
class type memory_texture_builder_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_memory_texture_builder : Raw.Memory_texture_builder.t
end

class memory_texture_builder :
  Raw.Memory_texture_builder.t ->
  memory_texture_builder_t
(** Wraps a raw handle of {!Ocgdk.Raw.Memory_texture_builder.t}. *)

(** {1:description Description}

    Constructs [Gdk.Texture] objects from system memory provided via
    [GLib.Bytes].

    The operation is quite simple: Create a texture builder, set all the
    necessary properties - keep in mind that the properties
    [Gdk.MemoryTextureBuilder:bytes], [Gdk.MemoryTextureBuilder:stride],
    [Gdk.MemoryTextureBuilder:width], and [Gdk.MemoryTextureBuilder:height] are
    mandatory - and then call [Gdk.MemoryTextureBuilder.build] to create the new
    texture.

    [GdkMemoryTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
*)

(** {1:constructors Constructors} *)

val new_ : unit -> memory_texture_builder_t
(** Creates a new texture builder. *)
