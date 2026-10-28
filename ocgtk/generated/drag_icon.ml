class type drag_icon_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t

  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .root_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the widget currently used as drag icon. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the widget to display as the drag icon. *)

  method as_drag_icon : Raw.Drag_icon.t
end

(* High-level class for DragIcon *)
class drag_icon (obj : Raw.Drag_icon.t) : drag_icon_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Native.native (Raw.Native.from_gobject obj)

    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .root
        (Raw.Root.from_gobject obj)

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Drag_icon.get_child obj)

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Drag_icon.set_child obj child

    method as_drag_icon = obj
  end

let get_for_drag (drag : Ocgdk.Drag.drag_t) : drag_icon_t =
  let drag = drag#as_drag in
  let obj_ = Raw.Drag_icon.get_for_drag drag in
  new drag_icon obj_
