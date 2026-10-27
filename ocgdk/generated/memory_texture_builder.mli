(** Constructs [Gdk.Texture] objects from system memory provided via
    [GLib.Bytes].

    The operation is quite simple: Create a texture builder, set all the
    necessary properties - keep in mind that the properties
    [Gdk.MemoryTextureBuilder:bytes], [Gdk.MemoryTextureBuilder:stride],
    [Gdk.MemoryTextureBuilder:width], and [Gdk.MemoryTextureBuilder:height] are
    mandatory - and then call [Gdk.MemoryTextureBuilder.build] to create the new
    texture.

    [GdkMemoryTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.

    Its methods, signals and properties are on
    {!class-type-memory_texture_builder_t}. The functions it is built on are in
    {!Ocgdk.Raw.Memory_texture_builder}. *)

(** The methods, signals and properties of a [GdkMemoryTextureBuilder]. *)
class type memory_texture_builder_t = object
  method build : unit -> Texture.texture_t
  method get_bytes : unit -> Glib_bytes.t option
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_height : unit -> int
  method get_offset : int -> Gsize.t
  method get_stride : unit -> Gsize.t
  method get_stride_for_plane : int -> Gsize.t
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_bytes : Glib_bytes.t option -> unit
  method set_color_state : Raw.Color_state.t -> unit
  method set_format : Enums.memoryformat -> unit
  method set_height : int -> unit
  method set_offset : int -> Gsize.t -> unit
  method set_stride : Gsize.t -> unit
  method set_stride_for_plane : int -> Gsize.t -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_memory_texture_builder : Raw.Memory_texture_builder.t
end

class memory_texture_builder :
  Raw.Memory_texture_builder.t ->
  memory_texture_builder_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Memory_texture_builder.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkMemoryTextureBuilder], give one already wrapped.
*)

val new_ : unit -> memory_texture_builder_t
