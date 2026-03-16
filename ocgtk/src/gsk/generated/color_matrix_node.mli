(* GENERATED CODE - DO NOT EDIT *)
(* ColorMatrixNode: ColorMatrixNode *)

type t = [`color_matrix_node | `render_node] Gobject.obj

(** Create a new ColorMatrixNode *)
external new_ : Render_node.t -> unit -> unit -> t = "ml_gsk_color_matrix_node_new"

(* Methods *)
(** Gets the child node that is getting its colors modified by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_color_matrix_node_get_child"

