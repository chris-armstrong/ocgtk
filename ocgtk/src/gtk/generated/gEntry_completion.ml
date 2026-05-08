class type entry_completion_t = object
  inherit GBuildable.buildable_t
  inherit GCell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_insert_prefix :
    callback:(prefix:string -> bool) -> Gobject.Signal.handler_id

  method on_no_matches : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method complete : unit -> unit
  method compute_prefix : string -> string option
  method get_completion_prefix : unit -> string option

  method get_entry :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_inline_completion : unit -> bool
  method get_inline_selection : unit -> bool
  method get_minimum_key_length : unit -> int
  method get_model : unit -> GTree_model.tree_model_t option
  method get_popup_completion : unit -> bool
  method get_popup_set_width : unit -> bool
  method get_popup_single_match : unit -> bool
  method get_text_column : unit -> int
  method insert_prefix : unit -> unit
  method set_inline_completion : bool -> unit
  method set_inline_selection : bool -> unit
  method set_minimum_key_length : int -> unit
  method set_model : GTree_model.tree_model_t option -> unit
  method set_popup_completion : bool -> unit
  method set_popup_set_width : bool -> unit
  method set_popup_single_match : bool -> unit
  method set_text_column : int -> unit

  method cell_area :
    GCell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_entry_completion : Entry_completion.t
end

(* High-level class for EntryCompletion *)
class entry_completion (obj : Entry_completion.t) : entry_completion_t =
  object (self)
    inherit GBuildable.buildable (Buildable.from_gobject obj)

    inherit
      GCell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Cell_area_and__cell_area_context_and__cell_layout.Cell_layout
         .from_gobject obj)

    method on_insert_prefix ~callback =
      Entry_completion.on_insert_prefix self#as_entry_completion ~callback

    method on_no_matches ~callback =
      Entry_completion.on_no_matches self#as_entry_completion ~callback

    method complete : unit -> unit = fun () -> Entry_completion.complete obj

    method compute_prefix : string -> string option =
      fun key -> Entry_completion.compute_prefix obj key

    method get_completion_prefix : unit -> string option =
      fun () -> Entry_completion.get_completion_prefix obj

    method get_entry :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t =
      fun () ->
        new
          GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
          .widget
          (Entry_completion.get_entry obj)

    method get_inline_completion : unit -> bool =
      fun () -> Entry_completion.get_inline_completion obj

    method get_inline_selection : unit -> bool =
      fun () -> Entry_completion.get_inline_selection obj

    method get_minimum_key_length : unit -> int =
      fun () -> Entry_completion.get_minimum_key_length obj

    method get_model : unit -> GTree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new GTree_model.tree_model ret)
          (Entry_completion.get_model obj)

    method get_popup_completion : unit -> bool =
      fun () -> Entry_completion.get_popup_completion obj

    method get_popup_set_width : unit -> bool =
      fun () -> Entry_completion.get_popup_set_width obj

    method get_popup_single_match : unit -> bool =
      fun () -> Entry_completion.get_popup_single_match obj

    method get_text_column : unit -> int =
      fun () -> Entry_completion.get_text_column obj

    method insert_prefix : unit -> unit =
      fun () -> Entry_completion.insert_prefix obj

    method set_inline_completion : bool -> unit =
      fun inline_completion ->
        Entry_completion.set_inline_completion obj inline_completion

    method set_inline_selection : bool -> unit =
      fun inline_selection ->
        Entry_completion.set_inline_selection obj inline_selection

    method set_minimum_key_length : int -> unit =
      fun length -> Entry_completion.set_minimum_key_length obj length

    method set_model : GTree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Entry_completion.set_model obj model

    method set_popup_completion : bool -> unit =
      fun popup_completion ->
        Entry_completion.set_popup_completion obj popup_completion

    method set_popup_set_width : bool -> unit =
      fun popup_set_width ->
        Entry_completion.set_popup_set_width obj popup_set_width

    method set_popup_single_match : bool -> unit =
      fun popup_single_match ->
        Entry_completion.set_popup_single_match obj popup_single_match

    method set_text_column : int -> unit =
      fun column -> Entry_completion.set_text_column obj column

    method cell_area =
      new GCell_area_and__cell_area_context_and__cell_layout.cell_area
        (Entry_completion.get_cell_area obj)

    method as_entry_completion = obj
  end

let new_ () : entry_completion_t =
  new entry_completion (Entry_completion.new_ ())

let new_with_area
    (area : GCell_area_and__cell_area_context_and__cell_layout.cell_area_t) :
    entry_completion_t =
  let area = area#as_cell_area in
  let obj_ = Entry_completion.new_with_area area in
  new entry_completion obj_
