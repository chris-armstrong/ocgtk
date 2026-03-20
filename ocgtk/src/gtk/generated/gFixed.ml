class type fixed_t = object
    method get_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option
    method move : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit
    method put : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option -> unit
    method as_fixed : Fixed.t
end

(* High-level class for Fixed *)
class fixed (obj : Fixed.t) : fixed_t = object (self)

  method get_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option =
    fun widget ->
      let widget = widget#as_widget in
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.transform ret) (Fixed.get_child_transform obj widget)

  method move : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit =
    fun widget x y ->
      let widget = widget#as_widget in
      (Fixed.move obj widget x y)

  method put : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit =
    fun widget x y ->
      let widget = widget#as_widget in
      (Fixed.put obj widget x y)

  method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Fixed.remove obj widget)

  method set_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option -> unit =
    fun widget transform ->
      let widget = widget#as_widget in
      let transform = Option.map (fun (c) -> c#as_transform) transform in
      (Fixed.set_child_transform obj widget transform)

    method as_fixed = obj
end

