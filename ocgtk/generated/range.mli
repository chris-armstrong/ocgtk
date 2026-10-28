(** Base class for widgets which visualize an adjustment.

    Its methods, signals and properties are on {!class-type-range_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Range}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Range].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Base class for widgets which visualize an adjustment.

    Widgets that are derived from [GtkRange] include [Gtk.Scale] and
    [Gtk.Scrollbar].

    Apart from signals for monitoring the parameters of the adjustment,
    [GtkRange] provides properties and methods for setting a “fill level” on
    range widgets. See [Gtk.Range.set_fill_level].

    {b Shortcuts and Gestures}

    The [GtkRange] slider is draggable. Holding the <kbd>Shift</kbd> key while
    dragging, or initiating the drag with a long-press will enable the
    fine-tuning mode. *)
class type range_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_adjust_bounds :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted before clamping a value, to give the application a chance to
      adjust the bounds. *)

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> value:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a scroll action is performed on a range.

      It allows an application to determine the type of scroll event that
      occurred and the resultant new value. The application can handle the event
      itself and return [TRUE] to prevent further processing. Or, by returning
      [FALSE], it can pass the event to other handlers until the default GTK
      handler is reached.

      The value parameter is unrounded. An application that overrides the
      ::change-value signal is responsible for clamping the value to the desired
      number of decimal digits; the default GTK handler clamps the value based
      on [Gtk.Range:round-digits]. *)

  method on_move_slider :
    ?after:bool ->
    callback:(step:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Virtual function that moves the slider.

      Used for keybindings. *)

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the range value changes. *)

  (** {2:methods Methods} *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Get the adjustment which is the “model” object for [GtkRange]. *)

  method get_fill_level : unit -> float
  (** Gets the current position of the fill level indicator. *)

  method get_flippable : unit -> bool
  (** Gets whether the [GtkRange] respects text direction.

      See [Gtk.Range.set_flippable]. *)

  method get_inverted : unit -> bool
  (** Gets whether the range is inverted.

      See [Gtk.Range.set_inverted]. *)

  method get_restrict_to_fill_level : unit -> bool
  (** Gets whether the range is restricted to the fill level. *)

  method get_round_digits : unit -> int
  (** Gets the number of digits to round the value to when it changes.

      See [Gtk.Range::change-value]. *)

  method get_show_fill_level : unit -> bool
  (** Gets whether the range displays the fill level graphically. *)

  method get_slider_size_fixed : unit -> bool
  (** This function is useful mainly for [GtkRange] subclasses.

      See [Gtk.Range.set_slider_size_fixed]. *)

  method get_value : unit -> float
  (** Gets the current value of the range. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** Sets the adjustment to be used as the “model” object for the [GtkRange]

      The adjustment indicates the current range value, the minimum and maximum
      range values, the step/page increments used for keybindings and scrolling,
      and the page size.

      The page size is normally 0 for [GtkScale] and nonzero for [GtkScrollbar],
      and indicates the size of the visible area of the widget being scrolled.
      The page size affects the size of the scrollbar slider. *)

  method set_fill_level : float -> unit
  (** Set the new position of the fill level indicator.

      The “fill level” is probably best described by its most prominent use
      case, which is an indicator for the amount of pre-buffering in a streaming
      media player. In that use case, the value of the range would indicate the
      current play position, and the fill level would be the position up to
      which the file/stream has been downloaded.

      This amount of prebuffering can be displayed on the range’s trough and is
      themeable separately from the trough. To enable fill level display, use
      [Gtk.Range.set_show_fill_level]. The range defaults to not showing the
      fill level.

      Additionally, it’s possible to restrict the range’s slider position to
      values which are smaller than the fill level. This is controlled by
      [Gtk.Range.set_restrict_to_fill_level] and is by default enabled. *)

  method set_flippable : bool -> unit
  (** Sets whether the [GtkRange] respects text direction.

      If a range is flippable, it will switch its direction if it is horizontal
      and its direction is [GTK_TEXT_DIR_RTL].

      See [Gtk.Widget.get_direction]. *)

  method set_increments : float -> float -> unit
  (** Sets the step and page sizes for the range.

      The step size is used when the user clicks the [GtkScrollbar] arrows or
      moves a [GtkScale] via arrow keys. The page size is used for example when
      moving via Page Up or Page Down keys. *)

  method set_inverted : bool -> unit
  (** Sets whether to invert the range.

      Ranges normally move from lower to higher values as the slider moves from
      top to bottom or left to right. Inverted ranges have higher values at the
      top or on the right rather than on the bottom or left. *)

  method set_range : float -> float -> unit
  (** Sets the allowable values in the [GtkRange].

      The range value is clamped to be between [min] and [max]. (If the range
      has a non-zero page size, it is clamped between [min] and [max] -
      page-size.) *)

  method set_restrict_to_fill_level : bool -> unit
  (** Sets whether the slider is restricted to the fill level.

      See [Gtk.Range.set_fill_level] for a general description of the fill level
      concept. *)

  method set_round_digits : int -> unit
  (** Sets the number of digits to round the value to when it changes.

      See [Gtk.Range::change-value]. *)

  method set_show_fill_level : bool -> unit
  (** Sets whether a graphical fill level is show on the trough.

      See [Gtk.Range.set_fill_level] for a general description of the fill level
      concept. *)

  method set_slider_size_fixed : bool -> unit
  (** Sets whether the range’s slider has a fixed size, or a size that depends
      on its adjustment’s page size.

      This function is useful mainly for [GtkRange] subclasses. *)

  method set_value : float -> unit
  (** Sets the current value of the range.

      If the value is outside the minimum or maximum range values, it will be
      clamped to fit inside them. The range emits the [Gtk.Range::value-changed]
      signal if the value changes. *)

  (** {2:conversions Conversions} *)

  method as_range : Raw.Range.t
end

class range : Raw.Range.t -> range_t
(** Wraps a raw handle of {!Ocgtk.Raw.Range.t}. *)

(** {1:description Description}

    Base class for widgets which visualize an adjustment.

    Widgets that are derived from [GtkRange] include [Gtk.Scale] and
    [Gtk.Scrollbar].

    Apart from signals for monitoring the parameters of the adjustment,
    [GtkRange] provides properties and methods for setting a “fill level” on
    range widgets. See [Gtk.Range.set_fill_level].

    {b Shortcuts and Gestures}

    The [GtkRange] slider is draggable. Holding the <kbd>Shift</kbd> key while
    dragging, or initiating the drag with a long-press will enable the
    fine-tuning mode. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
