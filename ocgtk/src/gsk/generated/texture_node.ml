(* GENERATED CODE - DO NOT EDIT *)
(* TextureNode: TextureNode *)

type t = [`texture_node | `render_node] Gobject.obj

(** Create a new TextureNode *)
external new_ : Ocgtk_gdk.Gdk.Wrappers.Texture.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> t = "ml_gsk_texture_node_new"

(* Methods *)
(** Retrieves the `GdkTexture` used when creating this `GskRenderNode`. *)
external get_texture : t -> Ocgtk_gdk.Gdk.Wrappers.Texture.t = "ml_gsk_texture_node_get_texture"

