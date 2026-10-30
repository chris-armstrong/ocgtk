(** Allows the user to choose an item from a list of options.

    Its methods, signals and properties are on {!class-type-drop_down_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Drop_down}. *)

(** {1:class Class} *)

class type drop_down_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the drop down is activated.

      The [::activate] signal on [GtkDropDown] is an action signal and emitting
      it causes the drop down to pop up its dropdown. *)

  (** {2:methods Methods} *)

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
  (** Gets the selected item. If no item is selected, [None] is returned. *)

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

  (** {2:conversions Conversions} *)

  method as_drop_down : Raw.Drop_down.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DropDown].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Allows the user to choose an item from a list of options.\n\n\
     An example GtkDropDown\n\n\
     The [GtkDropDown] displays the \
     \\[selected\\]{{!Ocgtk.Drop_down.class-type-drop_down_t.method-get_selected}[Gtk.DropDown:selected]}\n\
     choice.\n\n\
     The options are given to [GtkDropDown] in the form of [GListModel]\n\
     and how the individual options are represented is determined by\n\
     a \
     {{!Ocgtk.List_item_factory.class-type-list_item_factory_t}[Gtk.ListItemFactory]}. \
     The default factory displays simple strings,\n\
     and adds a checkmark to the selected item in the popup.\n\n\
     To set your own factory, use \
     {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_factory}[Gtk.DropDown.set_factory]}. \
     It is\n\
     possible to use a separate factory for the items in the popup, with\n\
     {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_list_factory}[Gtk.DropDown.set_list_factory]}.\n\n\
     [GtkDropDown] knows how to obtain strings from the items in a\n\
     {{!Ocgtk.String_list.class-type-string_list_t}[Gtk.StringList]}; for \
     other models, you have to provide an expression\n\
     to find the strings via \
     {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_expression}[Gtk.DropDown.set_expression]}.\n\n\
     [GtkDropDown] can optionally allow search in the popup, which is\n\
     useful if the list of options is long. To enable the search entry,\n\
     use \
     {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_enable_search}[Gtk.DropDown.set_enable_search]}.\n\n\
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
     {{!Ocgtk.Drop_down.val-new_from_strings}[Gtk.DropDown.new_from_strings]}, \
     for instance, the object returned from\n\
     {{!Ocgtk.Drop_down.class-type-drop_down_t.method-get_selected_item}[Gtk.DropDown.get_selected_item]} \
     will be a \
     {{!Ocgtk.String_object.class-type-string_object_t}[Gtk.StringObject]}.\n\n\
     To learn more about the list widget framework, see the\n\
     overview.\n\n\
     {b CSS nodes}\n\n\
     [GtkDropDown] has a single CSS node with name dropdown,\n\
     with the button and popover nodes as children.\n\n\
     {b Accessibility}\n\n\
     [GtkDropDown] uses the \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-COMBO_BOX}[Gtk.AccessibleRole.combo_box]} \
     role."]

class drop_down : Raw.Drop_down.t -> drop_down_t
(** Wraps a raw handle of {!Ocgtk.Raw.Drop_down.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Allows the user to choose an item from a list of options.\n\n\
 An example GtkDropDown\n\n\
 The [GtkDropDown] displays the \
 \\[selected\\]{{!Ocgtk.Drop_down.class-type-drop_down_t.method-get_selected}[Gtk.DropDown:selected]}\n\
 choice.\n\n\
 The options are given to [GtkDropDown] in the form of [GListModel]\n\
 and how the individual options are represented is determined by\n\
 a \
 {{!Ocgtk.List_item_factory.class-type-list_item_factory_t}[Gtk.ListItemFactory]}. \
 The default factory displays simple strings,\n\
 and adds a checkmark to the selected item in the popup.\n\n\
 To set your own factory, use \
 {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_factory}[Gtk.DropDown.set_factory]}. \
 It is\n\
 possible to use a separate factory for the items in the popup, with\n\
 {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_list_factory}[Gtk.DropDown.set_list_factory]}.\n\n\
 [GtkDropDown] knows how to obtain strings from the items in a\n\
 {{!Ocgtk.String_list.class-type-string_list_t}[Gtk.StringList]}; for other \
 models, you have to provide an expression\n\
 to find the strings via \
 {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_expression}[Gtk.DropDown.set_expression]}.\n\n\
 [GtkDropDown] can optionally allow search in the popup, which is\n\
 useful if the list of options is long. To enable the search entry,\n\
 use \
 {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_enable_search}[Gtk.DropDown.set_enable_search]}.\n\n\
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
 {{!Ocgtk.Drop_down.val-new_from_strings}[Gtk.DropDown.new_from_strings]}, for \
 instance, the object returned from\n\
 {{!Ocgtk.Drop_down.class-type-drop_down_t.method-get_selected_item}[Gtk.DropDown.get_selected_item]} \
 will be a \
 {{!Ocgtk.String_object.class-type-string_object_t}[Gtk.StringObject]}.\n\n\
 To learn more about the list widget framework, see the\n\
 overview.\n\n\
 {b CSS nodes}\n\n\
 [GtkDropDown] has a single CSS node with name dropdown,\n\
 with the button and popover nodes as children.\n\n\
 {b Accessibility}\n\n\
 [GtkDropDown] uses the \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-COMBO_BOX}[Gtk.AccessibleRole.combo_box]} \
 role."]

(** {1:constructors Constructors} *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Expression.expression_t option ->
  drop_down_t
(** Creates a new [GtkDropDown].

    You may want to call
    {{!Ocgtk.Drop_down.class-type-drop_down_t.method-set_factory}[Gtk.DropDown.set_factory]}
    to set up a way to map its items to widgets. *)

val new_from_strings : string array -> drop_down_t
(** Creates a new [GtkDropDown] that is populated with the strings. *)
