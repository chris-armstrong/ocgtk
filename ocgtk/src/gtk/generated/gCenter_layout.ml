class type center_layout_t = object
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_orientation : unit -> Gtk_enums.orientation
    method get_shrink_center_last : unit -> bool
    method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_end_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_orientation : Gtk_enums.orientation -> unit
    method set_shrink_center_last : bool -> unit
    method set_start_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_center_layout : Center_layout.t
end

(* High-level class for CenterLayout *)
class center_layout (obj : Center_layout.t) : center_layout_t = object (self)

  method get_baseline_position : unit -> Gtk_enums.baselineposition =
    fun () ->
      (Center_layout.get_baseline_position obj)

  method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_center_widget obj)

  method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_end_widget obj)

  method get_orientation : unit -> Gtk_enums.orientation =
    fun () ->
      (Center_layout.get_orientation obj)

  method get_shrink_center_last : unit -> bool =
    fun () ->
      (Center_layout.get_shrink_center_last obj)

  method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_layout.get_start_widget obj)

  method set_baseline_position : Gtk_enums.baselineposition -> unit =
    fun baseline_position ->
      (Center_layout.set_baseline_position obj baseline_position)

  method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_center_widget obj widget)

  method set_end_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_end_widget obj widget)

  method set_orientation : Gtk_enums.orientation -> unit =
    fun orientation ->
      (Center_layout.set_orientation obj orientation)

  method set_shrink_center_last : bool -> unit =
    fun shrink_center_last ->
      (Center_layout.set_shrink_center_last obj shrink_center_last)

  method set_start_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Center_layout.set_start_widget obj widget)

    method as_center_layout = obj
end

