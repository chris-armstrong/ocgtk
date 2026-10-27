(** Shows a horizontal or vertical scrollbar.

    An example GtkScrollbar

    Its position and movement are controlled by the adjustment that is passed to
    or created by [Gtk.Scrollbar.new]. See [Gtk.Adjustment] for more details.
    The [Gtk.Adjustment:value] field sets the position of the thumb and must be
    between [Gtk.Adjustment:lower] and [Gtk.Adjustment:upper] -
    [Gtk.Adjustment:page-size]. The [Gtk.Adjustment:page-size] represents the
    size of the visible scrollable area.

    The fields [Gtk.Adjustment:step-increment] and
    [Gtk.Adjustment:page-increment] fields are added to or subtracted from the
    [Gtk.Adjustment:value] when the user asks to move by a step (using e.g. the
    cursor arrow keys) or by a page (using e.g. the Page Down/Up keys).

    {b CSS nodes}

    {[
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ]}

    [GtkScrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes
    applied, depending on the scrollbar's orientation.

    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.

    Other style classes that may be added to scrollbars inside
    [Gtk.ScrolledWindow] include the positional classes (.left, .right, .top,
    .bottom) and style classes related to overlay scrolling (.overlay-indicator,
    .dragging, .hovering).

    {b Accessibility}

    [GtkScrollbar] uses the [Gtk.AccessibleRole.scrollbar] role.

    Its methods, signals and properties are on {!class-type-scrollbar_t}. The
    functions it is built on are in {!Ocgtk.Raw.Scrollbar}. *)

(** The methods, signals and properties of a [GtkScrollbar]. *)
class type scrollbar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Returns the scrollbar's adjustment. *)

  method set_adjustment : Adjustment.adjustment_t option -> unit
  (** Makes the scrollbar use the given adjustment. *)

  method as_scrollbar : Raw.Scrollbar.t
end

class scrollbar : Raw.Scrollbar.t -> scrollbar_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Scrollbar.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkScrollbar], give one already wrapped. *)

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scrollbar_t
