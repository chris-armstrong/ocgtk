(** [GListStore] is a simple implementation of [Gio.ListModel] that stores all
    items in memory.

    It provides insertions, deletions, and lookups in logarithmic time with a
    fast path for the common case of iterating the list linearly.

    Its methods, signals and properties are on {!class-type-list_store_t}. The
    functions it is built on are in {!Ocgio.Raw.List_store}. *)

(** The methods, signals and properties of a [GListStore]. *)
class type list_store_t = object
  inherit List_model.list_model_t
  method append : [ `object_ ] Gobject.obj -> unit
  method insert : int -> [ `object_ ] Gobject.obj -> unit
  method remove : int -> unit
  method remove_all : unit -> unit
  method splice : int -> int -> [ `object_ ] Gobject.obj array -> int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_list_store : Raw.List_store.t
end

class list_store : Raw.List_store.t -> list_store_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.List_store.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GListStore], give one already wrapped. *)

val new_ : Gobject.Type.t -> list_store_t
