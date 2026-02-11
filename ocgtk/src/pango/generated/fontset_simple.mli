(* GENERATED CODE - DO NOT EDIT *)
(* FontsetSimple: FontsetSimple *)

type t = [`fontset_simple | `fontset | `object_] Gobject.obj

(** Create a new FontsetSimple *)
external new_ : Language.t -> t = "ml_pango_fontset_simple_new"

(* Methods *)
(** Returns the number of fonts in the fontset. *)
external size : t -> int = "ml_pango_fontset_simple_size"

(** Adds a font to the fontset.

The fontset takes ownership of @font. *)
external append : t -> Context_and__font_and__font_map_and__fontset.Font.t -> unit = "ml_pango_fontset_simple_append"

