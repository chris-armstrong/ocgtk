(* High-level class for Spinner *)
class spinner (obj : Spinner.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Spinner.as_widget obj)

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

  method as_widget = (Spinner.as_widget obj)
    method as_spinner = obj
end

