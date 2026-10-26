class type filter_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_filter : unit -> Filter.filter_t option
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_pending : unit -> int
  method get_watch_items : unit -> bool
  method set_filter : Filter.filter_t option -> unit
  method set_incremental : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_watch_items : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_filter_list_model : Raw.Filter_list_model.t
end

(* High-level class for FilterListModel *)
class filter_list_model (obj : Raw.Filter_list_model.t) : filter_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_filter : unit -> Filter.filter_t option =
      fun () ->
        Option.map
          (fun ret -> new Filter.filter ret)
          (Raw.Filter_list_model.get_filter obj)

    method get_incremental : unit -> bool =
      fun () -> Raw.Filter_list_model.get_incremental obj

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Filter_list_model.get_model obj)

    method get_pending : unit -> int =
      fun () -> Raw.Filter_list_model.get_pending obj

    method get_watch_items : unit -> bool =
      fun () -> Raw.Filter_list_model.get_watch_items obj

    method set_filter : Filter.filter_t option -> unit =
      fun filter ->
        let filter = Option.map (fun c -> c#as_filter) filter in
        Raw.Filter_list_model.set_filter obj filter

    method set_incremental : bool -> unit =
      fun incremental -> Raw.Filter_list_model.set_incremental obj incremental

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Filter_list_model.set_model obj model

    method set_watch_items : bool -> unit =
      fun watch_items -> Raw.Filter_list_model.set_watch_items obj watch_items

    method item_type = Raw.Filter_list_model.get_item_type obj
    method n_items = Raw.Filter_list_model.get_n_items obj
    method as_filter_list_model = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option)
    (filter : Filter.filter_t option) : filter_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let filter = Option.map (fun c -> c#as_filter) filter in
  let obj_ = Raw.Filter_list_model.new_ model filter in
  new filter_list_model obj_
