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

    Its methods, signals and properties are on {!class-type-scale_t}. The
    functions it is built on are in {!Ocgtk.Raw.Scale}. *)

(** The methods, signals and properties of a [GtkScale]. *)
class type scale_t = object
  inherit Range.range_t
  method add_mark : float -> Enums.positiontype -> string option -> unit
  method clear_marks : unit -> unit
  method get_digits : unit -> int
  method get_draw_value : unit -> bool
  method get_has_origin : unit -> bool
  method get_layout : unit -> Ocpango.Layout.layout_t option
  method get_value_pos : unit -> Enums.positiontype
  method set_digits : int -> unit
  method set_draw_value : bool -> unit
  method set_has_origin : bool -> unit
  method set_value_pos : Enums.positiontype -> unit
  method as_scale : Raw.Scale.t
end

class scale : Raw.Scale.t -> scale_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Scale.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkScale], give one already wrapped. *)

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scale_t
val new_with_range : Enums.orientation -> float -> float -> float -> scale_t
