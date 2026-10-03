(* GENERATED CODE - DO NOT EDIT *)
(* Scrollbar: Scrollbar *)

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

    [GtkScrollbar] uses the [Gtk.AccessibleRole.scrollbar] role. *)

type t = [ `scrollbar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : Gtk_enums.orientation -> Adjustment.t option -> t
  = "ml_gtk_scrollbar_new"
(** Create a new Scrollbar *)

(* Methods *)

external set_adjustment : t -> Adjustment.t option -> unit
  = "ml_gtk_scrollbar_set_adjustment"
(** Makes the scrollbar use the given adjustment. *)

external get_adjustment : t -> Adjustment.t = "ml_gtk_scrollbar_get_adjustment"
(** Returns the scrollbar's adjustment. *)

(* Properties *)
