class type multi_sorter_t = object
  inherit Sorter.sorter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : Sorter.sorter_t -> unit
  method remove : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_multi_sorter : Raw.Multi_sorter.t
end

(* High-level class for MultiSorter *)
class multi_sorter (obj : Raw.Multi_sorter.t) : multi_sorter_t =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method append : Sorter.sorter_t -> unit =
      fun sorter ->
        let sorter = sorter#as_sorter in
        Raw.Multi_sorter.append obj sorter

    method remove : int -> unit =
      fun position -> Raw.Multi_sorter.remove obj position

    method item_type = Raw.Multi_sorter.get_item_type obj
    method n_items = Raw.Multi_sorter.get_n_items obj
    method as_multi_sorter = obj
  end

let new_ () : multi_sorter_t = new multi_sorter (Raw.Multi_sorter.new_ ())
