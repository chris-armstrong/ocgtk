[@@@ocaml.text
"Switches between children using tabs.\n\n\
 An example GtkNotebook\n\n\
 There are many configuration options for [GtkNotebook]. Among\n\
 other things, you can choose on which edge the tabs appear\n\
 (see [Gtk.Notebook.set_tab_pos]), whether, if there are\n\
 too many tabs to fit the notebook should be made bigger or scrolling\n\
 arrows added (see [Gtk.Notebook.set_scrollable]), and whether\n\
 there will be a popup menu allowing the users to switch pages.\n\
 (see [Gtk.Notebook.popup_enable]).\n\n\
 {b GtkNotebook as GtkBuildable}\n\n\
 The [GtkNotebook] implementation of the [GtkBuildable] interface\n\
 supports placing children into tabs by specifying “tab” as the\n\
 “type” attribute of a [<child>] element. Note that the content\n\
 of the tab must be created before the tab can be filled.\n\
 A tab child can be specified without specifying a [<child>]\n\
 type attribute.\n\n\
 To add a child widget in the notebooks action area, specify\n\
 \"action-start\" or “action-end” as the “type” attribute of the\n\
 [<child>] element.\n\n\
 An example of a UI definition fragment with [GtkNotebook]:\n\n\
 {[\n\
 <object class=\"GtkNotebook\">\n\
\  <child>\n\
\    <object class=\"GtkLabel\" id=\"notebook-content\">\n\
\      <property name=\"label\">Content</property>\n\
\    </object>\n\
\  </child>\n\
\  <child type=\"tab\">\n\
\    <object class=\"GtkLabel\" id=\"notebook-tab\">\n\
\      <property name=\"label\">Tab</property>\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkNotebook] supports the following keyboard shortcuts:\n\n\
 - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.\n\
 - <kbd>Home</kbd> moves the focus to the first tab.\n\
 - <kbd>End</kbd> moves the focus to the last tab.\n\n\
 Additionally, the following signals have default keybindings:\n\n\
 - [Gtk.Notebook::change-current-page]\n\
 - [Gtk.Notebook::focus-tab]\n\
 - [Gtk.Notebook::move-focus-out]\n\
 - [Gtk.Notebook::reorder-tab]\n\
 - [Gtk.Notebook::select-page]\n\n\
 Tabs support drag-and-drop between notebooks sharing the same [group-name],\n\
 or to new windows by handling the [::create-window] signal.\n\n\
 {b Actions}\n\n\
 [GtkNotebook] defines a set of built-in actions:\n\n\
 - [menu.popup] opens the tabs context menu.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 notebook\n\
 ├── header.top\n\
 │   ├── [<action widget>]\n\
 │   ├── tabs\n\
 │   │   ├── [arrow]\n\
 │   │   ├── tab\n\
 │   │   │   ╰── <tab label>\n\
 ┊   ┊   ┊\n\
 │   │   ├── tab[.reorderable-page]\n\
 │   │   │   ╰── <tab label>\n\
 │   │   ╰── [arrow]\n\
 │   ╰── [<action widget>]\n\
 │\n\
 ╰── stack\n\
\    ├── <child>\n\
\    ┊\n\
\    ╰── <child>\n\
 ]}\n\n\
 [GtkNotebook] has a main CSS node with name [notebook], a subnode\n\
 with name [header] and below that a subnode with name [tabs] which\n\
 contains one subnode per tab with name [tab].\n\n\
 If action widgets are present, their CSS nodes are placed next\n\
 to the [tabs] node. If the notebook is scrollable, CSS nodes with\n\
 name [arrow] are placed as first and last child of the [tabs] node.\n\n\
 The main node gets the [.frame] style class when the notebook\n\
 has a border (see [Gtk.Notebook.set_show_border]).\n\n\
 The header node gets one of the style class [.top], [.bottom],\n\
 [.left] or [.right], depending on where the tabs are placed. For\n\
 reorderable pages, the tab node gets the [.reorderable-page] class.\n\n\
 A [tab] node gets the [.dnd] style class while it is moved with \
 drag-and-drop.\n\n\
 The nodes are always arranged from left-to-right, regardless of text \
 direction.\n\n\
 {b Accessibility}\n\n\
 [GtkNotebook] uses the following roles:\n\n\
 - [Gtk.AccessibleRole.group] for the notebook widget\n\
 - [Gtk.AccessibleRole.tab_list] for the list of tabs\n\
 - [Gtk.AccessibleRole.tab] role for each tab\n\
 - [Gtk.AccessibleRole.tab_panel] for each page\n\n\
 Its methods, signals and properties are on {!class-type-notebook_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Notebook}."]

(** The methods, signals and properties of a [GtkNotebook]. *)
class type notebook_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_change_current_page :
    ?after:bool ->
    callback:(page:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_create_window :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      notebook_t option) ->
    unit ->
    Gobject.Signal.handler_id

  method on_focus_tab :
    ?after:bool ->
    callback:(tab:Enums.notebooktab -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_added :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_removed :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_reordered :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_reorder_tab :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> move_to_last:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_page :
    ?after:bool ->
    callback:(move_focus:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_switch_page :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method append_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method detach_tab :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_action_widget :
    Enums.packtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_current_page : unit -> int
  method get_group_name : unit -> string option

  method get_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option

  method get_n_pages : unit -> int

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Notebook_page.notebook_page_t

  method get_pages : unit -> Ocgio.List_model.list_model_t
  method get_scrollable : unit -> bool
  method get_show_border : unit -> bool
  method get_show_tabs : unit -> bool

  method get_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method get_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option

  method get_tab_pos : unit -> Enums.positiontype

  method get_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int ->
    int

  method insert_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int ->
    int

  method next_page : unit -> unit

  method page_num :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method popup_disable : unit -> unit
  method popup_enable : unit -> unit

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method prepend_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method prev_page : unit -> unit
  method remove_page : int -> unit

  method reorder_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method set_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.packtype ->
    unit

  method set_current_page : int -> unit
  method set_group_name : string option -> unit

  method set_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_scrollable : bool -> unit
  method set_show_border : bool -> unit
  method set_show_tabs : bool -> unit

  method set_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method set_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_tab_pos : Enums.positiontype -> unit

  method set_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method enable_popup : bool
  method set_enable_popup : bool -> unit
  method as_notebook : Raw.Notebook.t
end

class notebook : Raw.Notebook.t -> notebook_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Notebook.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNotebook], give one already wrapped. *)

val new_ : unit -> notebook_t
