(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Tooltip from cyclic group Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** Represents a widget tooltip.

    Its methods, signals and properties are on {!class-type-tooltip_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Tooltip}. *)

(** {1:class Class} *)

class type tooltip_t =
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .tooltip_t
(** {b The methods, signals and properties of a [Tooltip].}

    Represents a widget tooltip.

    Basic tooltips can be realized simply by using
    {{!Ocgtk.Widget.class-type-widget_t.method-set_tooltip_text}[Gtk.Widget.set_tooltip_text]}
    or
    {{!Ocgtk.Widget.class-type-widget_t.method-set_tooltip_markup}[Gtk.Widget.set_tooltip_markup]}
    without any explicit tooltip object.

    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per [GtkTreeView]
    row or cell, you will have to do a little more work:

    - Set the
      {{!Ocgtk.Widget.class-type-widget_t.method-get_has_tooltip}[Gtk.Widget:has-tooltip]}
      property to [true]. This will make GTK monitor the widget for motion and
      related events which are needed to determine when and where to show a
      tooltip.

    - Connect to the
      {{!Ocgtk.Widget.class-type-widget_t.method-on_query_tooltip}[Gtk.Widget::query-tooltip]}
      signal. This signal will be emitted when a tooltip is supposed to be
      shown. One of the arguments passed to the signal handler is a [GtkTooltip]
      object. This is the object that we are about to display as a tooltip, and
      can be manipulated in your callback using functions like
      {{!Ocgtk.Tooltip.class-type-tooltip_t.method-set_icon}[Gtk.Tooltip.set_icon]}.
      There are functions for setting the tooltip’s markup, setting an image
      from a named icon, or even putting in a custom widget.

    - Return [true] from your ::query-tooltip handler. This causes the tooltip
      to be show. If you return [false], it will not be shown. *)

class tooltip : Raw.Tooltip.t -> tooltip_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tooltip.t}. *)

(** {1:description Description}

    Represents a widget tooltip.

    Basic tooltips can be realized simply by using
    {{!Ocgtk.Widget.class-type-widget_t.method-set_tooltip_text}[Gtk.Widget.set_tooltip_text]}
    or
    {{!Ocgtk.Widget.class-type-widget_t.method-set_tooltip_markup}[Gtk.Widget.set_tooltip_markup]}
    without any explicit tooltip object.

    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per [GtkTreeView]
    row or cell, you will have to do a little more work:

    - Set the
      {{!Ocgtk.Widget.class-type-widget_t.method-get_has_tooltip}[Gtk.Widget:has-tooltip]}
      property to [true]. This will make GTK monitor the widget for motion and
      related events which are needed to determine when and where to show a
      tooltip.

    - Connect to the
      {{!Ocgtk.Widget.class-type-widget_t.method-on_query_tooltip}[Gtk.Widget::query-tooltip]}
      signal. This signal will be emitted when a tooltip is supposed to be
      shown. One of the arguments passed to the signal handler is a [GtkTooltip]
      object. This is the object that we are about to display as a tooltip, and
      can be manipulated in your callback using functions like
      {{!Ocgtk.Tooltip.class-type-tooltip_t.method-set_icon}[Gtk.Tooltip.set_icon]}.
      There are functions for setting the tooltip’s markup, setting an image
      from a named icon, or even putting in a custom widget.

    - Return [true] from your ::query-tooltip handler. This causes the tooltip
      to be show. If you return [false], it will not be shown. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
