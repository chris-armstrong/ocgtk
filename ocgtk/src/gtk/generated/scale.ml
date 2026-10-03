(* GENERATED CODE - DO NOT EDIT *)
(* Scale: Scale *)

type t =
  [ `scale | `range | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Allows to select a numeric value with a slider control.

    An example GtkScale

    To use it, you’ll probably want to investigate the methods on its base
    class, [Gtk.Range], in addition to the methods for [GtkScale] itself. To set
    the value of a scale, you would normally use [Gtk.Range.set_value]. To
    detect changes to the value, you would normally use the
    [Gtk.Range::value-changed] signal.

    Note that using the same upper and lower bounds for the [GtkScale] (through
    the [GtkRange] methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).

    {b GtkScale as GtkBuildable}

    [GtkScale] supports a custom [<marks>] element, which can contain multiple
    [<mark\>] elements. The “value” and “position” attributes have the same
    meaning as [Gtk.Scale.add_mark] parameters of the same name. If the element
    is not empty, its content is taken as the markup to show at the mark. It can
    be translated with the usual ”translatable” and “context” attributes.

    {b Shortcuts and Gestures}

    [GtkPopoverMenu] supports the following keyboard shortcuts:

    - Arrow keys, <kbd>+</kbd> and <kbd>-</kbd> will increment or decrement by
      step, or by page when combined with <kbd>Ctrl</kbd>.
    - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> will increment or decrement by page.
    - <kbd>Home</kbd> and <kbd>End</kbd> will set the minimum or maximum value.

    {b CSS nodes}

    {[
    scale[.fine-tune][.marks-before][.marks-after]
    ├── [value][.top][.right][.bottom][.left]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── marks.bottom
    │   ├── mark
    │   ┊    ├── indicator
    │   ┊    ╰── [label]
    ┊   ┊
    │   ╰── mark
    ╰── trough
        ├── [fill]
        ├── [highlight]
        ╰── slider
    ]}

    [GtkScale] has a main CSS node with name scale and a subnode for its
    contents, with subnodes named trough and slider.

    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.

    If the scale has an origin (see [Gtk.Scale.set_has_origin]), there is a
    subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.

    If the scale is showing a fill level (see [Gtk.Range.set_show_fill_level]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.

    If marks are present, there is a marks subnode before or after the trough
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.

    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.

    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.

    If the scale is displaying the value (see [Gtk.Scale:draw-value]), there is
    subnode with name value. This node will get the .top or .bottom style
    classes similar to the marks node.

    {b Accessibility}

    [GtkScale] uses the [Gtk.AccessibleRole.slider] role. *)

external new_ : Gtk_enums.orientation -> Adjustment.t option -> t
  = "ml_gtk_scale_new"
(** Create a new Scale *)

external new_with_range : Gtk_enums.orientation -> float -> float -> float -> t
  = "ml_gtk_scale_new_with_range"
(** Create a new Scale *)

(* Methods *)

external set_value_pos : t -> Gtk_enums.positiontype -> unit
  = "ml_gtk_scale_set_value_pos"
(** Sets the position in which the current value is displayed. *)

external set_has_origin : t -> bool -> unit = "ml_gtk_scale_set_has_origin"
(** Sets whether the scale has an origin.

    If [Gtk.Scale:has-origin] is set to [TRUE] (the default), the scale will
    highlight the part of the trough between the origin (bottom or left side)
    and the current value. *)

external set_draw_value : t -> bool -> unit = "ml_gtk_scale_set_draw_value"
(** Specifies whether the current value is displayed as a string next to the
    slider. *)

external set_digits : t -> int -> unit = "ml_gtk_scale_set_digits"
(** Sets the number of decimal places that are displayed in the value.

    Also causes the value of the adjustment to be rounded to this number of
    digits, so the retrieved value matches the displayed one, if
    [Gtk.Scale:draw-value] is [TRUE] when the value changes. If you want to
    enforce rounding the value when [Gtk.Scale:draw-value] is [FALSE], you can
    set [Gtk.Range:round-digits] instead.

    Note that rounding to a small number of digits can interfere with the smooth
    autoscrolling that is built into [GtkScale]. As an alternative, you can use
    [Gtk.Scale.set_format_value_func] to format the displayed value yourself. *)

external get_value_pos : t -> Gtk_enums.positiontype
  = "ml_gtk_scale_get_value_pos"
(** Gets the position in which the current value is displayed. *)

external get_layout_offsets : t -> int * int = "ml_gtk_scale_get_layout_offsets"
(** Obtains the coordinates where the scale will draw the [PangoLayout]
    representing the text in the scale.

    Remember when using the [PangoLayout] function you need to convert to and
    from pixels using [PANGO_PIXELS()] or [PANGO_SCALE].

    If the [Gtk.Scale:draw-value] property is [FALSE], the return values are
    undefined. *)

external get_layout : t -> Ocgtk_pango.Pango.Wrappers.Layout.t option
  = "ml_gtk_scale_get_layout"
(** Gets the [PangoLayout] used to display the scale.

    The returned object is owned by the scale so does not need to be freed by
    the caller. *)

external get_has_origin : t -> bool = "ml_gtk_scale_get_has_origin"
(** Returns whether the scale has an origin. *)

external get_draw_value : t -> bool = "ml_gtk_scale_get_draw_value"
(** Returns whether the current value is displayed as a string next to the
    slider. *)

external get_digits : t -> int = "ml_gtk_scale_get_digits"
(** Gets the number of decimal places that are displayed in the value. *)

external clear_marks : t -> unit = "ml_gtk_scale_clear_marks"
(** Removes any marks that have been added. *)

external add_mark :
  t -> float -> Gtk_enums.positiontype -> string option -> unit
  = "ml_gtk_scale_add_mark"
(** Adds a mark at [value].

    A mark is indicated visually by drawing a tick mark next to the scale, and
    GTK makes it easy for the user to position the scale exactly at the marks
    value.

    If [markup] is not [NULL], text is shown next to the tick mark.

    To remove marks from a scale, use [Gtk.Scale.clear_marks]. *)

(* Properties *)
