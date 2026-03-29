(* GENERATED CODE - DO NOT EDIT *)
(* AttrIterator: AttrIterator *)

(** A `PangoAttrIterator` is used to iterate through a `PangoAttrList`.

A new iterator is created with [method@Pango.AttrList.get_iterator].
Once the iterator is created, it can be advanced through the style
changes in the text using [method@Pango.AttrIterator.next]. At each
style change, the range of the current style segment and the attributes
currently in effect can be queried. *)
type t = [`attr_iterator] Gobject.obj

(* Methods *)
(** Get the range of the current segment.

Note that the stored return values are signed, not unsigned
like the values in `PangoAttribute`. To deal with this API
oversight, stored return values that wouldn't fit into
a signed integer are clamped to %G_MAXINT. *)
external range : t -> int * int = "ml_pango_attr_iterator_range"

(** Advance the iterator until the next change of style. *)
external next : t -> bool = "ml_pango_attr_iterator_next"

(** Gets a list of all attributes at the current position of the
iterator. *)
external get_attrs : t -> Attribute.t list = "ml_pango_attr_iterator_get_attrs"

(** Find the current attribute of a particular type
at the iterator location.

When multiple attributes of the same type overlap,
the attribute whose range starts closest to the
current location is used. *)
external get : t -> Pango_enums.attrtype -> Attribute.t option = "ml_pango_attr_iterator_get"

(** Destroy a `PangoAttrIterator` and free all associated memory. *)
external destroy : t -> unit = "ml_pango_attr_iterator_destroy"

(** Copy a `PangoAttrIterator`. *)
external copy : t -> t = "ml_pango_attr_iterator_copy"

