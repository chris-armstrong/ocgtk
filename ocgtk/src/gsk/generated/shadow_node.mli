(* GENERATED CODE - DO NOT EDIT *)
(* ShadowNode: ShadowNode *)

type t = [`shadow_node | `render_node] Gobject.obj

(** Create a new ShadowNode *)
external new_ : Render_node.t -> Shadow.t array -> Gsize.t -> t = "ml_gsk_shadow_node_new"

(* Methods *)
(** Retrieves the shadow data at the given index @i. *)
external get_shadow : t -> Gsize.t -> Shadow.t = "ml_gsk_shadow_node_get_shadow"

(** Retrieves the number of shadows in the @node. *)
external get_n_shadows : t -> Gsize.t = "ml_gsk_shadow_node_get_n_shadows"

(** Retrieves the child `GskRenderNode` of the shadow @node. *)
external get_child : t -> Render_node.t = "ml_gsk_shadow_node_get_child"

