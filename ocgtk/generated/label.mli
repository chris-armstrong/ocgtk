class type label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t

  method on_activate_current_link :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_current_uri : unit -> string option
  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_justify : unit -> Enums.justification
  method get_label : unit -> string
  method get_layout : unit -> Ocpango.Layout.layout_t
  method get_lines : unit -> int
  method get_max_width_chars : unit -> int
  method get_mnemonic_keyval : unit -> int

  method get_mnemonic_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_natural_wrap_mode : unit -> Enums.naturalwrapmode
  method get_selectable : unit -> bool
  method get_single_line_mode : unit -> bool
  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  method get_text : unit -> string
  method get_use_markup : unit -> bool
  method get_use_underline : unit -> bool
  method get_width_chars : unit -> int
  method get_wrap : unit -> bool
  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  method get_xalign : unit -> float
  method get_yalign : unit -> float
  method select_region : int -> int -> unit
  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_justify : Enums.justification -> unit
  method set_label : string -> unit
  method set_lines : int -> unit
  method set_markup : string -> unit
  method set_markup_with_mnemonic : string -> unit
  method set_max_width_chars : int -> unit

  method set_mnemonic_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_natural_wrap_mode : Enums.naturalwrapmode -> unit
  method set_selectable : bool -> unit
  method set_single_line_mode : bool -> unit
  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  method set_text : string -> unit
  method set_text_with_mnemonic : string -> unit
  method set_use_markup : bool -> unit
  method set_use_underline : bool -> unit
  method set_width_chars : int -> unit
  method set_wrap : bool -> unit
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method set_xalign : float -> unit
  method set_yalign : float -> unit
  method as_label : Raw.Label.t
end

class label : Raw.Label.t -> label_t

val new_ : string option -> label_t
val new_with_mnemonic : string option -> label_t
