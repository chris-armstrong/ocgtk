(** [GListStore] is a simple implementation of [Gio.ListModel] that stores all
    items in memory.

    Its methods, signals and properties are on {!class-type-list_store_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.List_store}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ListStore].}

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}

    [GListStore] is a simple implementation of [Gio.ListModel] that stores all
    items in memory.

    It provides insertions, deletions, and lookups in logarithmic time with a
    fast path for the common case of iterating the list linearly. *)
class type list_store_t = object
  inherit List_model.list_model_t

  (** {2:methods Methods} *)

  method append : [ `object_ ] Gobject.obj -> unit
  (** Appends [item] to [store]. [item] must be of type [GListStore:item]-type.

      This function takes a ref on [item].

      Use g_list_store_splice() to append multiple items at the same time
      efficiently. *)

  method insert : int -> [ `object_ ] Gobject.obj -> unit
  (** Inserts [item] into [store] at [position]. [item] must be of type
      [GListStore:item]-type or derived from it. [position] must be smaller than
      the length of the list, or equal to it to append.

      This function takes a ref on [item].

      Use g_list_store_splice() to insert multiple items at the same time
      efficiently. *)

  method remove : int -> unit
  (** Removes the item from [store] that is at [position]. [position] must be
      smaller than the current length of the list.

      Use g_list_store_splice() to remove multiple items at the same time
      efficiently. *)

  method remove_all : unit -> unit
  (** Removes all items from [store]. *)

  method splice : int -> int -> [ `object_ ] Gobject.obj array -> int -> unit
  (** Changes [store] by removing [n_removals] items and adding [n_additions]
      items to it. [additions] must contain [n_additions] items of type
      [GListStore:item]-type. [NULL] is not permitted.

      This function is more efficient than g_list_store_insert() and
      g_list_store_remove(), because it only emits [GListModel::items]-changed
      once for the change.

      This function takes a ref on each item in [additions].

      The parameters [position] and [n_removals] must be correct (ie: [position]
      \+ [n_removals] must be less than or equal to the length of the list at
      the time this function is called). *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items contained in this list store. Items must be subclasses
      of [GObject]. *)

  method n_items : int
  (** The number of items contained in this list store. *)

  (** {2:conversions Conversions} *)

  method as_list_store : Raw.List_store.t
end

class list_store : Raw.List_store.t -> list_store_t
(** Wraps a raw handle of {!Ocgio.Raw.List_store.t}. *)

(** {1:description Description}

    [GListStore] is a simple implementation of [Gio.ListModel] that stores all
    items in memory.

    It provides insertions, deletions, and lookups in logarithmic time with a
    fast path for the common case of iterating the list linearly. *)

(** {1:constructors Constructors} *)

val new_ : Gobject.Type.t -> list_store_t
(** Creates a new [GListStore] with items of type [item_type]. [item_type] must
    be a subclass of [GObject]. *)
