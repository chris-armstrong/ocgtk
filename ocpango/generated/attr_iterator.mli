(** A [PangoAttrIterator] is used to iterate through a [PangoAttrList].

    Its methods, signals and properties are on {!class-type-attr_iterator_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Attr_iterator}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrIterator].}

    A [PangoAttrIterator] is used to iterate through a [PangoAttrList].

    A new iterator is created with
    {{!Ocpango.Attr_list.class-type-attr_list_t.method-get_iterator}[Pango.AttrList.get_iterator]}.
    Once the iterator is created, it can be advanced through the style changes
    in the text using
    {{!Ocpango.Attr_iterator.class-type-attr_iterator_t.method-next}[Pango.AttrIterator.next]}.
    At each style change, the range of the current style segment and the
    attributes currently in effect can be queried. *)
class type attr_iterator_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_attr_iterator : Raw.Attr_iterator.t
end

class attr_iterator : Raw.Attr_iterator.t -> attr_iterator_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_iterator.t}. *)

(** {1:description Description}

    A [PangoAttrIterator] is used to iterate through a [PangoAttrList].

    A new iterator is created with
    {{!Ocpango.Attr_list.class-type-attr_list_t.method-get_iterator}[Pango.AttrList.get_iterator]}.
    Once the iterator is created, it can be advanced through the style changes
    in the text using
    {{!Ocpango.Attr_iterator.class-type-attr_iterator_t.method-next}[Pango.AttrIterator.next]}.
    At each style change, the range of the current style segment and the
    attributes currently in effect can be queried. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
