(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DropDown *)

type t = [`drop_down | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new DropDown *)
external new_ : unit -> Expression.t option -> t = "ml_gtk_drop_down_new"

(** Create a new DropDown *)
external new_from_strings : unit -> t = "ml_gtk_drop_down_new_from_strings"

(* Properties *)

(** Get property: enable-search *)
external get_enable_search : t -> bool = "ml_gtk_drop_down_get_enable_search"

(** Set property: enable-search *)
external set_enable_search : t -> bool -> unit = "ml_gtk_drop_down_set_enable_search"

(** Get property: selected *)
external get_selected : t -> int = "ml_gtk_drop_down_get_selected"

(** Set property: selected *)
external set_selected : t -> int -> unit = "ml_gtk_drop_down_set_selected"

(** Get property: show-arrow *)
external get_show_arrow : t -> bool = "ml_gtk_drop_down_get_show_arrow"

(** Set property: show-arrow *)
external set_show_arrow : t -> bool -> unit = "ml_gtk_drop_down_set_show_arrow"

(** Sets the match mode for the search filter. *)
external set_search_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_drop_down_set_search_match_mode"

(** Sets the `GtkListItemFactory` to use for populating list items in the popup. *)
external set_list_factory : t -> List_item_factory.t option -> unit = "ml_gtk_drop_down_set_list_factory"

(** Sets the `GtkListItemFactory` to use for creating header widgets for the popup. *)
external set_header_factory : t -> List_item_factory.t option -> unit = "ml_gtk_drop_down_set_header_factory"

(** Sets the `GtkListItemFactory` to use for populating list items. *)
external set_factory : t -> List_item_factory.t option -> unit = "ml_gtk_drop_down_set_factory"

(** Sets the expression that gets evaluated to obtain strings from items.

This is used for search in the popup. The expression must have
a value type of %G_TYPE_STRING. *)
external set_expression : t -> Expression.t option -> unit = "ml_gtk_drop_down_set_expression"

(** Returns the match mode that the search filter is using. *)
external get_search_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_drop_down_get_search_match_mode"

(** Gets the factory that's currently used to populate list items in the popup. *)
external get_list_factory : t -> List_item_factory.t option = "ml_gtk_drop_down_get_list_factory"

(** Gets the factory that's currently used to create header widgets for the popup. *)
external get_header_factory : t -> List_item_factory.t option = "ml_gtk_drop_down_get_header_factory"

(** Gets the factory that's currently used to populate list items.

The factory returned by this function is always used for the
item in the button. It is also used for items in the popup
if [property@Gtk.DropDown:list-factory] is not set. *)
external get_factory : t -> List_item_factory.t option = "ml_gtk_drop_down_get_factory"

(** Gets the expression set that is used to obtain strings from items.

See [method@Gtk.DropDown.set_expression]. *)
external get_expression : t -> Expression.t option = "ml_gtk_drop_down_get_expression"

