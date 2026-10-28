(** Displays a Gregorian calendar, one month at a time.

    Its methods, signals and properties are on {!class-type-calendar_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Calendar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Calendar].}

    Displays a Gregorian calendar, one month at a time.

    An example GtkCalendar

    A [GtkCalendar] can be created with [Gtk.Calendar.new].

    The selected date can be retrieved from a [GtkCalendar] using
    [Gtk.Calendar.get_date]. It can be altered with [Gtk.Calendar.set_date].

    To place a visual marker on a particular day, use [Gtk.Calendar.mark_day]
    and to remove the marker, [Gtk.Calendar.unmark_day]. Alternative, all marks
    can be cleared with [Gtk.Calendar.clear_marks].

    Users should be aware that, although the Gregorian calendar is the legal
    calendar in most countries, it was adopted progressively between 1582 and
    1929. Display before these dates is likely to be historically incorrect.

    {b Shortcuts and Gestures}

    [GtkCalendar] supports the following gestures:

    - Scrolling up or down will switch to the previous or next month.
    - Date strings can be dropped for setting the current day.

    {b CSS nodes}

    {[
    calendar.view
    ├── header
    │   ├── button
    │   ├── stack.month
    │   ├── button
    │   ├── button
    │   ├── label.year
    │   ╰── button
    ╰── grid
        ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
    ]}

    [GtkCalendar] has a main node with name calendar. It contains a subnode
    called header containing the widgets for switching between years and months.

    The grid subnode contains all day labels, including week numbers on the left
    (marked with the .week-number css class) and day names on top (marked with
    the .day-name css class).

    Day labels that belong to the previous or next month get the .other-month
    style class. The label of the current day get the .today style class.

    Marked day labels get the :selected state assigned. *)
class type calendar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:signals Signals} *)

  method on_day_selected :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user selects a day. *)

  method on_next_month :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user switches to the next month. *)

  method on_next_year :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when user switches to the next year. *)

  method on_prev_month :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user switches to the previous month. *)

  method on_prev_year :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when user switches to the previous year. *)

  (** {2:methods Methods} *)

  method clear_marks : unit -> unit
  (** Remove all visual markers. *)

  method get_day : unit -> int
  (** Gets the day of the selected date. *)

  method get_day_is_marked : int -> bool
  (** Returns if the [day] of the [calendar] is already marked. *)

  method get_month : unit -> int
  (** Gets the month of the selected date. *)

  method get_show_day_names : unit -> bool
  (** Returns whether [self] is currently showing the names of the week days.

      This is the value of the [Gtk.Calendar:show-day-names] property. *)

  method get_show_heading : unit -> bool
  (** Returns whether [self] is currently showing the heading.

      This is the value of the [Gtk.Calendar:show-heading] property. *)

  method get_show_week_numbers : unit -> bool
  (** Returns whether [self] is showing week numbers right now.

      This is the value of the [Gtk.Calendar:show-week-numbers] property. *)

  method get_year : unit -> int
  (** Gets the year of the selected date. *)

  method mark_day : int -> unit
  (** Places a visual marker on a particular day of the current month. *)

  method set_day : int -> unit
  (** Sets the day for the selected date.

      The new date must be valid. For example, setting the day to 31 when the
      month is February will fail. *)

  method set_month : int -> unit
  (** Sets the month for the selected date.

      The new date must be valid. For example, setting the month to 1 (February)
      when the day is 31 will fail. *)

  method set_show_day_names : bool -> unit
  (** Sets whether the calendar shows day names. *)

  method set_show_heading : bool -> unit
  (** Sets whether the calendar should show a heading.

      The heading contains the current year and month as well as buttons for
      changing both. *)

  method set_show_week_numbers : bool -> unit
  (** Sets whether week numbers are shown in the calendar. *)

  method set_year : int -> unit
  (** Sets the year for the selected date.

      The new date must be valid. For example, setting the year to 2023 when the
      date is February 29 will fail. *)

  method unmark_day : int -> unit
  (** Removes the visual marker from a particular day. *)

  (** {2:conversions Conversions} *)

  method as_calendar : Raw.Calendar.t
end

class calendar : Raw.Calendar.t -> calendar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Calendar.t}. *)

(** {1:description Description}

    Displays a Gregorian calendar, one month at a time.

    An example GtkCalendar

    A [GtkCalendar] can be created with [Gtk.Calendar.new].

    The selected date can be retrieved from a [GtkCalendar] using
    [Gtk.Calendar.get_date]. It can be altered with [Gtk.Calendar.set_date].

    To place a visual marker on a particular day, use [Gtk.Calendar.mark_day]
    and to remove the marker, [Gtk.Calendar.unmark_day]. Alternative, all marks
    can be cleared with [Gtk.Calendar.clear_marks].

    Users should be aware that, although the Gregorian calendar is the legal
    calendar in most countries, it was adopted progressively between 1582 and
    1929. Display before these dates is likely to be historically incorrect.

    {b Shortcuts and Gestures}

    [GtkCalendar] supports the following gestures:

    - Scrolling up or down will switch to the previous or next month.
    - Date strings can be dropped for setting the current day.

    {b CSS nodes}

    {[
    calendar.view
    ├── header
    │   ├── button
    │   ├── stack.month
    │   ├── button
    │   ├── button
    │   ├── label.year
    │   ╰── button
    ╰── grid
        ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
    ]}

    [GtkCalendar] has a main node with name calendar. It contains a subnode
    called header containing the widgets for switching between years and months.

    The grid subnode contains all day labels, including week numbers on the left
    (marked with the .week-number css class) and day names on top (marked with
    the .day-name css class).

    Day labels that belong to the previous or next month get the .other-month
    style class. The label of the current day get the .today style class.

    Marked day labels get the :selected state assigned. *)

(** {1:constructors Constructors} *)

val new_ : unit -> calendar_t
(** Creates a new calendar, with the current date being selected. *)
