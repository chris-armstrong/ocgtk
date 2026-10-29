(** Switches between children using tabs.

    Its methods, signals and properties are on {!class-type-notebook_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Notebook}. *)

(** {1:class Class} *)

class type notebook_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_change_current_page :
    ?after:bool ->
    callback:(page:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the current page should be changed.

      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>PgUp</kbd>,
      <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>PgDn</kbd>,
      <kbd>Ctrl</kbd>+<kbd>PgUp</kbd> and <kbd>Ctrl</kbd>+<kbd>PgDn</kbd>. *)

  method on_create_window :
    ?after:bool ->
    callback:(page:Widget.widget_t -> notebook_t option) ->
    unit ->
    Gobject.Signal.handler_id
  (** The ::create-window signal is emitted when a detachable tab is dropped on
      the root window.

      A handler for this signal can create a window containing a notebook where
      the tab will be attached. It is also responsible for moving/resizing the
      window and adding the necessary properties to the notebook (e.g. the
      [GtkNotebook]:group-name ). *)

  method on_focus_tab :
    ?after:bool ->
    callback:(tab:Enums.notebooktab -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a tab should be focused. *)

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when focus was moved out.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>Tab</kbd>,
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Tab</kbd>,
      <kbd>Ctrl</kbd>+<kbd>←</kbd>, <kbd>Ctrl</kbd>+<kbd>→</kbd>,
      <kbd>Ctrl</kbd>+<kbd>↑</kbd> and <kbd>Ctrl</kbd>+<kbd>↓</kbd>. *)

  method on_page_added :
    ?after:bool ->
    callback:(child:Widget.widget_t -> page_num:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** the ::page-added signal is emitted in the notebook right after a page is
      added to the notebook. *)

  method on_page_removed :
    ?after:bool ->
    callback:(child:Widget.widget_t -> page_num:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** the ::page-removed signal is emitted in the notebook right after a page is
      removed from the notebook. *)

  method on_page_reordered :
    ?after:bool ->
    callback:(child:Widget.widget_t -> page_num:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** the ::page-reordered signal is emitted in the notebook right after a page
      has been reordered. *)

  method on_reorder_tab :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> move_to_last:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the tab should be reordered.

      The default bindings for this signal are <kbd>Alt</kbd>+<kbd>Home</kbd>,
      <kbd>Alt</kbd>+<kbd>End</kbd>, <kbd>Alt</kbd>+<kbd>PgUp</kbd>,
      <kbd>Alt</kbd>+<kbd>PgDn</kbd>, <kbd>Alt</kbd>+<kbd>←</kbd>,
      <kbd>Alt</kbd>+<kbd>→</kbd>, <kbd>Alt</kbd>+<kbd>↑</kbd> and
      <kbd>Alt</kbd>+<kbd>↓</kbd>. *)

  method on_select_page :
    ?after:bool ->
    callback:(move_focus:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a page should be selected.

      The default binding for this signal is <kbd>␣</kbd>. *)

  method on_switch_page :
    ?after:bool ->
    callback:(page:Widget.widget_t -> page_num:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user or a function changes the current page. *)

  (** {2:methods Methods} *)

  method append_page : Widget.widget_t -> Widget.widget_t option -> int
  (** Appends a page to [notebook]. *)

  method append_page_menu :
    Widget.widget_t -> Widget.widget_t option -> Widget.widget_t option -> int
  (** Appends a page to [notebook], specifying the widget to use as the label in
      the popup menu. *)

  method detach_tab : Widget.widget_t -> unit
  (** Removes the child from the notebook.

      This function is very similar to [Gtk.Notebook.remove_page], but
      additionally informs the notebook that the removal is happening as part of
      a tab DND operation, which should not be cancelled. *)

  method get_action_widget : Enums.packtype -> Widget.widget_t option
  (** Gets one of the action widgets.

      See [Gtk.Notebook.set_action_widget]. *)

  method get_current_page : unit -> int
  (** Returns the page number of the current page. *)

  method get_group_name : unit -> string option
  (** Gets the current group name for [notebook]. *)

  method get_menu_label : Widget.widget_t -> Widget.widget_t option
  (** Retrieves the menu label widget of the page containing [child]. *)

  method get_menu_label_text : Widget.widget_t -> string option
  (** Retrieves the text of the menu label for the page containing [child]. *)

  method get_n_pages : unit -> int
  (** Gets the number of pages in a notebook. *)

  method get_nth_page : int -> Widget.widget_t option
  (** Returns the child widget contained in page number [page_num]. *)

  method get_page : Widget.widget_t -> Notebook_page.notebook_page_t
  (** Returns the [GtkNotebookPage] for [child]. *)

  method get_pages : unit -> Ocgio.List_model.list_model_t
  (** Returns a [GListModel] that contains the pages of the notebook.

      This can be used to keep an up-to-date view. The model also implements
      [Gtk.SelectionModel] and can be used to track and modify the visible page.
  *)

  method get_scrollable : unit -> bool
  (** Returns whether the tab label area has arrows for scrolling. *)

  method get_show_border : unit -> bool
  (** Returns whether a bevel will be drawn around the notebook pages. *)

  method get_show_tabs : unit -> bool
  (** Returns whether the tabs of the notebook are shown. *)

  method get_tab_detachable : Widget.widget_t -> bool
  (** Returns whether the tab contents can be detached from [notebook]. *)

  method get_tab_label : Widget.widget_t -> Widget.widget_t option
  (** Returns the tab label widget for the page [child].

      [None] is returned if [child] is not in [notebook] or if no tab label has
      specifically been set for [child]. *)

  method get_tab_label_text : Widget.widget_t -> string option
  (** Retrieves the text of the tab label for the page containing [child]. *)

  method get_tab_pos : unit -> Enums.positiontype
  (** Gets the edge at which the tabs are drawn. *)

  method get_tab_reorderable : Widget.widget_t -> bool
  (** Gets whether the tab can be reordered via drag and drop or not. *)

  method insert_page : Widget.widget_t -> Widget.widget_t option -> int -> int
  (** Insert a page into [notebook] at the given position. *)

  method insert_page_menu :
    Widget.widget_t ->
    Widget.widget_t option ->
    Widget.widget_t option ->
    int ->
    int
  (** Insert a page into [notebook] at the given position, specifying the widget
      to use as the label in the popup menu. *)

  method next_page : unit -> unit
  (** Switches to the next page.

      Nothing happens if the current page is the last page. *)

  method page_num : Widget.widget_t -> int
  (** Finds the index of the page which contains the given child widget. *)

  method popup_disable : unit -> unit
  (** Disables the popup menu. *)

  method popup_enable : unit -> unit
  (** Enables the popup menu.

      If the user clicks with the right mouse button on the tab labels, a menu
      with all the pages will be popped up. *)

  method prepend_page : Widget.widget_t -> Widget.widget_t option -> int
  (** Prepends a page to [notebook]. *)

  method prepend_page_menu :
    Widget.widget_t -> Widget.widget_t option -> Widget.widget_t option -> int
  (** Prepends a page to [notebook], specifying the widget to use as the label
      in the popup menu. *)

  method prev_page : unit -> unit
  (** Switches to the previous page.

      Nothing happens if the current page is the first page. *)

  method remove_page : int -> unit
  (** Removes a page from the notebook given its index in the notebook. *)

  method reorder_child : Widget.widget_t -> int -> unit
  (** Reorders the page containing [child], so that it appears in position
      [position].

      If [position] is greater than or equal to the number of children in the
      list or negative, [child] will be moved to the end of the list. *)

  method set_action_widget : Widget.widget_t -> Enums.packtype -> unit
  (** Sets [widget] as one of the action widgets.

      Depending on the pack type the widget will be placed before or after the
      tabs. You can use a [GtkBox] if you need to pack more than one widget on
      the same side. *)

  method set_current_page : int -> unit
  (** Switches to the page number [page_num].

      Note that due to historical reasons, GtkNotebook refuses to switch to a
      page unless the child widget is visible. Therefore, it is recommended to
      show child widgets before adding them to a notebook. *)

  method set_group_name : string option -> unit
  (** Sets a group name for [notebook].

      Notebooks with the same name will be able to exchange tabs via drag and
      drop. A notebook with a [None] group name will not be able to exchange
      tabs with any other notebook. *)

  method set_menu_label : Widget.widget_t -> Widget.widget_t option -> unit
  (** Changes the menu label for the page containing [child]. *)

  method set_menu_label_text : Widget.widget_t -> string -> unit
  (** Creates a new label and sets it as the menu label of [child]. *)

  method set_scrollable : bool -> unit
  (** Sets whether the tab label area will have arrows for scrolling if there
      are too many tabs to fit in the area. *)

  method set_show_border : bool -> unit
  (** Sets whether a bevel will be drawn around the notebook pages.

      This only has a visual effect when the tabs are not shown. *)

  method set_show_tabs : bool -> unit
  (** Sets whether to show the tabs for the notebook or not. *)

  method set_tab_detachable : Widget.widget_t -> bool -> unit
  [@@ocaml.doc
    "Sets whether the tab can be detached from [notebook] to another\n\
     notebook or widget.\n\n\
     Note that two notebooks must share a common group identifier\n\
     (see [Gtk.Notebook.set_group_name]) to allow automatic tabs\n\
     interchange between them.\n\n\
     If you want a widget to interact with a notebook through DnD\n\
     (i.e.: accept dragged tabs from it) it must be set as a drop\n\
     destination by adding to it a [Gtk.DropTarget] controller that accepts\n\
     the GType [GTK_TYPE_NOTEBOOK_PAGE]. The [:value] of said drop target will \
     be\n\
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

  method set_tab_label : Widget.widget_t -> Widget.widget_t option -> unit
  (** Changes the tab label for [child].

      If [None] is specified for [tab_label], then the page will have the label
      “page N”. *)

  method set_tab_label_text : Widget.widget_t -> string -> unit
  (** Creates a new label and sets it as the tab label for the page containing
      [child]. *)

  method set_tab_pos : Enums.positiontype -> unit
  (** Sets the edge at which the tabs are drawn. *)

  method set_tab_reorderable : Widget.widget_t -> bool -> unit
  (** Sets whether the notebook tab can be reordered via drag and drop or not.
  *)

  (** {2:properties Properties} *)

  method enable_popup : bool
  (** If [true], pressing the right mouse button on the notebook shows a page
      switching menu. *)

  method set_enable_popup : bool -> unit
  (** If [true], pressing the right mouse button on the notebook shows a page
      switching menu. *)

  (** {2:conversions Conversions} *)

  method as_notebook : Raw.Notebook.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Notebook].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Switches between children using tabs.\n\n\
     An example GtkNotebook\n\n\
     There are many configuration options for [GtkNotebook]. Among\n\
     other things, you can choose on which edge the tabs appear\n\
     (see \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-set_tab_pos}[Gtk.Notebook.set_tab_pos]}), \
     whether, if there are\n\
     too many tabs to fit the notebook should be made bigger or scrolling\n\
     arrows added (see \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-set_scrollable}[Gtk.Notebook.set_scrollable]}), \
     and whether\n\
     there will be a popup menu allowing the users to switch pages.\n\
     (see \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-popup_enable}[Gtk.Notebook.popup_enable]}).\n\n\
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
     - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context \
     menu.\n\
     - <kbd>Home</kbd> moves the focus to the first tab.\n\
     - <kbd>End</kbd> moves the focus to the last tab.\n\n\
     Additionally, the following signals have default keybindings:\n\n\
     - \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-on_change_current_page}[Gtk.Notebook::change-current-page]}\n\
     - \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-on_focus_tab}[Gtk.Notebook::focus-tab]}\n\
     - \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-on_move_focus_out}[Gtk.Notebook::move-focus-out]}\n\
     - \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-on_reorder_tab}[Gtk.Notebook::reorder-tab]}\n\
     - \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-on_select_page}[Gtk.Notebook::select-page]}\n\n\
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
     has a border (see \
     {{!Ocgtk.Notebook.class-type-notebook_t.method-set_show_border}[Gtk.Notebook.set_show_border]}).\n\n\
     The header node gets one of the style class [.top], [.bottom],\n\
     [.left] or [.right], depending on where the tabs are placed. For\n\
     reorderable pages, the tab node gets the [.reorderable-page] class.\n\n\
     A [tab] node gets the [.dnd] style class while it is moved with \
     drag-and-drop.\n\n\
     The nodes are always arranged from left-to-right, regardless of text \
     direction.\n\n\
     {b Accessibility}\n\n\
     [GtkNotebook] uses the following roles:\n\n\
     - \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]} \
     for the notebook widget\n\
     - \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_LIST}[Gtk.AccessibleRole.tab_list]} \
     for the list of tabs\n\
     - \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB}[Gtk.AccessibleRole.tab]} \
     role for each tab\n\
     - \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_PANEL}[Gtk.AccessibleRole.tab_panel]} \
     for each page"]

class notebook : Raw.Notebook.t -> notebook_t
(** Wraps a raw handle of {!Ocgtk.Raw.Notebook.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Switches between children using tabs.\n\n\
 An example GtkNotebook\n\n\
 There are many configuration options for [GtkNotebook]. Among\n\
 other things, you can choose on which edge the tabs appear\n\
 (see \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-set_tab_pos}[Gtk.Notebook.set_tab_pos]}), \
 whether, if there are\n\
 too many tabs to fit the notebook should be made bigger or scrolling\n\
 arrows added (see \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-set_scrollable}[Gtk.Notebook.set_scrollable]}), \
 and whether\n\
 there will be a popup menu allowing the users to switch pages.\n\
 (see \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-popup_enable}[Gtk.Notebook.popup_enable]}).\n\n\
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
 - \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-on_change_current_page}[Gtk.Notebook::change-current-page]}\n\
 - \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-on_focus_tab}[Gtk.Notebook::focus-tab]}\n\
 - \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-on_move_focus_out}[Gtk.Notebook::move-focus-out]}\n\
 - \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-on_reorder_tab}[Gtk.Notebook::reorder-tab]}\n\
 - \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-on_select_page}[Gtk.Notebook::select-page]}\n\n\
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
 has a border (see \
 {{!Ocgtk.Notebook.class-type-notebook_t.method-set_show_border}[Gtk.Notebook.set_show_border]}).\n\n\
 The header node gets one of the style class [.top], [.bottom],\n\
 [.left] or [.right], depending on where the tabs are placed. For\n\
 reorderable pages, the tab node gets the [.reorderable-page] class.\n\n\
 A [tab] node gets the [.dnd] style class while it is moved with \
 drag-and-drop.\n\n\
 The nodes are always arranged from left-to-right, regardless of text \
 direction.\n\n\
 {b Accessibility}\n\n\
 [GtkNotebook] uses the following roles:\n\n\
 - \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]} \
 for the notebook widget\n\
 - \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_LIST}[Gtk.AccessibleRole.tab_list]} \
 for the list of tabs\n\
 - \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB}[Gtk.AccessibleRole.tab]} \
 role for each tab\n\
 - \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-TAB_PANEL}[Gtk.AccessibleRole.tab_panel]} \
 for each page"]

(** {1:constructors Constructors} *)

val new_ : unit -> notebook_t
(** Creates a new [GtkNotebook] widget with no pages. *)
