(* High-level class for AttrIterator *)
class attr_iterator (obj : Attr_iterator.t) = object (self)

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

