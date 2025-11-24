(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellView *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_cell_view_new"

external new_with_context : Gtk.Widget.t -> Gtk.Widget.t -> t = "ml_gtk_cell_view_new_with_context"

external new_with_markup : string -> t = "ml_gtk_cell_view_new_with_markup"

external new_with_text : string -> t = "ml_gtk_cell_view_new_with_text"

external new_with_texture : unit -> t = "ml_gtk_cell_view_new_with_texture"

(* Properties *)

external get_draw_sensitive : t -> bool = "ml_gtk_cell_view_get_draw_sensitive"

external set_draw_sensitive : t -> bool -> unit = "ml_gtk_cell_view_set_draw_sensitive"

external get_fit_model : t -> bool = "ml_gtk_cell_view_get_fit_model"

external set_fit_model : t -> bool -> unit = "ml_gtk_cell_view_set_fit_model"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_cell_view_set_model"

external set_displayed_row : t -> Gtk.Widget.t option -> unit = "ml_gtk_cell_view_set_displayed_row"

external get_model : t -> Gtk.Widget.t = "ml_gtk_cell_view_get_model"

external get_displayed_row : t -> Gtk.Widget.t = "ml_gtk_cell_view_get_displayed_row"

