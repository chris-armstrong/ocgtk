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

(* High-level class for AttrIterator *)
class attr_iterator (obj : Raw.Attr_iterator.t) : attr_iterator_t =
  object (self)
    method destroy : unit -> unit = fun () -> Raw.Attr_iterator.destroy obj

    method get : Enums.attrtype -> Raw.Attribute.t option =
      fun type_ -> Raw.Attr_iterator.get obj type_

    method get_attrs : unit -> Raw.Attribute.t list =
      fun () -> Raw.Attr_iterator.get_attrs obj

    method next : unit -> bool = fun () -> Raw.Attr_iterator.next obj
    method as_attr_iterator = obj
  end
