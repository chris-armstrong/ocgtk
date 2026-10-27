(** A render node for a [GdkTexture], with control over scaling.

    Its methods, signals and properties are on
    {!class-type-texture_scale_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Texture_scale_node}. *)

(** The methods, signals and properties of a [GskTextureScaleNode]. *)
class type texture_scale_node_t = object
  inherit Render_node.render_node_t

  method get_filter : unit -> Enums.scalingfilter
  (** Retrieves the [GskScalingFilter] used when creating this [GskRenderNode].
  *)

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  method as_texture_scale_node : Raw.Texture_scale_node.t
end

class texture_scale_node : Raw.Texture_scale_node.t -> texture_scale_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Texture_scale_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskTextureScaleNode], give one already wrapped. *)

val new_ :
  Ocgdk.Texture.texture_t ->
  Ocgraphene.Rect.rect_t ->
  Enums.scalingfilter ->
  texture_scale_node_t
