(** A list model that wraps [GBookmarkFile].

    It presents a [GListModel] and fills it asynchronously with the [GFileInfo]s
    returned from that function.

    The [GFileInfo]s in the list have some attributes in the recent namespace
    added: [recent::private] (boolean) and [recent:applications] (stringv).

    Its methods, signals and properties are on {!class-type-bookmark_list_t}.
    The functions it is built on are in {!Ocgtk.Raw.Bookmark_list}. *)

(** The methods, signals and properties of a [GtkBookmarkList]. *)
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

class bookmark_list : Raw.Bookmark_list.t -> bookmark_list_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bookmark_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBookmarkList], give one already wrapped. *)

val new_ : string option -> string option -> bookmark_list_t
