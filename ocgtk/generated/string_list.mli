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

class string_list : Raw.String_list.t -> string_list_t

val new_ : string array option -> string_list_t
