(* GENERATED CODE - DO NOT EDIT *)
(* RadialGradientNode: RadialGradientNode *)

type t = [`radial_gradient_node | `render_node] Gobject.obj

(** Create a new RadialGradientNode *)
external new_ : unit -> unit -> float -> float -> float -> float -> Color_stop.t array -> unit -> t = "ml_gsk_radial_gradient_node_new_bytecode" "ml_gsk_radial_gradient_node_new_native"

(* Methods *)
(** Retrieves the vertical radius for the gradient. *)
external get_vradius : t -> float = "ml_gsk_radial_gradient_node_get_vradius"

(** Retrieves the start value for the gradient. *)
external get_start : t -> float = "ml_gsk_radial_gradient_node_get_start"

(** Retrieves the horizontal radius for the gradient. *)
external get_hradius : t -> float = "ml_gsk_radial_gradient_node_get_hradius"

(** Retrieves the end value for the gradient. *)
external get_end : t -> float = "ml_gsk_radial_gradient_node_get_end"

