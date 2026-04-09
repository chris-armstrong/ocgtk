class type sort_list_model_t = object
    method get_incremental : unit -> bool
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_pending : unit -> int
    method get_section_sorter : unit -> GSorter.sorter_t option
    method get_sorter : unit -> GSorter.sorter_t option
    method set_incremental : bool -> unit
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method set_section_sorter : GSorter.sorter_t option -> unit
    method set_sorter : GSorter.sorter_t option -> unit
    method item_type : int
    method n_items : int
    method as_sort_list_model : Sort_list_model.t
end

(* High-level class for SortListModel *)
class sort_list_model (obj : Sort_list_model.t) : sort_list_model_t = object (self)

  method get_incremental : unit -> bool =
    fun () ->
      (Sort_list_model.get_incremental obj)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (Sort_list_model.get_model obj)

  method get_pending : unit -> int =
    fun () ->
      (Sort_list_model.get_pending obj)

  method get_section_sorter : unit -> GSorter.sorter_t option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Sort_list_model.get_section_sorter obj)

  method get_sorter : unit -> GSorter.sorter_t option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Sort_list_model.get_sorter obj)

  method set_incremental : bool -> unit =
    fun incremental ->
      (Sort_list_model.set_incremental obj incremental)

  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Sort_list_model.set_model obj model)

  method set_section_sorter : GSorter.sorter_t option -> unit =
    fun sorter ->
      let sorter = Option.map (fun (c) -> c#as_sorter) sorter in
      (Sort_list_model.set_section_sorter obj sorter)

  method set_sorter : GSorter.sorter_t option -> unit =
    fun sorter ->
      let sorter = Option.map (fun (c) -> c#as_sorter) sorter in
      (Sort_list_model.set_sorter obj sorter)

  method item_type = Sort_list_model.get_item_type obj

  method n_items = Sort_list_model.get_n_items obj

    method as_sort_list_model = obj
end

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option) (sorter : GSorter.sorter_t option) : sort_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let sorter = Option.map (fun c -> c#as_sorter) sorter in
  let obj_ = Sort_list_model.new_ model sorter in
  new sort_list_model obj_

