(* GENERATED CODE - DO NOT EDIT *)
(* LinearGradientNode: LinearGradientNode *)

type t = [`linear_gradient_node | `render_node] Gobject.obj

(** Create a new LinearGradientNode *)
external new_ : Ocgtk_graphene.Graphene.Wrappers.Rect.t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> Color_stop.t array -> Gsize.t -> t = "ml_gsk_linear_gradient_node_new"

(* Methods *)
(** Retrieves the initial point of the linear gradient. *)
external get_start : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_linear_gradient_node_get_start"

(** Retrieves the number of color stops in the gradient. *)
external get_n_color_stops : t -> Gsize.t = "ml_gsk_linear_gradient_node_get_n_color_stops"

(** Retrieves the final point of the linear gradient. *)
external get_end : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t = "ml_gsk_linear_gradient_node_get_end"

(** Retrieves the color stops in the gradient. *)
external get_color_stops : t -> Color_stop.t array * Gsize.t = "ml_gsk_linear_gradient_node_get_color_stops"

