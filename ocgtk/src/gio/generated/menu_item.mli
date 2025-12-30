(* GENERATED CODE - DO NOT EDIT *)
(* MenuItem: MenuItem *)

type t = [`menu_item | `object_] Gobject.obj

(** Create a new MenuItem *)
external new_ : string option -> string option -> t = "ml_g_menu_item_new"

(** Create a new MenuItem *)
external new_from_model : Menu_link_iter_and__menu_model.Menu_model.t -> int -> t = "ml_g_menu_item_new_from_model"

(** Create a new MenuItem *)
external new_section : string option -> Menu_link_iter_and__menu_model.Menu_model.t -> t = "ml_g_menu_item_new_section"

(** Create a new MenuItem *)
external new_submenu : string option -> Menu_link_iter_and__menu_model.Menu_model.t -> t = "ml_g_menu_item_new_submenu"

(* Methods *)
(** Sets or unsets the "submenu" link of @menu_item to @submenu.

If @submenu is non-%NULL, it is linked to.  If it is %NULL then the
link is unset.

The effect of having one menu appear as a submenu of another is
exactly as it sounds. *)
external set_submenu : t -> Menu_link_iter_and__menu_model.Menu_model.t option -> unit = "ml_g_menu_item_set_submenu"

(** Sets or unsets the "section" link of @menu_item to @section.

The effect of having one menu appear as a section of another is
exactly as it sounds: the items from @section become a direct part of
the menu that @menu_item is added to.  See g_menu_item_new_section()
for more information about what it means for a menu item to be a
section. *)
external set_section : t -> Menu_link_iter_and__menu_model.Menu_model.t option -> unit = "ml_g_menu_item_set_section"

(** Creates a link from @menu_item to @model if non-%NULL, or unsets it.

Links are used to establish a relationship between a particular menu
item and another menu.  For example, %G_MENU_LINK_SUBMENU is used to
associate a submenu with a particular menu item, and %G_MENU_LINK_SECTION
is used to create a section. Other types of link can be used, but there
is no guarantee that clients will be able to make sense of them.
Link types are restricted to lowercase characters, numbers
and '-'. Furthermore, the names must begin with a lowercase character,
must not end with a '-', and must not contain consecutive dashes. *)
external set_link : t -> string -> Menu_link_iter_and__menu_model.Menu_model.t option -> unit = "ml_g_menu_item_set_link"

(** Sets or unsets the "label" attribute of @menu_item.

If @label is non-%NULL it is used as the label for the menu item.  If
it is %NULL then the label attribute is unset. *)
external set_label : t -> string option -> unit = "ml_g_menu_item_set_label"

(** Sets (or unsets) the icon on @menu_item.

This call is the same as calling g_icon_serialize() and using the
result as the value to g_menu_item_set_attribute_value() for
%G_MENU_ATTRIBUTE_ICON.

This API is only intended for use with "noun" menu items; things like
bookmarks or applications in an "Open With" menu.  Don't use it on
menu items corresponding to verbs (eg: stock icons for 'Save' or
'Quit').

If @icon is %NULL then the icon is unset. *)
external set_icon : t -> Icon.t -> unit = "ml_g_menu_item_set_icon"

(** Sets the "action" and possibly the "target" attribute of @menu_item.

The format of @detailed_action is the same format parsed by
g_action_parse_detailed_name().

See g_menu_item_set_action_and_target() or
g_menu_item_set_action_and_target_value() for more flexible (but
slightly less convenient) alternatives.

See also g_menu_item_set_action_and_target_value() for a description of
the semantics of the action and target attributes. *)
external set_detailed_action : t -> string -> unit = "ml_g_menu_item_set_detailed_action"

(** Queries the named @link on @menu_item. *)
external get_link : t -> string -> Menu_link_iter_and__menu_model.Menu_model.t option = "ml_g_menu_item_get_link"

