class type separator_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  method as_separator : Raw.Separator.t
end

(* High-level class for Separator *)
class separator (obj : Raw.Separator.t) : separator_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)
    method as_separator = obj
  end

let new_ (orientation : Enums.orientation) : separator_t =
  let obj_ = Raw.Separator.new_ orientation in
  new separator obj_
