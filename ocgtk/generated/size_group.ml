class type size_group_t = object
  inherit Buildable.buildable_t

  method add_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_mode : unit -> Enums.sizegroupmode

  method get_widgets :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    list

  method remove_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_mode : Enums.sizegroupmode -> unit
  method as_size_group : Raw.Size_group.t
end

(* High-level class for SizeGroup *)
class size_group (obj : Raw.Size_group.t) : size_group_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Size_group.add_widget obj widget

    method get_mode : unit -> Enums.sizegroupmode =
      fun () -> Raw.Size_group.get_mode obj

    method get_widgets :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        list =
      fun () ->
        (List.map (fun ret ->
             new
               Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
               .widget
               ret))
          (Raw.Size_group.get_widgets obj)

    method remove_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Size_group.remove_widget obj widget

    method set_mode : Enums.sizegroupmode -> unit =
      fun mode -> Raw.Size_group.set_mode obj mode

    method as_size_group = obj
  end

let new_ (mode : Enums.sizegroupmode) : size_group_t =
  let obj_ = Raw.Size_group.new_ mode in
  new size_group obj_
