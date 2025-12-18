(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ProgressBar *)

type t = [`progress_bar | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

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

(** Get property: text *)
external get_text : t -> string = "ml_gtk_progress_bar_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_progress_bar_set_text"

(** Sets the mode used to ellipsize the text.

The text is ellipsized if there is not enough space
to render the entire string. *)
external set_ellipsize : t -> Pango.ellipsizemode -> unit = "ml_gtk_progress_bar_set_ellipsize"

(** Indicates that some progress has been made, but you don’t know how much.

Causes the progress bar to enter “activity mode,” where a block
bounces back and forth. Each call to [method@Gtk.ProgressBar.pulse]
causes the block to move by a little bit (the amount of movement
per pulse is determined by [method@Gtk.ProgressBar.set_pulse_step]). *)
external pulse : t -> unit = "ml_gtk_progress_bar_pulse"

(** Returns the ellipsizing position of the progress bar.

See [method@Gtk.ProgressBar.set_ellipsize]. *)
external get_ellipsize : t -> Pango.ellipsizemode = "ml_gtk_progress_bar_get_ellipsize"

