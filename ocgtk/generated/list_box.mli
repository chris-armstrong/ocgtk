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

    Its methods, signals and properties are on {!class-type-list_box_t}. The
    functions it is built on are in {!Ocgtk.Raw.List_box}. *)

(** The methods, signals and properties of a [GtkListBox]. *)
class type list_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

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

  method on_row_activated :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_row_selected :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selected_rows_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method drag_highlight_row : List_box_row.list_box_row_t -> unit
  method drag_unhighlight_row : unit -> unit
  method get_activate_on_single_click : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t option
  method get_row_at_index : int -> List_box_row.list_box_row_t option
  method get_row_at_y : int -> List_box_row.list_box_row_t option
  method get_selected_row : unit -> List_box_row.list_box_row_t option
  method get_selected_rows : unit -> List_box_row.list_box_row_t list
  method get_selection_mode : unit -> Enums.selectionmode
  method get_show_separators : unit -> bool
  method get_tab_behavior : unit -> Enums.listtabbehavior

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_headers : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_row : List_box_row.list_box_row_t option -> unit
  method set_activate_on_single_click : bool -> unit
  method set_adjustment : Adjustment.adjustment_t option -> unit

  method set_placeholder :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_selection_mode : Enums.selectionmode -> unit
  method set_show_separators : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method unselect_all : unit -> unit
  method unselect_row : List_box_row.list_box_row_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_list_box : Raw.List_box.t
end

class list_box : Raw.List_box.t -> list_box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.List_box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkListBox], give one already wrapped. *)

val new_ : unit -> list_box_t
