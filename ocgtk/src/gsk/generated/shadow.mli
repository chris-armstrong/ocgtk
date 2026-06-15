(* GENERATED CODE - DO NOT EDIT *)
(* Shadow: Shadow *)

type t = [ `shadow ] Gobject.obj
(** The shadow parameters in a shadow node. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t
  = "ml_gsk_shadow_get_color"

external get_dx : t -> float = "ml_gsk_shadow_get_dx"
external get_dy : t -> float = "ml_gsk_shadow_get_dy"
external get_radius : t -> float = "ml_gsk_shadow_get_radius"

(* Setters *)
external set_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit
  = "ml_gsk_shadow_set_color"

external set_dx : t -> float -> unit = "ml_gsk_shadow_set_dx"
external set_dy : t -> float -> unit = "ml_gsk_shadow_set_dy"
external set_radius : t -> float -> unit = "ml_gsk_shadow_set_radius"

external make : Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> float -> float -> float -> t
  = "ml_gsk_shadow_make"
