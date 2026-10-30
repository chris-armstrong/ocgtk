(* GENERATED CODE - DO NOT EDIT *)
(* Menu: Menu *)

(** [GMenu] is a simple implementation of
    {{!Ocgio.Raw.Menu_model}[Gio.MenuModel]}. You populate a [GMenu] by adding
    {{!Ocgio.Raw.Menu_item}[Gio.MenuItem]} instances to it.

    There are some convenience functions to allow you to directly add items
    (avoiding {{!Ocgio.Raw.Menu_item}[Gio.MenuItem]}) for the common cases. To
    add a regular item, use {{!Ocgio.Raw.Menu.val-insert}[Gio.Menu.insert]}. To
    add a section, use
    {{!Ocgio.Raw.Menu.val-insert_section}[Gio.Menu.insert_section]}. To add a
    submenu, use
    {{!Ocgio.Raw.Menu.val-insert_submenu}[Gio.Menu.insert_submenu]}.

    The class built on this module is in {!Ocgio.Menu}. *)

type t = [ `menu | `menu_model | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_menu_get_type"

external new_ : unit -> t = "ml_g_menu_new"
(** Creates a new {{!Ocgio.Raw.Menu}[GMenu]}.

    The new menu has no items. *)

(* Methods *)

external remove_all : t -> unit = "ml_g_menu_remove_all"
(** Removes all items in the menu. *)

external remove : t -> int -> unit = "ml_g_menu_remove"
(** Removes an item from the menu.

    [position] gives the index of the item to remove.

    It is an error if position is not in range the range from 0 to one less than
    the number of items in the menu.

    It is not possible to remove items by identity since items are added to the
    menu simply by copying their links and attributes (ie: identity of the item
    itself is not preserved). *)

external prepend_submenu :
  t -> string option -> Menu_link_iter_and__menu_model.Menu_model.t -> unit
  = "ml_g_menu_prepend_submenu"
(** Convenience function for prepending a submenu menu item to the start of
    [menu]. Combine
    {{!Ocgio.Raw.Menu_item.val-new_submenu}[g_menu_item_new_submenu ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external prepend_section :
  t -> string option -> Menu_link_iter_and__menu_model.Menu_model.t -> unit
  = "ml_g_menu_prepend_section"
(** Convenience function for prepending a section menu item to the start of
    [menu]. Combine
    {{!Ocgio.Raw.Menu_item.val-new_section}[g_menu_item_new_section ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external prepend_item : t -> Menu_item.t -> unit = "ml_g_menu_prepend_item"
(** Prepends [item] to the start of [menu].

    See {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for more
    information. *)

external prepend : t -> string option -> string option -> unit
  = "ml_g_menu_prepend"
(** Convenience function for prepending a normal menu item to the start of
    [menu]. Combine {{!Ocgio.Raw.Menu_item.val-new_}[g_menu_item_new ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external insert_submenu :
  t ->
  int ->
  string option ->
  Menu_link_iter_and__menu_model.Menu_model.t ->
  unit = "ml_g_menu_insert_submenu"
(** Convenience function for inserting a submenu menu item into [menu]. Combine
    {{!Ocgio.Raw.Menu_item.val-new_submenu}[g_menu_item_new_submenu ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external insert_section :
  t ->
  int ->
  string option ->
  Menu_link_iter_and__menu_model.Menu_model.t ->
  unit = "ml_g_menu_insert_section"
(** Convenience function for inserting a section menu item into [menu]. Combine
    {{!Ocgio.Raw.Menu_item.val-new_section}[g_menu_item_new_section ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external insert_item : t -> int -> Menu_item.t -> unit = "ml_g_menu_insert_item"
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
   See {{!Ocgio.Raw.Menu.val-insert}[g_menu_insert ()]}, \
   {{!Ocgio.Raw.Menu.val-insert_section}[g_menu_insert_section ()]} and\n\
   {{!Ocgio.Raw.Menu.val-insert_submenu}[g_menu_insert_submenu ()]} as well as \
   \"prepend\" and \"append\" variants of\n\
   each of these functions."]

external insert : t -> int -> string option -> string option -> unit
  = "ml_g_menu_insert"
(** Convenience function for inserting a normal menu item into [menu]. Combine
    {{!Ocgio.Raw.Menu_item.val-new_}[g_menu_item_new ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external freeze : t -> unit = "ml_g_menu_freeze"
(** Marks [menu] as frozen.

    After the menu is frozen, it is an error to attempt to make any changes to
    it. In effect this means that the {{!Ocgio.Raw.Menu}[GMenu]} API must no
    longer be used.

    This function causes
    {{!Ocgio.Raw.Menu_model.val-is_mutable}[g_menu_model_is_mutable ()]} to
    begin returning [false], which has some positive performance implications.
*)

external append_submenu :
  t -> string option -> Menu_link_iter_and__menu_model.Menu_model.t -> unit
  = "ml_g_menu_append_submenu"
(** Convenience function for appending a submenu menu item to the end of [menu].
    Combine {{!Ocgio.Raw.Menu_item.val-new_submenu}[g_menu_item_new_submenu ()]}
    and {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external append_section :
  t -> string option -> Menu_link_iter_and__menu_model.Menu_model.t -> unit
  = "ml_g_menu_append_section"
(** Convenience function for appending a section menu item to the end of [menu].
    Combine {{!Ocgio.Raw.Menu_item.val-new_section}[g_menu_item_new_section ()]}
    and {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)

external append_item : t -> Menu_item.t -> unit = "ml_g_menu_append_item"
(** Appends [item] to the end of [menu].

    See {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for more
    information. *)

external append : t -> string option -> string option -> unit
  = "ml_g_menu_append"
(** Convenience function for appending a normal menu item to the end of [menu].
    Combine {{!Ocgio.Raw.Menu_item.val-new_}[g_menu_item_new ()]} and
    {{!Ocgio.Raw.Menu.val-insert_item}[g_menu_insert_item ()]} for a more
    flexible alternative. *)
