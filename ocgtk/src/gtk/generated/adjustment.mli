(* GENERATED CODE - DO NOT EDIT *)
(* Adjustment: Adjustment *)

type t = [ `adjustment | `initially_unowned | `object_ ] Gobject.obj
(** A model for a numeric value.

    The [GtkAdjustment] has an associated lower and upper bound. It also
    contains step and page increments, and a page size.

    Adjustments are used within several GTK widgets, including [Gtk.SpinButton],
    [Gtk.Viewport], [Gtk.Scrollbar] and [Gtk.Scale].

    The [GtkAdjustment] object does not update the value itself. Instead it is
    left up to the owner of the [GtkAdjustment] to control the value. *)

external new_ : float -> float -> float -> float -> float -> float -> t
  = "ml_gtk_adjustment_new_bytecode" "ml_gtk_adjustment_new_native"
(** Create a new Adjustment *)

(* Methods *)

external set_value : t -> float -> unit = "ml_gtk_adjustment_set_value"
(** Sets the [GtkAdjustment] value.

    The value is clamped to lie between [Gtk.Adjustment:lower] and
    [Gtk.Adjustment:upper].

    Note that for adjustments which are used in a [GtkScrollbar], the effective
    range of allowed values goes from [Gtk.Adjustment:lower] to
    [Gtk.Adjustment:upper] - [Gtk.Adjustment:page-size]. *)

external set_upper : t -> float -> unit = "ml_gtk_adjustment_set_upper"
(** Sets the maximum value of the adjustment.

    Note that values will be restricted by [upper - page-size] if the page-size
    property is nonzero.

    See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
    the [Gtk.Adjustment::changed] signal when setting multiple adjustment
    properties. *)

external set_step_increment : t -> float -> unit
  = "ml_gtk_adjustment_set_step_increment"
(** Sets the step increment of the adjustment.

    See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
    the [Gtk.Adjustment::changed] signal when setting multiple adjustment
    properties. *)

external set_page_size : t -> float -> unit = "ml_gtk_adjustment_set_page_size"
(** Sets the page size of the adjustment.

    See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
    the [Gtk.Adjustment::changed] signal when setting multiple adjustment
    properties. *)

external set_page_increment : t -> float -> unit
  = "ml_gtk_adjustment_set_page_increment"
(** Sets the page increment of the adjustment.

    See [Gtk.Adjustment.set_lower] about how to compress multiple emissions of
    the [Gtk.Adjustment::changed] signal when setting multiple adjustment
    properties. *)

external set_lower : t -> float -> unit = "ml_gtk_adjustment_set_lower"
(** Sets the minimum value of the adjustment.

    When setting multiple adjustment properties via their individual setters,
    multiple [Gtk.Adjustment::changed] signals will be emitted. However, since
    the emission of the [Gtk.Adjustment::changed] signal is tied to the emission
    of the ::notify signals of the changed properties, it’s possible to compress
    the [Gtk.Adjustment::changed] signals into one by calling
    g_object_freeze_notify() and g_object_thaw_notify() around the calls to the
    individual setters.

    Alternatively, using a single g_object_set() for all the properties to
    change, or using [Gtk.Adjustment.configure] has the same effect. *)

external get_value : t -> float = "ml_gtk_adjustment_get_value"
(** Gets the current value of the adjustment. *)

external get_upper : t -> float = "ml_gtk_adjustment_get_upper"
(** Retrieves the maximum value of the adjustment. *)

external get_step_increment : t -> float
  = "ml_gtk_adjustment_get_step_increment"
(** Retrieves the step increment of the adjustment. *)

external get_page_size : t -> float = "ml_gtk_adjustment_get_page_size"
(** Retrieves the page size of the adjustment. *)

external get_page_increment : t -> float
  = "ml_gtk_adjustment_get_page_increment"
(** Retrieves the page increment of the adjustment. *)

external get_minimum_increment : t -> float
  = "ml_gtk_adjustment_get_minimum_increment"
(** Gets the smaller of step increment and page increment. *)

external get_lower : t -> float = "ml_gtk_adjustment_get_lower"
(** Retrieves the minimum value of the adjustment. *)

external configure :
  t -> float -> float -> float -> float -> float -> float -> unit
  = "ml_gtk_adjustment_configure_bytecode" "ml_gtk_adjustment_configure_native"
(** Sets all properties of the adjustment at once.

    Use this function to avoid multiple emissions of the
    [Gtk.Adjustment::changed] signal. See [Gtk.Adjustment.set_lower] for an
    alternative way of compressing multiple emissions of
    [Gtk.Adjustment::changed] into one. *)

external clamp_page : t -> float -> float -> unit
  = "ml_gtk_adjustment_clamp_page"
(** Updates the value of the adjustment to ensure that the given range is
    contained in the current page.

    The current page goes from [value] to [value] + [page-size]. If the range is
    larger than the page size, then only the start of it will be in the current
    page.

    A [Gtk.Adjustment::value-changed] signal will be emitted if the value is
    changed. *)

(* Properties *)

val on_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_value_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
