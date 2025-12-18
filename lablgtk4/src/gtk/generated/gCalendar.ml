(* Signal class defined in gcalendar_signals.ml *)

(* High-level class for Calendar *)
class calendar (obj : Calendar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Calendar.as_widget obj)
  inherit Gcalendar_signals.calendar_signals obj

  method day = Calendar.get_day obj
  method set_day v = Calendar.set_day obj v

  method month = Calendar.get_month obj
  method set_month v = Calendar.set_month obj v

  method show_day_names = Calendar.get_show_day_names obj
  method set_show_day_names v = Calendar.set_show_day_names obj v

  method show_heading = Calendar.get_show_heading obj
  method set_show_heading v = Calendar.set_show_heading obj v

  method show_week_numbers = Calendar.get_show_week_numbers obj
  method set_show_week_numbers v = Calendar.set_show_week_numbers obj v

  method year = Calendar.get_year obj
  method set_year v = Calendar.set_year obj v

  method clear_marks : unit -> unit = fun () -> (Calendar.clear_marks obj )

  method get_day_is_marked : int -> bool = fun day -> (Calendar.get_day_is_marked obj day)

  method mark_day : int -> unit = fun day -> (Calendar.mark_day obj day)

  method unmark_day : int -> unit = fun day -> (Calendar.unmark_day obj day)

  method as_widget = (Calendar.as_widget obj)
    method as_calendar = obj
end

