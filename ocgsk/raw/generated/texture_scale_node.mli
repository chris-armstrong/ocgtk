(* GENERATED CODE - DO NOT EDIT *)
(* TextureScaleNode: TextureScaleNode *)

(** A render node for a [GdkTexture], with control over scaling.

    The class built on this module is in {!Ocgsk.Texture_scale_node}. *)

type t = [ `texture_scale_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_texture_scale_node_get_type"

external new_ :
  Ocgdk_raw.Texture.t -> Ocgraphene_raw.Rect.t -> Ocgsk_enums.scalingfilter -> t
  = "ml_gsk_texture_scale_node_new"
(** Create a new TextureScaleNode *)

(* Methods *)

external get_texture : t -> Ocgdk_raw.Texture.t
  = "ml_gsk_texture_scale_node_get_texture"
(** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

external get_filter : t -> Ocgsk_enums.scalingfilter
  = "ml_gsk_texture_scale_node_get_filter"
(** Retrieves the [GskScalingFilter] used when creating this [GskRenderNode]. *)
