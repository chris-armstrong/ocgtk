(** [GtkIconView] is a widget which displays data in a grid of icons.

    An example GtkIconView

    [GtkIconView] provides an alternative view on a [GtkTreeModel]. It displays
    the model as a grid of icons with labels. Like [Gtk.TreeView], it allows to
    select one or multiple items (depending on the selection mode, see
    [Gtk.IconView.set_selection_mode]). In addition to selection with the arrow
    keys, [GtkIconView] supports rubberband selection, which is controlled by
    dragging the pointer.

    Note that if the tree model is backed by an actual tree store (as opposed to
    a flat list where the mapping to icons is obvious), [GtkIconView] will only
    display the first level of the tree and ignore the tree’s branches.

    {b CSS nodes}

    {[
    iconview.view
    ╰── [rubberband]
    ]}

    [GtkIconView] has a single CSS node with name iconview and style class
    .view. For rubberband selection, a subnode with name rubberband is used.

    Its methods, signals and properties are on {!class-type-icon_view_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Icon_view}. *)

(** The methods, signals and properties of a [IconView]. *)
class type icon_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t
  inherit Scrollable.scrollable_t

  method on_activate_cursor_item :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** A \[keybinding signal\][Gtk.SignalAction] which gets emitted when the user
      activates the currently focused item.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control activation
      programmatically.

      The default bindings for this signal are Space, Return and Enter. *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "The ::move-cursor signal is a\n\
     \\[keybinding signal\\][Gtk.SignalAction]\n\
     which gets emitted when the user initiates a cursor movement.\n\n\
     Applications should not connect to it, but may emit it with\n\
     g_signal_emit_by_name() if they need to control the cursor\n\
     programmatically.\n\n\
     The default bindings for this signal include\n\n\
     - Arrow keys which move by individual steps\n\
     - Home/End keys which move to the first/last item\n\
     - PageUp/PageDown which move by \"pages\"\n\n\
     All of these will extend the selection when combined with\n\
     the Shift modifier."]

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** A \[keybinding signal\][Gtk.SignalAction] which gets emitted when the user
      selects all items.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control selection
      programmatically.

      The default binding for this signal is Ctrl-a. *)

  method on_select_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** A \[keybinding signal\][Gtk.SignalAction] which gets emitted when the user
      selects the item that is currently focused.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control selection
      programmatically.

      There is no default binding for this signal. *)

  method on_selection_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The ::selection-changed signal is emitted when the selection (i.e. the set
      of selected items) changes. *)

  method on_toggle_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** A \[keybinding signal\][Gtk.SignalAction] which gets emitted when the user
      toggles whether the currently focused item is selected or not. The exact
      effect of this depend on the selection mode.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control selection
      programmatically.

      There is no default binding for this signal is Ctrl-Space. *)

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** A \[keybinding signal\][Gtk.SignalAction] which gets emitted when the user
      unselects all items.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control selection
      programmatically.

      The default binding for this signal is Ctrl-Shift-a. *)

  method create_drag_icon :
    Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option
  (** Creates a [GdkPaintable] representation of the item at [path]. This image
      is used for a drag icon. *)

  method enable_model_drag_dest :
    Ocgdk.Content_formats.content_formats_t -> Ocgdk.Enums.dragaction -> unit
  (** Turns [icon_view] into a drop destination for automatic DND. Calling this
      method sets [GtkIconView]:reorderable to [FALSE]. *)

  method enable_model_drag_source :
    Ocgdk.Enums.modifiertype ->
    Ocgdk.Content_formats.content_formats_t ->
    Ocgdk.Enums.dragaction ->
    unit
  (** Turns [icon_view] into a drag source for automatic DND. Calling this
      method sets [GtkIconView]:reorderable to [FALSE]. *)

  method get_activate_on_single_click : unit -> bool
  (** Gets the setting set by gtk_icon_view_set_activate_on_single_click(). *)

  method get_column_spacing : unit -> int
  (** Returns the value of the ::column-spacing property. *)

  method get_columns : unit -> int
  (** Returns the value of the ::columns property. *)

  method get_item_column : Raw.Tree_path.t -> int
  (** Gets the column in which the item [path] is currently displayed. Column
      numbers start at 0. *)

  method get_item_orientation : unit -> Enums.orientation
  (** Returns the value of the ::item-orientation property which determines
      whether the labels are drawn beside the icons instead of below. *)

  method get_item_padding : unit -> int
  (** Returns the value of the ::item-padding property. *)

  method get_item_row : Raw.Tree_path.t -> int
  (** Gets the row in which the item [path] is currently displayed. Row numbers
      start at 0. *)

  method get_item_width : unit -> int
  (** Returns the value of the ::item-width property. *)

  method get_margin : unit -> int
  (** Returns the value of the ::margin property. *)

  method get_markup_column : unit -> int
  (** Returns the column with markup text for [icon_view]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model the [GtkIconView] is based on. Returns [NULL] if the
      model is unset. *)

  method get_path_at_pos : int -> int -> Raw.Tree_path.t option
  (** Gets the path for the icon at the given position. *)

  method get_pixbuf_column : unit -> int
  (** Returns the column with pixbufs for [icon_view]. *)

  method get_reorderable : unit -> bool
  (** Retrieves whether the user can reorder the list via drag-and-drop. See
      gtk_icon_view_set_reorderable(). *)

  method get_row_spacing : unit -> int
  (** Returns the value of the ::row-spacing property. *)

  method get_selected_items : unit -> Raw.Tree_path.t list
  (** Creates a list of paths of all selected items. Additionally, if you are
      planning on modifying the model after calling this function, you may want
      to convert the returned list into a list of [GtkTreeRowReferences]. To do
      this, you can use gtk_tree_row_reference_new().

      To free the return value, use [g_list_free_full]:

      {[
      GtkWidget *icon_view = gtk_icon_view_new ();
      // Use icon_view

      GList *list = gtk_icon_view_get_selected_items (GTK_ICON_VIEW (icon_view));

      // use list

      g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
      ]} *)

  method get_selection_mode : unit -> Enums.selectionmode
  (** Gets the selection mode of the [icon_view]. *)

  method get_spacing : unit -> int
  (** Returns the value of the ::spacing property. *)

  method get_text_column : unit -> int
  (** Returns the column with text for [icon_view]. *)

  method get_tooltip_column : unit -> int
  (** Returns the column of [icon_view]’s model which is being used for
      displaying tooltips on [icon_view]’s rows. *)

  method item_activated : Raw.Tree_path.t -> unit
  (** Activates the item determined by [path]. *)

  method path_is_selected : Raw.Tree_path.t -> bool
  (** Returns [TRUE] if the icon pointed to by [path] is currently selected. If
      [path] does not point to a valid location, [FALSE] is returned. *)

  method scroll_to_path : Raw.Tree_path.t -> bool -> float -> float -> unit
  (** Moves the alignments of [icon_view] to the position specified by [path].
      [row_align] determines where the row is placed, and [col_align] determines
      where [column] is placed. Both are expected to be between 0.0 and 1.0. 0.0
      means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
      center.

      If [use_align] is [FALSE], then the alignment arguments are ignored, and
      the tree does the minimum amount of work to scroll the item onto the
      screen. This means that the item will be scrolled to the edge closest to
      its current position. If the item is currently visible on the screen,
      nothing is done.

      This function only works if the model is set, and [path] is a valid row on
      the model. If the model changes before the [icon_view] is realized, the
      centered path will be modified to reflect this change. *)

  method select_all : unit -> unit
  (** Selects all the icons. [icon_view] must has its selection mode set to
      [GTK_SELECTION_MULTIPLE]. *)

  method select_path : Raw.Tree_path.t -> unit
  (** Selects the row at [path]. *)

  method set_activate_on_single_click : bool -> unit
  (** Causes the [GtkIconView]::item-activated signal to be emitted on a single
      click instead of a double click. *)

  method set_column_spacing : int -> unit
  (** Sets the ::column-spacing property which specifies the space which is
      inserted between the columns of the icon view. *)

  method set_columns : int -> unit
  (** Sets the ::columns property which determines in how many columns the icons
      are arranged. If [columns] is -1, the number of columns will be chosen
      automatically to fill the available area. *)

  method set_drag_dest_item :
    Raw.Tree_path.t option -> Enums.iconviewdropposition -> unit
  (** Sets the item that is highlighted for feedback. *)

  method set_item_orientation : Enums.orientation -> unit
  (** Sets the ::item-orientation property which determines whether the labels
      are drawn beside the icons instead of below. *)

  method set_item_padding : int -> unit
  (** Sets the [GtkIconView]:item-padding property which specifies the padding
      around each of the icon view’s items. *)

  method set_item_width : int -> unit
  (** Sets the ::item-width property which specifies the width to use for each
      item. If it is set to -1, the icon view will automatically determine a
      suitable item size. *)

  method set_margin : int -> unit
  (** Sets the ::margin property which specifies the space which is inserted at
      the top, bottom, left and right of the icon view. *)

  method set_markup_column : int -> unit
  (** Sets the column with markup information for [icon_view] to be [column].
      The markup column must be of type [G_TYPE_STRING]. If the markup column is
      set to something, it overrides the text column set by
      gtk_icon_view_set_text_column(). *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model for a [GtkIconView]. If the [icon_view] already has a model
      set, it will remove it before setting the new model. If [model] is [NULL],
      then it will unset the old model. *)

  method set_pixbuf_column : int -> unit
  (** Sets the column with pixbufs for [icon_view] to be [column]. The pixbuf
      column must be of type [GDK_TYPE_PIXBUF] *)

  method set_reorderable : bool -> unit
  (** This function is a convenience function to allow you to reorder models
      that support the [GtkTreeDragSourceIface] and the [GtkTreeDragDestIface].
      Both [GtkTreeStore] and [GtkListStore] support these. If [reorderable] is
      [TRUE], then the user can reorder the model by dragging and dropping rows.
      The developer can listen to these changes by connecting to the model's
      row_inserted and row_deleted signals. The reordering is implemented by
      setting up the icon view as a drag source and destination. Therefore, drag
      and drop can not be used in a reorderable view for any other purpose.

      This function does not give you any degree of control over the order --
      any reordering is allowed. If more control is needed, you should probably
      handle drag and drop manually. *)

  method set_row_spacing : int -> unit
  (** Sets the ::row-spacing property which specifies the space which is
      inserted between the rows of the icon view. *)

  method set_selection_mode : Enums.selectionmode -> unit
  (** Sets the selection mode of the [icon_view]. *)

  method set_spacing : int -> unit
  (** Sets the ::spacing property which specifies the space which is inserted
      between the cells (i.e. the icon and the text) of an item. *)

  method set_text_column : int -> unit
  (** Sets the column with text for [icon_view] to be [column]. The text column
      must be of type [G_TYPE_STRING]. *)

  method set_tooltip_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    Cell_renderer.cell_renderer_t option ->
    unit
  (** Sets the tip area of [tooltip] to the area which [cell] occupies in the
      item pointed to by [path]. See also gtk_tooltip_set_tip_area().

      See also gtk_icon_view_set_tooltip_column() for a simpler alternative. *)

  method set_tooltip_column : int -> unit
  (** If you only plan to have simple (text-only) tooltips on full items, you
      can use this function to have [GtkIconView] handle these automatically for
      you. [column] should be set to the column in [icon_view]’s model
      containing the tooltip texts, or -1 to disable this feature.

      When enabled, [GtkWidget:has-tooltip] will be set to [TRUE] and
      [icon_view] will connect a [GtkWidget::query-tooltip] signal handler.

      Note that the signal handler sets the text with gtk_tooltip_set_markup(),
      so &, <, etc have to be escaped in the text. *)

  method set_tooltip_item :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    unit
  (** Sets the tip area of [tooltip] to be the area covered by the item at
      [path]. See also gtk_icon_view_set_tooltip_column() for a simpler
      alternative. See also gtk_tooltip_set_tip_area(). *)

  method unselect_all : unit -> unit
  (** Unselects all the icons. *)

  method unselect_path : Raw.Tree_path.t -> unit
  (** Unselects the row at [path]. *)

  method unset_model_drag_dest : unit -> unit
  (** Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
      method sets [GtkIconView]:reorderable to [FALSE]. *)

  method unset_model_drag_source : unit -> unit
  (** Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling
      this method sets [GtkIconView]:reorderable to [FALSE]. *)

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_icon_view : Raw.Icon_view.t
end

class icon_view : Raw.Icon_view.t -> icon_view_t
(** Wraps a raw handle of {!Ocgtk.Raw.Icon_view.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> icon_view_t
(** Creates a new [GtkIconView] widget *)

val new_with_area :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t -> icon_view_t
(** Creates a new [GtkIconView] widget using the specified [area] to layout
    cells inside the icons. *)

val new_with_model : Tree_model.tree_model_t -> icon_view_t
(** Creates a new [GtkIconView] widget with the model [model]. *)
