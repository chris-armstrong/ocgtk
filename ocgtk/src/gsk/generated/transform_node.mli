(* GENERATED CODE - DO NOT EDIT *)
(* TransformNode: TransformNode *)

type t = [`transform_node | `render_node] Gobject.obj

(** Create a new TransformNode *)
external new_ : Render_node.t -> Transform.t -> t = "ml_gsk_transform_node_new"

(* Methods *)
(** Retrieves the `GskTransform` used by the @node. *)
external get_transform : t -> Transform.t = "ml_gsk_transform_node_get_transform"

(** Gets the child node that is getting transformed by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_transform_node_get_child"

