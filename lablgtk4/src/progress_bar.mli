(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ProgressBar *)

type t = Gtk.Widget.t

(** Create a new ProgressBar *)
external new_ : unit -> t = "ml_gtk_progress_bar_new"

(* Properties *)

(** Get property: fraction *)
external get_fraction : t -> float = "ml_gtk_progress_bar_get_fraction"

(** Set property: fraction *)
external set_fraction : t -> float -> unit = "ml_gtk_progress_bar_set_fraction"

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_progress_bar_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_progress_bar_set_inverted"

(** Get property: pulse-step *)
external get_pulse_step : t -> float = "ml_gtk_progress_bar_get_pulse_step"

(** Set property: pulse-step *)
external set_pulse_step : t -> float -> unit = "ml_gtk_progress_bar_set_pulse_step"

(** Get property: show-text *)
external get_show_text : t -> bool = "ml_gtk_progress_bar_get_show_text"

(** Set property: show-text *)
external set_show_text : t -> bool -> unit = "ml_gtk_progress_bar_set_show_text"

external set_text : t -> string option -> unit = "ml_gtk_progress_bar_set_text"

external set_ellipsize : t -> int -> unit = "ml_gtk_progress_bar_set_ellipsize"

external pulse : t -> unit = "ml_gtk_progress_bar_pulse"

external get_text : t -> string = "ml_gtk_progress_bar_get_text"

external get_ellipsize : t -> int = "ml_gtk_progress_bar_get_ellipsize"

