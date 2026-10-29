(** Displays a popup when clicked.

    Its methods, signals and properties are on {!class-type-menu_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Menu_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MenuButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Displays a popup when clicked.

    An example GtkMenuButton

    This popup can be provided either as a [GtkPopover] or as an abstract
    [GMenuModel].

    The [GtkMenuButton] widget can show either an icon (set with the
    [Gtk.MenuButton:icon-name] property) or a label (set with the
    [Gtk.MenuButton:label] property). If neither is explicitly set, a
    {{!Ocgtk.Image.class-type-image_t}[Gtk.Image]} is automatically created,
    using an arrow image oriented according to [Gtk.MenuButton:direction] or the
    generic “open-menu-symbolic” icon if the direction is not set.

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
class type menu_button_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the menu button is activated.

      The [::activate] signal on [GtkMenuButton] is an action signal and
      emitting it causes the button to pop up its menu. *)

  (** {2:methods Methods} *)

  method get_active : unit -> bool
  (** Returns whether the menu button is active. *)

  method get_always_show_arrow : unit -> bool
  (** Gets whether to show a dropdown arrow even when using an icon or a custom
      child. *)

  method get_can_shrink : unit -> bool
  (** Retrieves whether the button can be smaller than the natural size of its
      contents. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [menu_button]. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_icon_name : unit -> string option
  (** Gets the name of the icon shown in the button. *)

  method get_label : unit -> string option
  (** Gets the label shown in the button *)

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option
  (** Returns the [GMenuModel] used to generate the popup. *)

  method get_popover : unit -> Popover.popover_t option
  (** Returns the [GtkPopover] that pops out of the button.

      If the button is not using a [GtkPopover], this function returns [None].
  *)

  method get_primary : unit -> bool
  (** Returns whether the menu button acts as a primary menu. *)

  method get_use_underline : unit -> bool
  (** Returns whether an embedded underline in the text indicates a mnemonic. *)

  method popdown : unit -> unit
  (** Dismiss the menu. *)

  method popup : unit -> unit
  (** Pop up the menu. *)

  method set_active : bool -> unit
  (** Sets whether the menu button is active. *)

  method set_always_show_arrow : bool -> unit
  (** Sets whether to show a dropdown arrow even when using an icon or a custom
      child. *)

  method set_can_shrink : bool -> unit
  (** Sets whether the button size can be smaller than the natural size of its
      contents.

      For text buttons, setting [can_shrink] to true will ellipsize the label.

      For icon buttons, this function has no effect. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [menu_button].

      Setting a child resets [Gtk.MenuButton:label] and
      [Gtk.MenuButton:icon-name].

      If [Gtk.MenuButton:always-show-arrow] is set to [true] and
      [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will
      be shown next to the child. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button. *)

  method set_icon_name : string -> unit
  (** Sets the name of an icon to show inside the menu button.

      Setting icon name resets [Gtk.MenuButton:label] and
      [Gtk.MenuButton:child].

      If [Gtk.MenuButton:always-show-arrow] is set to [true] and
      [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will
      be shown next to the icon. *)

  method set_label : string -> unit
  (** Sets the label to show inside the menu button.

      Setting a label resets [Gtk.MenuButton:icon-name] and
      [Gtk.MenuButton:child].

      If [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow
      will be shown next to the label. *)

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets the [GMenuModel] from which the popup will be constructed.

      If [menu_model] is [None], the button is disabled.

      A [Gtk.Popover] will be created from the menu model with
      [Gtk.PopoverMenu.new_from_model]. Actions will be connected as documented
      for this function.

      If [Gtk.MenuButton:popover] is already set, it will be dissociated from
      the [menu_button], and the property is set to [None]. *)

  method set_popover : Popover.popover_t option -> unit
  (** Sets the [GtkPopover] that will be popped up when the [menu_button] is
      clicked.

      If [popover] is [None], the button is disabled.

      If [Gtk.MenuButton:menu-model] is set, the menu model is dissociated from
      the [menu_button], and the property is set to [None]. *)

  method set_primary : bool -> unit
  (** Sets whether menu button acts as a primary menu.

      Primary menus can be opened with the <kbd>F10</kbd> key. *)

  method set_use_underline : bool -> unit
  (** If true, an underline in the text indicates a mnemonic. *)

  (** {2:conversions Conversions} *)

  method as_menu_button : Raw.Menu_button.t
end

class menu_button : Raw.Menu_button.t -> menu_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Menu_button.t}. *)

(** {1:description Description}

    Displays a popup when clicked.

    An example GtkMenuButton

    This popup can be provided either as a [GtkPopover] or as an abstract
    [GMenuModel].

    The [GtkMenuButton] widget can show either an icon (set with the
    [Gtk.MenuButton:icon-name] property) or a label (set with the
    [Gtk.MenuButton:label] property). If neither is explicitly set, a
    {{!Ocgtk.Image.class-type-image_t}[Gtk.Image]} is automatically created,
    using an arrow image oriented according to [Gtk.MenuButton:direction] or the
    generic “open-menu-symbolic” icon if the direction is not set.

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

(** {1:constructors Constructors} *)

val new_ : unit -> menu_button_t
(** Creates a new [GtkMenuButton] widget with downwards-pointing arrow as the
    only child.

    You can replace the child widget with another [GtkWidget] should you wish
    to. *)
