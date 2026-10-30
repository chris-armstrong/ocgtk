(* GENERATED CODE - DO NOT EDIT *)
(* TextureScaleNode: TextureScaleNode *)

(** A render node for a [GdkTexture], with control over scaling.

    The class built on this module is in {!Ocgsk.Texture_scale_node}. *)

type t = [ `texture_scale_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_texture_scale_node_get_type"

external new_ :
  Ocgdk_raw.Texture.t -> Ocgraphene_raw.Rect.t -> Ocgsk_enums.scalingfilter -> t
  = "ml_gsk_texture_scale_node_new"
(** Creates a node that scales the texture to the size given by the bounds using
    the filter and then places it at the bounds' position.

    Note that further scaling and other transformations which are applied to the
    node will apply linear filtering to the resulting texture, as usual.

    This node is intended for tight control over scaling applied to a texture,
    such as in image editors and requires the application to be aware of the
    whole render tree as further transforms may be applied that conflict with
    the desired effect of this node. *)

(* Methods *)

external get_texture : t -> Ocgdk_raw.Texture.t
  = "ml_gsk_texture_scale_node_get_texture"
(** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

external get_filter : t -> Ocgsk_enums.scalingfilter
  = "ml_gsk_texture_scale_node_get_filter"
(** Retrieves the [GskScalingFilter] used when creating this [GskRenderNode]. *)
