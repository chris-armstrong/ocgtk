class type multi_sorter_t = object
  inherit GSorter.sorter_t
  inherit Ocgtk_gio.Gio.List_model.list_model_t
  inherit GBuildable.buildable_t
  method append : GSorter.sorter_t -> unit
  method remove : int -> unit
  method item_type : int
  method n_items : int
  method as_multi_sorter : Multi_sorter.t
end

(* High-level class for MultiSorter *)
class multi_sorter (obj : Multi_sorter.t) : multi_sorter_t =
  object (self)
    inherit GSorter.sorter (obj :> Sorter.t)

    inherit
      Ocgtk_gio.Gio.List_model.list_model
        (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

    inherit GBuildable.buildable (Buildable.from_gobject obj)

    method append : GSorter.sorter_t -> unit =
      fun sorter ->
        let sorter = sorter#as_sorter in
        Multi_sorter.append obj sorter

    method remove : int -> unit =
      fun position -> Multi_sorter.remove obj position

    method item_type = Multi_sorter.get_item_type obj
    method n_items = Multi_sorter.get_n_items obj
    method as_multi_sorter = obj
  end

let new_ () : multi_sorter_t = new multi_sorter (Multi_sorter.new_ ())
