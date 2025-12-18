class calendar : Calendar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcalendar_signals.calendar_signals
    method day : int
    method set_day : int -> unit
    method month : int
    method set_month : int -> unit
    method show_day_names : bool
    method set_show_day_names : bool -> unit
    method show_heading : bool
    method set_show_heading : bool -> unit
    method show_week_numbers : bool
    method set_show_week_numbers : bool -> unit
    method year : int
    method set_year : int -> unit
    method clear_marks : unit -> unit
    method get_day_is_marked : int -> bool
    method mark_day : int -> unit
    method unmark_day : int -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_calendar : Calendar.t
  end

