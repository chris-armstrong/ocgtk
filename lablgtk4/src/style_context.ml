(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StyleContext *)

type t = Gtk.widget

(* Properties *)

(** Sets the state to be used for style matching. *)
external set_state : t -> Gtk_enums.stateflags -> unit = "ml_gtk_style_context_set_state"

(** Sets the scale to use when getting image assets for the style. *)
external set_scale : t -> int -> unit = "ml_gtk_style_context_set_scale"

(** Saves the @context state.

This allows temporary modifications done through
[method@Gtk.StyleContext.add_class],
[method@Gtk.StyleContext.remove_class],
[method@Gtk.StyleContext.set_state] to be quickly
reverted in one go through [method@Gtk.StyleContext.restore].

The matching call to [method@Gtk.StyleContext.restore]
must be done before GTK returns to the main loop. *)
external save : t -> unit = "ml_gtk_style_context_save"

(** Restores @context state to a previous stage.

See [method@Gtk.StyleContext.save]. *)
external restore : t -> unit = "ml_gtk_style_context_restore"

(** Removes @provider from the style providers list in @context. *)
external remove_provider : t -> Gtk.widget -> unit = "ml_gtk_style_context_remove_provider"

(** Removes @class_name from @context. *)
external remove_class : t -> string -> unit = "ml_gtk_style_context_remove_class"

(** Returns %TRUE if @context currently has defined the
given class name. *)
external has_class : t -> string -> bool = "ml_gtk_style_context_has_class"

(** Returns the state used for style matching.

This method should only be used to retrieve the `GtkStateFlags`
to pass to `GtkStyleContext` methods, like
[method@Gtk.StyleContext.get_padding].
If you need to retrieve the current state of a `GtkWidget`, use
[method@Gtk.Widget.get_state_flags]. *)
external get_state : t -> Gtk_enums.stateflags = "ml_gtk_style_context_get_state"

(** Returns the scale used for assets. *)
external get_scale : t -> int = "ml_gtk_style_context_get_scale"

(** Gets the padding for a given state as a `GtkBorder`. *)
external get_padding : t -> unit = "ml_gtk_style_context_get_padding"

(** Gets the margin for a given state as a `GtkBorder`. *)
external get_margin : t -> unit = "ml_gtk_style_context_get_margin"

(** Gets the border for a given state as a `GtkBorder`. *)
external get_border : t -> unit = "ml_gtk_style_context_get_border"

(** Adds a style provider to @context, to be used in style construction.

Note that a style provider added by this function only affects
the style of the widget to which @context belongs. If you want
to affect the style of all widgets, use
[func@Gtk.StyleContext.add_provider_for_display].

Note: If both priorities are the same, a `GtkStyleProvider`
added through this function takes precedence over another added
through [func@Gtk.StyleContext.add_provider_for_display]. *)
external add_provider : t -> Gtk.widget -> int -> unit = "ml_gtk_style_context_add_provider"

(** Adds a style class to @context, so later uses of the
style context will make use of this new class for styling.

In the CSS file format, a `GtkEntry` defining a “search”
class, would be matched by:

```css
entry.search { ... }
```

While any widget defining a “search” class would be
matched by:
```css
.search { ... }
``` *)
external add_class : t -> string -> unit = "ml_gtk_style_context_add_class"

