class string_list : String_list.t ->
  object
    method append : string -> unit
    method get_string : int -> string option
    method remove : int -> unit
    method splice : int -> int -> string array option -> unit
    method take : string -> unit
    method n_items : int
    method strings : string array
    method as_string_list : String_list.t
  end

