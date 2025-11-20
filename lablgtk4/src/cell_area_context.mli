(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellAreaContext *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: minimum-height *)
external get_minimum_height : t -> int = "ml_gtk_cell_area_context_get_minimum_height"

(** Get property: minimum-width *)
external get_minimum_width : t -> int = "ml_gtk_cell_area_context_get_minimum_width"

(** Get property: natural-height *)
external get_natural_height : t -> int = "ml_gtk_cell_area_context_get_natural_height"

(** Get property: natural-width *)
external get_natural_width : t -> int = "ml_gtk_cell_area_context_get_natural_width"

external reset : t -> unit = "ml_gtk_cell_area_context_reset"

external push_preferred_width : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_width"

external push_preferred_height : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_height"

external get_preferred_width_for_height : t -> int -> int -> int -> unit = "ml_gtk_cell_area_context_get_preferred_width_for_height"

external get_preferred_width : t -> int -> int -> unit = "ml_gtk_cell_area_context_get_preferred_width"

external get_preferred_height_for_width : t -> int -> int -> int -> unit = "ml_gtk_cell_area_context_get_preferred_height_for_width"

external get_preferred_height : t -> int -> int -> unit = "ml_gtk_cell_area_context_get_preferred_height"

external get_area : t -> Gtk.Widget.t = "ml_gtk_cell_area_context_get_area"

external get_allocation : t -> int -> int -> unit = "ml_gtk_cell_area_context_get_allocation"

external allocate : t -> int -> int -> unit = "ml_gtk_cell_area_context_allocate"

