class type spinner_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_spinning : unit -> bool
  method set_spinning : bool -> unit
  method start : unit -> unit
  method stop : unit -> unit
  method as_spinner : Raw.Spinner.t
end

(* High-level class for Spinner *)
class spinner (obj : Raw.Spinner.t) : spinner_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_spinning : unit -> bool = fun () -> Raw.Spinner.get_spinning obj

    method set_spinning : bool -> unit =
      fun spinning -> Raw.Spinner.set_spinning obj spinning

    method start : unit -> unit = fun () -> Raw.Spinner.start obj
    method stop : unit -> unit = fun () -> Raw.Spinner.stop obj
    method as_spinner = obj
  end

let new_ () : spinner_t = new spinner (Raw.Spinner.new_ ())
