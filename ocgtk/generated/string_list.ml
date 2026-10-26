class type string_list_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : string -> unit
  method find : string -> int
  method get_string : int -> string option
  method remove : int -> unit
  method splice : int -> int -> string array option -> unit
  method take : string -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_string_list : Raw.String_list.t
end

(* High-level class for StringList *)
class string_list (obj : Raw.String_list.t) : string_list_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method append : string -> unit =
      fun string -> Raw.String_list.append obj string

    method find : string -> int = fun string -> Raw.String_list.find obj string

    method get_string : int -> string option =
      fun position -> Raw.String_list.get_string obj position

    method remove : int -> unit =
      fun position -> Raw.String_list.remove obj position

    method splice : int -> int -> string array option -> unit =
      fun position n_removals additions ->
        Raw.String_list.splice obj position n_removals additions

    method take : string -> unit = fun string -> Raw.String_list.take obj string
    method item_type = Raw.String_list.get_item_type obj
    method n_items = Raw.String_list.get_n_items obj
    method as_string_list = obj
  end

let new_ (strings : string array option) : string_list_t =
  let obj_ = Raw.String_list.new_ strings in
  new string_list obj_
