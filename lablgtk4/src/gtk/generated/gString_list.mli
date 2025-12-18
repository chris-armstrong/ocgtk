class string_list : String_list.t ->
  object
    method n_items : int
    method append : string -> unit
    method get_string : int -> string option
    method remove : int -> unit
    method as_string_list : String_list.t
  end

