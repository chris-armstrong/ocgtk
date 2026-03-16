(* GENERATED CODE - DO NOT EDIT *)
(* StrokeNode: StrokeNode *)

type t = [`stroke_node | `render_node] Gobject.obj

(** Create a new StrokeNode *)
external new_ : Render_node.t -> Path_and__path_measure_and__path_point.Path.t -> Stroke.t -> t = "ml_gsk_stroke_node_new"

(* Methods *)
(** Retrieves the stroke attributes used in this @node. *)
external get_stroke : t -> Stroke.t = "ml_gsk_stroke_node_get_stroke"

(** Retrieves the path that will be stroked with the contents of
the @node. *)
external get_path : t -> Path_and__path_measure_and__path_point.Path.t = "ml_gsk_stroke_node_get_path"

(** Gets the child node that is getting drawn by the given @node. *)
external get_child : t -> Render_node.t = "ml_gsk_stroke_node_get_child"

