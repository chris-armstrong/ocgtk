(* GENERATED CODE - DO NOT EDIT *)
(* StyleContext: StyleContext *)

type t = [`style_context | `object_] Gobject.obj

(* Methods *)
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

(** Removes @class_name from @context. *)
external remove_class : t -> string -> unit = "ml_gtk_style_context_remove_class"

(** Returns %TRUE if @context currently has defined the
given class name. *)
external has_class : t -> string -> bool = "ml_gtk_style_context_has_class"

(** Returns the scale used for assets. *)
external get_scale : t -> int = "ml_gtk_style_context_get_scale"

(** Gets the padding for a given state as a `GtkBorder`. *)
external get_padding : t -> Border.t = "ml_gtk_style_context_get_padding"

(** Gets the margin for a given state as a `GtkBorder`. *)
external get_margin : t -> Border.t = "ml_gtk_style_context_get_margin"

(** Gets the border for a given state as a `GtkBorder`. *)
external get_border : t -> Border.t = "ml_gtk_style_context_get_border"

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

(* Properties *)

