(** Puts child widgets in a reflowing grid.

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
    add any kind of widget to it via [Gtk.FlowBox.insert], and a
    [GtkFlowBoxChild] widget will automatically be inserted between the box and
    the widget.

    Also see [Gtk.ListBox].

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.FlowBox::move-cursor]
    - [Gtk.FlowBox::select-all]
    - [Gtk.FlowBox::toggle-cursor-child]
    - [Gtk.FlowBox::unselect-all]

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

    [GtkFlowBox] uses the [Gtk.AccessibleRole.grid] role, and [GtkFlowBoxChild]
    uses the [Gtk.AccessibleRole.grid_cell] role.

    Its methods, signals and properties are on {!class-type-flow_box_t}. The
    functions it is built on are in {!Ocgtk.Raw.Flow_box}. *)

(** The methods, signals and properties of a [GtkFlowBox]. *)
class type flow_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method on_activate_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_child_activated :
    ?after:bool ->
    callback:(child:Flow_box_child.flow_box_child_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

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

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selected_children_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_activate_on_single_click : unit -> bool
  method get_child_at_index : int -> Flow_box_child.flow_box_child_t option
  method get_child_at_pos : int -> int -> Flow_box_child.flow_box_child_t option
  method get_column_spacing : unit -> int
  method get_homogeneous : unit -> bool
  method get_max_children_per_line : unit -> int
  method get_min_children_per_line : unit -> int
  method get_row_spacing : unit -> int
  method get_selected_children : unit -> Flow_box_child.flow_box_child_t list
  method get_selection_mode : unit -> Enums.selectionmode

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
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
  method select_child : Flow_box_child.flow_box_child_t -> unit
  method set_activate_on_single_click : bool -> unit
  method set_column_spacing : int -> unit
  method set_hadjustment : Adjustment.adjustment_t -> unit
  method set_homogeneous : bool -> unit
  method set_max_children_per_line : int -> unit
  method set_min_children_per_line : int -> unit
  method set_row_spacing : int -> unit
  method set_selection_mode : Enums.selectionmode -> unit
  method set_vadjustment : Adjustment.adjustment_t -> unit
  method unselect_all : unit -> unit
  method unselect_child : Flow_box_child.flow_box_child_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_flow_box : Raw.Flow_box.t
end

class flow_box : Raw.Flow_box.t -> flow_box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Flow_box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFlowBox], give one already wrapped. *)

val new_ : unit -> flow_box_t
