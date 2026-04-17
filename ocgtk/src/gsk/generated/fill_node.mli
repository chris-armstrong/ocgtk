(* GENERATED CODE - DO NOT EDIT *)
(* FillNode: FillNode *)

type t = [`fill_node | `render_node] Gobject.obj

(** Create a new FillNode *)
external new_ : Render_node.t -> Path_and__path_measure_and__path_point.Path.t -> Gsk_enums.fillrule -> t = "ml_gsk_fill_node_new"

(* Methods *)
(** Retrieves the path used to describe the area filled with the contents of
the @node. *)
external get_path : t -> Path_and__path_measure_and__path_point.Path.t = "ml_gsk_fill_node_get_path"

(** Retrieves the fill rule used to determine how the path is filled. *)
external get_fill_rule : t -> Gsk_enums.fillrule = "ml_gsk_fill_node_get_fill_rule"

(** Gets the child node that is getting drawn by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_fill_node_get_child"

