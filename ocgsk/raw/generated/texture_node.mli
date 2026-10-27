(* GENERATED CODE - DO NOT EDIT *)
(* TextureNode: TextureNode *)

(** A render node for a [GdkTexture].

    The class built on this module is in {!Ocgsk.Texture_node}. *)

type t = [ `texture_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_texture_node_get_type"

external new_ : Ocgdk_raw.Texture.t -> Ocgraphene_raw.Rect.t -> t
  = "ml_gsk_texture_node_new"
(** Creates a [GskRenderNode] that will render the given [texture] into the area
    given by [bounds].

    Note that GSK applies linear filtering when textures are scaled and
    transformed. See [Gsk.TextureScaleNode] for a way to influence filtering. *)

(* Methods *)

external get_texture : t -> Ocgdk_raw.Texture.t
  = "ml_gsk_texture_node_get_texture"
(** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)
