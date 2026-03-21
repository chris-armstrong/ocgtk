class type attr_iterator_t = object
    method copy : unit -> Attr_iterator.t
    method destroy : unit -> unit
    method get : Pango_enums.attrtype -> Attribute.t option
    method next : unit -> bool
    method as_attr_iterator : Attr_iterator.t
end

(* High-level class for AttrIterator *)
class attr_iterator (obj : Attr_iterator.t) : attr_iterator_t = object (self)

  method copy : unit -> Attr_iterator.t =
    fun () ->
      (Attr_iterator.copy obj)

  method destroy : unit -> unit =
    fun () ->
      (Attr_iterator.destroy obj)

  method get : Pango_enums.attrtype -> Attribute.t option =
    fun type_ ->
      (Attr_iterator.get obj type_)

  method next : unit -> bool =
    fun () ->
      (Attr_iterator.next obj)

    method as_attr_iterator = obj
end

