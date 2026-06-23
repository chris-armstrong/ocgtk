class type attr_iterator_t = object
  method destroy : unit -> unit

  method get :
    Pango_enums.attrtype -> Attr_color_cycle_ed189c09.Attribute.t option

  method get_attrs : unit -> Attr_color_cycle_ed189c09.Attribute.t list
  method next : unit -> bool
  method as_attr_iterator : Attr_iterator.t
end

class attr_iterator : Attr_iterator.t -> attr_iterator_t
