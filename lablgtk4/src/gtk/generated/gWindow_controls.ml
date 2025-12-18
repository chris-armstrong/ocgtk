(* High-level class for WindowControls *)
class window_controls (obj : Window_controls.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Window_controls.as_widget obj)

  method decoration_layout = Window_controls.get_decoration_layout obj
  method set_decoration_layout v = Window_controls.set_decoration_layout obj v

  method empty = Window_controls.get_empty obj

  method get_side : unit -> Gtk_enums.packtype = fun () -> (Window_controls.get_side obj )

  method set_side : Gtk_enums.packtype -> unit = fun side -> (Window_controls.set_side obj side)

  method as_widget = (Window_controls.as_widget obj)
    method as_window_controls = obj
end

