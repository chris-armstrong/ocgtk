(* GENERATED CODE - DO NOT EDIT *)
(* SubsurfaceNode: SubsurfaceNode *)

type t = [`subsurface_node | `render_node] Gobject.obj

(* Methods *)
(** Gets the child node that is getting drawn by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_subsurface_node_get_child"

