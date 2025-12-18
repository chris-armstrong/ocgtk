(* High-level class for CenterLayout *)
class center_layout (obj : Center_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Center_layout.as_layoutmanager obj)

  method get_baseline_position : unit -> Gtk_enums.baselineposition = fun () -> (Center_layout.get_baseline_position obj )

  method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_center_widget obj )

  method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_end_widget obj )

  method get_orientation : unit -> Gtk_enums.orientation = fun () -> (Center_layout.get_orientation obj )

  method get_shrink_center_last : unit -> bool = fun () -> (Center_layout.get_shrink_center_last obj )

  method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_start_widget obj )

  method set_baseline_position : Gtk_enums.baselineposition -> unit = fun baseline_position -> (Center_layout.set_baseline_position obj baseline_position)

  method set_center_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_center_widget obj widget)

  method set_end_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_end_widget obj widget)

  method set_orientation : Gtk_enums.orientation -> unit = fun orientation -> (Center_layout.set_orientation obj orientation)

  method set_shrink_center_last : bool -> unit = fun shrink_center_last -> (Center_layout.set_shrink_center_last obj shrink_center_last)

  method set_start_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_start_widget obj widget)

  method as_layoutmanager = (Center_layout.as_layoutmanager obj)
    method as_center_layout = obj
end

