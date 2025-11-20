(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Calendar *)

type t = Gtk.Widget.t

(** Create a new Calendar *)
external new_ : unit -> t = "ml_gtk_calendar_new"

(* Properties *)

(** Get property: day *)
external get_day : t -> int = "ml_gtk_calendar_get_day"

(** Set property: day *)
external set_day : t -> int -> unit = "ml_gtk_calendar_set_day"

(** Get property: month *)
external get_month : t -> int = "ml_gtk_calendar_get_month"

(** Set property: month *)
external set_month : t -> int -> unit = "ml_gtk_calendar_set_month"

(** Get property: show-day-names *)
external get_show_day_names : t -> bool = "ml_gtk_calendar_get_show_day_names"

(** Set property: show-day-names *)
external set_show_day_names : t -> bool -> unit = "ml_gtk_calendar_set_show_day_names"

(** Get property: show-heading *)
external get_show_heading : t -> bool = "ml_gtk_calendar_get_show_heading"

(** Set property: show-heading *)
external set_show_heading : t -> bool -> unit = "ml_gtk_calendar_set_show_heading"

(** Get property: show-week-numbers *)
external get_show_week_numbers : t -> bool = "ml_gtk_calendar_get_show_week_numbers"

(** Set property: show-week-numbers *)
external set_show_week_numbers : t -> bool -> unit = "ml_gtk_calendar_set_show_week_numbers"

(** Get property: year *)
external get_year : t -> int = "ml_gtk_calendar_get_year"

(** Set property: year *)
external set_year : t -> int -> unit = "ml_gtk_calendar_set_year"

external unmark_day : t -> int -> unit = "ml_gtk_calendar_unmark_day"

external select_day : t -> unit -> unit = "ml_gtk_calendar_select_day"

external mark_day : t -> int -> unit = "ml_gtk_calendar_mark_day"

external get_day_is_marked : t -> int -> bool = "ml_gtk_calendar_get_day_is_marked"

external clear_marks : t -> unit = "ml_gtk_calendar_clear_marks"

