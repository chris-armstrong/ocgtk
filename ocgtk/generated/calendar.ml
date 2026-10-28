class type calendar_t = object
  inherit Widget.widget_t

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

(* High-level class for Calendar *)
class calendar (obj : Raw.Calendar.t) : calendar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_day_selected ?(after = false) ~callback () =
      Raw.Calendar.on_day_selected ~after self#as_calendar ~callback

    method on_next_month ?(after = false) ~callback () =
      Raw.Calendar.on_next_month ~after self#as_calendar ~callback

    method on_next_year ?(after = false) ~callback () =
      Raw.Calendar.on_next_year ~after self#as_calendar ~callback

    method on_prev_month ?(after = false) ~callback () =
      Raw.Calendar.on_prev_month ~after self#as_calendar ~callback

    method on_prev_year ?(after = false) ~callback () =
      Raw.Calendar.on_prev_year ~after self#as_calendar ~callback

    method clear_marks : unit -> unit = fun () -> Raw.Calendar.clear_marks obj
    method get_day : unit -> int = fun () -> Raw.Calendar.get_day obj

    method get_day_is_marked : int -> bool =
      fun day -> Raw.Calendar.get_day_is_marked obj day

    method get_month : unit -> int = fun () -> Raw.Calendar.get_month obj

    method get_show_day_names : unit -> bool =
      fun () -> Raw.Calendar.get_show_day_names obj

    method get_show_heading : unit -> bool =
      fun () -> Raw.Calendar.get_show_heading obj

    method get_show_week_numbers : unit -> bool =
      fun () -> Raw.Calendar.get_show_week_numbers obj

    method get_year : unit -> int = fun () -> Raw.Calendar.get_year obj
    method mark_day : int -> unit = fun day -> Raw.Calendar.mark_day obj day
    method set_day : int -> unit = fun day -> Raw.Calendar.set_day obj day

    method set_month : int -> unit =
      fun month -> Raw.Calendar.set_month obj month

    method set_show_day_names : bool -> unit =
      fun value -> Raw.Calendar.set_show_day_names obj value

    method set_show_heading : bool -> unit =
      fun value -> Raw.Calendar.set_show_heading obj value

    method set_show_week_numbers : bool -> unit =
      fun value -> Raw.Calendar.set_show_week_numbers obj value

    method set_year : int -> unit = fun year -> Raw.Calendar.set_year obj year
    method unmark_day : int -> unit = fun day -> Raw.Calendar.unmark_day obj day
    method as_calendar = obj
  end

let new_ () : calendar_t = new calendar (Raw.Calendar.new_ ())
