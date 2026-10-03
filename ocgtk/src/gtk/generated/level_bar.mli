(* GENERATED CODE - DO NOT EDIT *)
(* LevelBar: LevelBar *)

(** Shows a level indicator.

    Typical use cases are displaying the strength of a password, or showing the
    charge level of a battery.

    An example GtkLevelBar

    Use [Gtk.LevelBar.set_value] to set the current value, and
    [Gtk.LevelBar.add_offset_value] to set the value offsets at which the bar
    will be considered in a different state. GTK will add a few offsets by
    default on the level bar: [GTK_LEVEL_BAR_OFFSET_LOW],
    [GTK_LEVEL_BAR_OFFSET_HIGH] and [GTK_LEVEL_BAR_OFFSET_FULL], with values
    0.25, 0.75 and 1.0 respectively.

    Note that it is your responsibility to update preexisting offsets when
    changing the minimum or maximum value. GTK will simply clamp them to the new
    range.

    {b Adding a custom offset on the bar}

    {[
    static GtkWidget *
    create_level_bar (void)
    {
      GtkWidget *widget;
      GtkLevelBar *bar;

      widget = gtk_level_bar_new ();
      bar = GTK_LEVEL_BAR (widget);

      // This changes the value of the default low offset

      gtk_level_bar_add_offset_value (bar,
                                      GTK_LEVEL_BAR_OFFSET_LOW,
                                      0.10);

      // This adds a new offset to the bar; the application will
      // be able to change its color CSS like this:
      //
      // levelbar block.my-offset {
      //   background-color: magenta;
      //   border-style: solid;
      //   border-color: black;
      //   border-width: 1px;
      // }

      gtk_level_bar_add_offset_value (bar, “my-offset”, 0.60);

      return widget;
    }
    ]}

    The default interval of values is between zero and one, but it’s possible to
    modify the interval using [Gtk.LevelBar.set_min_value] and
    [Gtk.LevelBar.set_max_value]. The value will be always drawn in proportion
    to the admissible interval, i.e. a value of 15 with a specified interval
    between 10 and 20 is equivalent to a value of 0.5 with an interval between 0
    and 1. When [GTK_LEVEL_BAR_MODE_DISCRETE] is used, the bar level is rendered
    as a finite number of separated blocks instead of a single one. The number
    of blocks that will be rendered is equal to the number of units specified by
    the admissible interval.

    For instance, to build a bar rendered with five blocks, it’s sufficient to
    set the minimum value to 0 and the maximum value to 5 after changing the
    indicator mode to discrete.

    {b GtkLevelBar as GtkBuildable}

    The [GtkLevelBar] implementation of the [GtkBuildable] interface supports a
    custom [<offsets>] element, which can contain any number of [<offset>]
    elements, each of which must have “name” and “value” attributes.

    {b CSS nodes}

    {[
    levelbar[.discrete]
    ╰── trough
        ├── block.filled.level-name
        ┊
        ├── block.empty
        ┊
    ]}

    [GtkLevelBar] has a main CSS node with name levelbar and one of the style
    classes .discrete or .continuous and a subnode with name trough. Below the
    trough node are a number of nodes with name block and style class .filled or
    .empty. In continuous mode, there is exactly one node of each, in discrete
    mode, the number of filled and unfilled nodes corresponds to blocks that are
    drawn. The block.filled nodes also get a style class .level-name
    corresponding to the level for the current value.

    In horizontal orientation, the nodes are always arranged from left to right,
    regardless of text direction.

    {b Accessibility}

    [GtkLevelBar] uses the [Gtk.AccessibleRole.meter] role. *)

type t = [ `level_bar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_level_bar_new"
(** Create a new LevelBar *)

external new_for_interval : float -> float -> t
  = "ml_gtk_level_bar_new_for_interval"
(** Create a new LevelBar *)

(* Methods *)

external set_value : t -> float -> unit = "ml_gtk_level_bar_set_value"
(** Sets the value of the [GtkLevelBar]. *)

external set_mode : t -> Gtk_enums.levelbarmode -> unit
  = "ml_gtk_level_bar_set_mode"
(** Sets the [mode] of the [GtkLevelBar]. *)

external set_min_value : t -> float -> unit = "ml_gtk_level_bar_set_min_value"
(** Sets the [min-value] of the [GtkLevelBar].

    You probably want to update preexisting level offsets after calling this
    function. *)

external set_max_value : t -> float -> unit = "ml_gtk_level_bar_set_max_value"
(** Sets the [max-value] of the [GtkLevelBar].

    You probably want to update preexisting level offsets after calling this
    function. *)

external set_inverted : t -> bool -> unit = "ml_gtk_level_bar_set_inverted"
(** Sets whether the [GtkLevelBar] is inverted. *)

external remove_offset_value : t -> string option -> unit
  = "ml_gtk_level_bar_remove_offset_value"
(** Removes an offset marker from a [GtkLevelBar].

    The marker must have been previously added with
    [Gtk.LevelBar.add_offset_value]. *)

external get_value : t -> float = "ml_gtk_level_bar_get_value"
(** Returns the [value] of the [GtkLevelBar]. *)

external get_offset_value : t -> string option -> bool * float
  = "ml_gtk_level_bar_get_offset_value"
(** Fetches the value specified for the offset marker [name] in [self]. *)

external get_mode : t -> Gtk_enums.levelbarmode = "ml_gtk_level_bar_get_mode"
(** Returns the [mode] of the [GtkLevelBar]. *)

external get_min_value : t -> float = "ml_gtk_level_bar_get_min_value"
(** Returns the [min-value] of the [GtkLevelBar]. *)

external get_max_value : t -> float = "ml_gtk_level_bar_get_max_value"
(** Returns the [max-value] of the [GtkLevelBar]. *)

external get_inverted : t -> bool = "ml_gtk_level_bar_get_inverted"
(** Returns whether the levelbar is inverted. *)

external add_offset_value : t -> string -> float -> unit
  = "ml_gtk_level_bar_add_offset_value"
(** Adds a new offset marker on [self] at the position specified by [value].

    When the bar value is in the interval topped by [value] (or between [value]
    and [Gtk.LevelBar:max-value] in case the offset is the last one on the bar)
    a style class named [level-][name] will be applied when rendering the level
    bar fill.

    If another offset marker named [name] exists, its value will be replaced by
    [value]. *)

(* Properties *)

val on_offset_changed :
  ?after:bool ->
  t ->
  callback:(name:string -> unit) ->
  Gobject.Signal.handler_id
