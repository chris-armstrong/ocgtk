(** A [PangoAttrIterator] is used to iterate through a [PangoAttrList].

    A new iterator is created with [Pango.AttrList.get_iterator]. Once the
    iterator is created, it can be advanced through the style changes in the
    text using [Pango.AttrIterator.next]. At each style change, the range of the
    current style segment and the attributes currently in effect can be queried.

    Its methods, signals and properties are on {!class-type-attr_iterator_t}.
    The functions it is built on are in {!Ocpango.Raw.Attr_iterator}. *)

(** The methods, signals and properties of a [AttrIterator]. *)
class type attr_iterator_t = object
  method destroy : unit -> unit
  (** Destroy a [PangoAttrIterator] and free all associated memory. *)

  method get : Enums.attrtype -> Raw.Attribute.t option
  (** Find the current attribute of a particular type at the iterator location.

      When multiple attributes of the same type overlap, the attribute whose
      range starts closest to the current location is used. *)

  method get_attrs : unit -> Raw.Attribute.t list
  (** Gets a list of all attributes at the current position of the iterator. *)

  method next : unit -> bool
  (** Advance the iterator until the next change of style. *)

  method as_attr_iterator : Raw.Attr_iterator.t
end

class attr_iterator : Raw.Attr_iterator.t -> attr_iterator_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_iterator.t}. *)
