(** Constructs [Gdk.Texture] objects from GL textures.

    The operation is quite simple: Create a texture builder, set all the
    necessary properties - keep in mind that the properties
    [Gdk.GLTextureBuilder:context], [Gdk.GLTextureBuilder:id],
    [Gdk.GLTextureBuilder:width], and [Gdk.GLTextureBuilder:height] are
    mandatory - and then call [Gdk.GLTextureBuilder.build] to create the new
    texture.

    [GdkGLTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.

    Its methods, signals and properties are on
    {!class-type-gl_texture_builder_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Gl_texture_builder}. *)

(** {b The methods, signals and properties of a [GLTextureBuilder].}

    Constructs [Gdk.Texture] objects from GL textures.

    The operation is quite simple: Create a texture builder, set all the
    necessary properties - keep in mind that the properties
    [Gdk.GLTextureBuilder:context], [Gdk.GLTextureBuilder:id],
    [Gdk.GLTextureBuilder:width], and [Gdk.GLTextureBuilder:height] are
    mandatory - and then call [Gdk.GLTextureBuilder.build] to create the new
    texture.

    [GdkGLTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.
*)
class type gl_texture_builder_t = object
  method get_color_state : unit -> Raw.Color_state.t
  (** Gets the color state previously set via
      gdk_gl_texture_builder_set_color_state(). *)

  method get_context :
    unit -> App_launch_context_cycle_de440b34.gl_context_t option
  (** Gets the context previously set via gdk_gl_texture_builder_set_context()
      or [NULL] if none was set. *)

  method get_format : unit -> Enums.memoryformat
  (** Gets the format previously set via gdk_gl_texture_builder_set_format(). *)

  method get_has_mipmap : unit -> bool
  (** Gets whether the texture has a mipmap. *)

  method get_height : unit -> int
  (** Gets the height previously set via gdk_gl_texture_builder_set_height() or
      0 if the height wasn't set. *)

  method get_id : unit -> int
  (** Gets the texture id previously set via gdk_gl_texture_builder_set_id() or
      0 if the id wasn't set. *)

  method get_update_region : unit -> Occairo.Region.region_t option
  (** Gets the region previously set via
      gdk_gl_texture_builder_set_update_region() or [NULL] if none was set. *)

  method get_update_texture : unit -> Texture.texture_t option
  (** Gets the texture previously set via
      gdk_gl_texture_builder_set_update_texture() or [NULL] if none was set. *)

  method get_width : unit -> int
  (** Gets the width previously set via gdk_gl_texture_builder_set_width() or 0
      if the width wasn't set. *)

  method set_color_state : Raw.Color_state.t -> unit
  (** Sets the color state for the texture.

      By default, the sRGB colorstate is used. If you don't know what
      colorstates are, this is probably the right thing. *)

  method set_context :
    App_launch_context_cycle_de440b34.gl_context_t option -> unit
  (** Sets the context to be used for the texture. This is the context that owns
      the texture.

      The context must be set before calling [Gdk.GLTextureBuilder.build]. *)

  method set_format : Enums.memoryformat -> unit
  (** Sets the format of the texture. The default is
      [GDK_MEMORY_R8G8B8A8_PREMULTIPLIED].

      The format is the preferred format the texture data should be downloaded
      to. The format must be supported by the GL version of
      [Gdk.GLTextureBuilder:context].

      GDK's texture download code assumes that the format corresponds to the
      storage parameters of the GL texture in an obvious way. For example, a
      format of [GDK_MEMORY_R16G16B16A16_PREMULTIPLIED] is expected to be stored
      as [GL_RGBA16] texture, and [GDK_MEMORY_G8A8] is expected to be stored as
      [GL_RG8] texture.

      Setting the right format is particularly useful when using high bit depth
      textures to preserve the bit depth, to set the correct value for
      unpremultiplied textures and to make sure opaque textures are treated as
      such.

      Non-RGBA textures need to have swizzling parameters set up properly to be
      usable in GSK's shaders. *)

  method set_has_mipmap : bool -> unit
  (** Sets whether the texture has a mipmap. This allows the renderer and other
      users of the generated texture to use a higher quality downscaling.

      Typically, the [glGenerateMipmap] function is used to generate a mimap. *)

  method set_height : int -> unit
  (** Sets the height of the texture.

      The height must be set before calling [Gdk.GLTextureBuilder.build]. *)

  method set_id : int -> unit
  (** Sets the texture id of the texture. The texture id must remain unmodified
      until the texture was finalized. See [Gdk.GLTextureBuilder.build] for a
      longer discussion.

      The id must be set before calling [Gdk.GLTextureBuilder.build]. *)

  method set_update_region : Occairo.Region.region_t option -> unit
  (** Sets the region to be updated by this texture. Together with
      [Gdk.GLTextureBuilder:update-texture] this describes an update of a
      previous texture.

      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties, so
      that GTK can avoid rerendering parts that did not change.

      An example would be a screen recording where only the mouse pointer moves.
  *)

  method set_update_texture : Texture.texture_t option -> unit
  (** Sets the texture to be updated by this texture. See
      [Gdk.GLTextureBuilder.set_update_region] for an explanation. *)

  method set_width : int -> unit
  (** Sets the width of the texture.

      The width must be set before calling [Gdk.GLTextureBuilder.build]. *)

  method as_gl_texture_builder : Raw.Gl_texture_builder.t
end

class gl_texture_builder : Raw.Gl_texture_builder.t -> gl_texture_builder_t
(** Wraps a raw handle of {!Ocgdk.Raw.Gl_texture_builder.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> gl_texture_builder_t
(** Creates a new texture builder. *)
