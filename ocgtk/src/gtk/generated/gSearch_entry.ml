(* Signal class defined in gsearch_entry_signals.ml *)

class type search_entry_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gsearch_entry_signals.search_entry_signals
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_placeholder_text : unit -> string option
    method get_search_delay : unit -> int
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_key_capture_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_placeholder_text : string option -> unit
    method set_search_delay : int -> unit
    method activates_default : bool
    method set_activates_default : bool -> unit
    method as_search_entry : Search_entry.t
end

(* High-level class for SearchEntry *)
class search_entry (obj : Search_entry.t) : search_entry_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gsearch_entry_signals.search_entry_signals obj

  method get_input_hints : unit -> Gtk_enums.inputhints =
    fun () ->
      (Search_entry.get_input_hints obj)

  method get_input_purpose : unit -> Gtk_enums.inputpurpose =
    fun () ->
      (Search_entry.get_input_purpose obj)

  method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Search_entry.get_key_capture_widget obj)

  method get_placeholder_text : unit -> string option =
    fun () ->
      (Search_entry.get_placeholder_text obj)

  method get_search_delay : unit -> int =
    fun () ->
      (Search_entry.get_search_delay obj)

  method set_input_hints : Gtk_enums.inputhints -> unit =
    fun hints ->
      (Search_entry.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit =
    fun purpose ->
      (Search_entry.set_input_purpose obj purpose)

  method set_key_capture_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Search_entry.set_key_capture_widget obj widget)

  method set_placeholder_text : string option -> unit =
    fun text ->
      (Search_entry.set_placeholder_text obj text)

  method set_search_delay : int -> unit =
    fun delay ->
      (Search_entry.set_search_delay obj delay)

  method activates_default = Search_entry.get_activates_default obj
  method set_activates_default v =  Search_entry.set_activates_default obj v

    method as_search_entry = obj
end

let new_ () : search_entry_t =
  new search_entry (Search_entry.new_ ())

