class type size_group_t = object
    inherit GBuildable.buildable_t
    method add_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_mode : unit -> Gtk_enums.sizegroupmode
    method get_widgets : unit -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t list
    method remove_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_mode : Gtk_enums.sizegroupmode -> unit
    method as_size_group : Size_group.t
end

(* High-level class for SizeGroup *)
class size_group (obj : Size_group.t) : size_group_t = object (self)
  inherit GBuildable.buildable (Buildable.from_gobject obj)

  method add_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Size_group.add_widget obj widget)

  method get_mode : unit -> Gtk_enums.sizegroupmode =
    fun () ->
      (Size_group.get_mode obj)

  method get_widgets : unit -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t list =
    fun () ->
      (Size_group.get_widgets obj)

  method remove_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Size_group.remove_widget obj widget)

  method set_mode : Gtk_enums.sizegroupmode -> unit =
    fun mode ->
      (Size_group.set_mode obj mode)

    method as_size_group = obj
end

let new_ (mode : Gtk_enums.sizegroupmode) : size_group_t =
  let obj_ = Size_group.new_ mode in
  new size_group obj_

