(* GENERATED CODE - DO NOT EDIT *)
(* ContainerNode: ContainerNode *)

(** A render node that can contain other render nodes.

    The class built on this module is in {!Ocgsk.Container_node}. *)

type t = [ `container_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_container_node_get_type"

external new_ : Render_node.t array -> int -> t = "ml_gsk_container_node_new"
(** Creates a new [GskRenderNode] instance for holding the given [children].

    The new node will acquire a reference to each of the children. *)

(* Methods *)

external get_n_children : t -> int = "ml_gsk_container_node_get_n_children"
(** Retrieves the number of direct children of [node]. *)

external get_child : t -> int -> Render_node.t
  = "ml_gsk_container_node_get_child"
(** Gets one of the children of [container]. *)
