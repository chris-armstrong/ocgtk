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
 Its methods, signals and properties are on {!class-type-drop_down_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Drop_down}."]

(** The methods, signals and properties of a [GtkDropDown]. *)
class type drop_down_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_enable_search : unit -> bool
  method get_expression : unit -> Expression.expression_t option
  method get_factory : unit -> List_item_factory.list_item_factory_t option

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option

  method get_list_factory : unit -> List_item_factory.list_item_factory_t option
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_search_match_mode : unit -> Enums.stringfiltermatchmode
  method get_selected : unit -> int
  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  method get_show_arrow : unit -> bool
  method set_enable_search : bool -> unit
  method set_expression : Expression.expression_t option -> unit
  method set_factory : List_item_factory.list_item_factory_t option -> unit

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit

  method set_list_factory : List_item_factory.list_item_factory_t option -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_search_match_mode : Enums.stringfiltermatchmode -> unit
  method set_selected : int -> unit
  method set_show_arrow : bool -> unit
  method as_drop_down : Raw.Drop_down.t
end

class drop_down : Raw.Drop_down.t -> drop_down_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drop_down.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkDropDown], give one already wrapped. *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Expression.expression_t option ->
  drop_down_t

val new_from_strings : string array -> drop_down_t
