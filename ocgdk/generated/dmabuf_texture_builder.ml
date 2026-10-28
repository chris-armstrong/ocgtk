class type dmabuf_texture_builder_t = object
  (** {2:methods Methods} *)

  method get_color_state : unit -> Raw.Color_state.t option
  (** Gets the color state previously set via
      gdk_dmabuf_texture_builder_set_color_state(). *)

  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  (** Returns the display that this texture builder is associated with. *)

  method get_fd : int -> int
  (** Gets the file descriptor for a plane. *)

  method get_fourcc : unit -> UInt32.t
  (** Gets the format previously set via gdk_dmabuf_texture_builder_set_fourcc()
      or 0 if the format wasn't set.

      The format is specified as a fourcc code. *)

  method get_height : unit -> int
  (** Gets the height previously set via gdk_dmabuf_texture_builder_set_height()
      or 0 if the height wasn't set. *)

  method get_modifier : unit -> UInt64.t
  (** Gets the modifier value. *)

  method get_n_planes : unit -> int
  (** Gets the number of planes. *)

  method get_offset : int -> int
  (** Gets the offset value for a plane. *)

  method get_premultiplied : unit -> bool
  (** Whether the data is premultiplied. *)

  method get_stride : int -> int
  (** Gets the stride value for a plane. *)

  method get_update_region : unit -> Occairo.Region.region_t option
  (** Gets the region previously set via
      gdk_dmabuf_texture_builder_set_update_region() or [NULL] if none was set.
  *)

  method get_update_texture : unit -> Texture.texture_t option
  (** Gets the texture previously set via
      gdk_dmabuf_texture_builder_set_update_texture() or [NULL] if none was set.
  *)

  method get_width : unit -> int
  (** Gets the width previously set via gdk_dmabuf_texture_builder_set_width()
      or 0 if the width wasn't set. *)

  method set_color_state : Raw.Color_state.t option -> unit
  (** Sets the color state for the texture.

      By default, the colorstate is [NULL]. In that case, GTK will choose the
      correct colorstate based on the format. If you don't know what colorstates
      are, this is probably the right thing. *)

  method set_display : App_launch_context_cycle_de440b34.display_t -> unit
  (** Sets the display that this texture builder is associated with.

      The display is used to determine the supported dma-buf formats. *)

  method set_fd : int -> int -> unit
  (** Sets the file descriptor for a plane. *)

  method set_fourcc : UInt32.t -> unit
  (** Sets the format of the texture.

      The format is specified as a fourcc code.

      The format must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  method set_height : int -> unit
  (** Sets the height of the texture.

      The height must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  method set_modifier : UInt64.t -> unit
  (** Sets the modifier. *)

  method set_n_planes : int -> unit
  (** Sets the number of planes of the texture. *)

  method set_offset : int -> int -> unit
  (** Sets the offset for a plane. *)

  method set_premultiplied : bool -> unit
  (** Sets whether the data is premultiplied.

      Unless otherwise specified, all formats including alpha channels are
      assumed to be premultiplied. *)

  method set_stride : int -> int -> unit
  (** Sets the stride for a plane.

      The stride must be set for all planes before calling
      [Gdk.DmabufTextureBuilder.build]. *)

  method set_update_region : Occairo.Region.region_t option -> unit
  (** Sets the region to be updated by this texture. Together with
      [Gdk.DmabufTextureBuilder:update-texture] this describes an update of a
      previous texture.

      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties, so
      that GTK can avoid rerendering parts that did not change.

      An example would be a screen recording where only the mouse pointer moves.
  *)

  method set_update_texture : Texture.texture_t option -> unit
  (** Sets the texture to be updated by this texture. See
      [Gdk.DmabufTextureBuilder.set_update_region] for an explanation. *)

  method set_width : int -> unit
  (** Sets the width of the texture.

      The width must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  (** {2:conversions Conversions} *)

  method as_dmabuf_texture_builder : Raw.Dmabuf_texture_builder.t
end

(* High-level class for DmabufTextureBuilder *)
class dmabuf_texture_builder (obj : Raw.Dmabuf_texture_builder.t) :
  dmabuf_texture_builder_t =
  object (self)
    method get_color_state : unit -> Raw.Color_state.t option =
      fun () -> Raw.Dmabuf_texture_builder.get_color_state obj

    method get_display : unit -> App_launch_context_cycle_de440b34.display_t =
      fun () ->
        new App_launch_context_cycle_de440b34.display
          (Raw.Dmabuf_texture_builder.get_display obj)

    method get_fd : int -> int =
      fun plane -> Raw.Dmabuf_texture_builder.get_fd obj plane

    method get_fourcc : unit -> UInt32.t =
      fun () -> Raw.Dmabuf_texture_builder.get_fourcc obj

    method get_height : unit -> int =
      fun () -> Raw.Dmabuf_texture_builder.get_height obj

    method get_modifier : unit -> UInt64.t =
      fun () -> Raw.Dmabuf_texture_builder.get_modifier obj

    method get_n_planes : unit -> int =
      fun () -> Raw.Dmabuf_texture_builder.get_n_planes obj

    method get_offset : int -> int =
      fun plane -> Raw.Dmabuf_texture_builder.get_offset obj plane

    method get_premultiplied : unit -> bool =
      fun () -> Raw.Dmabuf_texture_builder.get_premultiplied obj

    method get_stride : int -> int =
      fun plane -> Raw.Dmabuf_texture_builder.get_stride obj plane

    method get_update_region : unit -> Occairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Region.region ret)
          (Raw.Dmabuf_texture_builder.get_update_region obj)

    method get_update_texture : unit -> Texture.texture_t option =
      fun () ->
        Option.map
          (fun ret -> new Texture.texture ret)
          (Raw.Dmabuf_texture_builder.get_update_texture obj)

    method get_width : unit -> int =
      fun () -> Raw.Dmabuf_texture_builder.get_width obj

    method set_color_state : Raw.Color_state.t option -> unit =
      fun color_state ->
        Raw.Dmabuf_texture_builder.set_color_state obj color_state

    method set_display : App_launch_context_cycle_de440b34.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Dmabuf_texture_builder.set_display obj display

    method set_fd : int -> int -> unit =
      fun plane fd -> Raw.Dmabuf_texture_builder.set_fd obj plane fd

    method set_fourcc : UInt32.t -> unit =
      fun fourcc -> Raw.Dmabuf_texture_builder.set_fourcc obj fourcc

    method set_height : int -> unit =
      fun height -> Raw.Dmabuf_texture_builder.set_height obj height

    method set_modifier : UInt64.t -> unit =
      fun modifier -> Raw.Dmabuf_texture_builder.set_modifier obj modifier

    method set_n_planes : int -> unit =
      fun n_planes -> Raw.Dmabuf_texture_builder.set_n_planes obj n_planes

    method set_offset : int -> int -> unit =
      fun plane offset -> Raw.Dmabuf_texture_builder.set_offset obj plane offset

    method set_premultiplied : bool -> unit =
      fun premultiplied ->
        Raw.Dmabuf_texture_builder.set_premultiplied obj premultiplied

    method set_stride : int -> int -> unit =
      fun plane stride -> Raw.Dmabuf_texture_builder.set_stride obj plane stride

    method set_update_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Dmabuf_texture_builder.set_update_region obj region

    method set_update_texture : Texture.texture_t option -> unit =
      fun texture ->
        let texture = Option.map (fun c -> c#as_texture) texture in
        Raw.Dmabuf_texture_builder.set_update_texture obj texture

    method set_width : int -> unit =
      fun width -> Raw.Dmabuf_texture_builder.set_width obj width

    method as_dmabuf_texture_builder = obj
  end

let new_ () : dmabuf_texture_builder_t =
  new dmabuf_texture_builder (Raw.Dmabuf_texture_builder.new_ ())
