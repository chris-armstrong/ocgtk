class type filter_list_model_t = object
  inherit Ocgtk_gio.Gio.List_model.list_model_t
  inherit GSection_model.section_model_t
  method get_filter : unit -> GFilter.filter_t option
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
  method get_pending : unit -> int
  method set_filter : GFilter.filter_t option -> unit
  method set_incremental : bool -> unit
  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
  method item_type : int
  method n_items : int
  method as_filter_list_model : Filter_list_model.t
end

(* High-level class for FilterListModel *)
class filter_list_model (obj : Filter_list_model.t) : filter_list_model_t =
  object (self)
    inherit
      Ocgtk_gio.Gio.List_model.list_model
        (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

    inherit GSection_model.section_model (Section_model.from_gobject obj)

    method get_filter : unit -> GFilter.filter_t option =
      fun () ->
        Option.map
          (fun ret -> new GFilter.filter ret)
          (Filter_list_model.get_filter obj)

    method get_incremental : unit -> bool =
      fun () -> Filter_list_model.get_incremental obj

    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret)
          (Filter_list_model.get_model obj)

    method get_pending : unit -> int =
      fun () -> Filter_list_model.get_pending obj

    method set_filter : GFilter.filter_t option -> unit =
      fun filter ->
        let filter = Option.map (fun c -> c#as_filter) filter in
        Filter_list_model.set_filter obj filter

    method set_incremental : bool -> unit =
      fun incremental -> Filter_list_model.set_incremental obj incremental

    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Filter_list_model.set_model obj model

    method item_type = Filter_list_model.get_item_type obj
    method n_items = Filter_list_model.get_n_items obj
    method as_filter_list_model = obj
  end

let new_ (model : Ocgtk_gio.Gio.List_model.list_model_t option)
    (filter : GFilter.filter_t option) : filter_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let filter = Option.map (fun c -> c#as_filter) filter in
  let obj_ = Filter_list_model.new_ model filter in
  new filter_list_model obj_
