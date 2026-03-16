(* High-level class for AttrList *)
class attr_list (obj : Attr_list.t) = object (self)

  method change : Attribute.t -> unit =
    fun attr ->
      (Attr_list.change obj attr)

  method copy : unit -> Attr_list.t option =
    fun () ->
      (Attr_list.copy obj)

  method equal : Attr_list.t -> bool =
    fun other_list ->
      (Attr_list.equal obj other_list)

  method get_iterator : unit -> Attr_iterator.t =
    fun () ->
      (Attr_list.get_iterator obj)

  method insert : Attribute.t -> unit =
    fun attr ->
      (Attr_list.insert obj attr)

  method insert_before : Attribute.t -> unit =
    fun attr ->
      (Attr_list.insert_before obj attr)

  method ref : unit -> Attr_list.t =
    fun () ->
      (Attr_list.ref obj)

  method splice : Attr_list.t -> int -> int -> unit =
    fun other pos len ->
      (Attr_list.splice obj other pos len)

  method to_string : unit -> string =
    fun () ->
      (Attr_list.to_string obj)

  method unref : unit -> unit =
    fun () ->
      (Attr_list.unref obj)

  method update : int -> int -> int -> unit =
    fun pos remove add ->
      (Attr_list.update obj pos remove add)

    method as_attr_list = obj
end

