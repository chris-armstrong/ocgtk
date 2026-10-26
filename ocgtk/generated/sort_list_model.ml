class type sort_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_pending : unit -> int
  method get_section_sorter : unit -> Sorter.sorter_t option
  method get_sorter : unit -> Sorter.sorter_t option
  method set_incremental : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_section_sorter : Sorter.sorter_t option -> unit
  method set_sorter : Sorter.sorter_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_sort_list_model : Raw.Sort_list_model.t
end

(* High-level class for SortListModel *)
class sort_list_model (obj : Raw.Sort_list_model.t) : sort_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_incremental : unit -> bool =
      fun () -> Raw.Sort_list_model.get_incremental obj

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Sort_list_model.get_model obj)

    method get_pending : unit -> int =
      fun () -> Raw.Sort_list_model.get_pending obj

    method get_section_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Sort_list_model.get_section_sorter obj)

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Sort_list_model.get_sorter obj)

    method set_incremental : bool -> unit =
      fun incremental -> Raw.Sort_list_model.set_incremental obj incremental

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Sort_list_model.set_model obj model

    method set_section_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Sort_list_model.set_section_sorter obj sorter

    method set_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Sort_list_model.set_sorter obj sorter

    method item_type = Raw.Sort_list_model.get_item_type obj
    method n_items = Raw.Sort_list_model.get_n_items obj
    method as_sort_list_model = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option)
    (sorter : Sorter.sorter_t option) : sort_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let sorter = Option.map (fun c -> c#as_sorter) sorter in
  let obj_ = Raw.Sort_list_model.new_ model sorter in
  new sort_list_model obj_
