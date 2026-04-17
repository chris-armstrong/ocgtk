(* GENERATED CODE - DO NOT EDIT *)
(* InsetShadowNode: InsetShadowNode *)

type t = [`inset_shadow_node | `render_node] Gobject.obj

(** Create a new InsetShadowNode *)
external new_ : Rounded_rect.t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> float -> float -> float -> float -> t = "ml_gsk_inset_shadow_node_new_bytecode" "ml_gsk_inset_shadow_node_new_native"

(* Methods *)
(** Retrieves how much the shadow spreads inwards. *)
external get_spread : t -> float = "ml_gsk_inset_shadow_node_get_spread"

(** Retrieves the outline rectangle of the inset shadow. *)
external get_outline : t -> Rounded_rect.t = "ml_gsk_inset_shadow_node_get_outline"

(** Retrieves the vertical offset of the inset shadow. *)
external get_dy : t -> float = "ml_gsk_inset_shadow_node_get_dy"

(** Retrieves the horizontal offset of the inset shadow. *)
external get_dx : t -> float = "ml_gsk_inset_shadow_node_get_dx"

(** Retrieves the color of the inset shadow. *)
external get_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t = "ml_gsk_inset_shadow_node_get_color"

(** Retrieves the blur radius to apply to the shadow. *)
external get_blur_radius : t -> float = "ml_gsk_inset_shadow_node_get_blur_radius"

