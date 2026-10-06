(* GENERATED CODE - DO NOT EDIT *)
(* PopoverMenu: PopoverMenu *)

[@@@ocaml.text
"A subclass of [GtkPopover] that implements menu behavior.\n\n\
 An example GtkPopoverMenu\n\n\
 [GtkPopoverMenu] treats its children like menus and allows switching\n\
 between them. It can open submenus as traditional, nested submenus,\n\
 or in a more touch-friendly sliding fashion.\n\
 The property [Gtk.PopoverMenu:flags] controls this appearance.\n\n\
 [GtkPopoverMenu] is meant to be used primarily with menu models,\n\
 using [Gtk.PopoverMenu.new_from_model]. If you need to put\n\
 other widgets such as a [GtkSpinButton] or a [GtkSwitch] into a popover,\n\
 you can use [Gtk.PopoverMenu.add_child].\n\n\
 For more dialog-like behavior, use a plain [GtkPopover].\n\n\
 {b Menu models}\n\n\
 The XML format understood by [GtkBuilder] for [GMenuModel] consists\n\
 of a toplevel [<menu>] element, which contains one or more [<item>]\n\
 elements. Each [<item>] element contains [<attribute>] and [<link>]\n\
 elements with a mandatory name attribute. [<link>] elements have the\n\
 same content model as [<menu>]. Instead of [<link name=\"submenu\">]\n\
 or [<link name=\"section\">], you can use [<submenu>] or [<section>]\n\
 elements.\n\n\
 {[\n\
 <menu id='app-menu'>\n\
\  <section>\n\
\    <item>\n\
\      <attribute name='label' translatable='yes'>_New Window</attribute>\n\
\      <attribute name='action'>app.new</attribute>\n\
\    </item>\n\
\    <item>\n\
\      <attribute name='label' translatable='yes'>_About Sunny</attribute>\n\
\      <attribute name='action'>app.about</attribute>\n\
\    </item>\n\
\    <item>\n\
\      <attribute name='label' translatable='yes'>_Quit</attribute>\n\
\      <attribute name='action'>app.quit</attribute>\n\
\    </item>\n\
\  </section>\n\
 </menu>\n\
 ]}\n\n\
 Attribute values can be translated using gettext, like other [GtkBuilder]\n\
 content. [<attribute>] elements can be marked for translation with a\n\
 [translatable=\"yes\"] attribute. It is also possible to specify message\n\
 context and translator comments, using the context and comments attributes.\n\
 To make use of this, the [GtkBuilder] must have been given the gettext\n\
 domain to use.\n\n\
 The following attributes are used when constructing menu items:\n\n\
 - \"label\": a user-visible string to display\n\
 - \"use-markup\": whether the text in the menu item includes \
 {{:https://docs.gtk.org/Pango/pango_markup.html}Pango markup}\n\
 - \"action\": the prefixed name of the action to trigger\n\
 - \"target\": the parameter to use when activating the action\n\
 - \"icon\" and \"verb-icon\": names of icons that may be displayed\n\
 - \"submenu-action\": name of an action that may be used to track\n\
 whether a submenu is open\n\
 - \"hidden-when\": a string used to determine when the item will be hidden.\n\
 Possible values include \"action-disabled\", \"action-missing\", \
 \"macos-menubar\".\n\
 This is mainly useful for exported menus, see [Gtk.Application.set_menubar].\n\
 - \"custom\": a string used to match against the ID of a custom child added \
 with\n\
 [Gtk.PopoverMenu.add_child], [Gtk.PopoverMenuBar.add_child],\n\
 or in the ui file with [<child type=\"ID\">].\n\n\
 The following attributes are used when constructing sections:\n\n\
 - \"label\": a user-visible string to use as section heading\n\
 - \"display-hint\": a string used to determine special formatting for the \
 section.\n\
 Possible values include \"horizontal-buttons\", \"circular-buttons\" and\n\
 \"inline-buttons\". They all indicate that section should be\n\
 displayed as a horizontal row of buttons.\n\
 - \"text-direction\": a string used to determine the [GtkTextDirection] to use\n\
 when \"display-hint\" is set to \"horizontal-buttons\". Possible values\n\
 include \"rtl\", \"ltr\", and \"none\".\n\n\
 The following attributes are used when constructing submenus:\n\n\
 - \"label\": a user-visible string to display\n\
 - \"icon\": icon name to display\n\
 - \"gtk-macos-special\": (macOS only, ignored by others) Add special meaning \
 to a menu\n\
 in the macOS menu bar. See Using GTK on Apple macOS.\n\n\
 Menu items will also show accelerators, which are usually associated\n\
 with actions via [Gtk.Application.set_accels_for_action],\n\
 [WidgetClass.add_binding_action] or\n\
 [Gtk.ShortcutController.add_shortcut].\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkPopoverMenu] supports the following keyboard shortcuts:\n\n\
 - <kbd>Space</kbd> activates the default widget.\n\n\
 {b CSS Nodes}\n\n\
 [GtkPopoverMenu] is just a subclass of [GtkPopover] that adds custom content\n\
 to it, therefore it has the same CSS nodes. It is one of the cases that add\n\
 a [.menu] style class to the main [popover] node.\n\n\
 Menu items have nodes with name [button] and class [.model]. If a section\n\
 display-hint is set, the section gets a node [box] with class [horizontal]\n\
 plus a class with the same text as the display hint. Note that said box may\n\
 not be the direct ancestor of the item [button]s. Thus, for example, to style\n\
 items in an [inline-buttons] section, select [.inline-buttons button.model].\n\
 Other things that may be of interest to style in menus include [label] nodes.\n\n\
 {b Accessibility}\n\n\
 [GtkPopoverMenu] uses the [Gtk.AccessibleRole.menu] role, and its\n\
 items use the [Gtk.AccessibleRole.menu_item],\n\
 [Gtk.AccessibleRole.checkbox] or [Gtk.AccessibleRole.menu_item_radio]\n\
 roles, depending on the action they are connected to."]

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
