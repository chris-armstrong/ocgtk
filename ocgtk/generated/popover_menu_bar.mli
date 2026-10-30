(** Presents a horizontal bar of items that pop up menus when clicked.

    Its methods, signals and properties are on {!class-type-popover_menu_bar_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Popover_menu_bar}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PopoverMenuBar].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Presents a horizontal bar of items that pop up menus when clicked.

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

    [GtkPopoverMenuBar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU_BAR}[Gtk.AccessibleRole.menu_bar]}
    role, the menu items use the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU_ITEM}[Gtk.AccessibleRole.menu_item]}
    role and the menus use the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU}[Gtk.AccessibleRole.menu]}
    role. *)
class type popover_menu_bar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method add_child : Widget.widget_t -> string -> bool
  (** Adds a custom widget to a generated menubar.

      For this to work, the menu model of [bar] must have an item with a
      [custom] attribute that matches [id]. *)

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option
  (** Returns the model from which the contents of [bar] are taken. *)

  method remove_child : Widget.widget_t -> bool
  (** Removes a widget that has previously been added with
      [gtk_popover_menu_bar_add_child ()]. *)

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model from which [bar] should take its contents. *)

  (** {2:conversions Conversions} *)

  method as_popover_menu_bar : Raw.Popover_menu_bar.t
end

class popover_menu_bar : Raw.Popover_menu_bar.t -> popover_menu_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Popover_menu_bar.t}. *)

(** {1:description Description}

    Presents a horizontal bar of items that pop up menus when clicked.

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

    [GtkPopoverMenuBar] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU_BAR}[Gtk.AccessibleRole.menu_bar]}
    role, the menu items use the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU_ITEM}[Gtk.AccessibleRole.menu_item]}
    role and the menus use the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-MENU}[Gtk.AccessibleRole.menu]}
    role. *)

(** {1:constructors Constructors} *)

val new_from_model : Ocgio.Menu_model.menu_model_t option -> popover_menu_bar_t
(** Creates a [GtkPopoverMenuBar] from a [GMenuModel]. *)
