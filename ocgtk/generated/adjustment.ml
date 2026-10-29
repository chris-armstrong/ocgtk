class type adjustment_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when one or more of the [GtkAdjustment] properties have been
      changed.

      Note that the [Gtk.Adjustment:value] property is covered by the
      [Gtk.Adjustment::value-changed] signal. *)

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the value has been changed. *)

  (** {2:methods Methods} *)

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
      [g_object_freeze_notify ()] and [g_object_thaw_notify ()] around the calls
      to the individual setters.

      Alternatively, using a single [g_object_set ()] for all the properties to
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

  (** {2:conversions Conversions} *)

  method as_adjustment : Raw.Adjustment.t
end

(* High-level class for Adjustment *)
class adjustment (obj : Raw.Adjustment.t) : adjustment_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Adjustment.on_changed ~after self#as_adjustment ~callback

    method on_value_changed ?(after = false) ~callback () =
      Raw.Adjustment.on_value_changed ~after self#as_adjustment ~callback

    method clamp_page : float -> float -> unit =
      fun lower upper -> Raw.Adjustment.clamp_page obj lower upper

    method configure :
        float -> float -> float -> float -> float -> float -> unit =
      fun value lower upper step_increment page_increment page_size ->
        Raw.Adjustment.configure obj value lower upper step_increment
          page_increment page_size

    method get_lower : unit -> float = fun () -> Raw.Adjustment.get_lower obj

    method get_minimum_increment : unit -> float =
      fun () -> Raw.Adjustment.get_minimum_increment obj

    method get_page_increment : unit -> float =
      fun () -> Raw.Adjustment.get_page_increment obj

    method get_page_size : unit -> float =
      fun () -> Raw.Adjustment.get_page_size obj

    method get_step_increment : unit -> float =
      fun () -> Raw.Adjustment.get_step_increment obj

    method get_upper : unit -> float = fun () -> Raw.Adjustment.get_upper obj
    method get_value : unit -> float = fun () -> Raw.Adjustment.get_value obj

    method set_lower : float -> unit =
      fun lower -> Raw.Adjustment.set_lower obj lower

    method set_page_increment : float -> unit =
      fun page_increment -> Raw.Adjustment.set_page_increment obj page_increment

    method set_page_size : float -> unit =
      fun page_size -> Raw.Adjustment.set_page_size obj page_size

    method set_step_increment : float -> unit =
      fun step_increment -> Raw.Adjustment.set_step_increment obj step_increment

    method set_upper : float -> unit =
      fun upper -> Raw.Adjustment.set_upper obj upper

    method set_value : float -> unit =
      fun value -> Raw.Adjustment.set_value obj value

    method as_adjustment = obj
  end

let new_ (value : float) (lower : float) (upper : float)
    (step_increment : float) (page_increment : float) (page_size : float) :
    adjustment_t =
  let obj_ =
    Raw.Adjustment.new_ value lower upper step_increment page_increment
      page_size
  in
  new adjustment obj_
