class type fixed_layout_child_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_child_t
    method get_transform : unit -> Ocgtk_gsk.Gsk.Transform.transform_t option
    method set_transform : Ocgtk_gsk.Gsk.Transform.transform_t -> unit
    method as_fixed_layout_child : Fixed_layout_child.t
end

(* High-level class for FixedLayoutChild *)
class fixed_layout_child (obj : Fixed_layout_child.t) : fixed_layout_child_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_child (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t)

  method get_transform : unit -> Ocgtk_gsk.Gsk.Transform.transform_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.Transform.transform ret) (Fixed_layout_child.get_transform obj)

  method set_transform : Ocgtk_gsk.Gsk.Transform.transform_t -> unit =
    fun transform ->
      let transform = transform#as_transform in
      (Fixed_layout_child.set_transform obj transform)

    method as_fixed_layout_child = obj
end

