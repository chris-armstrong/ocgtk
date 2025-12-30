(* High-level class for BookmarkList *)
class bookmark_list (obj : Bookmark_list.t) = object (self)

  method get_attributes : unit -> string option =
    fun () ->
      (Bookmark_list.get_attributes obj)

  method get_filename : unit -> string =
    fun () ->
      (Bookmark_list.get_filename obj)

  method get_io_priority : unit -> int =
    fun () ->
      (Bookmark_list.get_io_priority obj)

  method is_loading : unit -> bool =
    fun () ->
      (Bookmark_list.is_loading obj)

  method set_attributes : string option -> unit =
    fun attributes ->
      (Bookmark_list.set_attributes obj attributes)

  method set_io_priority : int -> unit =
    fun io_priority ->
      (Bookmark_list.set_io_priority obj io_priority)

  method loading = Bookmark_list.get_loading obj

  method n_items = Bookmark_list.get_n_items obj

    method as_bookmark_list = obj
end

