(* Signal class defined in gentry_completion_signals.ml *)

(* High-level class for EntryCompletion *)
class entry_completion (obj : Entry_completion.t) = object (self)
  inherit Gentry_completion_signals.entry_completion_signals obj

  method inline_completion = Entry_completion.get_inline_completion obj
  method set_inline_completion v = Entry_completion.set_inline_completion obj v

  method inline_selection = Entry_completion.get_inline_selection obj
  method set_inline_selection v = Entry_completion.set_inline_selection obj v

  method minimum_key_length = Entry_completion.get_minimum_key_length obj
  method set_minimum_key_length v = Entry_completion.set_minimum_key_length obj v

  method popup_completion = Entry_completion.get_popup_completion obj
  method set_popup_completion v = Entry_completion.set_popup_completion obj v

  method popup_set_width = Entry_completion.get_popup_set_width obj
  method set_popup_set_width v = Entry_completion.set_popup_set_width obj v

  method popup_single_match = Entry_completion.get_popup_single_match obj
  method set_popup_single_match v = Entry_completion.set_popup_single_match obj v

  method text_column = Entry_completion.get_text_column obj
  method set_text_column v = Entry_completion.set_text_column obj v

  method complete : unit -> unit = fun () -> (Entry_completion.complete obj )

  method get_completion_prefix : unit -> string option = fun () -> (Entry_completion.get_completion_prefix obj )

  method get_entry : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Entry_completion.get_entry obj )

  method get_model : unit -> GTree_model.tree_model option = fun () -> Option.map (fun ret -> new GTree_model.tree_model ret) (Entry_completion.get_model obj )

  method insert_prefix : unit -> unit = fun () -> (Entry_completion.insert_prefix obj )

  method set_model : GTree_model.tree_model option -> unit = fun model -> (Entry_completion.set_model obj ( model |> Option.map (fun x -> x#as_tree_model) ))

    method as_entry_completion = obj
end

