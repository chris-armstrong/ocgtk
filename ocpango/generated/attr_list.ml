class type attr_list_t = object
  method change : Raw.Attribute.t -> unit
  method equal : Raw.Attr_list.t -> bool
  method get_attributes : unit -> Raw.Attribute.t list
  method get_iterator : unit -> Raw.Attr_iterator.t
  method insert : Raw.Attribute.t -> unit
  method insert_before : Raw.Attribute.t -> unit
  method ref : unit -> Raw.Attr_list.t
  method splice : Raw.Attr_list.t -> int -> int -> unit
  method to_string : unit -> string
  method update : int -> int -> int -> unit
  method as_attr_list : Raw.Attr_list.t
end

(* High-level class for AttrList *)
class attr_list (obj : Raw.Attr_list.t) : attr_list_t =
  object (self)
    method change : Raw.Attribute.t -> unit =
      fun attr -> Raw.Attr_list.change obj attr

    method equal : Raw.Attr_list.t -> bool =
      fun other_list -> Raw.Attr_list.equal obj other_list

    method get_attributes : unit -> Raw.Attribute.t list =
      fun () -> Raw.Attr_list.get_attributes obj

    method get_iterator : unit -> Raw.Attr_iterator.t =
      fun () -> Raw.Attr_list.get_iterator obj

    method insert : Raw.Attribute.t -> unit =
      fun attr -> Raw.Attr_list.insert obj attr

    method insert_before : Raw.Attribute.t -> unit =
      fun attr -> Raw.Attr_list.insert_before obj attr

    method ref : unit -> Raw.Attr_list.t = fun () -> Raw.Attr_list.ref obj

    method splice : Raw.Attr_list.t -> int -> int -> unit =
      fun other pos len -> Raw.Attr_list.splice obj other pos len

    method to_string : unit -> string = fun () -> Raw.Attr_list.to_string obj

    method update : int -> int -> int -> unit =
      fun pos remove add -> Raw.Attr_list.update obj pos remove add

    method as_attr_list = obj
  end

let new_ () : attr_list_t = new attr_list (Raw.Attr_list.new_ ())
