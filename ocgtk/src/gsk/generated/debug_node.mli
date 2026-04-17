(* GENERATED CODE - DO NOT EDIT *)
(* DebugNode: DebugNode *)

type t = [`debug_node | `render_node] Gobject.obj

(** Create a new DebugNode *)
external new_ : Render_node.t -> string -> t = "ml_gsk_debug_node_new"

(* Methods *)
(** Gets the debug message that was set on this node *)
external get_message : t -> string = "ml_gsk_debug_node_get_message"

(** Gets the child node that is getting drawn by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_debug_node_get_child"

