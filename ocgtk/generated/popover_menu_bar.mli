(** Presents a horizontal bar of items that pop up menus when clicked.

    An example GtkPopoverMenuBar

    The only way to create instances of [GtkPopoverMenuBar] is from a
    [GMenuModel].

    {b CSS nodes}

    {[
    menubar
    ├── item[.active]
    ┊   ╰── popover
    ╰── item
        ╰── popover
    ]}

    [GtkPopoverMenuBar] has a single CSS node with name menubar, below which
    each item has its CSS node, and below that the corresponding popover.

    The item whose popover is currently open gets the .active style class.

    {b Accessibility}

    [GtkPopoverMenuBar] uses the [Gtk.AccessibleRole.menu_bar] role, the menu
    items use the [Gtk.AccessibleRole.menu_item] role and the menus use the
    [Gtk.AccessibleRole.menu] role.

    Its methods, signals and properties are on {!class-type-popover_menu_bar_t}.
    The functions it is built on are in {!Ocgtk.Raw.Popover_menu_bar}. *)

(** The methods, signals and properties of a [GtkPopoverMenuBar]. *)
class type popover_menu_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    bool

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  method as_popover_menu_bar : Raw.Popover_menu_bar.t
end

class popover_menu_bar : Raw.Popover_menu_bar.t -> popover_menu_bar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Popover_menu_bar.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkPopoverMenuBar], give one already wrapped. *)

val new_from_model : Ocgio.Menu_model.menu_model_t option -> popover_menu_bar_t
