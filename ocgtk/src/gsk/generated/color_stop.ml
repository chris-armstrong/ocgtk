(* GENERATED CODE - DO NOT EDIT *)
(* ColorStop: ColorStop *)

type t = [ `color_stop ] Gobject.obj
(** A color stop in a gradient node. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_offset : t -> float = "ml_gsk_color_stop_get_offset"

external get_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t
  = "ml_gsk_color_stop_get_color"

(* Setters *)
external set_offset : t -> float -> unit = "ml_gsk_color_stop_set_offset"

external set_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit
  = "ml_gsk_color_stop_set_color"

external make : float -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> t
  = "ml_gsk_color_stop_make"
