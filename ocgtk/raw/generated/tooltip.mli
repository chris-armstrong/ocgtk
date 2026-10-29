(* GENERATED CODE - DO NOT EDIT *)
(* Tooltip, a member of the cyclic module Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget *)

(** Represents a widget tooltip.

    Basic tooltips can be realized simply by using
    {{!Ocgtk.Raw.Widget.val-set_tooltip_text}[Gtk.Widget.set_tooltip_text]} or
    {{!Ocgtk.Raw.Widget.val-set_tooltip_markup}[Gtk.Widget.set_tooltip_markup]}
    without any explicit tooltip object.

    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per [GtkTreeView]
    row or cell, you will have to do a little more work:

    - Set the {{!Ocgtk.Raw.Widget.val-get_has_tooltip}[Gtk.Widget:has-tooltip]}
      property to [true]. This will make GTK monitor the widget for motion and
      related events which are needed to determine when and where to show a
      tooltip.

    - Connect to the
      {{!Ocgtk.Raw.Widget.val-on_query_tooltip}[Gtk.Widget::query-tooltip]}
      signal. This signal will be emitted when a tooltip is supposed to be
      shown. One of the arguments passed to the signal handler is a [GtkTooltip]
      object. This is the object that we are about to display as a tooltip, and
      can be manipulated in your callback using functions like
      {{!Ocgtk.Raw.Tooltip.val-set_icon}[Gtk.Tooltip.set_icon]}. There are
      functions for setting the tooltip’s markup, setting an image from a named
      icon, or even putting in a custom widget.

    - Return [true] from your ::query-tooltip handler. This causes the tooltip
      to be show. If you return [false], it will not be shown.

    The class built on this module is in {!Ocgtk.Tooltip}. *)

include module type of struct
  include
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .Tooltip
end
