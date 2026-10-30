class type list_store_t = object
  inherit List_model.list_model_t

  (** {2:methods Methods} *)

  method append : [ `object_ ] Gobject.obj -> unit
  (** Appends [item] to [store]. [item] must be of type [GListStore:item-type].

      This function takes a ref on [item].

      Use [g_list_store_splice ()] to append multiple items at the same time
      efficiently. *)

  method insert : int -> [ `object_ ] Gobject.obj -> unit
  (** Inserts [item] into [store] at [position]. [item] must be of type
      [GListStore:item-type] or derived from it. [position] must be smaller than
      the length of the list, or equal to it to append.

      This function takes a ref on [item].

      Use [g_list_store_splice ()] to insert multiple items at the same time
      efficiently. *)

  method remove : int -> unit
  (** Removes the item from [store] that is at [position]. [position] must be
      smaller than the current length of the list.

      Use [g_list_store_splice ()] to remove multiple items at the same time
      efficiently. *)

  method remove_all : unit -> unit
  (** Removes all items from [store]. *)

  method splice : int -> int -> [ `object_ ] Gobject.obj array -> int -> unit
  (** Changes [store] by removing [n_removals] items and adding [n_additions]
      items to it. [additions] must contain [n_additions] items of type
      [GListStore:item-type]. [None] is not permitted.

      This function is more efficient than [g_list_store_insert ()] and
      [g_list_store_remove ()], because it only emits
      [GListModel::items-changed] once for the change.

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

(* High-level class for ListStore *)
class list_store (obj : Raw.List_store.t) : list_store_t =
  object (self)
    inherit List_model.list_model (Raw.List_model.from_gobject obj)

    method append : [ `object_ ] Gobject.obj -> unit =
      fun item -> Raw.List_store.append obj item

    method insert : int -> [ `object_ ] Gobject.obj -> unit =
      fun position item -> Raw.List_store.insert obj position item

    method remove : int -> unit =
      fun position -> Raw.List_store.remove obj position

    method remove_all : unit -> unit = fun () -> Raw.List_store.remove_all obj

    method splice : int -> int -> [ `object_ ] Gobject.obj array -> int -> unit
        =
      fun position n_removals additions n_additions ->
        Raw.List_store.splice obj position n_removals additions n_additions

    method item_type = Raw.List_store.get_item_type obj
    method n_items = Raw.List_store.get_n_items obj
    method as_list_store = obj
  end

let new_ (item_type : Gobject.Type.t) : list_store_t =
  let obj_ = Raw.List_store.new_ item_type in
  new list_store obj_
