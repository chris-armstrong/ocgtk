(* High-level class for BookmarkList *)
class bookmark_list (obj : Bookmark_list.t) = object (self)

  method attributes = Bookmark_list.get_attributes obj
  method set_attributes v = Bookmark_list.set_attributes obj v

  method filename = Bookmark_list.get_filename obj

  method io_priority = Bookmark_list.get_io_priority obj
  method set_io_priority v = Bookmark_list.set_io_priority obj v

  method loading = Bookmark_list.get_loading obj

  method n_items = Bookmark_list.get_n_items obj

  method is_loading : unit -> bool = fun () -> (Bookmark_list.is_loading obj )

    method as_bookmark_list = obj
end

