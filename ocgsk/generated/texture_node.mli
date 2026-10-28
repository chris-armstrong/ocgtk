(** A render node for a [GdkTexture].

    Its methods, signals and properties are on {!class-type-texture_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Texture_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TextureNode].}

    A render node for a [GdkTexture]. *)
class type texture_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  (** {2:conversions Conversions} *)

  method as_texture_node : Raw.Texture_node.t
end

class texture_node : Raw.Texture_node.t -> texture_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Texture_node.t}. *)

(** {1:constructors Constructors} *)

val new_ : Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> texture_node_t
(** Creates a [GskRenderNode] that will render the given [texture] into the area
    given by [bounds].

    Note that GSK applies linear filtering when textures are scaled and
    transformed. See [Gsk.TextureScaleNode] for a way to influence filtering. *)
