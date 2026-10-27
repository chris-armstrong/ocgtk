(* GENERATED CODE - DO NOT EDIT *)
(* RepeatNode: RepeatNode *)

(** A render node repeating its single child node.

    The class built on this module is in {!Ocgsk.Repeat_node}. *)

type t = [ `repeat_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_repeat_node_get_type"

external new_ :
  Ocgraphene_raw.Rect.t -> Render_node.t -> Ocgraphene_raw.Rect.t option -> t
  = "ml_gsk_repeat_node_new"
(** Creates a [GskRenderNode] that will repeat the drawing of [child] across the
    given [bounds]. *)

(* Methods *)

external get_child_bounds : t -> Ocgraphene_raw.Rect.t
  = "ml_gsk_repeat_node_get_child_bounds"
(** Retrieves the bounding rectangle of the child of [node]. *)

external get_child : t -> Render_node.t = "ml_gsk_repeat_node_get_child"
(** Retrieves the child of [node]. *)
