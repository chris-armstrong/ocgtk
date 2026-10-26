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
