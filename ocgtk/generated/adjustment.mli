(** A model for a numeric value.

    The [GtkAdjustment] has an associated lower and upper bound. It also
    contains step and page increments, and a page size.

    Adjustments are used within several GTK widgets, including [Gtk.SpinButton],
    [Gtk.Viewport], [Gtk.Scrollbar] and [Gtk.Scale].

    The [GtkAdjustment] object does not update the value itself. Instead it is
    left up to the owner of the [GtkAdjustment] to control the value.

    Its methods, signals and properties are on {!class-type-adjustment_t}. The
    functions it is built on are in {!Ocgtk.Raw.Adjustment}. *)

(** The methods, signals and properties of a [GtkAdjustment]. *)
class type adjustment_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method clamp_page : float -> float -> unit
  (** Updates the value of the adjustment to ensure that the given range is
      contained in the current page.

      The current page goes from [value] to [value] + [page-size]. If the range
      is larger than the page size, then only the start of it will be in the
      current page.

      A [Gtk.Adjustment::value-changed] signal will be emitted if the value is
      changed. *)

  method configure : float -> float -> float -> float -> float -> float -> unit
  (** Sets all properties of the adjustment at once.

      Use this function to avoid multiple emissions of the
      [Gtk.Adjustment::changed] signal. See [Gtk.Adjustment.set_lower] for an
      alternative way of compressing multiple emissions of
      [Gtk.Adjustment::changed] into one. *)

  method get_lower : unit -> float
  (** Retrieves the minimum value of the adjustment. *)

  method get_minimum_increment : unit -> float
  (** Gets the smaller of step increment and page increment. *)

  method get_page_increment : unit -> float
  (** Retrieves the page increment of the adjustment. *)

  method get_page_size : unit -> float
  (** Retrieves the page size of the adjustment. *)

  method get_step_increment : unit -> float
  (** Retrieves the step increment of the adjustment. *)

  method get_upper : unit -> float
  (** Retrieves the maximum value of the adjustment. *)

  method get_value : unit -> float
  (** Gets the current value of the adjustment. *)

  method set_lower : float -> unit
  (** Sets the minimum value of the adjustment.

      When setting multiple adjustment properties via their individual setters,
      multiple [Gtk.Adjustment::changed] signals will be emitted. However, since
      the emission of the [Gtk.Adjustment::changed] signal is tied to the
      emission of the ::notify signals of the changed properties, it’s possible
      to compress the [Gtk.Adjustment::changed] signals into one by calling
      g_object_freeze_notify() and g_object_thaw_notify() around the calls to
      the individual setters.

      Alternatively, using a single g_object_set() for all the properties to
      change, or using [Gtk.Adjustment.configure] has the same effect. *)

  method set_page_increment : float -> unit
  (** Sets the page increment of the adjustment.

      See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
      the [Gtk.Adjustment::changed] signal when setting multiple adjustment
      properties. *)

  method set_page_size : float -> unit
  (** Sets the page size of the adjustment.

      See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
      the [Gtk.Adjustment::changed] signal when setting multiple adjustment
      properties. *)

  method set_step_increment : float -> unit
  (** Sets the step increment of the adjustment.

      See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
      the [Gtk.Adjustment::changed] signal when setting multiple adjustment
      properties. *)

  method set_upper : float -> unit
  (** Sets the maximum value of the adjustment.

      Note that values will be restricted by [upper - page-size] if the
      page-size property is nonzero.

      See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
      the [Gtk.Adjustment::changed] signal when setting multiple adjustment
      properties. *)

  method set_value : float -> unit
  (** Sets the [GtkAdjustment] value.

      The value is clamped to lie between [Gtk.Adjustment:lower] and
      [Gtk.Adjustment:upper].

      Note that for adjustments which are used in a [GtkScrollbar], the
      effective range of allowed values goes from [Gtk.Adjustment:lower] to
      [Gtk.Adjustment:upper] - [Gtk.Adjustment:page-size]. *)

  method as_adjustment : Raw.Adjustment.t
end

class adjustment : Raw.Adjustment.t -> adjustment_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Adjustment.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAdjustment], give one already wrapped. *)

val new_ : float -> float -> float -> float -> float -> float -> adjustment_t
