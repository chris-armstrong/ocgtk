class type list_item_t = object
  (** {2:methods Methods} *)

  method get_accessible_description : unit -> string
  (** Gets the accessible description of [self]. *)

  method get_accessible_label : unit -> string
  (** Gets the accessible label of [self]. *)

  method get_activatable : unit -> bool
  (** Checks if a listitem has been set to be activatable via
      [Gtk.ListItem.set_activatable]. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child previously set via [Gtk.ListItem.set_child] or [NULL] if
      none was set. *)

  method get_focusable : unit -> bool
  (** Checks if a listitem has been set to be focusable via
      [Gtk.ListItem.set_focusable]. *)

  method get_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the model item that associated with [self].

      If [self] is unbound, this function returns [NULL]. *)

  method get_position : unit -> int
  (** Gets the position in the model that [self] currently displays.

      If [self] is unbound, [GTK_INVALID_LIST_POSITION] is returned. *)

  method get_selectable : unit -> bool
  (** Checks if a listitem has been set to be selectable via
      [Gtk.ListItem.set_selectable].

      Do not confuse this function with [Gtk.ListItem.get_selected]. *)

  method get_selected : unit -> bool
  (** Checks if the item is displayed as selected.

      The selected state is maintained by the list widget and its model and
      cannot be set otherwise. *)

  method set_accessible_description : string -> unit
  (** Sets the accessible description for the listitem.

      The accessible description may be used by e.g. screen readers. *)

  method set_accessible_label : string -> unit
  (** Sets the accessible label for the listitem.

      The accessible label may be used by e.g. screen readers. *)

  method set_activatable : bool -> unit
  (** Sets [self] to be activatable.

      If an item is activatable, double-clicking on the item, using the Return
      key or calling [Gtk.Widget.activate] will activate the item. Activating
      instructs the containing view to handle activation. [GtkListView] for
      example will be emitting the [Gtk.ListView::activate] signal.

      By default, listitems are activatable. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child to be used for this listitem.

      This function is typically called by applications when setting up a
      listitem so that the widget can be reused when binding it multiple times.
  *)

  method set_focusable : bool -> unit
  (** Sets [self] to be focusable.

      If an item is focusable, it can be focused using the keyboard. This works
      similar to [Gtk.Widget.set_focusable].

      Note that if items are not focusable, the keyboard cannot be used to
      activate them and selecting only works if one of the listitem's children
      is focusable.

      By default, listitems are focusable. *)

  method set_selectable : bool -> unit
  (** Sets [self] to be selectable.

      If an item is selectable, clicking on the item or using the keyboard will
      try to select or unselect the item. If this succeeds is up to the model to
      determine, as it is managing the selected state.

      Note that this means that making an item non-selectable has no influence
      on the selected state at all. A non-selectable item may still be selected.

      By default, listitems are selectable. When rebinding them to a new item,
      they will also be reset to be selectable by GTK. *)

  (** {2:conversions Conversions} *)

  method as_list_item : Raw.List_item.t
end

(* High-level class for ListItem *)
class list_item (obj : Raw.List_item.t) : list_item_t =
  object (self)
    method get_accessible_description : unit -> string =
      fun () -> Raw.List_item.get_accessible_description obj

    method get_accessible_label : unit -> string =
      fun () -> Raw.List_item.get_accessible_label obj

    method get_activatable : unit -> bool =
      fun () -> Raw.List_item.get_activatable obj

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
          (Raw.List_item.get_child obj)

    method get_focusable : unit -> bool =
      fun () -> Raw.List_item.get_focusable obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.List_item.get_item obj

    method get_position : unit -> int = fun () -> Raw.List_item.get_position obj

    method get_selectable : unit -> bool =
      fun () -> Raw.List_item.get_selectable obj

    method get_selected : unit -> bool =
      fun () -> Raw.List_item.get_selected obj

    method set_accessible_description : string -> unit =
      fun description ->
        Raw.List_item.set_accessible_description obj description

    method set_accessible_label : string -> unit =
      fun label -> Raw.List_item.set_accessible_label obj label

    method set_activatable : bool -> unit =
      fun activatable -> Raw.List_item.set_activatable obj activatable

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.List_item.set_child obj child

    method set_focusable : bool -> unit =
      fun focusable -> Raw.List_item.set_focusable obj focusable

    method set_selectable : bool -> unit =
      fun selectable -> Raw.List_item.set_selectable obj selectable

    method as_list_item = obj
  end
