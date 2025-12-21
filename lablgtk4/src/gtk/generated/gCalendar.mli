class calendar : Calendar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcalendar_signals.calendar_signals
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
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_calendar : Calendar.t
  end

