(* Signal class defined in gsearch_entry_signals.ml *)

(* High-level class for SearchEntry *)
class search_entry (obj : Search_entry.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Search_entry.as_widget obj)
  inherit Gsearch_entry_signals.search_entry_signals obj

  method activates_default = Search_entry.get_activates_default obj
  method set_activates_default v = Search_entry.set_activates_default obj v

  method placeholder_text = Search_entry.get_placeholder_text obj
  method set_placeholder_text v = Search_entry.set_placeholder_text obj v

  method search_delay = Search_entry.get_search_delay obj
  method set_search_delay v = Search_entry.set_search_delay obj v

  method get_input_hints : unit -> Gtk_enums.inputhints = fun () -> (Search_entry.get_input_hints obj )

  method get_input_purpose : unit -> Gtk_enums.inputpurpose = fun () -> (Search_entry.get_input_purpose obj )

  method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Search_entry.get_key_capture_widget obj )

  method set_input_hints : Gtk_enums.inputhints -> unit = fun hints -> (Search_entry.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit = fun purpose -> (Search_entry.set_input_purpose obj purpose)

  method set_key_capture_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Search_entry.set_key_capture_widget obj widget)

  method as_widget = (Search_entry.as_widget obj)
    method as_search_entry = obj
end

