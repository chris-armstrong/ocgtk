(* High-level class for BoxLayout *)
class box_layout (obj : Box_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Box_layout.as_layoutmanager obj)

  method baseline_child = Box_layout.get_baseline_child obj
  method set_baseline_child v = Box_layout.set_baseline_child obj v

  method homogeneous = Box_layout.get_homogeneous obj
  method set_homogeneous v = Box_layout.set_homogeneous obj v

  method spacing = Box_layout.get_spacing obj
  method set_spacing v = Box_layout.set_spacing obj v

  method get_baseline_position : unit -> Gtk_enums.baselineposition = fun () -> (Box_layout.get_baseline_position obj )

  method set_baseline_position : Gtk_enums.baselineposition -> unit = fun position -> (Box_layout.set_baseline_position obj position)

  method as_layoutmanager = (Box_layout.as_layoutmanager obj)
    method as_box_layout = obj
end

