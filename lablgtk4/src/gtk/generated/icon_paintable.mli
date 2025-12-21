(* GENERATED CODE - DO NOT EDIT *)
(* IconPaintable: IconPaintable *)

type t = [`icon_paintable | `object_] Gobject.obj

(** Create a new IconPaintable *)
external new_for_file : unit -> int -> int -> t = "ml_gtk_icon_paintable_new_for_file"

(* Methods *)
(** Checks if the icon is symbolic or not.

This currently uses only the file name and not the file contents
for determining this. This behaviour may change in the future.

Note that to render a symbolic `GtkIconPaintable` properly (with
recoloring), you have to set its icon name on a `GtkImage`. *)
external is_symbolic : t -> bool = "ml_gtk_icon_paintable_is_symbolic"

(* Properties *)

(** Get property: is-symbolic *)
external get_is_symbolic : t -> bool = "ml_gtk_icon_paintable_get_is_symbolic"

