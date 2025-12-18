(* High-level class for ActionBar *)
class action_bar (obj : Action_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Action_bar.as_widget obj)

  method revealed = Action_bar.get_revealed obj
  method set_revealed v = Action_bar.set_revealed obj v

  method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Action_bar.get_center_widget obj )

  method pack_end : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Action_bar.pack_end obj child)

  method pack_start : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Action_bar.pack_start obj child)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Action_bar.remove obj child)

  method set_center_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun center_widget ->
      let center_widget = Option.map (fun (c) -> c#as_widget) center_widget in
      (Action_bar.set_center_widget obj center_widget)

  method as_widget = (Action_bar.as_widget obj)
    method as_action_bar = obj
end

