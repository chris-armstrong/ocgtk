(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)
(* Generated from progress_bar.mli *)

(* Type declarations *)
type t = Gtk.Widget.t

(* External FFI bindings *)
external new_ : unit -> t = "ml_gtk_progress_bar_new"
external get_fraction : t -> float = "ml_gtk_progress_bar_get_fraction"
external set_fraction : t -> float -> unit = "ml_gtk_progress_bar_set_fraction"
external get_inverted : t -> bool = "ml_gtk_progress_bar_get_inverted"
external set_inverted : t -> bool -> unit = "ml_gtk_progress_bar_set_inverted"
external get_pulse_step : t -> float = "ml_gtk_progress_bar_get_pulse_step"
external set_pulse_step : t -> float -> unit = "ml_gtk_progress_bar_set_pulse_step"
external get_show_text : t -> bool = "ml_gtk_progress_bar_get_show_text"
external set_show_text : t -> bool -> unit = "ml_gtk_progress_bar_set_show_text"
external get_text : t -> string = "ml_gtk_progress_bar_get_text"
external set_text : t -> string -> unit = "ml_gtk_progress_bar_set_text"
external set_ellipsize : t -> Pango_enums.ellipsizemode -> unit = "ml_gtk_progress_bar_set_ellipsize"
external pulse : t -> unit = "ml_gtk_progress_bar_pulse"
external get_ellipsize : t -> Pango_enums.ellipsizemode = "ml_gtk_progress_bar_get_ellipsize"

(* Summary:
 * - 1 type declarations
 * - 14 external bindings
 *)
