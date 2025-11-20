(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintContext *)

type t = Gtk.Widget.t

external set_cairo_context : t -> unit -> float -> float -> unit = "ml_gtk_print_context_set_cairo_context"

external get_width : t -> float = "ml_gtk_print_context_get_width"

external get_page_setup : t -> Gtk.Widget.t = "ml_gtk_print_context_get_page_setup"

external get_height : t -> float = "ml_gtk_print_context_get_height"

external get_hard_margins : t -> float -> float -> float -> float -> bool = "ml_gtk_print_context_get_hard_margins"

external get_dpi_y : t -> float = "ml_gtk_print_context_get_dpi_y"

external get_dpi_x : t -> float = "ml_gtk_print_context_get_dpi_x"

