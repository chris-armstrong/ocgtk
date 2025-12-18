class entry_completion : Entry_completion.t ->
  object
    inherit Gentry_completion_signals.entry_completion_signals
    method inline_completion : bool
    method set_inline_completion : bool -> unit
    method inline_selection : bool
    method set_inline_selection : bool -> unit
    method minimum_key_length : int
    method set_minimum_key_length : int -> unit
    method popup_completion : bool
    method set_popup_completion : bool -> unit
    method popup_set_width : bool
    method set_popup_set_width : bool -> unit
    method popup_single_match : bool
    method set_popup_single_match : bool -> unit
    method text_column : int
    method set_text_column : int -> unit
    method complete : unit -> unit
    method get_completion_prefix : unit -> string option
    method get_entry : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_model : unit -> GTree_model.tree_model option
    method insert_prefix : unit -> unit
    method set_model : GTree_model.tree_model option -> unit
    method as_entry_completion : Entry_completion.t
  end

