(** A [PangoGlyphItemIter] is an iterator over the clusters in a
    [PangoGlyphItem].

    The {i forward direction} of the iterator is the logical direction of text.
    That is, with increasing [start_index] and [start_char] values. If
    [glyph_item] is right-to-left (that is, if
    [glyph_item->item->analysis.level] is odd), then [start_glyph] decreases as
    the iterator moves forward. Moreover, in right-to-left cases, [start_glyph]
    is greater than [end_glyph].

    An iterator should be initialized using either
    pango_glyph_item_iter_init_start() or pango_glyph_item_iter_init_end(), for
    forward and backward iteration respectively, and walked over using any
    desired mixture of pango_glyph_item_iter_next_cluster() and
    pango_glyph_item_iter_prev_cluster().

    A common idiom for doing a forward iteration over the clusters is:

    {[
    PangoGlyphItemIter cluster_iter;
    gboolean have_cluster;

    for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
                                                          glyph_item, text);
         have_cluster;
         have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
    {
      ...
    }
    ]}

    Note that [text] is the start of the text for layout, which is then indexed
    by [glyph_item->item->offset] to get to the text of [glyph_item]. The
    [start_index] and [end_index] values can directly index into [text]. The
    [start_glyph], [end_glyph], [start_char], and [end_char] values however are
    zero-based for the [glyph_item]. For each cluster, the item pointed at by
    the start variables is included in the cluster while the one pointed at by
    end variables is not.

    None of the members of a [PangoGlyphItemIter] should be modified manually.

    Its methods, signals and properties are on {!class-type-glyph_item_iter_t}.
    The functions it is built on are in {!Ocpango.Raw.Glyph_item_iter}. *)

(** The methods, signals and properties of a [PangoGlyphItemIter]. *)
class type glyph_item_iter_t = object
  method init_end : Raw.Glyph_item.t -> string -> bool
  method init_start : Raw.Glyph_item.t -> string -> bool
  method next_cluster : unit -> bool
  method prev_cluster : unit -> bool
  method as_glyph_item_iter : Raw.Glyph_item_iter.t
end

class glyph_item_iter : Raw.Glyph_item_iter.t -> glyph_item_iter_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Glyph_item_iter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoGlyphItemIter], give one already wrapped. *)
