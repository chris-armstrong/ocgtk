class type notebook_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

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
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      notebook_t option) ->
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
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** the ::page-added signal is emitted in the notebook right after a page is
      added to the notebook. *)

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
  (** the ::page-removed signal is emitted in the notebook right after a page is
      removed from the notebook. *)

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
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user or a function changes the current page. *)

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int
  (** Appends a page to [notebook]. *)

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
  (** Appends a page to [notebook], specifying the widget to use as the label in
      the popup menu. *)

  method detach_tab :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes the child from the notebook.

      This function is very similar to [Gtk.Notebook.remove_page], but
      additionally informs the notebook that the removal is happening as part of
      a tab DND operation, which should not be cancelled. *)

  method get_action_widget :
    Enums.packtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets one of the action widgets.

      See [Gtk.Notebook.set_action_widget]. *)

  method get_current_page : unit -> int
  (** Returns the page number of the current page. *)

  method get_group_name : unit -> string option
  (** Gets the current group name for [notebook]. *)

  method get_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the menu label widget of the page containing [child]. *)

  method get_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option
  (** Retrieves the text of the menu label for the page containing [child]. *)

  method get_n_pages : unit -> int
  (** Gets the number of pages in a notebook. *)

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the child widget contained in page number [page_num]. *)

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Notebook_page.notebook_page_t
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

  method get_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Returns whether the tab contents can be detached from [notebook]. *)

  method get_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the tab label widget for the page [child].

      [NULL] is returned if [child] is not in [notebook] or if no tab label has
      specifically been set for [child]. *)

  method get_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option
  (** Retrieves the text of the tab label for the page containing [child]. *)

  method get_tab_pos : unit -> Enums.positiontype
  (** Gets the edge at which the tabs are drawn. *)

  method get_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Gets whether the tab can be reordered via drag and drop or not. *)

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int ->
    int
  (** Insert a page into [notebook] at the given position. *)

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
  (** Insert a page into [notebook] at the given position, specifying the widget
      to use as the label in the popup menu. *)

  method next_page : unit -> unit
  (** Switches to the next page.

      Nothing happens if the current page is the last page. *)

  method page_num :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int
  (** Finds the index of the page which contains the given child widget. *)

  method popup_disable : unit -> unit
  (** Disables the popup menu. *)

  method popup_enable : unit -> unit
  (** Enables the popup menu.

      If the user clicks with the right mouse button on the tab labels, a menu
      with all the pages will be popped up. *)

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int
  (** Prepends a page to [notebook]. *)

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
  (** Prepends a page to [notebook], specifying the widget to use as the label
      in the popup menu. *)

  method prev_page : unit -> unit
  (** Switches to the previous page.

      Nothing happens if the current page is the first page. *)

  method remove_page : int -> unit
  (** Removes a page from the notebook given its index in the notebook. *)

  method reorder_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
  (** Reorders the page containing [child], so that it appears in position
      [position].

      If [position] is greater than or equal to the number of children in the
      list or negative, [child] will be moved to the end of the list. *)

  method set_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.packtype ->
    unit
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
      drop. A notebook with a [NULL] group name will not be able to exchange
      tabs with any other notebook. *)

  method set_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Changes the menu label for the page containing [child]. *)

  method set_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit
  (** Creates a new label and sets it as the menu label of [child]. *)

  method set_scrollable : bool -> unit
  (** Sets whether the tab label area will have arrows for scrolling if there
      are too many tabs to fit in the area. *)

  method set_show_border : bool -> unit
  (** Sets whether a bevel will be drawn around the notebook pages.

      This only has a visual effect when the tabs are not shown. *)

  method set_show_tabs : bool -> unit
  (** Sets whether to show the tabs for the notebook or not. *)

  method set_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit
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

  method set_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Changes the tab label for [child].

      If [NULL] is specified for [tab_label], then the page will have the label
      “page N”. *)

  method set_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit
  (** Creates a new label and sets it as the tab label for the page containing
      [child]. *)

  method set_tab_pos : Enums.positiontype -> unit
  (** Sets the edge at which the tabs are drawn. *)

  method set_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit
  (** Sets whether the notebook tab can be reordered via drag and drop or not.
  *)

  method enable_popup : bool
  (** If [TRUE], pressing the right mouse button on the notebook shows a page
      switching menu. *)

  method set_enable_popup : bool -> unit
  (** If [TRUE], pressing the right mouse button on the notebook shows a page
      switching menu. *)

  method as_notebook : Raw.Notebook.t
end

(* High-level class for Notebook *)
class notebook (obj : Raw.Notebook.t) : notebook_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_change_current_page ?(after = false) ~callback () =
      Raw.Notebook.on_change_current_page ~after self#as_notebook ~callback

    method on_create_window ?(after = false) ~callback () =
      Raw.Notebook.on_create_window ~after self#as_notebook
        ~callback:(fun ~page ->
          Option.map
            (fun w -> w#as_notebook)
            (callback
               ~page:
                 (new
                    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                    .widget
                    page)))

    method on_focus_tab ?(after = false) ~callback () =
      Raw.Notebook.on_focus_tab ~after self#as_notebook ~callback

    method on_move_focus_out ?(after = false) ~callback () =
      Raw.Notebook.on_move_focus_out ~after self#as_notebook ~callback

    method on_page_added ?(after = false) ~callback () =
      Raw.Notebook.on_page_added ~after self#as_notebook
        ~callback:(fun ~child ~page_num ->
          callback
            ~child:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 child)
            ~page_num)

    method on_page_removed ?(after = false) ~callback () =
      Raw.Notebook.on_page_removed ~after self#as_notebook
        ~callback:(fun ~child ~page_num ->
          callback
            ~child:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 child)
            ~page_num)

    method on_page_reordered ?(after = false) ~callback () =
      Raw.Notebook.on_page_reordered ~after self#as_notebook
        ~callback:(fun ~child ~page_num ->
          callback
            ~child:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 child)
            ~page_num)

    method on_reorder_tab ?(after = false) ~callback () =
      Raw.Notebook.on_reorder_tab ~after self#as_notebook ~callback

    method on_select_page ?(after = false) ~callback () =
      Raw.Notebook.on_select_page ~after self#as_notebook ~callback

    method on_switch_page ?(after = false) ~callback () =
      Raw.Notebook.on_switch_page ~after self#as_notebook
        ~callback:(fun ~page ~page_num ->
          callback
            ~page:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 page)
            ~page_num)

    method append_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        int =
      fun child tab_label ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        Raw.Notebook.append_page obj child tab_label

    method append_page_menu :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        int =
      fun child tab_label menu_label ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        let menu_label = Option.map (fun c -> c#as_widget) menu_label in
        Raw.Notebook.append_page_menu obj child tab_label menu_label

    method detach_tab :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.detach_tab obj child

    method get_action_widget :
        Enums.packtype ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun pack_type ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Notebook.get_action_widget obj pack_type)

    method get_current_page : unit -> int =
      fun () -> Raw.Notebook.get_current_page obj

    method get_group_name : unit -> string option =
      fun () -> Raw.Notebook.get_group_name obj

    method get_menu_label :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun child ->
        let child = child#as_widget in
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Notebook.get_menu_label obj child)

    method get_menu_label_text :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string option =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.get_menu_label_text obj child

    method get_n_pages : unit -> int = fun () -> Raw.Notebook.get_n_pages obj

    method get_nth_page :
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun page_num ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Notebook.get_nth_page obj page_num)

    method get_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Notebook_page.notebook_page_t =
      fun child ->
        let child = child#as_widget in
        new Notebook_page.notebook_page (Raw.Notebook.get_page obj child)

    method get_pages : unit -> Ocgio.List_model.list_model_t =
      fun () -> new Ocgio.List_model.list_model (Raw.Notebook.get_pages obj)

    method get_scrollable : unit -> bool =
      fun () -> Raw.Notebook.get_scrollable obj

    method get_show_border : unit -> bool =
      fun () -> Raw.Notebook.get_show_border obj

    method get_show_tabs : unit -> bool =
      fun () -> Raw.Notebook.get_show_tabs obj

    method get_tab_detachable :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.get_tab_detachable obj child

    method get_tab_label :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun child ->
        let child = child#as_widget in
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Notebook.get_tab_label obj child)

    method get_tab_label_text :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string option =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.get_tab_label_text obj child

    method get_tab_pos : unit -> Enums.positiontype =
      fun () -> Raw.Notebook.get_tab_pos obj

    method get_tab_reorderable :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.get_tab_reorderable obj child

    method insert_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        int ->
        int =
      fun child tab_label position ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        Raw.Notebook.insert_page obj child tab_label position

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
        int =
      fun child tab_label menu_label position ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        let menu_label = Option.map (fun c -> c#as_widget) menu_label in
        Raw.Notebook.insert_page_menu obj child tab_label menu_label position

    method next_page : unit -> unit = fun () -> Raw.Notebook.next_page obj

    method page_num :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun child ->
        let child = child#as_widget in
        Raw.Notebook.page_num obj child

    method popup_disable : unit -> unit =
      fun () -> Raw.Notebook.popup_disable obj

    method popup_enable : unit -> unit = fun () -> Raw.Notebook.popup_enable obj

    method prepend_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        int =
      fun child tab_label ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        Raw.Notebook.prepend_page obj child tab_label

    method prepend_page_menu :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        int =
      fun child tab_label menu_label ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        let menu_label = Option.map (fun c -> c#as_widget) menu_label in
        Raw.Notebook.prepend_page_menu obj child tab_label menu_label

    method prev_page : unit -> unit = fun () -> Raw.Notebook.prev_page obj

    method remove_page : int -> unit =
      fun page_num -> Raw.Notebook.remove_page obj page_num

    method reorder_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun child position ->
        let child = child#as_widget in
        Raw.Notebook.reorder_child obj child position

    method set_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.packtype ->
        unit =
      fun widget pack_type ->
        let widget = widget#as_widget in
        Raw.Notebook.set_action_widget obj widget pack_type

    method set_current_page : int -> unit =
      fun page_num -> Raw.Notebook.set_current_page obj page_num

    method set_group_name : string option -> unit =
      fun group_name -> Raw.Notebook.set_group_name obj group_name

    method set_menu_label :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child menu_label ->
        let child = child#as_widget in
        let menu_label = Option.map (fun c -> c#as_widget) menu_label in
        Raw.Notebook.set_menu_label obj child menu_label

    method set_menu_label_text :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        unit =
      fun child menu_text ->
        let child = child#as_widget in
        Raw.Notebook.set_menu_label_text obj child menu_text

    method set_scrollable : bool -> unit =
      fun scrollable -> Raw.Notebook.set_scrollable obj scrollable

    method set_show_border : bool -> unit =
      fun show_border -> Raw.Notebook.set_show_border obj show_border

    method set_show_tabs : bool -> unit =
      fun show_tabs -> Raw.Notebook.set_show_tabs obj show_tabs

    method set_tab_detachable :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun child detachable ->
        let child = child#as_widget in
        Raw.Notebook.set_tab_detachable obj child detachable

    method set_tab_label :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child tab_label ->
        let child = child#as_widget in
        let tab_label = Option.map (fun c -> c#as_widget) tab_label in
        Raw.Notebook.set_tab_label obj child tab_label

    method set_tab_label_text :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        unit =
      fun child tab_text ->
        let child = child#as_widget in
        Raw.Notebook.set_tab_label_text obj child tab_text

    method set_tab_pos : Enums.positiontype -> unit =
      fun pos -> Raw.Notebook.set_tab_pos obj pos

    method set_tab_reorderable :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun child reorderable ->
        let child = child#as_widget in
        Raw.Notebook.set_tab_reorderable obj child reorderable

    method enable_popup = Raw.Notebook.get_enable_popup obj
    method set_enable_popup v = Raw.Notebook.set_enable_popup obj v
    method as_notebook = obj
  end

let new_ () : notebook_t = new notebook (Raw.Notebook.new_ ())
