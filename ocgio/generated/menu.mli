(** [GMenu] is a simple implementation of [Gio.MenuModel]. You populate a
    [GMenu] by adding [Gio.MenuItem] instances to it.

    Its methods, signals and properties are on {!class-type-menu_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Menu}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Menu].}

    Inherits from: {{!Ocgio.Menu_model.class-type-menu_model_t}Ocgio.Menu_model}

    [GMenu] is a simple implementation of [Gio.MenuModel]. You populate a
    [GMenu] by adding [Gio.MenuItem] instances to it.

    There are some convenience functions to allow you to directly add items
    (avoiding [Gio.MenuItem]) for the common cases. To add a regular item, use
    [Gio.Menu.insert]. To add a section, use [Gio.Menu.insert_section]. To add a
    submenu, use [Gio.Menu.insert_submenu]. *)
class type menu_t = object
  inherit Menu_model.menu_model_t

  (** {2:methods Methods} *)

  method append : string option -> string option -> unit
  (** Convenience function for appending a normal menu item to the end of
      [menu]. Combine g_menu_item_new() and g_menu_insert_item() for a more
      flexible alternative. *)

  method append_item : Menu_item.menu_item_t -> unit
  (** Appends [item] to the end of [menu].

      See g_menu_insert_item() for more information. *)

  method append_section : string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for appending a section menu item to the end of
      [menu]. Combine g_menu_item_new_section() and g_menu_insert_item() for a
      more flexible alternative. *)

  method append_submenu : string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for appending a submenu menu item to the end of
      [menu]. Combine g_menu_item_new_submenu() and g_menu_insert_item() for a
      more flexible alternative. *)

  method freeze : unit -> unit
  (** Marks [menu] as frozen.

      After the menu is frozen, it is an error to attempt to make any changes to
      it. In effect this means that the [GMenu] API must no longer be used.

      This function causes g_menu_model_is_mutable() to begin returning [false],
      which has some positive performance implications. *)

  method insert : int -> string option -> string option -> unit
  (** Convenience function for inserting a normal menu item into [menu]. Combine
      g_menu_item_new() and g_menu_insert_item() for a more flexible
      alternative. *)

  method insert_item : int -> Menu_item.menu_item_t -> unit
  [@@ocaml.doc
    "Inserts [item] into [menu].\n\n\
     The \"insertion\" is actually done by copying all of the attribute and\n\
     link values of [item] and using them to form a new item within [menu].\n\
     As such, [item] itself is not really inserted, but rather, a menu item\n\
     that is exactly the same as the one presently described by [item].\n\n\
     This means that [item] is essentially useless after the insertion\n\
     occurs.  Any changes you make to it are ignored unless it is inserted\n\
     again (at which point its updated values will be copied).\n\n\
     You should probably just free [item] once you're done.\n\n\
     There are many convenience functions to take care of common cases.\n\
     See g_menu_insert(), g_menu_insert_section() and\n\
     g_menu_insert_submenu() as well as \"prepend\" and \"append\" variants of\n\
     each of these functions."]

  method insert_section :
    int -> string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for inserting a section menu item into [menu].
      Combine g_menu_item_new_section() and g_menu_insert_item() for a more
      flexible alternative. *)

  method insert_submenu :
    int -> string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for inserting a submenu menu item into [menu].
      Combine g_menu_item_new_submenu() and g_menu_insert_item() for a more
      flexible alternative. *)

  method prepend : string option -> string option -> unit
  (** Convenience function for prepending a normal menu item to the start of
      [menu]. Combine g_menu_item_new() and g_menu_insert_item() for a more
      flexible alternative. *)

  method prepend_item : Menu_item.menu_item_t -> unit
  (** Prepends [item] to the start of [menu].

      See g_menu_insert_item() for more information. *)

  method prepend_section : string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for prepending a section menu item to the start of
      [menu]. Combine g_menu_item_new_section() and g_menu_insert_item() for a
      more flexible alternative. *)

  method prepend_submenu : string option -> Menu_model.menu_model_t -> unit
  (** Convenience function for prepending a submenu menu item to the start of
      [menu]. Combine g_menu_item_new_submenu() and g_menu_insert_item() for a
      more flexible alternative. *)

  method remove : int -> unit
  (** Removes an item from the menu.

      [position] gives the index of the item to remove.

      It is an error if position is not in range the range from 0 to one less
      than the number of items in the menu.

      It is not possible to remove items by identity since items are added to
      the menu simply by copying their links and attributes (ie: identity of the
      item itself is not preserved). *)

  method remove_all : unit -> unit
  (** Removes all items in the menu. *)

  (** {2:conversions Conversions} *)

  method as_menu : Raw.Menu.t
end

class menu : Raw.Menu.t -> menu_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu.t}. *)

(** {1:description Description}

    [GMenu] is a simple implementation of [Gio.MenuModel]. You populate a
    [GMenu] by adding [Gio.MenuItem] instances to it.

    There are some convenience functions to allow you to directly add items
    (avoiding [Gio.MenuItem]) for the common cases. To add a regular item, use
    [Gio.Menu.insert]. To add a section, use [Gio.Menu.insert_section]. To add a
    submenu, use [Gio.Menu.insert_submenu]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> menu_t
(** Creates a new [GMenu].

    The new menu has no items. *)
