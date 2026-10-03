(* GENERATED CODE - DO NOT EDIT *)
(* MenuButton: MenuButton *)

type t = [ `menu_button | `widget | `initially_unowned | `object_ ] Gobject.obj
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

    [GtkMenuButton] uses the [Gtk.AccessibleRole.button] role. *)

external new_ : unit -> t = "ml_gtk_menu_button_new"
(** Create a new MenuButton *)

(* Methods *)

external set_use_underline : t -> bool -> unit
  = "ml_gtk_menu_button_set_use_underline"
(** If true, an underline in the text indicates a mnemonic. *)

external set_primary : t -> bool -> unit = "ml_gtk_menu_button_set_primary"
(** Sets whether menu button acts as a primary menu.

    Primary menus can be opened with the <kbd>F10</kbd> key. *)

external set_popover : t -> Popover.t option -> unit
  = "ml_gtk_menu_button_set_popover"
(** Sets the [GtkPopover] that will be popped up when the [menu_button] is
    clicked.

    If [popover] is [NULL], the button is disabled.

    If [Gtk.MenuButton:menu-model] is set, the menu model is dissociated from
    the [menu_button], and the property is set to [NULL]. *)

external set_menu_model :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_menu_button_set_menu_model"
(** Sets the [GMenuModel] from which the popup will be constructed.

    If [menu_model] is [NULL], the button is disabled.

    A [Gtk.Popover] will be created from the menu model with
    [Gtk.PopoverMenu.new_from_model]. Actions will be connected as documented
    for this function.

    If [Gtk.MenuButton:popover] is already set, it will be dissociated from the
    [menu_button], and the property is set to [NULL]. *)

external set_label : t -> string -> unit = "ml_gtk_menu_button_set_label"
(** Sets the label to show inside the menu button.

    Setting a label resets [Gtk.MenuButton:icon-name] and
    [Gtk.MenuButton:child].

    If [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will
    be shown next to the label. *)

external set_icon_name : t -> string -> unit
  = "ml_gtk_menu_button_set_icon_name"
(** Sets the name of an icon to show inside the menu button.

    Setting icon name resets [Gtk.MenuButton:label] and [Gtk.MenuButton:child].

    If [Gtk.MenuButton:always-show-arrow] is set to [TRUE] and
    [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will be
    shown next to the icon. *)

external set_has_frame : t -> bool -> unit = "ml_gtk_menu_button_set_has_frame"
(** Sets the style of the button. *)

external set_direction : t -> Gtk_enums.arrowtype -> unit
  = "ml_gtk_menu_button_set_direction"
(** Sets the direction in which the popup will be popped up.

    If the button is automatically populated with an arrow icon, its direction
    will be changed to match.

    If the does not fit in the available space in the given direction, GTK will
    its best to keep it inside the screen and fully visible.

    If you pass [GTK_ARROW_NONE] for a [direction], the popup will behave as if
    you passed [GTK_ARROW_DOWN] (although you won’t see any arrows). *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_menu_button_set_child"
(** Sets the child widget of [menu_button].

    Setting a child resets [Gtk.MenuButton:label] and
    [Gtk.MenuButton:icon-name].

    If [Gtk.MenuButton:always-show-arrow] is set to [TRUE] and
    [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will be
    shown next to the child. *)

external set_can_shrink : t -> bool -> unit
  = "ml_gtk_menu_button_set_can_shrink"
(** Sets whether the button size can be smaller than the natural size of its
    contents.

    For text buttons, setting [can_shrink] to true will ellipsize the label.

    For icon buttons, this function has no effect. *)

external set_always_show_arrow : t -> bool -> unit
  = "ml_gtk_menu_button_set_always_show_arrow"
(** Sets whether to show a dropdown arrow even when using an icon or a custom
    child. *)

external set_active : t -> bool -> unit = "ml_gtk_menu_button_set_active"
(** Sets whether the menu button is active. *)

external popup : t -> unit = "ml_gtk_menu_button_popup"
(** Pop up the menu. *)

external popdown : t -> unit = "ml_gtk_menu_button_popdown"
(** Dismiss the menu. *)

external get_use_underline : t -> bool = "ml_gtk_menu_button_get_use_underline"
(** Returns whether an embedded underline in the text indicates a mnemonic. *)

external get_primary : t -> bool = "ml_gtk_menu_button_get_primary"
(** Returns whether the menu button acts as a primary menu. *)

external get_popover : t -> Popover.t option = "ml_gtk_menu_button_get_popover"
(** Returns the [GtkPopover] that pops out of the button.

    If the button is not using a [GtkPopover], this function returns [NULL]. *)

external get_menu_model : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_menu_button_get_menu_model"
(** Returns the [GMenuModel] used to generate the popup. *)

external get_label : t -> string option = "ml_gtk_menu_button_get_label"
(** Gets the label shown in the button *)

external get_icon_name : t -> string option = "ml_gtk_menu_button_get_icon_name"
(** Gets the name of the icon shown in the button. *)

external get_has_frame : t -> bool = "ml_gtk_menu_button_get_has_frame"
(** Returns whether the button has a frame. *)

external get_direction : t -> Gtk_enums.arrowtype
  = "ml_gtk_menu_button_get_direction"
(** Returns the direction the popup will be pointing at when popped up. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_menu_button_get_child"
(** Gets the child widget of [menu_button]. *)

external get_can_shrink : t -> bool = "ml_gtk_menu_button_get_can_shrink"
(** Retrieves whether the button can be smaller than the natural size of its
    contents. *)

external get_always_show_arrow : t -> bool
  = "ml_gtk_menu_button_get_always_show_arrow"
(** Gets whether to show a dropdown arrow even when using an icon or a custom
    child. *)

external get_active : t -> bool = "ml_gtk_menu_button_get_active"
(** Returns whether the menu button is active. *)

(* Properties *)

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)
