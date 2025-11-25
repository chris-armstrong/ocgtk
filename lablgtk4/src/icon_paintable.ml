(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconPaintable *)

type t = Gtk.widget

(** Create a new IconPaintable *)
external new_for_file : unit -> int -> int -> t = "ml_gtk_icon_paintable_new_for_file"

(* Properties *)

(** Checks if the icon is symbolic or not.

This currently uses only the file name and not the file contents
for determining this. This behaviour may change in the future.

Note that to render a symbolic `GtkIconPaintable` properly (with
recoloring), you have to set its icon name on a `GtkImage`. *)
external is_symbolic : t -> bool = "ml_gtk_icon_paintable_is_symbolic"

(** Get the icon name being used for this icon.

When an icon looked up in the icon theme was not available, the
icon theme may use fallback icons - either those specified to
gtk_icon_theme_lookup_icon() or the always-available
"image-missing". The icon chosen is returned by this function.

If the icon was created without an icon theme, this function
returns %NULL. *)
external get_icon_name : t -> string option = "ml_gtk_icon_paintable_get_icon_name"

