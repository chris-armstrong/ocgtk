(** Used by list widgets to represent items in a [Gio.ListModel].

    [GtkListItem] objects are managed by the list widget (with its factory) and
    cannot be created by applications, but they need to be populated by
    application code. This is done by calling [Gtk.ListItem.set_child].

    [GtkListItem] objects exist in 2 stages:

    + The unbound stage where the listitem is not currently connected to an item
      in the list. In that case, the [Gtk.ListItem:item] property is set to
      [NULL].

    + The bound stage where the listitem references an item from the list. The
      [Gtk.ListItem:item] property is not [NULL].

    Its methods, signals and properties are on {!class-type-list_item_t}. The
    functions it is built on are in {!Ocgtk.Raw.List_item}. *)

(** The methods, signals and properties of a [GtkListItem]. *)
class type list_item_t = object
  method get_accessible_description : unit -> string
  method get_accessible_label : unit -> string
  method get_activatable : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_focusable : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_position : unit -> int
  method get_selectable : unit -> bool
  method get_selected : unit -> bool
  method set_accessible_description : string -> unit
  method set_accessible_label : string -> unit
  method set_activatable : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_focusable : bool -> unit
  method set_selectable : bool -> unit
  method as_list_item : Raw.List_item.t
end

class list_item : Raw.List_item.t -> list_item_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.List_item.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkListItem], give one already wrapped. *)
