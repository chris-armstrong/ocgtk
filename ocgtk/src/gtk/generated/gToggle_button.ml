(* Signal class defined in gtoggle_button_signals.ml *)

(* High-level class for ToggleButton *)
class toggle_button (obj : Toggle_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Toggle_button.as_widget obj)
  inherit Gtoggle_button_signals.toggle_button_signals obj

  method get_active : unit -> bool =
    fun () ->
      (Toggle_button.get_active obj)

  method set_active : bool -> unit =
    fun is_active ->
      (Toggle_button.set_active obj is_active)

  method set_group : 'p1. (<as_toggle_button: Toggle_button.t; ..> as 'p1) option -> unit =
    fun group ->
      let group = Option.map (fun (c) -> c#as_toggle_button) group in
      (Toggle_button.set_group obj group)

  method toggled : unit -> unit =
    fun () ->
      (Toggle_button.toggled obj)

  method as_widget = (Toggle_button.as_widget obj)
    method as_toggle_button = obj
end

