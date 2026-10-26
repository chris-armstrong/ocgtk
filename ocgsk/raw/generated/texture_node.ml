(* GENERATED CODE - DO NOT EDIT *)
(* TextureNode: TextureNode *)

(** A render node for a [GdkTexture]. *)

type t = [ `texture_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_texture_node_get_type"

external new_ : Ocgdk_raw.Texture.t -> Ocgraphene_raw.Rect.t -> t
  = "ml_gsk_texture_node_new"
(** Create a new TextureNode *)

(* Methods *)

external get_texture : t -> Ocgdk_raw.Texture.t
  = "ml_gsk_texture_node_get_texture"
(** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)
