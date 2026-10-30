(* GENERATED CODE - DO NOT EDIT *)
(* ClipNode: ClipNode *)

(** A render node applying a rectangular clip to its single child node.

    The class built on this module is in {!Ocgsk.Clip_node}. *)

type t = [ `clip_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_clip_node_get_type"

external new_ : Render_node.t -> Ocgraphene_raw.Rect.t -> t
  = "ml_gsk_clip_node_new"
(** Creates a [GskRenderNode] that will clip the [child] to the area given by
    [clip]. *)

(* Methods *)

external get_clip : t -> Ocgraphene_raw.Rect.t = "ml_gsk_clip_node_get_clip"
(** Retrieves the clip rectangle for [node]. *)

external get_child : t -> Render_node.t = "ml_gsk_clip_node_get_child"
(** Gets the child node that is getting clipped by the given [node]. *)
