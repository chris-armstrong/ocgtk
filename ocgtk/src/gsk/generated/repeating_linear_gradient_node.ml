(* GENERATED CODE - DO NOT EDIT *)
(* RepeatingLinearGradientNode: RepeatingLinearGradientNode *)

(** A render node for a repeating linear gradient. *)

type t = [ `repeating_linear_gradient_node | `render_node ] Gobject.obj

external new_ :
  Ocgtk_graphene.Graphene.Wrappers.Rect.t ->
  Ocgtk_graphene.Graphene.Wrappers.Point.t ->
  Ocgtk_graphene.Graphene.Wrappers.Point.t ->
  Color_stop.t array ->
  Gsize.t ->
  t = "ml_gsk_repeating_linear_gradient_node_new"
(** Create a new RepeatingLinearGradientNode *)

(* Methods *)
