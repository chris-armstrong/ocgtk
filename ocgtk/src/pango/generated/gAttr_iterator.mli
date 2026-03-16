class attr_iterator : Attr_iterator.t ->
  object
    method copy : unit -> Attr_iterator.t
    method destroy : unit -> unit
    method get : Pango_enums.attrtype -> Attribute.t option
    method next : unit -> bool
    method as_attr_iterator : Attr_iterator.t
  end

