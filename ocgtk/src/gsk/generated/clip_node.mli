(* GENERATED CODE - DO NOT EDIT *)
(* ClipNode: ClipNode *)

type t = [`clip_node | `render_node] Gobject.obj

(** Create a new ClipNode *)
external new_ : Render_node.t -> unit -> t = "ml_gsk_clip_node_new"

(* Methods *)
(** Gets the child node that is getting clipped by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_clip_node_get_child"

