(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Calendar *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_calendar_new"

(* Properties *)

external get_day : t -> int = "ml_gtk_calendar_get_day"

external set_day : t -> int -> unit = "ml_gtk_calendar_set_day"

external get_month : t -> int = "ml_gtk_calendar_get_month"

external set_month : t -> int -> unit = "ml_gtk_calendar_set_month"

external get_show_day_names : t -> bool = "ml_gtk_calendar_get_show_day_names"

external set_show_day_names : t -> bool -> unit = "ml_gtk_calendar_set_show_day_names"

external get_show_heading : t -> bool = "ml_gtk_calendar_get_show_heading"

external set_show_heading : t -> bool -> unit = "ml_gtk_calendar_set_show_heading"

external get_show_week_numbers : t -> bool = "ml_gtk_calendar_get_show_week_numbers"

external set_show_week_numbers : t -> bool -> unit = "ml_gtk_calendar_set_show_week_numbers"

external get_year : t -> int = "ml_gtk_calendar_get_year"

external set_year : t -> int -> unit = "ml_gtk_calendar_set_year"

external unmark_day : t -> int -> unit = "ml_gtk_calendar_unmark_day"

external mark_day : t -> int -> unit = "ml_gtk_calendar_mark_day"

external get_day_is_marked : t -> int -> bool = "ml_gtk_calendar_get_day_is_marked"

external clear_marks : t -> unit = "ml_gtk_calendar_clear_marks"

