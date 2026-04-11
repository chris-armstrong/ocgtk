class type separator_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GOrientable.orientable_t
    method as_separator : Separator.t
end

(* High-level class for Separator *)
class separator (obj : Separator.t) : separator_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GOrientable.orientable (Orientable.from_gobject obj)

    method as_separator = obj
end

let new_ (orientation : Gtk_enums.orientation) : separator_t =
  let obj_ = Separator.new_ orientation in
  new separator obj_

