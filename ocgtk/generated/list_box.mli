(** Shows a vertical list.

    An example GtkListBox

    A [GtkListBox] only contains [GtkListBoxRow] children. These rows can by
    dynamically sorted and filtered, and headers can be added dynamically
    depending on the row content. It also allows keyboard and mouse navigation
    and selection like a typical list.

    Using [GtkListBox] is often an alternative to [GtkTreeView], especially when
    the list contents has a more complicated layout than what is allowed by a
    [GtkCellRenderer], or when the contents is interactive (i.e. has a button in
    it).

    Although a [GtkListBox] must have only [GtkListBoxRow] children, you can add
    any kind of widget to it via [Gtk.ListBox.prepend], [Gtk.ListBox.append] and
    [Gtk.ListBox.insert] and a [GtkListBoxRow] widget will automatically be
    inserted between the list and the widget.

    [GtkListBoxRows] can be marked as activatable or selectable. If a row is
    activatable, [Gtk.ListBox::row-activated] will be emitted for it when the
    user tries to activate it. If it is selectable, the row will be marked as
    selected when the user tries to select it.

    {b GtkListBox as GtkBuildable}

    The [GtkListBox] implementation of the [GtkBuildable] interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a [<child>] element. See [Gtk.ListBox.set_placeholder] for
    info.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ListBox::move-cursor]
    - [Gtk.ListBox::select-all]
    - [Gtk.ListBox::toggle-cursor-row]
    - [Gtk.ListBox::unselect-all]

    {b CSS nodes}

    {[
    list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
    ╰── row[.activatable]
    ]}

    [GtkListBox] uses a single CSS node named list. It may carry the .separators
    style class, when the [Gtk.ListBox:show-separators] property is set. Each
    [GtkListBoxRow] uses a single CSS node named row. The row nodes get the
    .activatable style class added when appropriate.

    It may also carry the .boxed-list style class. In this case, the list will
    be automatically surrounded by a frame and have separators.

    The main list node may also carry style classes to select the style of list
    presentation: .rich-list, .navigation-sidebar or .data-table.

    {b Accessibility}

    [GtkListBox] uses the [Gtk.AccessibleRole.list] role and [GtkListBoxRow]
    uses the [Gtk.AccessibleRole.list_item] role.

    Its methods, signals and properties are on {!class-type-list_box_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.List_box}. *)

(** {b The methods, signals and properties of a [ListBox].}

    Shows a vertical list.

    An example GtkListBox

    A [GtkListBox] only contains [GtkListBoxRow] children. These rows can by
    dynamically sorted and filtered, and headers can be added dynamically
    depending on the row content. It also allows keyboard and mouse navigation
    and selection like a typical list.

    Using [GtkListBox] is often an alternative to [GtkTreeView], especially when
    the list contents has a more complicated layout than what is allowed by a
    [GtkCellRenderer], or when the contents is interactive (i.e. has a button in
    it).

    Although a [GtkListBox] must have only [GtkListBoxRow] children, you can add
    any kind of widget to it via [Gtk.ListBox.prepend], [Gtk.ListBox.append] and
    [Gtk.ListBox.insert] and a [GtkListBoxRow] widget will automatically be
    inserted between the list and the widget.

    [GtkListBoxRows] can be marked as activatable or selectable. If a row is
    activatable, [Gtk.ListBox::row-activated] will be emitted for it when the
    user tries to activate it. If it is selectable, the row will be marked as
    selected when the user tries to select it.

    {b GtkListBox as GtkBuildable}

    The [GtkListBox] implementation of the [GtkBuildable] interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a [<child>] element. See [Gtk.ListBox.set_placeholder] for
    info.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ListBox::move-cursor]
    - [Gtk.ListBox::select-all]
    - [Gtk.ListBox::toggle-cursor-row]
    - [Gtk.ListBox::unselect-all]

    {b CSS nodes}

    {[
    list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
    ╰── row[.activatable]
    ]}

    [GtkListBox] uses a single CSS node named list. It may carry the .separators
    style class, when the [Gtk.ListBox:show-separators] property is set. Each
    [GtkListBoxRow] uses a single CSS node named row. The row nodes get the
    .activatable style class added when appropriate.

    It may also carry the .boxed-list style class. In this case, the list will
    be automatically surrounded by a frame and have separators.

    The main list node may also carry style classes to select the style of list
    presentation: .rich-list, .navigation-sidebar or .data-table.

    {b Accessibility}

    [GtkListBox] uses the [Gtk.AccessibleRole.list] role and [GtkListBoxRow]
    uses the [Gtk.AccessibleRole.list_item] role. *)
class type list_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the cursor row is activated. *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a cursor movement.

      The default bindings for this signal come in two variants, the variant
      with the Shift modifier extends the selection, the variant without the
      Shift modifier does not. There are too many key combinations to list them
      all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual children
      - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
      - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages *)

  method on_row_activated :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a row has been activated by the user. *)

  method on_row_selected :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new row is selected, or (with a [NULL] [row]) when the
      selection is cleared.

      When the [box] is using [GTK_SELECTION_MULTIPLE], this signal will not
      give you the full picture of selection changes, and you should use the
      [Gtk.ListBox::selected-rows-changed] signal instead. *)

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to select all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)

  method on_selected_rows_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the set of selected rows changes. *)

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the cursor row is toggled.

      The default bindings for this signal is <kbd>Ctrl</kbd>+<kbd>␣</kbd>. *)

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to unselect all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default binding for this signal is
      <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Append a widget to the list.

      If a sort function is set, the widget will actually be inserted at the
      calculated position. *)

  method drag_highlight_row : List_box_row.list_box_row_t -> unit
  (** Add a drag highlight to a row.

      This is a helper function for implementing DnD onto a [GtkListBox]. The
      passed in [row] will be highlighted by setting the
      [GTK_STATE_FLAG_DROP_ACTIVE] state and any previously highlighted row will
      be unhighlighted.

      The row will also be unhighlighted when the widget gets a drag leave
      event. *)

  method drag_unhighlight_row : unit -> unit
  (** If a row has previously been highlighted via
      gtk_list_box_drag_highlight_row(), it will have the highlight removed. *)

  method get_activate_on_single_click : unit -> bool
  (** Returns whether rows activate on single clicks. *)

  method get_adjustment : unit -> Adjustment.adjustment_t option
  (** Gets the adjustment (if any) that the widget uses to for vertical
      scrolling. *)

  method get_row_at_index : int -> List_box_row.list_box_row_t option
  (** Gets the n-th child in the list (not counting headers).

      If [index_] is negative or larger than the number of items in the list,
      [NULL] is returned. *)

  method get_row_at_y : int -> List_box_row.list_box_row_t option
  (** Gets the row at the [y] position. *)

  method get_selected_row : unit -> List_box_row.list_box_row_t option
  (** Gets the selected row, or [NULL] if no rows are selected.

      Note that the box may allow multiple selection, in which case you should
      use [Gtk.ListBox.selected_foreach] to find all selected rows. *)

  method get_selected_rows : unit -> List_box_row.list_box_row_t list
  (** Creates a list of all selected children. *)

  method get_selection_mode : unit -> Enums.selectionmode
  (** Gets the selection mode of the listbox. *)

  method get_show_separators : unit -> bool
  (** Returns whether the list box should show separators between rows. *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Returns the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
  (** Insert the [child] into the [box] at [position].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      If [position] is -1, or larger than the total number of items in the
      [box], then the [child] will be appended to the end. *)

  method invalidate_filter : unit -> unit
  (** Update the filtering for all rows.

      Call this when result of the filter function on the [box] is changed due
      to an external factor. For instance, this would be used if the filter
      function just looked for a specific search string and the entry with the
      search string has changed. *)

  method invalidate_headers : unit -> unit
  (** Update the separators for all rows.

      Call this when result of the header function on the [box] is changed due
      to an external factor. *)

  method invalidate_sort : unit -> unit
  (** Update the sorting for all rows.

      Call this when result of the sort function on the [box] is changed due to
      an external factor. *)

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Prepend a widget to the list.

      If a sort function is set, the widget will actually be inserted at the
      calculated position. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [box]. *)

  method remove_all : unit -> unit
  (** Removes all rows from [box].

      This function does nothing if [box] is backed by a model. *)

  method select_all : unit -> unit
  (** Select all children of [box], if the selection mode allows it. *)

  method select_row : List_box_row.list_box_row_t option -> unit
  (** Make [row] the currently selected row. *)

  method set_activate_on_single_click : bool -> unit
  (** If [single] is [TRUE], rows will be activated when you click on them,
      otherwise you need to double-click. *)

  method set_adjustment : Adjustment.adjustment_t option -> unit
  (** Sets the adjustment (if any) that the widget uses to for vertical
      scrolling.

      For instance, this is used to get the page size for PageUp/Down key
      handling.

      In the normal case when the [box] is packed inside a [GtkScrolledWindow]
      the adjustment from that will be picked up automatically, so there is no
      need to manually do that. *)

  method set_placeholder :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the placeholder widget that is shown in the list when it doesn't
      display any visible children. *)

  method set_selection_mode : Enums.selectionmode -> unit
  (** Sets how selection works in the listbox. *)

  method set_show_separators : bool -> unit
  (** Sets whether the list box should show separators between rows. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

  method unselect_all : unit -> unit
  (** Unselect all children of [box], if the selection mode allows it. *)

  method unselect_row : List_box_row.list_box_row_t -> unit
  (** Unselects a single row of [box], if the selection mode allows it. *)

  method accept_unpaired_release : bool
  (** Whether to accept unpaired release events. *)

  method set_accept_unpaired_release : bool -> unit
  (** Whether to accept unpaired release events. *)

  method as_list_box : Raw.List_box.t
end

class list_box : Raw.List_box.t -> list_box_t
(** Wraps a raw handle of {!Ocgtk.Raw.List_box.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> list_box_t
(** Creates a new [GtkListBox] container. *)
