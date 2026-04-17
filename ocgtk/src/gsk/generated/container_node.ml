(* GENERATED CODE - DO NOT EDIT *)
(* ContainerNode: ContainerNode *)

type t = [`container_node | `render_node] Gobject.obj

(** Create a new ContainerNode *)
external new_ : Render_node.t array -> int -> t = "ml_gsk_container_node_new"

(* Methods *)
(** Retrieves the number of direct children of @node. *)
external get_n_children : t -> int = "ml_gsk_container_node_get_n_children"

(** Gets one of the children of @container. *)
external get_child : t -> int -> Render_node.t = "ml_gsk_container_node_get_child"

