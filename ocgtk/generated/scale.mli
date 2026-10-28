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

    [GtkScale] uses the [Gtk.AccessibleRole.slider] role.

    Its methods, signals and properties are on {!class-type-scale_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Scale}. *)

(** {b The methods, signals and properties of a [Scale].}

    Allows to select a numeric value with a slider control.

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
class type scale_t = object
  inherit Range.range_t

  method add_mark : float -> Enums.positiontype -> string option -> unit
  (** Adds a mark at [value].

      A mark is indicated visually by drawing a tick mark next to the scale, and
      GTK makes it easy for the user to position the scale exactly at the marks
      value.

      If [markup] is not [NULL], text is shown next to the tick mark.

      To remove marks from a scale, use [Gtk.Scale.clear_marks]. *)

  method clear_marks : unit -> unit
  (** Removes any marks that have been added. *)

  method get_digits : unit -> int
  (** Gets the number of decimal places that are displayed in the value. *)

  method get_draw_value : unit -> bool
  (** Returns whether the current value is displayed as a string next to the
      slider. *)

  method get_has_origin : unit -> bool
  (** Returns whether the scale has an origin. *)

  method get_layout : unit -> Ocpango.Layout.layout_t option
  (** Gets the [PangoLayout] used to display the scale.

      The returned object is owned by the scale so does not need to be freed by
      the caller. *)

  method get_value_pos : unit -> Enums.positiontype
  (** Gets the position in which the current value is displayed. *)

  method set_digits : int -> unit
  (** Sets the number of decimal places that are displayed in the value.

      Also causes the value of the adjustment to be rounded to this number of
      digits, so the retrieved value matches the displayed one, if
      [Gtk.Scale:draw-value] is [TRUE] when the value changes. If you want to
      enforce rounding the value when [Gtk.Scale:draw-value] is [FALSE], you can
      set [Gtk.Range:round-digits] instead.

      Note that rounding to a small number of digits can interfere with the
      smooth autoscrolling that is built into [GtkScale]. As an alternative, you
      can use [Gtk.Scale.set_format_value_func] to format the displayed value
      yourself. *)

  method set_draw_value : bool -> unit
  (** Specifies whether the current value is displayed as a string next to the
      slider. *)

  method set_has_origin : bool -> unit
  (** Sets whether the scale has an origin.

      If [Gtk.Scale:has-origin] is set to [TRUE] (the default), the scale will
      highlight the part of the trough between the origin (bottom or left side)
      and the current value. *)

  method set_value_pos : Enums.positiontype -> unit
  (** Sets the position in which the current value is displayed. *)

  method as_scale : Raw.Scale.t
end

class scale : Raw.Scale.t -> scale_t
(** Wraps a raw handle of {!Ocgtk.Raw.Scale.t}. *)

(** {2:constructors Constructors} *)

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scale_t
(** Creates a new [GtkScale]. *)

val new_with_range : Enums.orientation -> float -> float -> float -> scale_t
(** Creates a new scale widget with a range from [min] to [max].

    The returns scale will have the given orientation and will let the user
    input a number between [min] and [max] (including [min] and [max]) with the
    increment [step]. [step] must be nonzero; it’s the distance the slider moves
    when using the arrow keys to adjust the scale value.

    Note that the way in which the precision is derived works best if [step] is
    a power of ten. If the resulting precision is not suitable for your needs,
    use [Gtk.Scale.set_digits] to correct it. *)
