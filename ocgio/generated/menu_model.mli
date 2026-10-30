(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for MenuModel from cyclic group Menu_link_iter_and__menu_model *)

(** [GMenuModel] represents the contents of a menu — an ordered list of menu
    items. The items are associated with actions, which can be activated through
    them. Items can be grouped in sections, and may have submenus associated
    with them. Both items and sections usually have some representation data,
    such as labels or icons. The type of the associated action (ie whether it is
    stateful, and what kind of state it has) can influence the representation of
    the item.

    Its methods, signals and properties are on {!class-type-menu_model_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Menu_model}. *)

(** {1:class Class} *)

class type menu_model_t = Menu_link_iter_and__menu_model.menu_model_t
(** {b The methods, signals and properties of a [MenuModel].}

    [GMenuModel] represents the contents of a menu — an ordered list of menu
    items. The items are associated with actions, which can be activated through
    them. Items can be grouped in sections, and may have submenus associated
    with them. Both items and sections usually have some representation data,
    such as labels or icons. The type of the associated action (ie whether it is
    stateful, and what kind of state it has) can influence the representation of
    the item.

    The conceptual model of menus in [GMenuModel] is hierarchical: sections and
    submenus are again represented by [GMenuModel]s. Menus themselves do not
    define their own roles. Rather, the role of a particular [GMenuModel] is
    defined by the item that references it (or, in the case of the ‘root’ menu,
    is defined by the context in which it is used).

    As an example, consider the visible portions of this menu:

    {b An example menu}

    While this kind of deeply nested menu is no longer considered good UI
    practice, it serves as a good example of the concepts in [GMenuModel]. There
    are 8 ‘menus’ visible in the screenshot: one menubar, two submenus and 5
    sections:

    - the toplevel menubar (containing 4 items)
    - the View submenu (containing 3 sections)
    - the first section of the View submenu (containing 2 items)
    - the second section of the View submenu (containing 1 item)
    - the final section of the View submenu (containing 1 item)
    - the Highlight Mode submenu (containing 2 sections)
    - the Sources section (containing 2 items)
    - the Markup section (containing 2 items)

    The example illustrates the conceptual connection between these 8 menus.
    Each large block in the figure represents a menu and the smaller blocks
    within the large block represent items in that menu. Some items contain
    references to other menus.

    {b A menu example}

    menu model

    Notice that the separators visible in the example appear nowhere in the menu
    model. This is because separators are not explicitly represented in the menu
    model. Instead, a separator is inserted between any two non-empty sections
    of a menu. Section items can have labels just like any other item. In that
    case, a display system may show a section header instead of a separator.

    The motivation for this abstract model of application controls is that
    modern user interfaces tend to make these controls available outside the
    application. Examples include global menus, jumplists, dash boards, etc. To
    support such uses, it is necessary to ‘export’ information about actions and
    their representation in menus, which is exactly what the action group
    exporter and the menu model exporter do for
    {{!Ocgio.Action_group.class-type-action_group_t}[Gio.ActionGroup]} and
    {{!Ocgio.Menu_model.class-type-menu_model_t}[Gio.MenuModel]}. The
    client-side counterparts to make use of the exported information are
    {{!Ocgio.D_bus_action_group.class-type-d_bus_action_group_t}[Gio.DBusActionGroup]}
    and
    {{!Ocgio.D_bus_menu_model.class-type-d_bus_menu_model_t}[Gio.DBusMenuModel]}.

    The API of [GMenuModel] is very generic, with iterators for the attributes
    and links of an item, see
    {{!Ocgio.Menu_model.class-type-menu_model_t.method-iterate_item_attributes}[Gio.MenuModel.iterate_item_attributes]}
    and
    {{!Ocgio.Menu_model.class-type-menu_model_t.method-iterate_item_links}[Gio.MenuModel.iterate_item_links]}.
    The ‘standard’ attributes and link types have predefined names:
    [G_MENU_ATTRIBUTE_LABEL], [G_MENU_ATTRIBUTE_ACTION],
    [G_MENU_ATTRIBUTE_TARGET], [G_MENU_LINK_SECTION] and [G_MENU_LINK_SUBMENU].

    Items in a [GMenuModel] represent active controls if they refer to an action
    that can get activated when the user interacts with the menu item. The
    reference to the action is encoded by the string ID in the
    [G_MENU_ATTRIBUTE_ACTION] attribute. An action ID uniquely identifies an
    action in an action group. Which action group(s) provide actions depends on
    the context in which the menu model is used. E.g. when the model is exported
    as the application menu of a
    {{:https://docs.gtk.org/gtk4/class.Application.html}[GtkApplication]},
    actions can be application-wide or window-specific (and thus come from two
    different action groups). By convention, the application-wide actions have
    names that start with [app.], while the names of window-specific actions
    start with [win.].

    While a wide variety of stateful actions is possible, the following is the
    minimum that is expected to be supported by all users of exported menu
    information:

    - an action with no parameter type and no state
    - an action with no parameter type and boolean state
    - an action with string parameter type and string state

    {b Stateless}

    A stateless action typically corresponds to an ordinary menu item.

    Selecting such a menu item will activate the action (with no parameter).

    {b Boolean State}

    An action with a boolean state will most typically be used with a ‘toggle’
    or ‘switch’ menu item. The state can be set directly, but activating the
    action (with no parameter) results in the state being toggled.

    Selecting a toggle menu item will activate the action. The menu item should
    be rendered as ‘checked’ when the state is true.

    {b String Parameter and State}

    Actions with string parameters and state will most typically be used to
    represent an enumerated choice over the items available for a group of radio
    menu items. Activating the action with a string parameter is equivalent to
    setting that parameter as the state.

    Radio menu items, in addition to being associated with the action, will have
    a target value. Selecting that menu item will result in activation of the
    action with the target value as the parameter. The menu item should be
    rendered as ‘selected’ when the state of the action is equal to the target
    value of the menu item. *)

class menu_model : Raw.Menu_model.t -> menu_model_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu_model.t}. *)

(** {1:description Description}

    [GMenuModel] represents the contents of a menu — an ordered list of menu
    items. The items are associated with actions, which can be activated through
    them. Items can be grouped in sections, and may have submenus associated
    with them. Both items and sections usually have some representation data,
    such as labels or icons. The type of the associated action (ie whether it is
    stateful, and what kind of state it has) can influence the representation of
    the item.

    The conceptual model of menus in [GMenuModel] is hierarchical: sections and
    submenus are again represented by [GMenuModel]s. Menus themselves do not
    define their own roles. Rather, the role of a particular [GMenuModel] is
    defined by the item that references it (or, in the case of the ‘root’ menu,
    is defined by the context in which it is used).

    As an example, consider the visible portions of this menu:

    {b An example menu}

    While this kind of deeply nested menu is no longer considered good UI
    practice, it serves as a good example of the concepts in [GMenuModel]. There
    are 8 ‘menus’ visible in the screenshot: one menubar, two submenus and 5
    sections:

    - the toplevel menubar (containing 4 items)
    - the View submenu (containing 3 sections)
    - the first section of the View submenu (containing 2 items)
    - the second section of the View submenu (containing 1 item)
    - the final section of the View submenu (containing 1 item)
    - the Highlight Mode submenu (containing 2 sections)
    - the Sources section (containing 2 items)
    - the Markup section (containing 2 items)

    The example illustrates the conceptual connection between these 8 menus.
    Each large block in the figure represents a menu and the smaller blocks
    within the large block represent items in that menu. Some items contain
    references to other menus.

    {b A menu example}

    menu model

    Notice that the separators visible in the example appear nowhere in the menu
    model. This is because separators are not explicitly represented in the menu
    model. Instead, a separator is inserted between any two non-empty sections
    of a menu. Section items can have labels just like any other item. In that
    case, a display system may show a section header instead of a separator.

    The motivation for this abstract model of application controls is that
    modern user interfaces tend to make these controls available outside the
    application. Examples include global menus, jumplists, dash boards, etc. To
    support such uses, it is necessary to ‘export’ information about actions and
    their representation in menus, which is exactly what the action group
    exporter and the menu model exporter do for
    {{!Ocgio.Action_group.class-type-action_group_t}[Gio.ActionGroup]} and
    {{!Ocgio.Menu_model.class-type-menu_model_t}[Gio.MenuModel]}. The
    client-side counterparts to make use of the exported information are
    {{!Ocgio.D_bus_action_group.class-type-d_bus_action_group_t}[Gio.DBusActionGroup]}
    and
    {{!Ocgio.D_bus_menu_model.class-type-d_bus_menu_model_t}[Gio.DBusMenuModel]}.

    The API of [GMenuModel] is very generic, with iterators for the attributes
    and links of an item, see
    {{!Ocgio.Menu_model.class-type-menu_model_t.method-iterate_item_attributes}[Gio.MenuModel.iterate_item_attributes]}
    and
    {{!Ocgio.Menu_model.class-type-menu_model_t.method-iterate_item_links}[Gio.MenuModel.iterate_item_links]}.
    The ‘standard’ attributes and link types have predefined names:
    [G_MENU_ATTRIBUTE_LABEL], [G_MENU_ATTRIBUTE_ACTION],
    [G_MENU_ATTRIBUTE_TARGET], [G_MENU_LINK_SECTION] and [G_MENU_LINK_SUBMENU].

    Items in a [GMenuModel] represent active controls if they refer to an action
    that can get activated when the user interacts with the menu item. The
    reference to the action is encoded by the string ID in the
    [G_MENU_ATTRIBUTE_ACTION] attribute. An action ID uniquely identifies an
    action in an action group. Which action group(s) provide actions depends on
    the context in which the menu model is used. E.g. when the model is exported
    as the application menu of a
    {{:https://docs.gtk.org/gtk4/class.Application.html}[GtkApplication]},
    actions can be application-wide or window-specific (and thus come from two
    different action groups). By convention, the application-wide actions have
    names that start with [app.], while the names of window-specific actions
    start with [win.].

    While a wide variety of stateful actions is possible, the following is the
    minimum that is expected to be supported by all users of exported menu
    information:

    - an action with no parameter type and no state
    - an action with no parameter type and boolean state
    - an action with string parameter type and string state

    {b Stateless}

    A stateless action typically corresponds to an ordinary menu item.

    Selecting such a menu item will activate the action (with no parameter).

    {b Boolean State}

    An action with a boolean state will most typically be used with a ‘toggle’
    or ‘switch’ menu item. The state can be set directly, but activating the
    action (with no parameter) results in the state being toggled.

    Selecting a toggle menu item will activate the action. The menu item should
    be rendered as ‘checked’ when the state is true.

    {b String Parameter and State}

    Actions with string parameters and state will most typically be used to
    represent an enumerated choice over the items available for a group of radio
    menu items. Activating the action with a string parameter is equivalent to
    setting that parameter as the state.

    Radio menu items, in addition to being associated with the action, will have
    a target value. Selecting that menu item will result in activation of the
    action with the target value as the parameter. The menu item should be
    rendered as ‘selected’ when the state of the action is equal to the target
    value of the menu item. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
