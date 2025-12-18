(* High-level class for CenterBox *)
class center_box (obj : Center_box.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Center_box.as_widget obj)

  method shrink_center_last = Center_box.get_shrink_center_last obj
  method set_shrink_center_last v = Center_box.set_shrink_center_last obj v

  method get_baseline_position : unit -> Gtk_enums.baselineposition = fun () -> (Center_box.get_baseline_position obj )

  method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_center_widget obj )

  method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_end_widget obj )

  method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_start_widget obj )

  method set_baseline_position : Gtk_enums.baselineposition -> unit = fun position -> (Center_box.set_baseline_position obj position)

  method set_center_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_center_widget obj child)

  method set_end_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_end_widget obj child)

  method set_start_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_start_widget obj child)

  method as_widget = (Center_box.as_widget obj)
    method as_center_box = obj
end

