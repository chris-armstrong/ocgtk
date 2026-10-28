(** A render node for a [GdkTexture], with control over scaling.

    Its methods, signals and properties are on
    {!class-type-texture_scale_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Texture_scale_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TextureScaleNode].}

    Inherits from:
    {{!Ocgsk.Render_node.class-type-render_node_t}Ocgsk.Render_node}

    A render node for a [GdkTexture], with control over scaling. *)
class type texture_scale_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_filter : unit -> Enums.scalingfilter
  (** Retrieves the [GskScalingFilter] used when creating this [GskRenderNode].
  *)

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  (** {2:conversions Conversions} *)

  method as_texture_scale_node : Raw.Texture_scale_node.t
end

class texture_scale_node : Raw.Texture_scale_node.t -> texture_scale_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Texture_scale_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Ocgdk.Texture.texture_t ->
  Ocgraphene.Rect.rect_t ->
  Enums.scalingfilter ->
  texture_scale_node_t
(** Creates a node that scales the texture to the size given by the bounds using
    the filter and then places it at the bounds' position.

    Note that further scaling and other transformations which are applied to the
    node will apply linear filtering to the resulting texture, as usual.

    This node is intended for tight control over scaling applied to a texture,
    such as in image editors and requires the application to be aware of the
    whole render tree as further transforms may be applied that conflict with
    the desired effect of this node. *)
