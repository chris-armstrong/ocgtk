(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Range *)

type t = [`range | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(* Properties *)

(** Get property: fill-level *)
external get_fill_level : t -> float = "ml_gtk_range_get_fill_level"

(** Set property: fill-level *)
external set_fill_level : t -> float -> unit = "ml_gtk_range_set_fill_level"

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_range_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_range_set_inverted"

(** Get property: restrict-to-fill-level *)
external get_restrict_to_fill_level : t -> bool = "ml_gtk_range_get_restrict_to_fill_level"

(** Set property: restrict-to-fill-level *)
external set_restrict_to_fill_level : t -> bool -> unit = "ml_gtk_range_set_restrict_to_fill_level"

(** Get property: round-digits *)
external get_round_digits : t -> int = "ml_gtk_range_get_round_digits"

(** Set property: round-digits *)
external set_round_digits : t -> int -> unit = "ml_gtk_range_set_round_digits"

(** Get property: show-fill-level *)
external get_show_fill_level : t -> bool = "ml_gtk_range_get_show_fill_level"

(** Set property: show-fill-level *)
external set_show_fill_level : t -> bool -> unit = "ml_gtk_range_set_show_fill_level"

(** Sets the current value of the range.

If the value is outside the minimum or maximum range values,
it will be clamped to fit inside them. The range emits the
[signal@Gtk.Range::value-changed] signal if the value changes. *)
external set_value : t -> float -> unit = "ml_gtk_range_set_value"

(** Sets whether the range’s slider has a fixed size, or a size that
depends on its adjustment’s page size.

This function is useful mainly for `GtkRange` subclasses. *)
external set_slider_size_fixed : t -> bool -> unit = "ml_gtk_range_set_slider_size_fixed"

(** Sets the allowable values in the `GtkRange`.

The range value is clamped to be between @min and @max.
(If the range has a non-zero page size, it is clamped
between @min and @max - page-size.) *)
external set_range : t -> float -> float -> unit = "ml_gtk_range_set_range"

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

(** Gets whether the `GtkRange` respects text direction.

See [method@Gtk.Range.set_flippable]. *)
external get_flippable : t -> bool = "ml_gtk_range_get_flippable"

(** Get the adjustment which is the “model” object for `GtkRange`. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_range_get_adjustment"

