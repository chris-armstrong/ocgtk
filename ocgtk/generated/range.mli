(** Base class for widgets which visualize an adjustment.

    Widgets that are derived from [GtkRange] include [Gtk.Scale] and
    [Gtk.Scrollbar].

    Apart from signals for monitoring the parameters of the adjustment,
    [GtkRange] provides properties and methods for setting a “fill level” on
    range widgets. See [Gtk.Range.set_fill_level].

    {b Shortcuts and Gestures}

    The [GtkRange] slider is draggable. Holding the <kbd>Shift</kbd> key while
    dragging, or initiating the drag with a long-press will enable the
    fine-tuning mode.

    Its methods, signals and properties are on {!class-type-range_t}. The
    functions it is built on are in {!Ocgtk.Raw.Range}. *)

(** The methods, signals and properties of a [GtkRange]. *)
class type range_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_adjust_bounds :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> value:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_slider :
    ?after:bool ->
    callback:(step:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_fill_level : unit -> float
  method get_flippable : unit -> bool
  method get_inverted : unit -> bool
  method get_restrict_to_fill_level : unit -> bool
  method get_round_digits : unit -> int
  method get_show_fill_level : unit -> bool
  method get_slider_size_fixed : unit -> bool
  method get_value : unit -> float
  method set_adjustment : Adjustment.adjustment_t -> unit
  method set_fill_level : float -> unit
  method set_flippable : bool -> unit
  method set_increments : float -> float -> unit
  method set_inverted : bool -> unit
  method set_range : float -> float -> unit
  method set_restrict_to_fill_level : bool -> unit
  method set_round_digits : int -> unit
  method set_show_fill_level : bool -> unit
  method set_slider_size_fixed : bool -> unit
  method set_value : float -> unit
  method as_range : Raw.Range.t
end

class range : Raw.Range.t -> range_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Range.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRange], give one already wrapped. *)
