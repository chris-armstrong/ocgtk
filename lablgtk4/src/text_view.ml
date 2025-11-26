(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextView *)

type t = [`text_view | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new TextView *)
external new_ : unit -> t = "ml_gtk_text_view_new"

(** Create a new TextView *)
external new_with_buffer : Gtk.widget -> t = "ml_gtk_text_view_new_with_buffer"

(* Properties *)

(** Determines whether @iter is at the start of a display line.

See [method@Gtk.TextView.forward_display_line] for an
explanation of display lines vs. paragraphs. *)
external starts_display_line : t -> Obj.t -> bool = "ml_gtk_text_view_starts_display_line"

(** Sets the line wrapping for the view. *)
external set_wrap_mode : t -> Gtk_enums.wrapmode -> unit = "ml_gtk_text_view_set_wrap_mode"

(** Sets the top margin for text in @text_view.

Note that this function is confusingly named.
In CSS terms, the value set here is padding. *)
external set_top_margin : t -> int -> unit = "ml_gtk_text_view_set_top_margin"

(** Sets the default right margin for text in the text view.

Tags in the buffer may override the default.

Note that this function is confusingly named.
In CSS terms, the value set here is padding. *)
external set_right_margin : t -> int -> unit = "ml_gtk_text_view_set_right_margin"

(** Sets the default number of pixels of blank space to leave between
display/wrapped lines within a paragraph.

May be overridden by tags in @text_view’s buffer. *)
external set_pixels_inside_wrap : t -> int -> unit = "ml_gtk_text_view_set_pixels_inside_wrap"

(** Sets the default number of pixels of blank space
to put below paragraphs in @text_view.

May be overridden by tags applied to @text_view’s buffer. *)
external set_pixels_below_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_below_lines"

(** Sets the default number of blank pixels above paragraphs in @text_view.

Tags in the buffer for @text_view may override the defaults. *)
external set_pixels_above_lines : t -> int -> unit = "ml_gtk_text_view_set_pixels_above_lines"

(** Changes the `GtkTextView` overwrite mode. *)
external set_overwrite : t -> bool -> unit = "ml_gtk_text_view_set_overwrite"

(** Sets whether the `GtkTextView` should display text in
monospace styling. *)
external set_monospace : t -> bool -> unit = "ml_gtk_text_view_set_monospace"

(** Sets the default left margin for text in @text_view.

Tags in the buffer may override the default.

Note that this function is confusingly named.
In CSS terms, the value set here is padding. *)
external set_left_margin : t -> int -> unit = "ml_gtk_text_view_set_left_margin"

(** Sets the default justification of text in @text_view.

Tags in the view’s buffer may override the default. *)
external set_justification : t -> Gtk_enums.justification -> unit = "ml_gtk_text_view_set_justification"

(** Sets the `input-purpose` of the `GtkTextView`.

The `input-purpose` can be used by on-screen keyboards
and other input methods to adjust their behaviour. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_text_view_set_input_purpose"

(** Sets the `input-hints` of the `GtkTextView`.

The `input-hints` allow input methods to fine-tune
their behaviour. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_text_view_set_input_hints"

(** Sets the default indentation for paragraphs in @text_view.

Tags in the buffer may override the default. *)
external set_indent : t -> int -> unit = "ml_gtk_text_view_set_indent"

(** Places @widget into the gutter specified by @win.

@win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
%GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM. *)
external set_gutter : t -> Gtk_enums.textwindowtype -> Gtk.widget option -> unit = "ml_gtk_text_view_set_gutter"

(** Sets the default editability of the `GtkTextView`.

You can override this default setting with tags in the buffer,
using the “editable” attribute of tags. *)
external set_editable : t -> bool -> unit = "ml_gtk_text_view_set_editable"

(** Toggles whether the insertion point should be displayed.

A buffer with no editable text probably shouldn’t have a visible
cursor, so you may want to turn the cursor off.

Note that this property may be overridden by the
[property@Gtk.Settings:gtk-keynav-use-caret] setting. *)
external set_cursor_visible : t -> bool -> unit = "ml_gtk_text_view_set_cursor_visible"

(** Sets @buffer as the buffer being displayed by @text_view.

The previous buffer displayed by the text view is unreferenced, and
a reference is added to @buffer. If you owned a reference to @buffer
before passing it to this function, you must remove that reference
yourself; `GtkTextView` will not “adopt” it. *)
external set_buffer : t -> Gtk.widget option -> unit = "ml_gtk_text_view_set_buffer"

(** Sets the bottom margin for text in @text_view.

Note that this function is confusingly named.
In CSS terms, the value set here is padding. *)
external set_bottom_margin : t -> int -> unit = "ml_gtk_text_view_set_bottom_margin"

(** Sets the behavior of the text widget when the <kbd>Tab</kbd> key is pressed.

If @accepts_tab is %TRUE, a tab character is inserted. If @accepts_tab
is %FALSE the keyboard focus is moved to the next widget in the focus
chain.

Focus can always be moved using <kbd>Ctrl</kbd>+<kbd>Tab</kbd>. *)
external set_accepts_tab : t -> bool -> unit = "ml_gtk_text_view_set_accepts_tab"

(** Scrolls @text_view so that @mark is on the screen in the position
indicated by @xalign and @yalign.

An alignment of 0.0 indicates left or top, 1.0 indicates right or
bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
the minimal distance to get the mark onscreen, possibly not scrolling
at all. The effective screen for purposes of this function is reduced
by a margin of size @within_margin. *)
external scroll_to_mark : t -> Gtk.widget -> float -> bool -> float -> float -> unit = "ml_gtk_text_view_scroll_to_mark_bytecode" "ml_gtk_text_view_scroll_to_mark_native"

(** Scrolls @text_view so that @iter is on the screen in the position
indicated by @xalign and @yalign.

An alignment of 0.0 indicates left or top, 1.0 indicates right or
bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
the minimal distance to get the mark onscreen, possibly not scrolling
at all. The effective screen for purposes of this function is reduced
by a margin of size @within_margin.

Note that this function uses the currently-computed height of the
lines in the text buffer. Line heights are computed in an idle
handler; so this function may not have the desired effect if it’s
called before the height computations. To avoid oddness, consider
using [method@Gtk.TextView.scroll_to_mark] which saves a point to be
scrolled to after line validation. *)
external scroll_to_iter : t -> Obj.t -> float -> bool -> float -> float -> bool = "ml_gtk_text_view_scroll_to_iter_bytecode" "ml_gtk_text_view_scroll_to_iter_native"

(** Scrolls @text_view the minimum distance such that @mark is contained
within the visible area of the widget. *)
external scroll_mark_onscreen : t -> Gtk.widget -> unit = "ml_gtk_text_view_scroll_mark_onscreen"

(** Reset the input method context of the text view if needed.

This can be necessary in the case where modifying the buffer
would confuse on-going input method behavior. *)
external reset_im_context : t -> unit = "ml_gtk_text_view_reset_im_context"

(** Ensures that the cursor is shown.

This also resets the time that it will stay blinking (or
visible, in case blinking is disabled).

This function should be called in response to user input
(e.g. from derived classes that override the textview's
event handlers). *)
external reset_cursor_blink : t -> unit = "ml_gtk_text_view_reset_cursor_blink"

(** Removes a child widget from @text_view. *)
external remove : t -> Gtk.widget -> unit = "ml_gtk_text_view_remove"

(** Moves the cursor to the currently visible region of the
buffer. *)
external place_cursor_onscreen : t -> bool = "ml_gtk_text_view_place_cursor_onscreen"

(** Move the iterator a given number of characters visually, treating
it as the strong cursor position.

If @count is positive, then the new strong cursor position will
be @count positions to the right of the old cursor position.
If @count is negative then the new strong cursor position will
be @count positions to the left of the old cursor position.

In the presence of bi-directional text, the correspondence
between logical and visual order will depend on the direction
of the current run, and there may be jumps when the cursor
is moved off of the end of a run. *)
external move_visually : t -> Obj.t -> int -> bool = "ml_gtk_text_view_move_visually"

(** Updates the position of a child.

See [method@Gtk.TextView.add_overlay]. *)
external move_overlay : t -> Gtk.widget -> int -> int -> unit = "ml_gtk_text_view_move_overlay"

(** Moves a mark within the buffer so that it's
located within the currently-visible text area. *)
external move_mark_onscreen : t -> Gtk.widget -> bool = "ml_gtk_text_view_move_mark_onscreen"

(** Allow the `GtkTextView` input method to internally handle key press
and release events.

If this function returns %TRUE, then no further processing should be
done for this key event. See [method@Gtk.IMContext.filter_keypress].

Note that you are expected to call this function from your handler
when overriding key event handling. This is needed in the case when
you need to insert your own key handling between the input method
and the default key event handling of the `GtkTextView`.

```c
static gboolean
gtk_foo_bar_key_press_event (GtkWidget *widget,
                             GdkEvent  *event)
{
  guint keyval;

  gdk_event_get_keyval ((GdkEvent"*)"event, &keyval);

  if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
    {
      if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
        return TRUE;
    }

  // Do some stuff

  return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
}
``` *)
external im_context_filter_keypress : t -> _ Gdk.event -> bool = "ml_gtk_text_view_im_context_filter_keypress"

(** Gets the line wrapping for the view. *)
external get_wrap_mode : t -> Gtk_enums.wrapmode = "ml_gtk_text_view_get_wrap_mode"

(** Gets the top margin for text in the @text_view. *)
external get_top_margin : t -> int = "ml_gtk_text_view_get_top_margin"

(** Gets the default right margin for text in @text_view.

Tags in the buffer may override the default. *)
external get_right_margin : t -> int = "ml_gtk_text_view_get_right_margin"

(** Gets the default number of pixels to put between wrapped lines
inside a paragraph. *)
external get_pixels_inside_wrap : t -> int = "ml_gtk_text_view_get_pixels_inside_wrap"

(** Gets the default number of pixels to put below paragraphs.

The line space is the sum of the value returned by this function and
the value returned by [method@Gtk.TextView.get_pixels_above_lines]. *)
external get_pixels_below_lines : t -> int = "ml_gtk_text_view_get_pixels_below_lines"

(** Gets the default number of pixels to put above paragraphs.

Adding this function with [method@Gtk.TextView.get_pixels_below_lines]
is equal to the line space between each paragraph. *)
external get_pixels_above_lines : t -> int = "ml_gtk_text_view_get_pixels_above_lines"

(** Returns whether the `GtkTextView` is in overwrite mode or not. *)
external get_overwrite : t -> bool = "ml_gtk_text_view_get_overwrite"

(** Gets whether the `GtkTextView` uses monospace styling. *)
external get_monospace : t -> bool = "ml_gtk_text_view_get_monospace"

(** Gets the default left margin size of paragraphs in the @text_view.

Tags in the buffer may override the default. *)
external get_left_margin : t -> int = "ml_gtk_text_view_get_left_margin"

(** Gets the default justification of paragraphs in @text_view.

Tags in the buffer may override the default. *)
external get_justification : t -> Gtk_enums.justification = "ml_gtk_text_view_get_justification"

(** Retrieves the iterator at buffer coordinates @x and @y.

Buffer coordinates are coordinates for the entire buffer, not just
the currently-displayed portion. If you have coordinates from an
event, you have to convert those to buffer coordinates with
[method@Gtk.TextView.window_to_buffer_coords]. *)
external get_iter_at_location : t -> int -> int -> bool * Obj.t = "ml_gtk_text_view_get_iter_at_location"

(** Gets the `input-purpose` of the `GtkTextView`. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_text_view_get_input_purpose"

(** Gets the `input-hints` of the `GtkTextView`. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_text_view_get_input_hints"

(** Gets the default indentation of paragraphs in @text_view.

Tags in the view’s buffer may override the default.
The indentation may be negative. *)
external get_indent : t -> int = "ml_gtk_text_view_get_indent"

(** Gets a `GtkWidget` that has previously been set as gutter.

See [method@Gtk.TextView.set_gutter].

@win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
%GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM. *)
external get_gutter : t -> Gtk_enums.textwindowtype -> Gtk.widget option = "ml_gtk_text_view_get_gutter"

(** Returns the default editability of the `GtkTextView`.

Tags in the buffer may override this setting for some ranges of text. *)
external get_editable : t -> bool = "ml_gtk_text_view_get_editable"

(** Find out whether the cursor should be displayed. *)
external get_cursor_visible : t -> bool = "ml_gtk_text_view_get_cursor_visible"

(** Returns the `GtkTextBuffer` being displayed by this text view.

The reference count on the buffer is not incremented; the caller
of this function won’t own a new reference. *)
external get_buffer : t -> Gtk.widget = "ml_gtk_text_view_get_buffer"

(** Gets the bottom margin for text in the @text_view. *)
external get_bottom_margin : t -> int = "ml_gtk_text_view_get_bottom_margin"

(** Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.

See [method@Gtk.TextView.set_accepts_tab]. *)
external get_accepts_tab : t -> bool = "ml_gtk_text_view_get_accepts_tab"

(** Moves the given @iter forward to the next display line end.

A display line is different from a paragraph. Paragraphs are
separated by newlines or other paragraph separator characters.
Display lines are created by line-wrapping a paragraph. If
wrapping is turned off, display lines and paragraphs will be the
same. Display lines are divided differently for each view, since
they depend on the view’s width; paragraphs are the same in all
views, since they depend on the contents of the `GtkTextBuffer`. *)
external forward_display_line_end : t -> Obj.t -> bool = "ml_gtk_text_view_forward_display_line_end"

(** Moves the given @iter forward by one display (wrapped) line.

A display line is different from a paragraph. Paragraphs are
separated by newlines or other paragraph separator characters.
Display lines are created by line-wrapping a paragraph. If
wrapping is turned off, display lines and paragraphs will be the
same. Display lines are divided differently for each view, since
they depend on the view’s width; paragraphs are the same in all
views, since they depend on the contents of the `GtkTextBuffer`. *)
external forward_display_line : t -> Obj.t -> bool = "ml_gtk_text_view_forward_display_line"

(** Moves the given @iter backward to the next display line start.

A display line is different from a paragraph. Paragraphs are
separated by newlines or other paragraph separator characters.
Display lines are created by line-wrapping a paragraph. If
wrapping is turned off, display lines and paragraphs will be the
same. Display lines are divided differently for each view, since
they depend on the view’s width; paragraphs are the same in all
views, since they depend on the contents of the `GtkTextBuffer`. *)
external backward_display_line_start : t -> Obj.t -> bool = "ml_gtk_text_view_backward_display_line_start"

(** Moves the given @iter backward by one display (wrapped) line.

A display line is different from a paragraph. Paragraphs are
separated by newlines or other paragraph separator characters.
Display lines are created by line-wrapping a paragraph. If
wrapping is turned off, display lines and paragraphs will be the
same. Display lines are divided differently for each view, since
they depend on the view’s width; paragraphs are the same in all
views, since they depend on the contents of the `GtkTextBuffer`. *)
external backward_display_line : t -> Obj.t -> bool = "ml_gtk_text_view_backward_display_line"

(** Adds @child at a fixed coordinate in the `GtkTextView`'s text window.

The @xpos and @ypos must be in buffer coordinates (see
[method@Gtk.TextView.get_iter_location] to convert to
buffer coordinates).

@child will scroll with the text view.

If instead you want a widget that will not move with the
`GtkTextView` contents see `GtkOverlay`. *)
external add_overlay : t -> Gtk.widget -> int -> int -> unit = "ml_gtk_text_view_add_overlay"

(** Adds a child widget in the text buffer, at the given @anchor. *)
external add_child_at_anchor : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_view_add_child_at_anchor"

