class type bookmark_list_t = object
  inherit Ocgio.List_model.list_model_t

  method get_attributes : unit -> string option
  (** Gets the attributes queried on the children. *)

  method get_filename : unit -> string
  (** Returns the filename of the bookmark file that this list is loading. *)

  method get_io_priority : unit -> int
  (** Gets the IO priority to use while loading file. *)

  method is_loading : unit -> bool
  (** Returns [TRUE] if the files are currently being loaded.

      Files will be added to [self] from time to time while loading is going on.
      The order in which are added is undefined and may change in between runs.
  *)

  method set_attributes : string option -> unit
  (** Sets the [attributes] to be enumerated and starts the enumeration.

      If [attributes] is [NULL], no attributes will be queried, but a list of
      [GFileInfo]s will still be created. *)

  method set_io_priority : int -> unit
  (** Sets the IO priority to use while loading files.

      The default IO priority is [G_PRIORITY_DEFAULT]. *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

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
