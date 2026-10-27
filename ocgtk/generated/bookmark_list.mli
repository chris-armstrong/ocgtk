(** A list model that wraps [GBookmarkFile].

    It presents a [GListModel] and fills it asynchronously with the [GFileInfo]s
    returned from that function.

    The [GFileInfo]s in the list have some attributes in the recent namespace
    added: [recent::private] (boolean) and [recent:applications] (stringv).

    Its methods, signals and properties are on {!class-type-bookmark_list_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Bookmark_list}. *)

(** The methods, signals and properties of a [GtkBookmarkList]. *)
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
  method n_items : int
  method as_bookmark_list : Raw.Bookmark_list.t
end

class bookmark_list : Raw.Bookmark_list.t -> bookmark_list_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bookmark_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBookmarkList], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string option -> string option -> bookmark_list_t
(** Creates a new [GtkBookmarkList] with the given [attributes]. *)
