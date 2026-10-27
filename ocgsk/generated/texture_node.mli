(** A render node for a [GdkTexture].

    Its methods, signals and properties are on {!class-type-texture_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Texture_node}. *)

(** The methods, signals and properties of a [GskTextureNode]. *)
class type texture_node_t = object
  inherit Render_node.render_node_t

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  method as_texture_node : Raw.Texture_node.t
end

class texture_node : Raw.Texture_node.t -> texture_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Texture_node.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskTextureNode], give one already wrapped. *)

val new_ : Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> texture_node_t
