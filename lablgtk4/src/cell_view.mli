(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellView *)

type t = Gtk.Widget.t

(** Create a new CellView *)
external new_ : unit -> t = "ml_gtk_cell_view_new"

(** Create a new CellView *)
external new_with_context : Gtk.Widget.t -> Gtk.Widget.t -> t = "ml_gtk_cell_view_new_with_context"

(** Create a new CellView *)
external new_with_markup : string -> t = "ml_gtk_cell_view_new_with_markup"

(** Create a new CellView *)
external new_with_text : string -> t = "ml_gtk_cell_view_new_with_text"

(** Create a new CellView *)
external new_with_texture : unit -> t = "ml_gtk_cell_view_new_with_texture"

(* Properties *)

(** Get property: draw-sensitive *)
external get_draw_sensitive : t -> bool = "ml_gtk_cell_view_get_draw_sensitive"

(** Set property: draw-sensitive *)
external set_draw_sensitive : t -> bool -> unit = "ml_gtk_cell_view_set_draw_sensitive"

(** Get property: fit-model *)
external get_fit_model : t -> bool = "ml_gtk_cell_view_get_fit_model"

(** Set property: fit-model *)
external set_fit_model : t -> bool -> unit = "ml_gtk_cell_view_set_fit_model"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_cell_view_set_model"

external set_displayed_row : t -> Gtk.Widget.t option -> unit = "ml_gtk_cell_view_set_displayed_row"

external get_model : t -> Gtk.Widget.t = "ml_gtk_cell_view_get_model"

external get_displayed_row : t -> Gtk.Widget.t = "ml_gtk_cell_view_get_displayed_row"

