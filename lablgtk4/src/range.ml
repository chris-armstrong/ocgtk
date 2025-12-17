(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Range *)

type t = [`range | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(* Properties *)

(** Sets the current value of the range.

If the value is outside the minimum or maximum range values,
it will be clamped to fit inside them. The range emits the
[signal@Gtk.Range::value-changed] signal if the value changes. *)
external set_value : t -> float -> unit = "ml_gtk_range_set_value"

(** Sets whether the range’s slider has a fixed size, or a size that
depends on its adjustment’s page size.

This function is useful mainly for `GtkRange` subclasses. *)
external set_slider_size_fixed : t -> bool -> unit = "ml_gtk_range_set_slider_size_fixed"

(** Sets whether a graphical fill level is show on the trough.

See [method@Gtk.Range.set_fill_level] for a general description
of the fill level concept. *)
external set_show_fill_level : t -> bool -> unit = "ml_gtk_range_set_show_fill_level"

(** Sets the number of digits to round the value to when
it changes.

See [signal@Gtk.Range::change-value]. *)
external set_round_digits : t -> int -> unit = "ml_gtk_range_set_round_digits"

(** Sets whether the slider is restricted to the fill level.

See [method@Gtk.Range.set_fill_level] for a general description
of the fill level concept. *)
external set_restrict_to_fill_level : t -> bool -> unit = "ml_gtk_range_set_restrict_to_fill_level"

(** Sets the allowable values in the `GtkRange`.

The range value is clamped to be between @min and @max.
(If the range has a non-zero page size, it is clamped
between @min and @max - page-size.) *)
external set_range : t -> float -> float -> unit = "ml_gtk_range_set_range"

(** Sets whether to invert the range.

Ranges normally move from lower to higher values as the
slider moves from top to bottom or left to right. Inverted
ranges have higher values at the top or on the right rather
than on the bottom or left. *)
external set_inverted : t -> bool -> unit = "ml_gtk_range_set_inverted"

(** Sets the step and page sizes for the range.

The step size is used when the user clicks the `GtkScrollbar`
arrows or moves a `GtkScale` via arrow keys. The page size
is used for example when moving via Page Up or Page Down keys. *)
external set_increments : t -> float -> float -> unit = "ml_gtk_range_set_increments"

(** Sets whether the `GtkRange` respects text direction.

If a range is flippable, it will switch its direction
if it is horizontal and its direction is %GTK_TEXT_DIR_RTL.

See [method@Gtk.Widget.get_direction]. *)
external set_flippable : t -> bool -> unit = "ml_gtk_range_set_flippable"

(** Set the new position of the fill level indicator.

The “fill level” is probably best described by its most prominent
use case, which is an indicator for the amount of pre-buffering in
a streaming media player. In that use case, the value of the range
would indicate the current play position, and the fill level would
be the position up to which the file/stream has been downloaded.

This amount of prebuffering can be displayed on the range’s trough
and is themeable separately from the trough. To enable fill level
display, use [method@Gtk.Range.set_show_fill_level]. The range defaults
to not showing the fill level.

Additionally, it’s possible to restrict the range’s slider position
to values which are smaller than the fill level. This is controlled
by [method@Gtk.Range.set_restrict_to_fill_level] and is by default
enabled. *)
external set_fill_level : t -> float -> unit = "ml_gtk_range_set_fill_level"

(** Sets the adjustment to be used as the “model” object for the `GtkRange`

The adjustment indicates the current range value, the minimum and
maximum range values, the step/page increments used for keybindings
and scrolling, and the page size.

The page size is normally 0 for `GtkScale` and nonzero for `GtkScrollbar`,
and indicates the size of the visible area of the widget being scrolled.
The page size affects the size of the scrollbar slider. *)
external set_adjustment : t -> Adjustment.t -> unit = "ml_gtk_range_set_adjustment"

(** Gets the current value of the range. *)
external get_value : t -> float = "ml_gtk_range_get_value"

(** This function is useful mainly for `GtkRange` subclasses.

See [method@Gtk.Range.set_slider_size_fixed]. *)
external get_slider_size_fixed : t -> bool = "ml_gtk_range_get_slider_size_fixed"

(** Gets whether the range displays the fill level graphically. *)
external get_show_fill_level : t -> bool = "ml_gtk_range_get_show_fill_level"

(** Gets the number of digits to round the value to when
it changes.

See [signal@Gtk.Range::change-value]. *)
external get_round_digits : t -> int = "ml_gtk_range_get_round_digits"

(** Gets whether the range is restricted to the fill level. *)
external get_restrict_to_fill_level : t -> bool = "ml_gtk_range_get_restrict_to_fill_level"

(** Gets whether the range is inverted.

See [method@Gtk.Range.set_inverted]. *)
external get_inverted : t -> bool = "ml_gtk_range_get_inverted"

(** Gets whether the `GtkRange` respects text direction.

See [method@Gtk.Range.set_flippable]. *)
external get_flippable : t -> bool = "ml_gtk_range_get_flippable"

(** Gets the current position of the fill level indicator. *)
external get_fill_level : t -> float = "ml_gtk_range_get_fill_level"

(** Get the adjustment which is the “model” object for `GtkRange`. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_range_get_adjustment"

