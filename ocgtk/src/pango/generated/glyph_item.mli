(* GENERATED CODE - DO NOT EDIT *)
(* GlyphItem: GlyphItem *)

(** A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs
resulting from shaping the items text.

As an example of the usage of `PangoGlyphItem`, the results
of shaping text with `PangoLayout` is a list of `PangoLayoutLine`,
each of which contains a list of `PangoGlyphItem`. *)
type t = [`glyph_item] Gobject.obj

(* Methods *)
(** Modifies @orig to cover only the text after @split_index, and
returns a new item that covers the text before @split_index that
used to be in @orig.

You can think of @split_index as the length of the returned item.
@split_index may not be 0, and it may not be greater than or equal
to the length of @orig (that is, there must be at least one byte
assigned to each item, you can't create a zero-length item).

This function is similar in function to pango_item_split() (and uses
it internally.) *)
external split : t -> string -> int -> t option = "ml_pango_glyph_item_split"

(** Adds spacing between the graphemes of @glyph_item to
give the effect of typographic letter spacing. *)
external letter_space : t -> string -> Log_attr.t array -> int -> unit = "ml_pango_glyph_item_letter_space"

(** Given a `PangoGlyphItem` and the corresponding text, determine the
width corresponding to each character.

When multiple characters compose a single cluster, the width of the
entire cluster is divided equally among the characters.

See also [method@Pango.GlyphString.get_logical_widths]. *)
external get_logical_widths : t -> string -> int array -> unit = "ml_pango_glyph_item_get_logical_widths"

(** Frees a `PangoGlyphItem` and resources to which it points. *)
external free : t -> unit = "ml_pango_glyph_item_free"

(** Make a deep copy of an existing `PangoGlyphItem` structure. *)
external copy : t -> t option = "ml_pango_glyph_item_copy"

