class type combo_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_editable.cell_editable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_format_entry_text :
    ?after:bool ->
    callback:(path:string -> string) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_active :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_popdown :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_active : unit -> int
  method get_active_id : unit -> string option
  method get_button_sensitivity : unit -> Enums.sensitivitytype

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_entry_text_column : unit -> int
  method get_has_entry : unit -> bool
  method get_id_column : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_popup_fixed_width : unit -> bool
  method popdown : unit -> unit
  method popup : unit -> unit
  method popup_for_device : Ocgdk.Device.device_t -> unit
  method set_active : int -> unit
  method set_active_id : string option -> bool
  method set_active_iter : Raw.Tree_iter.t option -> unit
  method set_button_sensitivity : Enums.sensitivitytype -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_entry_text_column : int -> unit
  method set_id_column : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_popup_fixed_width : bool -> unit
  method has_frame : bool
  method set_has_frame : bool -> unit
  method popup_shown : bool
  method as_combo_box : Raw.Combo_box.t
end

(* High-level class for ComboBox *)
class combo_box (obj : Raw.Combo_box.t) : combo_box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Cell_editable.cell_editable (Raw.Cell_editable.from_gobject obj)

    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Raw.Cell_layout.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Combo_box.on_activate ~after self#as_combo_box ~callback

    method on_changed ?(after = false) ~callback () =
      Raw.Combo_box.on_changed ~after self#as_combo_box ~callback

    method on_format_entry_text ?(after = false) ~callback () =
      Raw.Combo_box.on_format_entry_text ~after self#as_combo_box ~callback

    method on_move_active ?(after = false) ~callback () =
      Raw.Combo_box.on_move_active ~after self#as_combo_box ~callback

    method on_popdown ?(after = false) ~callback () =
      Raw.Combo_box.on_popdown ~after self#as_combo_box ~callback

    method on_popup ?(after = false) ~callback () =
      Raw.Combo_box.on_popup ~after self#as_combo_box ~callback

    method get_active : unit -> int = fun () -> Raw.Combo_box.get_active obj

    method get_active_id : unit -> string option =
      fun () -> Raw.Combo_box.get_active_id obj

    method get_button_sensitivity : unit -> Enums.sensitivitytype =
      fun () -> Raw.Combo_box.get_button_sensitivity obj

    method get_child :
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
          (Raw.Combo_box.get_child obj)

    method get_entry_text_column : unit -> int =
      fun () -> Raw.Combo_box.get_entry_text_column obj

    method get_has_entry : unit -> bool =
      fun () -> Raw.Combo_box.get_has_entry obj

    method get_id_column : unit -> int =
      fun () -> Raw.Combo_box.get_id_column obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Combo_box.get_model obj)

    method get_popup_fixed_width : unit -> bool =
      fun () -> Raw.Combo_box.get_popup_fixed_width obj

    method popdown : unit -> unit = fun () -> Raw.Combo_box.popdown obj
    method popup : unit -> unit = fun () -> Raw.Combo_box.popup obj

    method popup_for_device : Ocgdk.Device.device_t -> unit =
      fun device ->
        let device = device#as_device in
        Raw.Combo_box.popup_for_device obj device

    method set_active : int -> unit =
      fun index_ -> Raw.Combo_box.set_active obj index_

    method set_active_id : string option -> bool =
      fun active_id -> Raw.Combo_box.set_active_id obj active_id

    method set_active_iter : Raw.Tree_iter.t option -> unit =
      fun iter -> Raw.Combo_box.set_active_iter obj iter

    method set_button_sensitivity : Enums.sensitivitytype -> unit =
      fun sensitivity -> Raw.Combo_box.set_button_sensitivity obj sensitivity

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Combo_box.set_child obj child

    method set_entry_text_column : int -> unit =
      fun text_column -> Raw.Combo_box.set_entry_text_column obj text_column

    method set_id_column : int -> unit =
      fun id_column -> Raw.Combo_box.set_id_column obj id_column

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Combo_box.set_model obj model

    method set_popup_fixed_width : bool -> unit =
      fun fixed -> Raw.Combo_box.set_popup_fixed_width obj fixed

    method has_frame = Raw.Combo_box.get_has_frame obj
    method set_has_frame v = Raw.Combo_box.set_has_frame obj v
    method popup_shown = Raw.Combo_box.get_popup_shown obj
    method as_combo_box = obj
  end

let new_ () : combo_box_t = new combo_box (Raw.Combo_box.new_ ())

let new_with_entry () : combo_box_t =
  new combo_box (Raw.Combo_box.new_with_entry ())

let new_with_model (model : Tree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Combo_box.new_with_model model in
  new combo_box obj_

let new_with_model_and_entry (model : Tree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Combo_box.new_with_model_and_entry model in
  new combo_box obj_
