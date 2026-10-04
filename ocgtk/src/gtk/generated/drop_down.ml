(* GENERATED CODE - DO NOT EDIT *)
(* DropDown: DropDown *)

[@@@ocaml.text
"Allows the user to choose an item from a list of options.\n\n\
 An example GtkDropDown\n\n\
 The [GtkDropDown] displays the \\[selected\\][Gtk.DropDown:selected]\n\
 choice.\n\n\
 The options are given to [GtkDropDown] in the form of [GListModel]\n\
 and how the individual options are represented is determined by\n\
 a [Gtk.ListItemFactory]. The default factory displays simple strings,\n\
 and adds a checkmark to the selected item in the popup.\n\n\
 To set your own factory, use [Gtk.DropDown.set_factory]. It is\n\
 possible to use a separate factory for the items in the popup, with\n\
 [Gtk.DropDown.set_list_factory].\n\n\
 [GtkDropDown] knows how to obtain strings from the items in a\n\
 [Gtk.StringList]; for other models, you have to provide an expression\n\
 to find the strings via [Gtk.DropDown.set_expression].\n\n\
 [GtkDropDown] can optionally allow search in the popup, which is\n\
 useful if the list of options is long. To enable the search entry,\n\
 use [Gtk.DropDown.set_enable_search].\n\n\
 Here is a UI definition example for [GtkDropDown] with a simple model:\n\n\
 {[\n\
 <object class=\"GtkDropDown\">\n\
\  <property name=\"model\">\n\
\    <object class=\"GtkStringList\">\n\
\      <items>\n\
\        <item translatable=\"yes\">Factory</item>\n\
\        <item translatable=\"yes\">Home</item>\n\
\        <item translatable=\"yes\">Subway</item>\n\
\      </items>\n\
\    </object>\n\
\  </property>\n\
 </object>\n\
 ]}\n\n\
 If a [GtkDropDown] is created in this manner, or with\n\
 [Gtk.DropDown.new_from_strings], for instance, the object returned from\n\
 [Gtk.DropDown.get_selected_item] will be a [Gtk.StringObject].\n\n\
 To learn more about the list widget framework, see the\n\
 overview.\n\n\
 {b CSS nodes}\n\n\
 [GtkDropDown] has a single CSS node with name dropdown,\n\
 with the button and popover nodes as children.\n\n\
 {b Accessibility}\n\n\
 [GtkDropDown] uses the [Gtk.AccessibleRole.combo_box] role."]

type t = [ `drop_down | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ :
  Ocgtk_gio.Gio.Wrappers.List_model.t option -> Expression.t option -> t
  = "ml_gtk_drop_down_new"
(** Create a new DropDown *)

external new_from_strings : string array -> t
  = "ml_gtk_drop_down_new_from_strings"
(** Create a new DropDown *)

(* Methods *)

external set_show_arrow : t -> bool -> unit = "ml_gtk_drop_down_set_show_arrow"
(** Sets whether an arrow will be displayed within the widget. *)

external set_selected : t -> int -> unit = "ml_gtk_drop_down_set_selected"
(** Selects the item at the given position. *)

external set_search_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit
  = "ml_gtk_drop_down_set_search_match_mode"
(** Sets the match mode for the search filter. *)

external set_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option -> unit
  = "ml_gtk_drop_down_set_model"
(** Sets the [GListModel] to use. *)

external set_list_factory : t -> List_item_factory.t option -> unit
  = "ml_gtk_drop_down_set_list_factory"
(** Sets the [GtkListItemFactory] to use for populating list items in the popup.
*)

external set_header_factory : t -> List_item_factory.t option -> unit
  = "ml_gtk_drop_down_set_header_factory"
(** Sets the [GtkListItemFactory] to use for creating header widgets for the
    popup. *)

external set_factory : t -> List_item_factory.t option -> unit
  = "ml_gtk_drop_down_set_factory"
(** Sets the [GtkListItemFactory] to use for populating list items. *)

external set_expression : t -> Expression.t option -> unit
  = "ml_gtk_drop_down_set_expression"
(** Sets the expression that gets evaluated to obtain strings from items.

    This is used for search in the popup. The expression must have a value type
    of [G_TYPE_STRING]. *)

external set_enable_search : t -> bool -> unit
  = "ml_gtk_drop_down_set_enable_search"
(** Sets whether a search entry will be shown in the popup that allows to search
    for items in the list.

    Note that [Gtk.DropDown:expression] must be set for search to work. *)

external get_show_arrow : t -> bool = "ml_gtk_drop_down_get_show_arrow"
(** Returns whether to show an arrow within the widget. *)

external get_selected_item : t -> [ `object_ ] Gobject.obj option
  = "ml_gtk_drop_down_get_selected_item"
(** Gets the selected item. If no item is selected, [NULL] is returned. *)

external get_selected : t -> int = "ml_gtk_drop_down_get_selected"
(** Gets the position of the selected item. *)

external get_search_match_mode : t -> Gtk_enums.stringfiltermatchmode
  = "ml_gtk_drop_down_get_search_match_mode"
(** Returns the match mode that the search filter is using. *)

external get_model : t -> Ocgtk_gio.Gio.Wrappers.List_model.t option
  = "ml_gtk_drop_down_get_model"
(** Gets the model that provides the displayed items. *)

external get_list_factory : t -> List_item_factory.t option
  = "ml_gtk_drop_down_get_list_factory"
(** Gets the factory that's currently used to populate list items in the popup.
*)

external get_header_factory : t -> List_item_factory.t option
  = "ml_gtk_drop_down_get_header_factory"
(** Gets the factory that's currently used to create header widgets for the
    popup. *)

external get_factory : t -> List_item_factory.t option
  = "ml_gtk_drop_down_get_factory"
(** Gets the factory that's currently used to populate list items.

    The factory returned by this function is always used for the item in the
    button. It is also used for items in the popup if
    [Gtk.DropDown:list-factory] is not set. *)

external get_expression : t -> Expression.t option
  = "ml_gtk_drop_down_get_expression"
(** Gets the expression set that is used to obtain strings from items.

    See [Gtk.DropDown.set_expression]. *)

external get_enable_search : t -> bool = "ml_gtk_drop_down_get_enable_search"
(** Returns whether search is enabled. *)

(* Properties *)

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)
