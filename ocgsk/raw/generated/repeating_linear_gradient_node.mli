(* GENERATED CODE - DO NOT EDIT *)
(* RepeatingLinearGradientNode: RepeatingLinearGradientNode *)

(** A render node for a repeating linear gradient.

    The class built on this module is in
    {!Ocgsk.Repeating_linear_gradient_node}. *)

type t = [ `repeating_linear_gradient_node | `render_node ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gsk_repeating_linear_gradient_node_get_type"

external new_ :
  Ocgraphene_raw.Rect.t ->
  Ocgraphene_raw.Point.t ->
  Ocgraphene_raw.Point.t ->
  Color_stop.t array ->
  Gsize.t ->
  t = "ml_gsk_repeating_linear_gradient_node_new"
(** Create a new RepeatingLinearGradientNode *)

(* Methods *)
