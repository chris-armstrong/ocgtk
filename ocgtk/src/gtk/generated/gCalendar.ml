(* Signal class defined in gcalendar_signals.ml *)

class type calendar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
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
    method as_calendar : Calendar.t
end

(* High-level class for Calendar *)
class calendar (obj : Calendar.t) : calendar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gcalendar_signals.calendar_signals obj

  method clear_marks : unit -> unit =
    fun () ->
      (Calendar.clear_marks obj)

  method get_day : unit -> int =
    fun () ->
      (Calendar.get_day obj)

  method get_day_is_marked : int -> bool =
    fun day ->
      (Calendar.get_day_is_marked obj day)

  method get_month : unit -> int =
    fun () ->
      (Calendar.get_month obj)

  method get_show_day_names : unit -> bool =
    fun () ->
      (Calendar.get_show_day_names obj)

  method get_show_heading : unit -> bool =
    fun () ->
      (Calendar.get_show_heading obj)

  method get_show_week_numbers : unit -> bool =
    fun () ->
      (Calendar.get_show_week_numbers obj)

  method get_year : unit -> int =
    fun () ->
      (Calendar.get_year obj)

  method mark_day : int -> unit =
    fun day ->
      (Calendar.mark_day obj day)

  method set_day : int -> unit =
    fun day ->
      (Calendar.set_day obj day)

  method set_month : int -> unit =
    fun month ->
      (Calendar.set_month obj month)

  method set_show_day_names : bool -> unit =
    fun value ->
      (Calendar.set_show_day_names obj value)

  method set_show_heading : bool -> unit =
    fun value ->
      (Calendar.set_show_heading obj value)

  method set_show_week_numbers : bool -> unit =
    fun value ->
      (Calendar.set_show_week_numbers obj value)

  method set_year : int -> unit =
    fun year ->
      (Calendar.set_year obj year)

  method unmark_day : int -> unit =
    fun day ->
      (Calendar.unmark_day obj day)

    method as_calendar = obj
end

let new_ () : calendar_t =
  new calendar (Calendar.new_ ())

