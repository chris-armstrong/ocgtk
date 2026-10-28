(** Used by list widgets to represent items in a [Gio.ListModel].

    Its methods, signals and properties are on {!class-type-list_item_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgtk.Raw.List_item}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ListItem].}

    Used by list widgets to represent items in a [Gio.ListModel].

    [GtkListItem] objects are managed by the list widget (with its factory) and
    cannot be created by applications, but they need to be populated by
    application code. This is done by calling [Gtk.ListItem.set_child].

    [GtkListItem] objects exist in 2 stages:

    + The unbound stage where the listitem is not currently connected to an item
      in the list. In that case, the [Gtk.ListItem:item] property is set to
      [NULL].

    + The bound stage where the listitem references an item from the list. The
      [Gtk.ListItem:item] property is not [NULL]. *)
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

class list_item : Raw.List_item.t -> list_item_t
(** Wraps a raw handle of {!Ocgtk.Raw.List_item.t}. *)

(** {1:description Description}

    Used by list widgets to represent items in a [Gio.ListModel].

    [GtkListItem] objects are managed by the list widget (with its factory) and
    cannot be created by applications, but they need to be populated by
    application code. This is done by calling [Gtk.ListItem.set_child].

    [GtkListItem] objects exist in 2 stages:

    + The unbound stage where the listitem is not currently connected to an item
      in the list. In that case, the [Gtk.ListItem:item] property is set to
      [NULL].

    + The bound stage where the listitem references an item from the list. The
      [Gtk.ListItem:item] property is not [NULL]. *)
