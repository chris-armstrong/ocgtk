class entry_completion : Entry_completion.t ->
  object
    inherit Gentry_completion_signals.entry_completion_signals
    method complete : unit -> unit
    method compute_prefix : string -> string option
    method get_completion_prefix : unit -> string option
    method get_entry : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_inline_completion : unit -> bool
    method get_inline_selection : unit -> bool
    method get_minimum_key_length : unit -> int
    method get_model : unit -> GTree_model.tree_model option
    method get_popup_completion : unit -> bool
    method get_popup_set_width : unit -> bool
    method get_popup_single_match : unit -> bool
    method get_text_column : unit -> int
    method insert_prefix : unit -> unit
    method set_inline_completion : bool -> unit
    method set_inline_selection : bool -> unit
    method set_minimum_key_length : int -> unit
    method set_popup_completion : bool -> unit
    method set_popup_set_width : bool -> unit
    method set_popup_single_match : bool -> unit
    method set_text_column : int -> unit
    method cell_area : GCell_area_and__cell_area_context.cell_area
    method as_entry_completion : Entry_completion.t
  end

