(* GENERATED CODE - DO NOT EDIT *)
(* ShadowNode: ShadowNode *)

type t = [`shadow_node | `render_node] Gobject.obj

(* Methods *)
(** Retrieves the child `GskRenderNode` of the shadow @node. *)
external get_child : t -> Render_node.t = "ml_gsk_shadow_node_get_child"

