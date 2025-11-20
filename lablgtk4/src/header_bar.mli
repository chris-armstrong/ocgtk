(* GENERATED CODE - DO NOT EDIT *)
(* Widget: HeaderBar *)

type t = Gtk.Widget.t

(** Create a new HeaderBar *)
external new_ : unit -> t = "ml_gtk_header_bar_new"

(* Properties *)

(** Get property: decoration-layout *)
external get_decoration_layout : t -> string = "ml_gtk_header_bar_get_decoration_layout"

(** Set property: decoration-layout *)
external set_decoration_layout : t -> string -> unit = "ml_gtk_header_bar_set_decoration_layout"

(** Get property: show-title-buttons *)
external get_show_title_buttons : t -> bool = "ml_gtk_header_bar_get_show_title_buttons"

(** Set property: show-title-buttons *)
external set_show_title_buttons : t -> bool -> unit = "ml_gtk_header_bar_set_show_title_buttons"

external set_title_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_header_bar_set_title_widget"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_header_bar_remove"

external pack_start : t -> Gtk.Widget.t -> unit = "ml_gtk_header_bar_pack_start"

external pack_end : t -> Gtk.Widget.t -> unit = "ml_gtk_header_bar_pack_end"

external get_title_widget : t -> Gtk.Widget.t = "ml_gtk_header_bar_get_title_widget"

