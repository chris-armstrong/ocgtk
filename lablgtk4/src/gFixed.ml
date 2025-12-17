(* High-level class for Fixed *)
class fixed (obj : Fixed.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Fixed.as_widget obj)

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

  method as_widget = (Fixed.as_widget obj)
    method as_fixed = obj
end

