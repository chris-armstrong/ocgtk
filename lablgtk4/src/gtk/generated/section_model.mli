(* GENERATED CODE - DO NOT EDIT *)
(* SectionModel: SectionModel *)

type t = [`section_model] Gobject.obj

(* Methods *)
external sections_changed : t -> int -> int -> unit = "ml_gtk_section_model_sections_changed"

(** Query the section that covers the given position. The number of
items in the section can be computed by `out_end - out_start`.

If the position is larger than the number of items, a single
range from n_items to G_MAXUINT will be returned. *)
external get_section : t -> int -> int * int = "ml_gtk_section_model_get_section"

