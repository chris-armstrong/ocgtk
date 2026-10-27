(** Displays a Gregorian calendar, one month at a time.

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

    Marked day labels get the :selected state assigned.

    Its methods, signals and properties are on {!class-type-calendar_t}. The
    functions it is built on are in {!Ocgtk.Raw.Calendar}. *)

(** The methods, signals and properties of a [GtkCalendar]. *)
class type calendar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_day_selected :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_next_month :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_next_year :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_prev_month :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_prev_year :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method clear_marks : unit -> unit
  method get_day : unit -> int
  method get_day_is_marked : int -> bool
  method get_month : unit -> int
  method get_show_day_names : unit -> bool
  method get_show_heading : unit -> bool
  method get_show_week_numbers : unit -> bool
  method get_year : unit -> int
  method mark_day : int -> unit
  method set_day : int -> unit
  method set_month : int -> unit
  method set_show_day_names : bool -> unit
  method set_show_heading : bool -> unit
  method set_show_week_numbers : bool -> unit
  method set_year : int -> unit
  method unmark_day : int -> unit
  method as_calendar : Raw.Calendar.t
end

class calendar : Raw.Calendar.t -> calendar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Calendar.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCalendar], give one already wrapped. *)

val new_ : unit -> calendar_t
