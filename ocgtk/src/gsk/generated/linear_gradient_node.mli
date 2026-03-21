(* GENERATED CODE - DO NOT EDIT *)
(* LinearGradientNode: LinearGradientNode *)

type t = [`linear_gradient_node | `render_node] Gobject.obj

(* Methods *)
(** Retrieves the initial point of the linear gradient. *)
external get_start : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_linear_gradient_node_get_start"

(** Retrieves the final point of the linear gradient. *)
external get_end : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_linear_gradient_node_get_end"

