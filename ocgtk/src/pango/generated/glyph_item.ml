(* GENERATED CODE - DO NOT EDIT *)
(* GlyphItem: GlyphItem *)

type t = [ `glyph_item ] Gobject.obj
(** A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs resulting from
    shaping the items text.

    As an example of the usage of `PangoGlyphItem`, the results of shaping text
    with `PangoLayout` is a list of `PangoLayoutLine`, each of which contains a
    list of `PangoGlyphItem`. *)

(* Methods *)

external split : t -> string -> int -> t option = "ml_pango_glyph_item_split"
(** Modifies @orig to cover only the text after @split_index, and
returns a new item that covers the text before @split_index that
used to be in @orig.

You can think of @split_index as the length of the returned item.
@split_index may not be 0, and it may not be greater than or equal
to the length of @orig (that is, there must be at least one byte
assigned to each item, you can't create a zero-length item).

This function is similar in function to pango_item_split() (and uses
it internally.) *)

external apply_attrs : t -> string -> Attr_list.t -> t list
  = "ml_pango_glyph_item_apply_attrs"
(** Splits a shaped item (`PangoGlyphItem`) into multiple items based
on an attribute list.

The idea is that if you have attributes that don't affect shaping,
such as color or underline, to avoid affecting shaping, you filter
them out ([method@Pango.AttrList.filter]), apply the shaping process
and then reapply them to the result using this function.

All attributes that start or end inside a cluster are applied
to that cluster; for instance, if half of a cluster is underlined
and the other-half strikethrough, then the cluster will end
up with both underline and strikethrough attributes. In these
cases, it may happen that @item->extra_attrs for some of the
result items can have multiple attributes of the same type.

This function takes ownership of @glyph_item; it will be reused
as one of the elements in the list. *)

(* Record field accessors *)

(* Getters *)
external get_item : t -> Item.t = "ml_pango_glyph_item_get_item"
external get_glyphs : t -> Glyph_string.t = "ml_pango_glyph_item_get_glyphs"
external get_y_offset : t -> int = "ml_pango_glyph_item_get_y_offset"

external get_start_x_offset : t -> int
  = "ml_pango_glyph_item_get_start_x_offset"

external get_end_x_offset : t -> int = "ml_pango_glyph_item_get_end_x_offset"

(* Setters *)
external set_item : t -> Item.t -> unit = "ml_pango_glyph_item_set_item"

external set_glyphs : t -> Glyph_string.t -> unit
  = "ml_pango_glyph_item_set_glyphs"

external set_y_offset : t -> int -> unit = "ml_pango_glyph_item_set_y_offset"

external set_start_x_offset : t -> int -> unit
  = "ml_pango_glyph_item_set_start_x_offset"

external set_end_x_offset : t -> int -> unit
  = "ml_pango_glyph_item_set_end_x_offset"

external make : Item.t -> Glyph_string.t -> int -> int -> int -> t
  = "ml_pango_glyph_item_make"
