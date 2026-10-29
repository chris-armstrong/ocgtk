(** Puts child widgets in a reflowing grid.

    Its methods, signals and properties are on {!class-type-flow_box_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Flow_box}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FlowBox].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Puts child widgets in a reflowing grid.

    An example GtkFlowBox

    For instance, with the horizontal orientation, the widgets will be arranged
    from left to right, starting a new row under the previous row when
    necessary. Reducing the width in this case will require more rows, so a
    larger height will be requested.

    Likewise, with the vertical orientation, the widgets will be arranged from
    top to bottom, starting a new column to the right when necessary. Reducing
    the height will require more columns, so a larger width will be requested.

    The size request of a [GtkFlowBox] alone may not be what you expect; if you
    need to be able to shrink it along both axes and dynamically reflow its
    children, you may have to wrap it in a [GtkScrolledWindow] to enable that.

    The children of a [GtkFlowBox] can be dynamically sorted and filtered.

    Although a [GtkFlowBox] must have only [GtkFlowBoxChild] children, you can
    add any kind of widget to it via
    {{!Ocgtk.Flow_box.class-type-flow_box_t.method-insert}[Gtk.FlowBox.insert]},
    and a [GtkFlowBoxChild] widget will automatically be inserted between the
    box and the widget.

    Also see {{!Ocgtk.List_box.class-type-list_box_t}[Gtk.ListBox]}.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_move_cursor}[Gtk.FlowBox::move-cursor]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_select_all}[Gtk.FlowBox::select-all]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_toggle_cursor_child}[Gtk.FlowBox::toggle-cursor-child]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_unselect_all}[Gtk.FlowBox::unselect-all]}

    {b CSS nodes}

    {[
    flowbox
    ├── flowboxchild
    │   ╰── <child>
    ├── flowboxchild
    │   ╰── <child>
    ┊
    ╰── [rubberband]
    ]}

    [GtkFlowBox] uses a single CSS node with name flowbox. [GtkFlowBoxChild]
    uses a single CSS node with name flowboxchild. For rubberband selection, a
    subnode with name rubberband is used.

    {b Accessibility}

    [GtkFlowBox] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GRID}[Gtk.AccessibleRole.grid]}
    role, and [GtkFlowBoxChild] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GRID_CELL}[Gtk.AccessibleRole.grid_cell]}
    role. *)
class type flow_box_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_activate_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates the [box].

      This is a keybinding signal. *)

  method on_child_activated :
    ?after:bool ->
    callback:(child:Flow_box_child.flow_box_child_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a child has been activated by the user. *)

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
  (** Emitted when the user initiates a cursor movement.

      This is a keybinding signal. Applications should not connect to it, but
      may emit it with g_signal_emit_by_name() if they need to control the
      cursor programmatically.

      The default bindings for this signal come in two variants, the variant
      with the Shift modifier extends the selection, the variant without the
      Shift modifier does not. There are too many key combinations to list them
      all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual children
      - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
      - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages *)

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to select all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)

  method on_selected_children_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the set of selected children changes.

      Use [Gtk.FlowBox.selected_foreach] or [Gtk.FlowBox.get_selected_children]
      to obtain the selected children. *)

  method on_toggle_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to toggle the selection of the child that has the focus.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>Space</kbd>.
  *)

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to unselect all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default bindings for this signal is
      <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)

  (** {2:methods Methods} *)

  method append : Widget.widget_t -> unit
  (** Adds [child] to the end of [self].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      See also: [Gtk.FlowBox.insert]. *)

  method get_activate_on_single_click : unit -> bool
  (** Returns whether children activate on single clicks. *)

  method get_child_at_index : int -> Flow_box_child.flow_box_child_t option
  (** Gets the nth child in the [box]. *)

  method get_child_at_pos : int -> int -> Flow_box_child.flow_box_child_t option
  (** Gets the child in the ([x], [y]) position.

      Both [x] and [y] are assumed to be relative to the origin of [box]. *)

  method get_column_spacing : unit -> int
  (** Gets the horizontal spacing. *)

  method get_homogeneous : unit -> bool
  (** Returns whether the box is homogeneous. *)

  method get_max_children_per_line : unit -> int
  (** Gets the maximum number of children per line. *)

  method get_min_children_per_line : unit -> int
  (** Gets the minimum number of children per line. *)

  method get_row_spacing : unit -> int
  (** Gets the vertical spacing. *)

  method get_selected_children : unit -> Flow_box_child.flow_box_child_t list
  (** Creates a list of all selected children. *)

  method get_selection_mode : unit -> Enums.selectionmode
  (** Gets the selection mode of [box]. *)

  method insert : Widget.widget_t -> int -> unit
  (** Inserts the [widget] into [box] at [position].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      If [position] is -1, or larger than the total number of children in the
      [box], then the [widget] will be appended to the end. *)

  method invalidate_filter : unit -> unit
  (** Updates the filtering for all children.

      Call this function when the result of the filter function on the [box] is
      changed due to an external factor. For instance, this would be used if the
      filter function just looked for a specific search term, and the entry with
      the string has changed. *)

  method invalidate_sort : unit -> unit
  (** Updates the sorting for all children.

      Call this when the result of the sort function on [box] is changed due to
      an external factor. *)

  method prepend : Widget.widget_t -> unit
  (** Adds [child] to the start of [self].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      See also: [Gtk.FlowBox.insert]. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child from [box]. *)

  method remove_all : unit -> unit
  (** Removes all children from [box].

      This function does nothing if [box] is backed by a model. *)

  method select_all : unit -> unit
  (** Select all children of [box], if the selection mode allows it. *)

  method select_child : Flow_box_child.flow_box_child_t -> unit
  (** Selects a single child of [box], if the selection mode allows it. *)

  method set_activate_on_single_click : bool -> unit
  (** If [single] is [true], children will be activated when you click on them,
      otherwise you need to double-click. *)

  method set_column_spacing : int -> unit
  (** Sets the horizontal space to add between children. *)

  method set_hadjustment : Adjustment.adjustment_t -> unit
  (** Hooks up an adjustment to focus handling in [box].

      The adjustment is also used for autoscrolling during rubberband selection.
      See [Gtk.ScrolledWindow.get_hadjustment] for a typical way of obtaining
      the adjustment, and [Gtk.FlowBox.set_vadjustment] for setting the vertical
      adjustment.

      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the box. *)

  method set_homogeneous : bool -> unit
  (** Sets whether or not all children of [box] are given equal space in the
      box. *)

  method set_max_children_per_line : int -> unit
  (** Sets the maximum number of children to request and allocate space for in
      [box]’s orientation.

      Setting the maximum number of children per line limits the overall natural
      size request to be no more than [n_children] children long in the given
      orientation. *)

  method set_min_children_per_line : int -> unit
  (** Sets the minimum number of children to line up in [box]’s orientation
      before flowing. *)

  method set_row_spacing : int -> unit
  (** Sets the vertical space to add between children. *)

  method set_selection_mode : Enums.selectionmode -> unit
  (** Sets how selection works in [box]. *)

  method set_vadjustment : Adjustment.adjustment_t -> unit
  (** Hooks up an adjustment to focus handling in [box].

      The adjustment is also used for autoscrolling during rubberband selection.
      See [Gtk.ScrolledWindow.get_vadjustment] for a typical way of obtaining
      the adjustment, and [Gtk.FlowBox.set_hadjustment] for setting the
      horizontal adjustment.

      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the box. *)

  method unselect_all : unit -> unit
  (** Unselect all children of [box], if the selection mode allows it. *)

  method unselect_child : Flow_box_child.flow_box_child_t -> unit
  (** Unselects a single child of [box], if the selection mode allows it. *)

  (** {2:properties Properties} *)

  method accept_unpaired_release : bool
  (** Whether to accept unpaired release events. *)

  method set_accept_unpaired_release : bool -> unit
  (** Whether to accept unpaired release events. *)

  (** {2:conversions Conversions} *)

  method as_flow_box : Raw.Flow_box.t
end

class flow_box : Raw.Flow_box.t -> flow_box_t
(** Wraps a raw handle of {!Ocgtk.Raw.Flow_box.t}. *)

(** {1:description Description}

    Puts child widgets in a reflowing grid.

    An example GtkFlowBox

    For instance, with the horizontal orientation, the widgets will be arranged
    from left to right, starting a new row under the previous row when
    necessary. Reducing the width in this case will require more rows, so a
    larger height will be requested.

    Likewise, with the vertical orientation, the widgets will be arranged from
    top to bottom, starting a new column to the right when necessary. Reducing
    the height will require more columns, so a larger width will be requested.

    The size request of a [GtkFlowBox] alone may not be what you expect; if you
    need to be able to shrink it along both axes and dynamically reflow its
    children, you may have to wrap it in a [GtkScrolledWindow] to enable that.

    The children of a [GtkFlowBox] can be dynamically sorted and filtered.

    Although a [GtkFlowBox] must have only [GtkFlowBoxChild] children, you can
    add any kind of widget to it via
    {{!Ocgtk.Flow_box.class-type-flow_box_t.method-insert}[Gtk.FlowBox.insert]},
    and a [GtkFlowBoxChild] widget will automatically be inserted between the
    box and the widget.

    Also see {{!Ocgtk.List_box.class-type-list_box_t}[Gtk.ListBox]}.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_move_cursor}[Gtk.FlowBox::move-cursor]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_select_all}[Gtk.FlowBox::select-all]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_toggle_cursor_child}[Gtk.FlowBox::toggle-cursor-child]}
    - {{!Ocgtk.Flow_box.class-type-flow_box_t.method-on_unselect_all}[Gtk.FlowBox::unselect-all]}

    {b CSS nodes}

    {[
    flowbox
    ├── flowboxchild
    │   ╰── <child>
    ├── flowboxchild
    │   ╰── <child>
    ┊
    ╰── [rubberband]
    ]}

    [GtkFlowBox] uses a single CSS node with name flowbox. [GtkFlowBoxChild]
    uses a single CSS node with name flowboxchild. For rubberband selection, a
    subnode with name rubberband is used.

    {b Accessibility}

    [GtkFlowBox] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GRID}[Gtk.AccessibleRole.grid]}
    role, and [GtkFlowBoxChild] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GRID_CELL}[Gtk.AccessibleRole.grid_cell]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : unit -> flow_box_t
(** Creates a [GtkFlowBox]. *)
