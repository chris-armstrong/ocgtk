(** [GMenuItem] is an opaque structure type. You must access it using the
    functions below.

    Its methods, signals and properties are on {!class-type-menu_item_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Menu_item}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MenuItem].}

    Inherits from: [GObject.Object]

    [GMenuItem] is an opaque structure type. You must access it using the
    functions below. *)
class type menu_item_t = object
  (** {2:methods Methods} *)

  method get_attribute_value :
    string -> Gvariant_type.t option -> Gvariant.t option
  (** Queries the named [attribute] on [menu_item].

      If [expected_type] is specified and the attribute does not have this type,
      [NULL] is returned. [NULL] is also returned if the attribute simply does
      not exist. *)

  method get_link : string -> Menu_model.menu_model_t option
  (** Queries the named [link] on [menu_item]. *)

  method set_action_and_target_value :
    string option -> Gvariant.t option -> unit
  [@@ocaml.doc
    "Sets or unsets the \"action\" and \"target\" attributes of [menu_item].\n\n\
     If [action] is [NULL] then both the \"action\" and \"target\" attributes\n\
     are unset (and [target_value] is ignored).\n\n\
     If [action] is non-[NULL] then the \"action\" attribute is set.  The\n\
     \"target\" attribute is then set to the value of [target_value] if it is\n\
     non-[NULL] or unset otherwise.\n\n\
     Normal menu items (ie: not submenu, section or other custom item\n\
     types) are expected to have the \"action\" attribute set to identify\n\
     the action that they are associated with.  The state type of the\n\
     action help to determine the disposition of the menu item.  See\n\
     [GAction] and [GActionGroup] for an overview of actions.\n\n\
     In general, clicking on the menu item will result in activation of\n\
     the named action with the \"target\" attribute given as the parameter\n\
     to the action invocation.  If the \"target\" attribute is not set then\n\
     the action is invoked with no parameter.\n\n\
     If the action has no state then the menu item is usually drawn as a\n\
     plain menu item (ie: with no additional decoration).\n\n\
     If the action has a boolean state then the menu item is usually drawn\n\
     as a toggle menu item (ie: with a checkmark or equivalent\n\
     indication).  The item should be marked as 'toggled' or 'checked'\n\
     when the boolean state is [TRUE].\n\n\
     If the action has a string state then the menu item is usually drawn\n\
     as a radio menu item (ie: with a radio bullet or equivalent\n\
     indication).  The item should be marked as 'selected' when the string\n\
     state is equal to the value of the [target] property.\n\n\
     See g_menu_item_set_action_and_target() or\n\
     g_menu_item_set_detailed_action() for two equivalent calls that are\n\
     probably more convenient for most uses."]

  method set_attribute_value : string -> Gvariant.t option -> unit
  (** Sets or unsets an attribute on [menu_item].

      The attribute to set or unset is specified by [attribute]. This can be one
      of the standard attribute names [G_MENU_ATTRIBUTE_LABEL],
      [G_MENU_ATTRIBUTE_ACTION], [G_MENU_ATTRIBUTE_TARGET], or a custom
      attribute name. Attribute names are restricted to lowercase characters,
      numbers and '-'. Furthermore, the names must begin with a lowercase
      character, must not end with a '-', and must not contain consecutive
      dashes.

      must consist only of lowercase ASCII characters, digits and '-'.

      If [value] is non-[NULL] then it is used as the new value for the
      attribute. If [value] is [NULL] then the attribute is unset. If the
      [value] [GVariant] is floating, it is consumed.

      See also g_menu_item_set_attribute() for a more convenient way to do the
      same. *)

  method set_detailed_action : string -> unit
  [@@ocaml.doc
    "Sets the \"action\" and possibly the \"target\" attribute of [menu_item].\n\n\
     The format of [detailed_action] is the same format parsed by\n\
     g_action_parse_detailed_name().\n\n\
     See g_menu_item_set_action_and_target() or\n\
     g_menu_item_set_action_and_target_value() for more flexible (but\n\
     slightly less convenient) alternatives.\n\n\
     See also g_menu_item_set_action_and_target_value() for a description of\n\
     the semantics of the action and target attributes."]

  method set_icon : Icon.icon_t -> unit
  [@@ocaml.doc
    "Sets (or unsets) the icon on [menu_item].\n\n\
     This call is the same as calling g_icon_serialize() and using the\n\
     result as the value to g_menu_item_set_attribute_value() for\n\
     [G_MENU_ATTRIBUTE_ICON].\n\n\
     This API is only intended for use with \"noun\" menu items; things like\n\
     bookmarks or applications in an \"Open With\" menu.  Don't use it on\n\
     menu items corresponding to verbs (eg: stock icons for 'Save' or\n\
     'Quit').\n\n\
     If [icon] is [NULL] then the icon is unset."]

  method set_label : string option -> unit
  [@@ocaml.doc
    "Sets or unsets the \"label\" attribute of [menu_item].\n\n\
     If [label] is non-[NULL] it is used as the label for the menu item.  If\n\
     it is [NULL] then the label attribute is unset."]

  method set_link : string -> Menu_model.menu_model_t option -> unit
  (** Creates a link from [menu_item] to [model] if non-[NULL], or unsets it.

      Links are used to establish a relationship between a particular menu item
      and another menu. For example, [G_MENU_LINK_SUBMENU] is used to associate
      a submenu with a particular menu item, and [G_MENU_LINK_SECTION] is used
      to create a section. Other types of link can be used, but there is no
      guarantee that clients will be able to make sense of them. Link types are
      restricted to lowercase characters, numbers and '-'. Furthermore, the
      names must begin with a lowercase character, must not end with a '-', and
      must not contain consecutive dashes. *)

  method set_section : Menu_model.menu_model_t option -> unit
  [@@ocaml.doc
    "Sets or unsets the \"section\" link of [menu_item] to [section].\n\n\
     The effect of having one menu appear as a section of another is\n\
     exactly as it sounds: the items from [section] become a direct part of\n\
     the menu that [menu_item] is added to.  See g_menu_item_new_section()\n\
     for more information about what it means for a menu item to be a\n\
     section."]

  method set_submenu : Menu_model.menu_model_t option -> unit
  [@@ocaml.doc
    "Sets or unsets the \"submenu\" link of [menu_item] to [submenu].\n\n\
     If [submenu] is non-[NULL], it is linked to.  If it is [NULL] then the\n\
     link is unset.\n\n\
     The effect of having one menu appear as a submenu of another is\n\
     exactly as it sounds."]

  (** {2:conversions Conversions} *)

  method as_menu_item : Raw.Menu_item.t
end

class menu_item : Raw.Menu_item.t -> menu_item_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu_item.t}. *)

(** {1:constructors Constructors} *)

val new_ : string option -> string option -> menu_item_t
[@@ocaml.doc
  "Creates a new [GMenuItem].\n\n\
   If [label] is non-[NULL] it is used to set the \"label\" attribute of the\n\
   new item.\n\n\
   If [detailed_action] is non-[NULL] it is used to set the \"action\" and\n\
   possibly the \"target\" attribute of the new item.  See\n\
   g_menu_item_set_detailed_action() for more information."]

val new_from_model : Menu_model.menu_model_t -> int -> menu_item_t
(** Creates a [GMenuItem] as an exact copy of an existing menu item in a
    [GMenuModel].

    [item_index] must be valid (ie: be sure to call g_menu_model_get_n_items()
    first). *)

val new_section : string option -> Menu_model.menu_model_t -> menu_item_t
[@@ocaml.doc
  "Creates a new [GMenuItem] representing a section.\n\n\
   This is a convenience API around g_menu_item_new() and\n\
   g_menu_item_set_section().\n\n\
   The effect of having one menu appear as a section of another is\n\
   exactly as it sounds: the items from [section] become a direct part of\n\
   the menu that [menu_item] is added to.\n\n\
   Visual separation is typically displayed between two non-empty\n\
   sections.  If [label] is non-[NULL] then it will be incorporated into\n\
   this visual indication.  This allows for labeled subsections of a\n\
   menu.\n\n\
   As a simple example, consider a typical \"Edit\" menu from a simple\n\
   program.  It probably contains an \"Undo\" and \"Redo\" item, followed by\n\
   a separator, followed by \"Cut\", \"Copy\" and \"Paste\".\n\n\
   This would be accomplished by creating three [GMenu] instances.  The\n\
   first would be populated with the \"Undo\" and \"Redo\" items, and the\n\
   second with the \"Cut\", \"Copy\" and \"Paste\" items.  The first and\n\
   second menus would then be added as submenus of the third.  In XML\n\
   format, this would look something like the following:\n\n\
   {[\n\
   <menu id='edit-menu'>\n\
  \  <section>\n\
  \    <item label='Undo'/>\n\
  \    <item label='Redo'/>\n\
  \  </section>\n\
  \  <section>\n\
  \    <item label='Cut'/>\n\
  \    <item label='Copy'/>\n\
  \    <item label='Paste'/>\n\
  \  </section>\n\
   </menu>\n\
   ]}\n\n\
   The following example is exactly equivalent.  It is more illustrative\n\
   of the exact relationship between the menus and items (keeping in\n\
   mind that the 'link' element defines a new menu that is linked to the\n\
   containing one).  The style of the second example is more verbose and\n\
   difficult to read (and therefore not recommended except for the\n\
   purpose of understanding what is really going on).\n\n\
   {[\n\
   <menu id='edit-menu'>\n\
  \  <item>\n\
  \    <link name='section'>\n\
  \      <item label='Undo'/>\n\
  \      <item label='Redo'/>\n\
  \    </link>\n\
  \  </item>\n\
  \  <item>\n\
  \    <link name='section'>\n\
  \      <item label='Cut'/>\n\
  \      <item label='Copy'/>\n\
  \      <item label='Paste'/>\n\
  \    </link>\n\
  \  </item>\n\
   </menu>\n\
   ]}"]

val new_submenu : string option -> Menu_model.menu_model_t -> menu_item_t
(** Creates a new [GMenuItem] representing a submenu.

    This is a convenience API around g_menu_item_new() and
    g_menu_item_set_submenu(). *)
