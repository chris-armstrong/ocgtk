(** Displays a popup when clicked.

    An example GtkMenuButton

    This popup can be provided either as a [GtkPopover] or as an abstract
    [GMenuModel].

    The [GtkMenuButton] widget can show either an icon (set with the
    [Gtk.MenuButton:icon-name] property) or a label (set with the
    [Gtk.MenuButton:label] property). If neither is explicitly set, a
    [Gtk.Image] is automatically created, using an arrow image oriented
    according to [Gtk.MenuButton:direction] or the generic “open-menu-symbolic”
    icon if the direction is not set.

    The positioning of the popup is determined by the [Gtk.MenuButton:direction]
    property of the menu button.

    For menus, the [Gtk.Widget:halign] and [Gtk.Widget:valign] properties of the
    menu are also taken into account. For example, when the direction is
    [GTK_ARROW_DOWN] and the horizontal alignment is [GTK_ALIGN_START], the menu
    will be positioned below the button, with the starting edge (depending on
    the text direction) of the menu aligned with the starting edge of the
    button. If there is not enough space below the button, the menu is popped up
    above the button instead. If the alignment would move part of the menu
    offscreen, it is “pushed in”.

    {b CSS nodes}

    {[
    menubutton
    ╰── button.toggle
        ╰── <content>
             ╰── [arrow]
    ]}

    [GtkMenuButton] has a single CSS node with name [menubutton] which contains
    a [button] node with a [.toggle] style class.

    If the button contains an icon, it will have the [.image-button] style
    class, if it contains text, it will have [.text-button] style class. If an
    arrow is visible in addition to an icon, text or a custom child, it will
    also have [.arrow-button] style class.

    Inside the toggle button content, there is an [arrow] node for the
    indicator, which will carry one of the [.none], [.up], [.down], [.left] or
    [.right] style classes to indicate the direction that the menu will appear
    in. The CSS is expected to provide a suitable image for each of these cases
    using the [-gtk-icon-source] property.

    Optionally, the [menubutton] node can carry the [.circular] style class to
    request a round appearance.

    {b Accessibility}

    [GtkMenuButton] uses the [Gtk.AccessibleRole.button] role.

    Its methods, signals and properties are on {!class-type-menu_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Menu_button}. *)

(** The methods, signals and properties of a [GtkMenuButton]. *)
class type menu_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_active : unit -> bool
  method get_always_show_arrow : unit -> bool
  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option
  method get_popover : unit -> Popover.popover_t option
  method get_primary : unit -> bool
  method get_use_underline : unit -> bool
  method popdown : unit -> unit
  method popup : unit -> unit
  method set_active : bool -> unit
  method set_always_show_arrow : bool -> unit
  method set_can_shrink : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  method set_popover : Popover.popover_t option -> unit
  method set_primary : bool -> unit
  method set_use_underline : bool -> unit
  method as_menu_button : Raw.Menu_button.t
end

class menu_button : Raw.Menu_button.t -> menu_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Menu_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkMenuButton], give one already wrapped. *)

val new_ : unit -> menu_button_t
