(* Signal class defined in gentry_completion_signals.ml *)

(* High-level class for EntryCompletion *)
class entry_completion (obj : Entry_completion.t) = object (self)
  inherit Gentry_completion_signals.entry_completion_signals obj

  method complete : unit -> unit =
    fun () ->
      (Entry_completion.complete obj)

  method compute_prefix : string -> string option =
    fun key ->
      (Entry_completion.compute_prefix obj key)

  method get_completion_prefix : unit -> string option =
    fun () ->
      (Entry_completion.get_completion_prefix obj)

  method get_entry : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Entry_completion.get_entry obj)

  method get_inline_completion : unit -> bool =
    fun () ->
      (Entry_completion.get_inline_completion obj)

  method get_inline_selection : unit -> bool =
    fun () ->
      (Entry_completion.get_inline_selection obj)

  method get_minimum_key_length : unit -> int =
    fun () ->
      (Entry_completion.get_minimum_key_length obj)

  method get_model : unit -> GTree_model.tree_model option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Entry_completion.get_model obj)

  method get_popup_completion : unit -> bool =
    fun () ->
      (Entry_completion.get_popup_completion obj)

  method get_popup_set_width : unit -> bool =
    fun () ->
      (Entry_completion.get_popup_set_width obj)

  method get_popup_single_match : unit -> bool =
    fun () ->
      (Entry_completion.get_popup_single_match obj)

  method get_text_column : unit -> int =
    fun () ->
      (Entry_completion.get_text_column obj)

  method insert_prefix : unit -> unit =
    fun () ->
      (Entry_completion.insert_prefix obj)

  method set_inline_completion : bool -> unit =
    fun inline_completion ->
      (Entry_completion.set_inline_completion obj inline_completion)

  method set_inline_selection : bool -> unit =
    fun inline_selection ->
      (Entry_completion.set_inline_selection obj inline_selection)

  method set_minimum_key_length : int -> unit =
    fun length ->
      (Entry_completion.set_minimum_key_length obj length)

  method set_popup_completion : bool -> unit =
    fun popup_completion ->
      (Entry_completion.set_popup_completion obj popup_completion)

  method set_popup_set_width : bool -> unit =
    fun popup_set_width ->
      (Entry_completion.set_popup_set_width obj popup_set_width)

  method set_popup_single_match : bool -> unit =
    fun popup_single_match ->
      (Entry_completion.set_popup_single_match obj popup_single_match)

  method set_text_column : int -> unit =
    fun column ->
      (Entry_completion.set_text_column obj column)

  method cell_area = new GCell_area_and__cell_area_context.cell_area (Entry_completion.get_cell_area obj)

    method as_entry_completion = obj
end

