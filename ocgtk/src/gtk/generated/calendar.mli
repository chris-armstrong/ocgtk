(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Calendar *)

type t = [`calendar | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Calendar *)
external new_ : unit -> t = "ml_gtk_calendar_new"

(* Methods *)
(** Removes the visual marker from a particular day. *)
external unmark_day : t -> int -> unit = "ml_gtk_calendar_unmark_day"

(** Sets the year for the selected date.

The new date must be valid. For example, setting 2023 for the year when then
the date is 2024-02-29, fails. *)
external set_year : t -> int -> unit = "ml_gtk_calendar_set_year"

(** Sets whether week numbers are shown in the calendar. *)
external set_show_week_numbers : t -> bool -> unit = "ml_gtk_calendar_set_show_week_numbers"

(** Sets whether the calendar should show a heading.

The heading contains the current year and month as well as
buttons for changing both. *)
external set_show_heading : t -> bool -> unit = "ml_gtk_calendar_set_show_heading"

(** Sets whether the calendar shows day names. *)
external set_show_day_names : t -> bool -> unit = "ml_gtk_calendar_set_show_day_names"

(** Sets the month for the selected date.

The new date must be valid. For example, setting 1 (February) for the month
when the day is 31, fails. *)
external set_month : t -> int -> unit = "ml_gtk_calendar_set_month"

(** Sets the day for the selected date.

The new date must be valid. For example, setting 31 for the day when the
month is February, fails. *)
external set_day : t -> int -> unit = "ml_gtk_calendar_set_day"

(** Places a visual marker on a particular day of the current month. *)
external mark_day : t -> int -> unit = "ml_gtk_calendar_mark_day"

(** Gets the year of the selected date. *)
external get_year : t -> int = "ml_gtk_calendar_get_year"

(** Returns whether @self is showing week numbers right
now.

This is the value of the [property@Gtk.Calendar:show-week-numbers]
property. *)
external get_show_week_numbers : t -> bool = "ml_gtk_calendar_get_show_week_numbers"

(** Returns whether @self is currently showing the heading.

This is the value of the [property@Gtk.Calendar:show-heading]
property. *)
external get_show_heading : t -> bool = "ml_gtk_calendar_get_show_heading"

(** Returns whether @self is currently showing the names
of the week days.

This is the value of the [property@Gtk.Calendar:show-day-names]
property. *)
external get_show_day_names : t -> bool = "ml_gtk_calendar_get_show_day_names"

(** Gets the month of the selected date. *)
external get_month : t -> int = "ml_gtk_calendar_get_month"

(** Returns if the @day of the @calendar is already marked. *)
external get_day_is_marked : t -> int -> bool = "ml_gtk_calendar_get_day_is_marked"

(** Gets the day of the selected date. *)
external get_day : t -> int = "ml_gtk_calendar_get_day"

(** Remove all visual markers. *)
external clear_marks : t -> unit = "ml_gtk_calendar_clear_marks"

(* Properties *)

