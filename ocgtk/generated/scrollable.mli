(** An interface for widgets with native scrolling ability.

    To implement this interface you should override the
    [Gtk.Scrollable:hadjustment] and [Gtk.Scrollable:vadjustment] properties.

    {b Creating a scrollable widget}

    All scrollable widgets should do the following.

    - When a parent widget sets the scrollable child widget’s adjustments, the
      widget should connect to the [Gtk.Adjustment::value-changed] signal. The
      child widget should then populate the adjustments’ properties as soon as
      possible, which usually means queueing an allocation right away and
      populating the properties in the [Gtk.Widget.size_allocate]
      implementation.

    - Because its preferred size is the size for a fully expanded widget, the
      scrollable widget must be able to cope with underallocations. This means
      that it must accept any value passed to its [Gtk.Widget.size_allocate]
      implementation.

    - When the parent allocates space to the scrollable child widget, the widget
      must ensure the adjustments’ property values are correct and up to date,
      for example using [Gtk.Adjustment.configure].

    - When any of the adjustments emits the [Gtk.Adjustment::value-changed]
      signal, the scrollable widget should scroll its contents.

    Its methods, signals and properties are on {!class-type-scrollable_t}. The
    functions it is built on are in {!Ocgtk.Raw.Scrollable}. *)

(** {b The methods, signals and properties of a [Scrollable].}

    An interface for widgets with native scrolling ability.

    To implement this interface you should override the
    [Gtk.Scrollable:hadjustment] and [Gtk.Scrollable:vadjustment] properties.

    {b Creating a scrollable widget}

    All scrollable widgets should do the following.

    - When a parent widget sets the scrollable child widget’s adjustments, the
      widget should connect to the [Gtk.Adjustment::value-changed] signal. The
      child widget should then populate the adjustments’ properties as soon as
      possible, which usually means queueing an allocation right away and
      populating the properties in the [Gtk.Widget.size_allocate]
      implementation.

    - Because its preferred size is the size for a fully expanded widget, the
      scrollable widget must be able to cope with underallocations. This means
      that it must accept any value passed to its [Gtk.Widget.size_allocate]
      implementation.

    - When the parent allocates space to the scrollable child widget, the widget
      must ensure the adjustments’ property values are correct and up to date,
      for example using [Gtk.Adjustment.configure].

    - When any of the adjustments emits the [Gtk.Adjustment::value-changed]
      signal, the scrollable widget should scroll its contents. *)
class type scrollable_t = object
  method get_hadjustment : unit -> Adjustment.adjustment_t option
  (** Retrieves the [GtkAdjustment] used for horizontal scrolling. *)

  method get_hscroll_policy : unit -> Enums.scrollablepolicy
  (** Gets the horizontal [GtkScrollablePolicy]. *)

  method get_vadjustment : unit -> Adjustment.adjustment_t option
  (** Retrieves the [GtkAdjustment] used for vertical scrolling. *)

  method get_vscroll_policy : unit -> Enums.scrollablepolicy
  (** Gets the vertical [GtkScrollablePolicy]. *)

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the horizontal adjustment of the [GtkScrollable]. *)

  method set_hscroll_policy : Enums.scrollablepolicy -> unit
  (** Sets the [GtkScrollablePolicy].

      The policy determines whether horizontal scrolling should start below the
      minimum width or below the natural width. *)

  method set_vadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the vertical adjustment of the [GtkScrollable]. *)

  method set_vscroll_policy : Enums.scrollablepolicy -> unit
  (** Sets the [GtkScrollablePolicy].

      The policy determines whether vertical scrolling should start below the
      minimum height or below the natural height. *)

  method as_scrollable : Raw.Scrollable.t
end

class scrollable : Raw.Scrollable.t -> scrollable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Scrollable.t}. *)
