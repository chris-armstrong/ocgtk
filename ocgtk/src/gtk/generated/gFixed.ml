(* High-level class for Fixed *)
class fixed (obj : Fixed.t) = object (self)

  method get_child_transform : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> Ocgtk_gsk.Gsk.transform option =
    fun widget ->
      let widget = widget#as_widget in
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.transform ret) (Fixed.get_child_transform obj widget)

  method move : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> float -> float -> unit =
    fun widget x y ->
      let widget = widget#as_widget in
      (Fixed.move obj widget x y)

  method put : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> float -> float -> unit =
    fun widget x y ->
      let widget = widget#as_widget in
      (Fixed.put obj widget x y)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Fixed.remove obj widget)

  method set_child_transform : 'p1 'p2. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#Ocgtk_gsk.Gsk.transform as 'p2) option -> unit =
    fun widget transform ->
      let widget = widget#as_widget in
      let transform = Option.map (fun (c) -> c#as_transform) transform in
      (Fixed.set_child_transform obj widget transform)

    method as_fixed = obj
end

