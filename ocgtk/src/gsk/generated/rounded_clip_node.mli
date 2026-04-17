(* GENERATED CODE - DO NOT EDIT *)
(* RoundedClipNode: RoundedClipNode *)

type t = [`rounded_clip_node | `render_node] Gobject.obj

(** Create a new RoundedClipNode *)
external new_ : Render_node.t -> Rounded_rect.t -> t = "ml_gsk_rounded_clip_node_new"

(* Methods *)
(** Retrieves the rounded rectangle used to clip the contents of the @node. *)
external get_clip : t -> Rounded_rect.t = "ml_gsk_rounded_clip_node_get_clip"

(** Gets the child node that is getting clipped by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_rounded_clip_node_get_child"

