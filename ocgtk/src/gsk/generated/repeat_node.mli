(* GENERATED CODE - DO NOT EDIT *)
(* RepeatNode: RepeatNode *)

type t = [`repeat_node | `render_node] Gobject.obj

(** Create a new RepeatNode *)
external new_ : unit -> Render_node.t -> unit -> t = "ml_gsk_repeat_node_new"

(* Methods *)
(** Retrieves the child of @node. *)
external get_child : t -> Render_node.t = "ml_gsk_repeat_node_get_child"

