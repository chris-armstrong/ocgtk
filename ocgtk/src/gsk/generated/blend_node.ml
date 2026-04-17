(* GENERATED CODE - DO NOT EDIT *)
(* BlendNode: BlendNode *)

type t = [`blend_node | `render_node] Gobject.obj

(** Create a new BlendNode *)
external new_ : Render_node.t -> Render_node.t -> Gsk_enums.blendmode -> t = "ml_gsk_blend_node_new"

(* Methods *)
(** Retrieves the top `GskRenderNode` child of the @node. *)
external get_top_child : t -> Render_node.t = "ml_gsk_blend_node_get_top_child"

(** Retrieves the bottom `GskRenderNode` child of the @node. *)
external get_bottom_child : t -> Render_node.t = "ml_gsk_blend_node_get_bottom_child"

(** Retrieves the blend mode used by @node. *)
external get_blend_mode : t -> Gsk_enums.blendmode = "ml_gsk_blend_node_get_blend_mode"

