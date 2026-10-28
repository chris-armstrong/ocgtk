(** A [PangoGlyphItemIter] is an iterator over the clusters in a
    [PangoGlyphItem].

    Its methods, signals and properties are on {!class-type-glyph_item_iter_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocpango.Raw.Glyph_item_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GlyphItemIter].}

    A [PangoGlyphItemIter] is an iterator over the clusters in a
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
*)
class type glyph_item_iter_t = object
  (** {2:methods Methods} *)

  method init_end : Raw.Glyph_item.t -> string -> bool
  (** Initializes a [PangoGlyphItemIter] structure to point to the last cluster
      in a glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method init_start : Raw.Glyph_item.t -> string -> bool
  (** Initializes a [PangoGlyphItemIter] structure to point to the first cluster
      in a glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method next_cluster : unit -> bool
  (** Advances the iterator to the next cluster in the glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method prev_cluster : unit -> bool
  (** Moves the iterator to the preceding cluster in the glyph item. See
      [PangoGlyphItemIter] for details of cluster orders. *)

  (** {2:conversions Conversions} *)

  method as_glyph_item_iter : Raw.Glyph_item_iter.t
end

class glyph_item_iter : Raw.Glyph_item_iter.t -> glyph_item_iter_t
(** Wraps a raw handle of {!Ocpango.Raw.Glyph_item_iter.t}. *)

(** {1:description Description}

    A [PangoGlyphItemIter] is an iterator over the clusters in a
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
*)
