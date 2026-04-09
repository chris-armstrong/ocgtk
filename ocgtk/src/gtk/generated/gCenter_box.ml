class type center_box_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GOrientable.orientable_t
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_shrink_center_last : unit -> bool
    method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_end_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_shrink_center_last : bool -> unit
    method set_start_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_center_box : Center_box.t
end

(* High-level class for CenterBox *)
class center_box (obj : Center_box.t) : center_box_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GOrientable.orientable (Orientable.from_gobject obj)

  method get_baseline_position : unit -> Gtk_enums.baselineposition =
    fun () ->
      (Center_box.get_baseline_position obj)

  method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_center_widget obj)

  method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_end_widget obj)

  method get_shrink_center_last : unit -> bool =
    fun () ->
      (Center_box.get_shrink_center_last obj)

  method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Center_box.get_start_widget obj)

  method set_baseline_position : Gtk_enums.baselineposition -> unit =
    fun position ->
      (Center_box.set_baseline_position obj position)

  method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_center_widget obj child)

  method set_end_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_end_widget obj child)

  method set_shrink_center_last : bool -> unit =
    fun shrink_center_last ->
      (Center_box.set_shrink_center_last obj shrink_center_last)

  method set_start_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Center_box.set_start_widget obj child)

    method as_center_box = obj
end

let new_ () : center_box_t =
  new center_box (Center_box.new_ ())

