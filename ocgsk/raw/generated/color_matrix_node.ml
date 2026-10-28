(* GENERATED CODE - DO NOT EDIT *)
(* ColorMatrixNode: ColorMatrixNode *)

(** A render node controlling the color matrix of its single child node.

    The class built on this module is in {!Ocgsk.Color_matrix_node}. *)

type t = [ `color_matrix_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_color_matrix_node_get_type"

external new_ :
  Render_node.t -> Ocgraphene_raw.Matrix.t -> Ocgraphene_raw.Vec4.t -> t
  = "ml_gsk_color_matrix_node_new"
(** Creates a [GskRenderNode] that will drawn the [child] with [color_matrix].

    In particular, the node will transform colors by applying

    pixel = transpose(color_matrix) * pixel + color_offset

    for every pixel. The transformation operates on unpremultiplied colors, with
    color components ordered R, G, B, A. *)

(* Methods *)

external get_color_offset : t -> Ocgraphene_raw.Vec4.t
  = "ml_gsk_color_matrix_node_get_color_offset"
(** Retrieves the color offset used by the [node]. *)

external get_color_matrix : t -> Ocgraphene_raw.Matrix.t
  = "ml_gsk_color_matrix_node_get_color_matrix"
(** Retrieves the color matrix used by the [node]. *)

external get_child : t -> Render_node.t = "ml_gsk_color_matrix_node_get_child"
(** Gets the child node that is getting its colors modified by the given [node].
*)
