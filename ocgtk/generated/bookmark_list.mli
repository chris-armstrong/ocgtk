(** A list model that wraps [GBookmarkFile].

    Its methods, signals and properties are on {!class-type-bookmark_list_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Bookmark_list}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BookmarkList].}

    A list model that wraps [GBookmarkFile].

    It presents a [GListModel] and fills it asynchronously with the [GFileInfo]s
    returned from that function.

    The [GFileInfo]s in the list have some attributes in the recent namespace
    added: [recent::private] (boolean) and [recent:applications] (stringv). *)
class type bookmark_list_t = object
  inherit Ocgio.List_model.list_model_t

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_bookmark_list : Raw.Bookmark_list.t
end

class bookmark_list : Raw.Bookmark_list.t -> bookmark_list_t
(** Wraps a raw handle of {!Ocgtk.Raw.Bookmark_list.t}. *)

(** {1:description Description}

    A list model that wraps [GBookmarkFile].

    It presents a [GListModel] and fills it asynchronously with the [GFileInfo]s
    returned from that function.

    The [GFileInfo]s in the list have some attributes in the recent namespace
    added: [recent::private] (boolean) and [recent:applications] (stringv). *)

(** {1:constructors Constructors} *)

val new_ : string option -> string option -> bookmark_list_t
(** Creates a new [GtkBookmarkList] with the given [attributes]. *)
