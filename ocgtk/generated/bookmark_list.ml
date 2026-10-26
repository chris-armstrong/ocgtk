class type bookmark_list_t = object
  inherit Ocgio.List_model.list_model_t
  method get_attributes : unit -> string option
  method get_filename : unit -> string
  method get_io_priority : unit -> int
  method is_loading : unit -> bool
  method set_attributes : string option -> unit
  method set_io_priority : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_bookmark_list : Raw.Bookmark_list.t
end

(* High-level class for BookmarkList *)
class bookmark_list (obj : Raw.Bookmark_list.t) : bookmark_list_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_attributes : unit -> string option =
      fun () -> Raw.Bookmark_list.get_attributes obj

    method get_filename : unit -> string =
      fun () -> Raw.Bookmark_list.get_filename obj

    method get_io_priority : unit -> int =
      fun () -> Raw.Bookmark_list.get_io_priority obj

    method is_loading : unit -> bool =
      fun () -> Raw.Bookmark_list.is_loading obj

    method set_attributes : string option -> unit =
      fun attributes -> Raw.Bookmark_list.set_attributes obj attributes

    method set_io_priority : int -> unit =
      fun io_priority -> Raw.Bookmark_list.set_io_priority obj io_priority

    method item_type = Raw.Bookmark_list.get_item_type obj
    method n_items = Raw.Bookmark_list.get_n_items obj
    method as_bookmark_list = obj
  end

let new_ (filename : string option) (attributes : string option) :
    bookmark_list_t =
  let obj_ = Raw.Bookmark_list.new_ filename attributes in
  new bookmark_list obj_
