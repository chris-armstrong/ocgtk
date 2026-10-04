(* GENERATED CODE - DO NOT EDIT *)
(* Notebook: Notebook *)

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
 - [Gtk.AccessibleRole.tab_panel] for each page"]

type t = [ `notebook | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_notebook_new"
(** Create a new Notebook *)

(* Methods *)

external set_tab_reorderable :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool ->
  unit = "ml_gtk_notebook_set_tab_reorderable"
(** Sets whether the notebook tab can be reordered via drag and drop or not. *)

external set_tab_pos : t -> Gtk_enums.positiontype -> unit
  = "ml_gtk_notebook_set_tab_pos"
(** Sets the edge at which the tabs are drawn. *)

external set_tab_label_text :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string ->
  unit = "ml_gtk_notebook_set_tab_label_text"
(** Creates a new label and sets it as the tab label for the page containing
    [child]. *)

external set_tab_label :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_notebook_set_tab_label"
(** Changes the tab label for [child].

    If [NULL] is specified for [tab_label], then the page will have the label
    “page N”. *)

external set_tab_detachable :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool ->
  unit = "ml_gtk_notebook_set_tab_detachable"
[@@ocaml.doc
  "Sets whether the tab can be detached from [notebook] to another\n\
   notebook or widget.\n\n\
   Note that two notebooks must share a common group identifier\n\
   (see [Gtk.Notebook.set_group_name]) to allow automatic tabs\n\
   interchange between them.\n\n\
   If you want a widget to interact with a notebook through DnD\n\
   (i.e.: accept dragged tabs from it) it must be set as a drop\n\
   destination by adding to it a [Gtk.DropTarget] controller that accepts\n\
   the GType [GTK_TYPE_NOTEBOOK_PAGE]. The [:value] of said drop target will be\n\
   preloaded with a [Gtk.NotebookPage] object that corresponds to the\n\
   dropped tab, so you can process the value via [::accept] or [::drop] \
   signals.\n\n\
   Note that you should use [Gtk.Notebook.detach_tab] instead\n\
   of [Gtk.Notebook.remove_page] if you want to remove the tab\n\
   from the source notebook as part of accepting a drop. Otherwise,\n\
   the source notebook will think that the dragged tab was removed\n\
   from underneath the ongoing drag operation, and will initiate a\n\
   drag cancel animation.\n\n\
   {[\n\
   static void\n\
   on_drag_data_received (GtkWidget        *widget,\n\
  \                       GdkDrop          *drop,\n\
  \                       GtkSelectionData *data,\n\
  \                       guint             time,\n\
  \                       gpointer          user_data)\n\
   {\n\
  \  GtkDrag *drag;\n\
  \  GtkWidget *notebook;\n\
  \  GtkWidget **child;\n\n\
  \  drag = gtk_drop_get_drag (drop);\n\
  \  notebook = g_object_get_data (drag, \"gtk-notebook-drag-origin\");\n\
  \  child = (void*\\) gtk_selection_data_get_data (data);\n\n\
  \  // process_widget (\\*child);\n\n\
  \  gtk_notebook_detach_tab (GTK_NOTEBOOK (notebook), *child);\n\
   }\n\
   ]}\n\n\
   If you want a notebook to accept drags from other widgets,\n\
   you will have to set your own DnD code to do it."]

external set_show_tabs : t -> bool -> unit = "ml_gtk_notebook_set_show_tabs"
(** Sets whether to show the tabs for the notebook or not. *)

external set_show_border : t -> bool -> unit = "ml_gtk_notebook_set_show_border"
(** Sets whether a bevel will be drawn around the notebook pages.

    This only has a visual effect when the tabs are not shown. *)

external set_scrollable : t -> bool -> unit = "ml_gtk_notebook_set_scrollable"
(** Sets whether the tab label area will have arrows for scrolling if there are
    too many tabs to fit in the area. *)

external set_menu_label_text :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string ->
  unit = "ml_gtk_notebook_set_menu_label_text"
(** Creates a new label and sets it as the menu label of [child]. *)

external set_menu_label :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_notebook_set_menu_label"
(** Changes the menu label for the page containing [child]. *)

external set_group_name : t -> string option -> unit
  = "ml_gtk_notebook_set_group_name"
(** Sets a group name for [notebook].

    Notebooks with the same name will be able to exchange tabs via drag and
    drop. A notebook with a [NULL] group name will not be able to exchange tabs
    with any other notebook. *)

external set_current_page : t -> int -> unit
  = "ml_gtk_notebook_set_current_page"
(** Switches to the page number [page_num].

    Note that due to historical reasons, GtkNotebook refuses to switch to a page
    unless the child widget is visible. Therefore, it is recommended to show
    child widgets before adding them to a notebook. *)

external set_action_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Gtk_enums.packtype ->
  unit = "ml_gtk_notebook_set_action_widget"
(** Sets [widget] as one of the action widgets.

    Depending on the pack type the widget will be placed before or after the
    tabs. You can use a [GtkBox] if you need to pack more than one widget on the
    same side. *)

external reorder_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  unit = "ml_gtk_notebook_reorder_child"
(** Reorders the page containing [child], so that it appears in position
    [position].

    If [position] is greater than or equal to the number of children in the list
    or negative, [child] will be moved to the end of the list. *)

external remove_page : t -> int -> unit = "ml_gtk_notebook_remove_page"
(** Removes a page from the notebook given its index in the notebook. *)

external prev_page : t -> unit = "ml_gtk_notebook_prev_page"
(** Switches to the previous page.

    Nothing happens if the current page is the first page. *)

external prepend_page_menu :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int = "ml_gtk_notebook_prepend_page_menu"
(** Prepends a page to [notebook], specifying the widget to use as the label in
    the popup menu. *)

external prepend_page :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int = "ml_gtk_notebook_prepend_page"
(** Prepends a page to [notebook]. *)

external popup_enable : t -> unit = "ml_gtk_notebook_popup_enable"
(** Enables the popup menu.

    If the user clicks with the right mouse button on the tab labels, a menu
    with all the pages will be popped up. *)

external popup_disable : t -> unit = "ml_gtk_notebook_popup_disable"
(** Disables the popup menu. *)

external page_num :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int = "ml_gtk_notebook_page_num"
(** Finds the index of the page which contains the given child widget. *)

external next_page : t -> unit = "ml_gtk_notebook_next_page"
(** Switches to the next page.

    Nothing happens if the current page is the last page. *)

external insert_page_menu :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int ->
  int = "ml_gtk_notebook_insert_page_menu"
(** Insert a page into [notebook] at the given position, specifying the widget
    to use as the label in the popup menu. *)

external insert_page :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int ->
  int = "ml_gtk_notebook_insert_page"
(** Insert a page into [notebook] at the given position. *)

external get_tab_reorderable :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_notebook_get_tab_reorderable"
(** Gets whether the tab can be reordered via drag and drop or not. *)

external get_tab_pos : t -> Gtk_enums.positiontype
  = "ml_gtk_notebook_get_tab_pos"
(** Gets the edge at which the tabs are drawn. *)

external get_tab_label_text :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string option = "ml_gtk_notebook_get_tab_label_text"
(** Retrieves the text of the tab label for the page containing [child]. *)

external get_tab_label :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_notebook_get_tab_label"
(** Returns the tab label widget for the page [child].

    [NULL] is returned if [child] is not in [notebook] or if no tab label has
    specifically been set for [child]. *)

external get_tab_detachable :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_notebook_get_tab_detachable"
(** Returns whether the tab contents can be detached from [notebook]. *)

external get_show_tabs : t -> bool = "ml_gtk_notebook_get_show_tabs"
(** Returns whether the tabs of the notebook are shown. *)

external get_show_border : t -> bool = "ml_gtk_notebook_get_show_border"
(** Returns whether a bevel will be drawn around the notebook pages. *)

external get_scrollable : t -> bool = "ml_gtk_notebook_get_scrollable"
(** Returns whether the tab label area has arrows for scrolling. *)

external get_pages : t -> Ocgtk_gio.Gio.Wrappers.List_model.t
  = "ml_gtk_notebook_get_pages"
(** Returns a [GListModel] that contains the pages of the notebook.

    This can be used to keep an up-to-date view. The model also implements
    [Gtk.SelectionModel] and can be used to track and modify the visible page.
*)

external get_page :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Notebook_page.t = "ml_gtk_notebook_get_page"
(** Returns the [GtkNotebookPage] for [child]. *)

external get_nth_page :
  t ->
  int ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_notebook_get_nth_page"
(** Returns the child widget contained in page number [page_num]. *)

external get_n_pages : t -> int = "ml_gtk_notebook_get_n_pages"
(** Gets the number of pages in a notebook. *)

external get_menu_label_text :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  string option = "ml_gtk_notebook_get_menu_label_text"
(** Retrieves the text of the menu label for the page containing [child]. *)

external get_menu_label :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_notebook_get_menu_label"
(** Retrieves the menu label widget of the page containing [child]. *)

external get_group_name : t -> string option = "ml_gtk_notebook_get_group_name"
(** Gets the current group name for [notebook]. *)

external get_current_page : t -> int = "ml_gtk_notebook_get_current_page"
(** Returns the page number of the current page. *)

external get_action_widget :
  t ->
  Gtk_enums.packtype ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_notebook_get_action_widget"
(** Gets one of the action widgets.

    See [Gtk.Notebook.set_action_widget]. *)

external detach_tab :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_notebook_detach_tab"
(** Removes the child from the notebook.

    This function is very similar to [Gtk.Notebook.remove_page], but
    additionally informs the notebook that the removal is happening as part of a
    tab DND operation, which should not be cancelled. *)

external append_page_menu :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int = "ml_gtk_notebook_append_page_menu"
(** Appends a page to [notebook], specifying the widget to use as the label in
    the popup menu. *)

external append_page :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  int = "ml_gtk_notebook_append_page"
(** Appends a page to [notebook]. *)

(* Properties *)

external get_enable_popup : t -> bool = "ml_gtk_notebook_get_enable_popup"
(** Get property: enable-popup *)

external set_enable_popup : t -> bool -> unit
  = "ml_gtk_notebook_set_enable_popup"
(** Set property: enable-popup *)

val on_change_current_page :
  ?after:bool -> t -> callback:(page:int -> bool) -> Gobject.Signal.handler_id

val on_create_window :
  ?after:bool ->
  t ->
  callback:
    (page:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    t option) ->
  Gobject.Signal.handler_id

val on_focus_tab :
  ?after:bool ->
  t ->
  callback:(tab:Gtk_enums.notebooktab -> bool) ->
  Gobject.Signal.handler_id

val on_move_focus_out :
  ?after:bool ->
  t ->
  callback:(direction:Gtk_enums.directiontype -> unit) ->
  Gobject.Signal.handler_id

val on_page_added :
  ?after:bool ->
  t ->
  callback:
    (child:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    page_num:int ->
    unit) ->
  Gobject.Signal.handler_id

val on_page_removed :
  ?after:bool ->
  t ->
  callback:
    (child:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    page_num:int ->
    unit) ->
  Gobject.Signal.handler_id

val on_page_reordered :
  ?after:bool ->
  t ->
  callback:
    (child:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    page_num:int ->
    unit) ->
  Gobject.Signal.handler_id

val on_reorder_tab :
  ?after:bool ->
  t ->
  callback:(direction:Gtk_enums.directiontype -> move_to_last:bool -> bool) ->
  Gobject.Signal.handler_id

val on_select_page :
  ?after:bool ->
  t ->
  callback:(move_focus:bool -> bool) ->
  Gobject.Signal.handler_id

val on_switch_page :
  ?after:bool ->
  t ->
  callback:
    (page:
       Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
       .Widget
       .t ->
    page_num:int ->
    unit) ->
  Gobject.Signal.handler_id
