class type spinner_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_spinning : unit -> bool
    method set_spinning : bool -> unit
    method start : unit -> unit
    method stop : unit -> unit
    method as_spinner : Spinner.t
end

(* High-level class for Spinner *)
class spinner (obj : Spinner.t) : spinner_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_spinning : unit -> bool =
    fun () ->
      (Spinner.get_spinning obj)

  method set_spinning : bool -> unit =
    fun spinning ->
      (Spinner.set_spinning obj spinning)

  method start : unit -> unit =
    fun () ->
      (Spinner.start obj)

  method stop : unit -> unit =
    fun () ->
      (Spinner.stop obj)

    method as_spinner = obj
end

let new_ () : spinner_t =
  new spinner (Spinner.new_ ())

