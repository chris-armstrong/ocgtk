(* GENERATED CODE - DO NOT EDIT *)
(* PopoverMenu: PopoverMenu *)

(** A subclass of [GtkPopover] that implements menu behavior.

    An example GtkPopoverMenu

    [GtkPopoverMenu] treats its children like menus and allows switching between
    them. It can open submenus as traditional, nested submenus, or in a more
    touch-friendly sliding fashion. The property [Gtk.PopoverMenu:flags]
    controls this appearance.

    [GtkPopoverMenu] is meant to be used primarily with menu models, using
    [Gtk.PopoverMenu.new_from_model]. If you need to put other widgets such as a
    [GtkSpinButton] or a [GtkSwitch] into a popover, you can use
    [Gtk.PopoverMenu.add_child].

    For more dialog-like behavior, use a plain [GtkPopover].

    {b Menu models}

    The XML format understood by [GtkBuilder] for [GMenuModel] consists of a
    toplevel [<menu>] element, which contains one or more [<item>] elements.
    Each [<item>] element contains [<attribute>] and [<link>] elements with a
    mandatory name attribute. [<link>] elements have the same content model as
    [<menu>]. Instead of [<link name=”submenu”>] or [<link name=”section”>], you
    can use [<submenu>] or [<section>] elements.

    {[
    <menu id='app-menu'>
      <section>
        <item>
          <attribute name='label' translatable='yes'>_New Window</attribute>
          <attribute name='action'>app.new</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_About Sunny</attribute>
          <attribute name='action'>app.about</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_Quit</attribute>
          <attribute name='action'>app.quit</attribute>
        </item>
      </section>
    </menu>
    ]}

    Attribute values can be translated using gettext, like other [GtkBuilder]
    content. [<attribute>] elements can be marked for translation with a
    [translatable=”yes”] attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the [GtkBuilder] must have been given the gettext
    domain to use.

    The following attributes are used when constructing menu items:

    - “label”: a user-visible string to display
    - “use-markup”: whether the text in the menu item includes
      {{:https://docs.gtk.org/Pango/pango_markup.html}Pango markup}
    - “action”: the prefixed name of the action to trigger
    - “target”: the parameter to use when activating the action
    - “icon” and “verb-icon”: names of icons that may be displayed
    - “submenu-action”: name of an action that may be used to track whether a
      submenu is open
    - “hidden-when”: a string used to determine when the item will be hidden.
      Possible values include “action-disabled”, “action-missing”,
      “macos-menubar”. This is mainly useful for exported menus, see
      [Gtk.Application.set_menubar].
    - “custom”: a string used to match against the ID of a custom child added
      with [Gtk.PopoverMenu.add_child], [Gtk.PopoverMenuBar.add_child], or in
      the ui file with [<child type=”ID”>].

    The following attributes are used when constructing sections:

    - “label”: a user-visible string to use as section heading
    - “display-hint”: a string used to determine special formatting for the
      section. Possible values include “horizontal-buttons”, “circular-buttons”
      and “inline-buttons”. They all indicate that section should be displayed
      as a horizontal row of buttons.
    - “text-direction”: a string used to determine the [GtkTextDirection] to use
      when “display-hint” is set to “horizontal-buttons”. Possible values
      include “rtl”, “ltr”, and “none”.

    The following attributes are used when constructing submenus:

    - “label”: a user-visible string to display
    - “icon”: icon name to display
    - “gtk-macos-special”: (macOS only, ignored by others) Add special meaning
      to a menu in the macOS menu bar. See Using GTK on Apple macOS.

    Menu items will also show accelerators, which are usually associated with
    actions via [Gtk.Application.set_accels_for_action],
    [WidgetClass.add_binding_action] or [Gtk.ShortcutController.add_shortcut].

    {b Shortcuts and Gestures}

    [GtkPopoverMenu] supports the following keyboard shortcuts:

    - <kbd>Space</kbd> activates the default widget.

    {b CSS Nodes}

    [GtkPopoverMenu] is just a subclass of [GtkPopover] that adds custom content
    to it, therefore it has the same CSS nodes. It is one of the cases that add
    a [.menu] style class to the main [popover] node.

    Menu items have nodes with name [button] and class [.model]. If a section
    display-hint is set, the section gets a node [box] with class [horizontal]
    plus a class with the same text as the display hint. Note that said box may
    not be the direct ancestor of the item [button]s. Thus, for example, to
    style items in an [inline-buttons] section, select
    [.inline-buttons button.model]. Other things that may be of interest to
    style in menus include [label] nodes.

    {b Accessibility}

    [GtkPopoverMenu] uses the [Gtk.AccessibleRole.menu] role, and its items use
    the [Gtk.AccessibleRole.menu_item], [Gtk.AccessibleRole.checkbox] or
    [Gtk.AccessibleRole.menu_item_radio] roles, depending on the action they are
    connected to. *)

type t =
  [ `popover_menu | `popover | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_from_model : Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> t
  = "ml_gtk_popover_menu_new_from_model"
(** Create a new PopoverMenu *)

external new_from_model_full :
  Ocgtk_gio.Gio.Wrappers.Menu_model.t -> Gtk_enums.popovermenuflags -> t
  = "ml_gtk_popover_menu_new_from_model_full"
(** Create a new PopoverMenu *)

(* Methods *)

external set_menu_model :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_popover_menu_set_menu_model"
(** Sets a new menu model on [popover].

    The existing contents of [popover] are removed, and the [popover] is
    populated with new contents according to [model]. *)

external set_flags : t -> Gtk_enums.popovermenuflags -> unit
  = "ml_gtk_popover_menu_set_flags"
(** Sets the flags that [popover] uses to create/display a menu from its model.

    If a model is set and the flags change, contents are rebuilt, so if setting
    properties individually, set flags before model to avoid a redundant
    rebuild. *)

external remove_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_popover_menu_remove_child"
(** Removes a widget that has previously been added with
    [Gtk.PopoverMenu.add_child] *)

external get_menu_model : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_popover_menu_get_menu_model"
(** Returns the menu model used to populate the popover. *)

external get_flags : t -> Gtk_enums.popovermenuflags
  = "ml_gtk_popover_menu_get_flags"
(** Returns the flags that [popover] uses to create/display a menu from its
    model. *)

external add_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string ->
  bool = "ml_gtk_popover_menu_add_child"
(** Adds a custom widget to a generated menu.

    For this to work, the menu model of [popover] must have an item with a
    [custom] attribute that matches [id]. *)

(* Properties *)

external get_visible_submenu : t -> string
  = "ml_gtk_popover_menu_get_visible_submenu"
(** Get property: visible-submenu *)

external set_visible_submenu : t -> string -> unit
  = "ml_gtk_popover_menu_set_visible_submenu"
(** Set property: visible-submenu *)
