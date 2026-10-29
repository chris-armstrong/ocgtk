(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgio.Raw.Menu_link_iter}, {!Ocgio.Raw.Menu_model},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** {{!Ocgio.Raw.Menu_link_iter}[GMenuLinkIter]} is an opaque structure type.
    You must access it using the functions below.

    The class built on this module is in {!Ocgio.Menu_link_iter}. *)
module rec Menu_link_iter : sig
  type t = [ `menu_link_iter | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_menu_link_iter_get_type"

  (* Methods *)

  external next : t -> bool = "ml_g_menu_link_iter_next"
  (** Attempts to advance the iterator to the next (possibly first) link.

      [true] is returned on success, or [false] if there are no more links.

      You must call this function when you first acquire the iterator to advance
      it to the first link (and determine if the first link exists at all). *)

  external get_value : t -> Menu_model.t = "ml_g_menu_link_iter_get_value"
  (** Gets the linked {{!Ocgio.Raw.Menu_model}[GMenuModel]} at the current
      iterator position.

      The iterator is not advanced. *)

  external get_name : t -> string = "ml_g_menu_link_iter_get_name"
  (** Gets the name of the link at the current iterator position.

      The iterator is not advanced. *)
end

(** [GMenuModel] represents the contents of a menu — an ordered list of menu
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
    {{!Ocgio.Raw.Action_group}[Gio.ActionGroup]} and
    {{!Ocgio.Raw.Menu_model}[Gio.MenuModel]}. The client-side counterparts to
    make use of the exported information are
    {{!Ocgio.Raw.D_bus_action_group}[Gio.DBusActionGroup]} and
    {{!Ocgio.Raw.D_bus_menu_model}[Gio.DBusMenuModel]}.

    The API of [GMenuModel] is very generic, with iterators for the attributes
    and links of an item, see
    {{!Ocgio.Raw.Menu_model.val-iterate_item_attributes}[Gio.MenuModel.iterate_item_attributes]}
    and
    {{!Ocgio.Raw.Menu_model.val-iterate_item_links}[Gio.MenuModel.iterate_item_links]}.
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
    value of the menu item.

    The class built on this module is in {!Ocgio.Menu_model}. *)
and Menu_model : sig
  type t = [ `menu_model | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_menu_model_get_type"

  (* Methods *)

  external iterate_item_links : t -> int -> Menu_link_iter.t
    = "ml_g_menu_model_iterate_item_links"
  (** Creates a {{!Ocgio.Raw.Menu_link_iter}[GMenuLinkIter]} to iterate over the
      links of the item at position [item_index] in [model]. *)

  external iterate_item_attributes : t -> int -> Menu_attribute_iter.t
    = "ml_g_menu_model_iterate_item_attributes"
  (** Creates a {{!Ocgio.Raw.Menu_attribute_iter}[GMenuAttributeIter]} to
      iterate over the attributes of the item at position [item_index] in
      [model]. *)

  external items_changed : t -> int -> int -> int -> unit
    = "ml_g_menu_model_items_changed"
  (** Requests emission of the
      {{!Ocgio.Raw.Menu_model.val-on_items_changed}[GMenuModel::items-changed]}
      signal on [model].

      This function should never be called except by
      {{!Ocgio.Raw.Menu_model}[GMenuModel]} subclasses. Any other calls to this
      function will very likely lead to a violation of the interface of the
      model.

      The implementation should update its internal representation of the menu
      before emitting the signal. The implementation should further expect to
      receive queries about the new state of the menu (and particularly added
      menu items) while signal handlers are running.

      The implementation must dispatch this call directly from a mainloop entry
      and not in response to calls -- particularly those from the
      {{!Ocgio.Raw.Menu_model}[GMenuModel]} API. Said another way: the menu must
      not change while user code is running without returning to the mainloop.
  *)

  external is_mutable : t -> bool = "ml_g_menu_model_is_mutable"
  (** Queries if [model] is mutable.

      An immutable {{!Ocgio.Raw.Menu_model}[GMenuModel]} will never emit the
      {{!Ocgio.Raw.Menu_model.val-on_items_changed}[GMenuModel::items-changed]}
      signal. Consumers of the model may make optimisations accordingly. *)

  external get_n_items : t -> int = "ml_g_menu_model_get_n_items"
  (** Query the number of items in [model]. *)

  external get_item_link : t -> int -> string -> t option
    = "ml_g_menu_model_get_item_link"
  (** Queries the item at position [item_index] in [model] for the link
      specified by [link].

      If the link exists, the linked {{!Ocgio.Raw.Menu_model}[GMenuModel]} is
      returned. If the link does not exist, [None] is returned. *)

  external get_item_attribute_value :
    t -> int -> string -> Gvariant_type.t option -> Gvariant.t option
    = "ml_g_menu_model_get_item_attribute_value"
  (** Queries the item at position [item_index] in [model] for the attribute
      specified by [attribute].

      If [expected_type] is non-[None] then it specifies the expected type of
      the attribute. If it is [None] then any type will be accepted.

      If the attribute exists and matches [expected_type] (or if the expected
      type is unspecified) then the value is returned.

      If the attribute does not exist, or does not match the expected type then
      [None] is returned. *)

  val on_items_changed :
    ?after:bool ->
    t ->
    callback:(position:int -> removed:int -> added:int -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when a change has occurred to the menu.

      The only changes that can occur to a menu is that items are removed or
      added. Items may not change (except by being removed and added back in the
      same location). This signal is capable of describing both of those changes
      (at the same time).

      The signal means that starting at the index [position], [removed] items
      were removed and [added] items were added in their place. If [removed] is
      zero then only items were added. If [added] is zero then only items were
      removed.

      As an example, if the menu contains items a, b, c, d (in that order) and
      the signal (2, 1, 3) occurs then the new composition of the menu will be
      a, b, _, _, _, d (with each _ representing some new item).

      Signal handlers may query the model (particularly the added items) and
      expect to see the results of the modification that is being reported. The
      signal is emitted after the modification. *)
end
