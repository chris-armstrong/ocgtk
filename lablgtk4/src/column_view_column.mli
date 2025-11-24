(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnViewColumn *)

type t = Gtk.Widget.t

(** Create a new ColumnViewColumn *)
external new_ : string option -> Gtk.Widget.t option -> t = "ml_gtk_column_view_column_new"

(* Properties *)

(** Get property: expand *)
external get_expand : t -> bool = "ml_gtk_column_view_column_get_expand"

(** Set property: expand *)
external set_expand : t -> bool -> unit = "ml_gtk_column_view_column_set_expand"

(** Get property: fixed-width *)
external get_fixed_width : t -> int = "ml_gtk_column_view_column_get_fixed_width"

(** Set property: fixed-width *)
external set_fixed_width : t -> int -> unit = "ml_gtk_column_view_column_set_fixed_width"

(** Get property: id *)
external get_id : t -> string = "ml_gtk_column_view_column_get_id"

(** Set property: id *)
external set_id : t -> string -> unit = "ml_gtk_column_view_column_set_id"

(** Get property: resizable *)
external get_resizable : t -> bool = "ml_gtk_column_view_column_get_resizable"

(** Set property: resizable *)
external set_resizable : t -> bool -> unit = "ml_gtk_column_view_column_set_resizable"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_column_view_column_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_column_view_column_set_title"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_column_view_column_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_column_view_column_set_visible"

external set_sorter : t -> Gtk.Widget.t option -> unit = "ml_gtk_column_view_column_set_sorter"

external set_factory : t -> Gtk.Widget.t option -> unit = "ml_gtk_column_view_column_set_factory"

external get_sorter : t -> Gtk.Widget.t = "ml_gtk_column_view_column_get_sorter"

external get_factory : t -> Gtk.Widget.t = "ml_gtk_column_view_column_get_factory"

external get_column_view : t -> Gtk.Widget.t = "ml_gtk_column_view_column_get_column_view"

