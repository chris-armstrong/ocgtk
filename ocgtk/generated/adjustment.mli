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
  method configure : float -> float -> float -> float -> float -> float -> unit
  method get_lower : unit -> float
  method get_minimum_increment : unit -> float
  method get_page_increment : unit -> float
  method get_page_size : unit -> float
  method get_step_increment : unit -> float
  method get_upper : unit -> float
  method get_value : unit -> float
  method set_lower : float -> unit
  method set_page_increment : float -> unit
  method set_page_size : float -> unit
  method set_step_increment : float -> unit
  method set_upper : float -> unit
  method set_value : float -> unit
  method as_adjustment : Raw.Adjustment.t
end

class adjustment : Raw.Adjustment.t -> adjustment_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Adjustment.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAdjustment], give one already wrapped. *)

val new_ : float -> float -> float -> float -> float -> float -> adjustment_t
