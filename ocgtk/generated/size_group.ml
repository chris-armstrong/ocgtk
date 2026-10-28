class type size_group_t = object
  inherit Buildable.buildable_t

  method add_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds a widget to a [GtkSizeGroup].

      In the future, the requisition of the widget will be determined as the
      maximum of its requisition and the requisition of the other widgets in the
      size group. Whether this applies horizontally, vertically, or in both
      directions depends on the mode of the size group. See
      [Gtk.SizeGroup.set_mode].

      When the widget is destroyed or no longer referenced elsewhere, it will be
      removed from the size group. *)

  method get_mode : unit -> Enums.sizegroupmode
  (** Gets the current mode of the size group. *)

  method get_widgets :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    list
  (** Returns the list of widgets associated with [size_group]. *)

  method remove_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a widget from a [GtkSizeGroup]. *)

  method set_mode : Enums.sizegroupmode -> unit
  (** Sets the [GtkSizeGroupMode] of the size group.

      The mode of the size group determines whether the widgets in the size
      group should all have the same horizontal requisition
      ([GTK_SIZE_GROUP_HORIZONTAL]) all have the same vertical requisition
      ([GTK_SIZE_GROUP_VERTICAL]), or should all have the same requisition in
      both directions ([GTK_SIZE_GROUP_BOTH]). *)

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
