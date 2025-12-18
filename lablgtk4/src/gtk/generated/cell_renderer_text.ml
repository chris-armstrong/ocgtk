(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererText *)

type t = [`cell_renderer_text | `cell_renderer | `initially_unowned] Gobject.obj

let as_cell_renderer (obj : t) : Cell_renderer.t = Obj.magic obj

(** Create a new CellRendererText *)
external new_ : unit -> t = "ml_gtk_cell_renderer_text_new"

(* Properties *)

(** Get property: align-set *)
external get_align_set : t -> bool = "ml_gtk_cell_renderer_text_get_align_set"

(** Set property: align-set *)
external set_align_set : t -> bool -> unit = "ml_gtk_cell_renderer_text_set_align_set"

(** Sets the height of a renderer to explicitly be determined by the “font” and
“y_pad” property set on it.  Further changes in these properties do not
affect the height, so they must be accompanied by a subsequent call to this
function.  Using this function is inflexible, and should really only be used
if calculating the size of a cell is too slow (ie, a massive number of cells
displayed).  If @number_of_rows is -1, then the fixed height is unset, and
the height is determined by the properties again. *)
external set_fixed_height_from_font : t -> int -> unit = "ml_gtk_cell_renderer_text_set_fixed_height_from_font"

