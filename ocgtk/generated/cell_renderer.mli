(** An object for rendering a single cell

    The [GtkCellRenderer] is a base class of a set of objects used for rendering
    a cell to a [cairo_t]. These objects are used primarily by the [GtkTreeView]
    widget, though they aren’t tied to them in any specific way. It is worth
    noting that [GtkCellRenderer] is not a [GtkWidget] and cannot be treated as
    such.

    The primary use of a [GtkCellRenderer] is for drawing a certain graphical
    elements on a [cairo_t]. Typically, one cell renderer is used to draw many
    cells on the screen. To this extent, it isn’t expected that a CellRenderer
    keep any permanent state around. Instead, any state is set just prior to use
    using [GObject]s property system. Then, the cell is measured using
    gtk_cell_renderer_get_preferred_size(). Finally, the cell is rendered in the
    correct location using gtk_cell_renderer_snapshot().

    There are a number of rules that must be followed when writing a new
    [GtkCellRenderer]. First and foremost, it’s important that a certain set of
    properties will always yield a cell renderer of the same size, barring a
    style change. The [GtkCellRenderer] also has a number of generic properties
    that are expected to be honored by all children.

    Beyond merely rendering a cell, cell renderers can optionally provide active
    user interface elements. A cell renderer can be “activatable” like
    [GtkCellRenderer]Toggle, which toggles when it gets activated by a mouse
    click, or it can be “editable” like [GtkCellRenderer]Text, which allows the
    user to edit the text using a widget implementing the [GtkCellEditable]
    interface, e.g. [GtkEntry]. To make a cell renderer activatable or editable,
    you have to implement the [GtkCellRenderer]Class.activate or
    [GtkCellRenderer]Class.start_editing virtual functions, respectively.

    Many properties of [GtkCellRenderer] and its subclasses have a corresponding
    “set” property, e.g. “cell-background-set” corresponds to “cell-background”.
    These “set” properties reflect whether a property has been set or not. You
    should not set them independently.

    Its methods, signals and properties are on {!class-type-cell_renderer_t}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer}. *)

(** The methods, signals and properties of a [GtkCellRenderer]. *)
class type cell_renderer_t = object
  method on_editing_canceled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_editing_started :
    ?after:bool ->
    callback:(editable:Cell_editable.cell_editable_t -> path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method activate :
    Ocgdk.Event.event_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool

  method get_is_expanded : unit -> bool
  method get_is_expander : unit -> bool
  method get_request_mode : unit -> Enums.sizerequestmode
  method get_sensitive : unit -> bool

  method get_state :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Enums.cellrendererstate ->
    Enums.stateflags

  method get_visible : unit -> bool
  method is_activatable : unit -> bool
  method set_alignment : float -> float -> unit
  method set_fixed_size : int -> int -> unit
  method set_is_expanded : bool -> unit
  method set_is_expander : bool -> unit
  method set_padding : int -> int -> unit
  method set_sensitive : bool -> unit
  method set_visible : bool -> unit

  method snapshot :
    Snapshot.snapshot_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    unit

  method start_editing :
    Ocgdk.Event.event_t option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    Cell_editable.cell_editable_t option

  method stop_editing : bool -> unit
  method set_cell_background : string -> unit
  method cell_background_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_cell_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method cell_background_set : bool
  method set_cell_background_set : bool -> unit
  method editing : bool
  method height : int
  method set_height : int -> unit
  method mode : Enums.cellrenderermode
  method set_mode : Enums.cellrenderermode -> unit
  method width : int
  method set_width : int -> unit
  method xalign : float
  method set_xalign : float -> unit
  method xpad : int
  method set_xpad : int -> unit
  method yalign : float
  method set_yalign : float -> unit
  method ypad : int
  method set_ypad : int -> unit
  method as_cell_renderer : Raw.Cell_renderer.t
end

class cell_renderer : Raw.Cell_renderer.t -> cell_renderer_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellRenderer], give one already wrapped. *)
