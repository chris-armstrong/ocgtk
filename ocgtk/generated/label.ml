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

(* High-level class for Label *)
class label (obj : Raw.Label.t) : label_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    method on_activate_current_link ?(after = false) ~callback () =
      Raw.Label.on_activate_current_link ~after self#as_label ~callback

    method on_activate_link ?(after = false) ~callback () =
      Raw.Label.on_activate_link ~after self#as_label ~callback

    method on_copy_clipboard ?(after = false) ~callback () =
      Raw.Label.on_copy_clipboard ~after self#as_label ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Label.on_move_cursor ~after self#as_label ~callback

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Label.get_attributes obj)

    method get_current_uri : unit -> string option =
      fun () -> Raw.Label.get_current_uri obj

    method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode =
      fun () -> Raw.Label.get_ellipsize obj

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Label.get_extra_menu obj)

    method get_justify : unit -> Enums.justification =
      fun () -> Raw.Label.get_justify obj

    method get_label : unit -> string = fun () -> Raw.Label.get_label obj

    method get_layout : unit -> Ocpango.Layout.layout_t =
      fun () -> new Ocpango.Layout.layout (Raw.Label.get_layout obj)

    method get_lines : unit -> int = fun () -> Raw.Label.get_lines obj

    method get_max_width_chars : unit -> int =
      fun () -> Raw.Label.get_max_width_chars obj

    method get_mnemonic_keyval : unit -> int =
      fun () -> Raw.Label.get_mnemonic_keyval obj

    method get_mnemonic_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Label.get_mnemonic_widget obj)

    method get_natural_wrap_mode : unit -> Enums.naturalwrapmode =
      fun () -> Raw.Label.get_natural_wrap_mode obj

    method get_selectable : unit -> bool =
      fun () -> Raw.Label.get_selectable obj

    method get_single_line_mode : unit -> bool =
      fun () -> Raw.Label.get_single_line_mode obj

    method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Tab_array.tab_array ret)
          (Raw.Label.get_tabs obj)

    method get_text : unit -> string = fun () -> Raw.Label.get_text obj

    method get_use_markup : unit -> bool =
      fun () -> Raw.Label.get_use_markup obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Label.get_use_underline obj

    method get_width_chars : unit -> int =
      fun () -> Raw.Label.get_width_chars obj

    method get_wrap : unit -> bool = fun () -> Raw.Label.get_wrap obj

    method get_wrap_mode : unit -> Ocpango.Enums.wrapmode =
      fun () -> Raw.Label.get_wrap_mode obj

    method get_xalign : unit -> float = fun () -> Raw.Label.get_xalign obj
    method get_yalign : unit -> float = fun () -> Raw.Label.get_yalign obj

    method select_region : int -> int -> unit =
      fun start_offset end_offset ->
        Raw.Label.select_region obj start_offset end_offset

    method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit =
      fun attrs ->
        let attrs = Option.map (fun c -> c#as_attr_list) attrs in
        Raw.Label.set_attributes obj attrs

    method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit =
      fun mode -> Raw.Label.set_ellipsize obj mode

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Label.set_extra_menu obj model

    method set_justify : Enums.justification -> unit =
      fun jtype -> Raw.Label.set_justify obj jtype

    method set_label : string -> unit = fun str -> Raw.Label.set_label obj str
    method set_lines : int -> unit = fun lines -> Raw.Label.set_lines obj lines
    method set_markup : string -> unit = fun str -> Raw.Label.set_markup obj str

    method set_markup_with_mnemonic : string -> unit =
      fun str -> Raw.Label.set_markup_with_mnemonic obj str

    method set_max_width_chars : int -> unit =
      fun n_chars -> Raw.Label.set_max_width_chars obj n_chars

    method set_mnemonic_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Label.set_mnemonic_widget obj widget

    method set_natural_wrap_mode : Enums.naturalwrapmode -> unit =
      fun wrap_mode -> Raw.Label.set_natural_wrap_mode obj wrap_mode

    method set_selectable : bool -> unit =
      fun setting -> Raw.Label.set_selectable obj setting

    method set_single_line_mode : bool -> unit =
      fun single_line_mode ->
        Raw.Label.set_single_line_mode obj single_line_mode

    method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit =
      fun tabs ->
        let tabs = Option.map (fun c -> c#as_tab_array) tabs in
        Raw.Label.set_tabs obj tabs

    method set_text : string -> unit = fun str -> Raw.Label.set_text obj str

    method set_text_with_mnemonic : string -> unit =
      fun str -> Raw.Label.set_text_with_mnemonic obj str

    method set_use_markup : bool -> unit =
      fun setting -> Raw.Label.set_use_markup obj setting

    method set_use_underline : bool -> unit =
      fun setting -> Raw.Label.set_use_underline obj setting

    method set_width_chars : int -> unit =
      fun n_chars -> Raw.Label.set_width_chars obj n_chars

    method set_wrap : bool -> unit = fun wrap -> Raw.Label.set_wrap obj wrap

    method set_wrap_mode : Ocpango.Enums.wrapmode -> unit =
      fun wrap_mode -> Raw.Label.set_wrap_mode obj wrap_mode

    method set_xalign : float -> unit =
      fun xalign -> Raw.Label.set_xalign obj xalign

    method set_yalign : float -> unit =
      fun yalign -> Raw.Label.set_yalign obj yalign

    method as_label = obj
  end

let new_ (str : string option) : label_t =
  let obj_ = Raw.Label.new_ str in
  new label obj_

let new_with_mnemonic (str : string option) : label_t =
  let obj_ = Raw.Label.new_with_mnemonic str in
  new label obj_
