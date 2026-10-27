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
 [GtkDropDown] uses the [Gtk.AccessibleRole.combo_box] role.\n\n\
 Its methods, signals and properties are on {!class-type-drop_down_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Drop_down}."]

(** The methods, signals and properties of a [GtkDropDown]. *)
class type drop_down_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_enable_search : unit -> bool
  (** Returns whether search is enabled. *)

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression set that is used to obtain strings from items.

      See [Gtk.DropDown.set_expression]. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items.

      The factory returned by this function is always used for the item in the
      button. It is also used for items in the popup if
      [Gtk.DropDown:list-factory] is not set. *)

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to create header widgets for the
      popup. *)

  method get_list_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items in the
      popup. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that provides the displayed items. *)

  method get_search_match_mode : unit -> Enums.stringfiltermatchmode
  (** Returns the match mode that the search filter is using. *)

  method get_selected : unit -> int
  (** Gets the position of the selected item. *)

  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the selected item. If no item is selected, [NULL] is returned. *)

  method get_show_arrow : unit -> bool
  (** Returns whether to show an arrow within the widget. *)

  method set_enable_search : bool -> unit
  (** Sets whether a search entry will be shown in the popup that allows to
      search for items in the list.

      Note that [Gtk.DropDown:expression] must be set for search to work. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that gets evaluated to obtain strings from items.

      This is used for search in the popup. The expression must have a value
      type of [G_TYPE_STRING]. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items. *)

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for creating header widgets for the
      popup. *)

  method set_list_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items in the
      popup. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the [GListModel] to use. *)

  method set_search_match_mode : Enums.stringfiltermatchmode -> unit
  (** Sets the match mode for the search filter. *)

  method set_selected : int -> unit
  (** Selects the item at the given position. *)

  method set_show_arrow : bool -> unit
  (** Sets whether an arrow will be displayed within the widget. *)

  method as_drop_down : Raw.Drop_down.t
end

class drop_down : Raw.Drop_down.t -> drop_down_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drop_down.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkDropDown], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Expression.expression_t option ->
  drop_down_t
(** Creates a new [GtkDropDown].

    You may want to call [Gtk.DropDown.set_factory] to set up a way to map its
    items to widgets. *)

val new_from_strings : string array -> drop_down_t
(** Creates a new [GtkDropDown] that is populated with the strings. *)
