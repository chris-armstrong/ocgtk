(* Signal class defined in gcombo_box_signals.ml *)

class type combo_box_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gcombo_box_signals.combo_box_signals
    method get_active : unit -> int
    method get_active_id : unit -> string option
    method get_button_sensitivity : unit -> Gtk_enums.sensitivitytype
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_entry_text_column : unit -> int
    method get_has_entry : unit -> bool
    method get_id_column : unit -> int
    method get_model : unit -> GTree_model.tree_model_t option
    method get_popup_fixed_width : unit -> bool
    method popdown : unit -> unit
    method popup : unit -> unit
    method popup_for_device : Ocgtk_gdk.Gdk.Device.device_t -> unit
    method set_active : int -> unit
    method set_active_id : string option -> bool
    method set_active_iter : Tree_iter.t option -> unit
    method set_button_sensitivity : Gtk_enums.sensitivitytype -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_entry_text_column : int -> unit
    method set_id_column : int -> unit
    method set_popup_fixed_width : bool -> unit
    method has_frame : bool
    method set_has_frame : bool -> unit
    method popup_shown : bool
    method as_combo_box : Combo_box.t
end

(* High-level class for ComboBox *)
class combo_box (obj : Combo_box.t) : combo_box_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gcombo_box_signals.combo_box_signals obj

  method get_active : unit -> int =
    fun () ->
      (Combo_box.get_active obj)

  method get_active_id : unit -> string option =
    fun () ->
      (Combo_box.get_active_id obj)

  method get_button_sensitivity : unit -> Gtk_enums.sensitivitytype =
    fun () ->
      (Combo_box.get_button_sensitivity obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Combo_box.get_child obj)

  method get_entry_text_column : unit -> int =
    fun () ->
      (Combo_box.get_entry_text_column obj)

  method get_has_entry : unit -> bool =
    fun () ->
      (Combo_box.get_has_entry obj)

  method get_id_column : unit -> int =
    fun () ->
      (Combo_box.get_id_column obj)

  method get_model : unit -> GTree_model.tree_model_t option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Combo_box.get_model obj)

  method get_popup_fixed_width : unit -> bool =
    fun () ->
      (Combo_box.get_popup_fixed_width obj)

  method popdown : unit -> unit =
    fun () ->
      (Combo_box.popdown obj)

  method popup : unit -> unit =
    fun () ->
      (Combo_box.popup obj)

  method popup_for_device : Ocgtk_gdk.Gdk.Device.device_t -> unit =
    fun device ->
      let device = device#as_device in
      (Combo_box.popup_for_device obj device)

  method set_active : int -> unit =
    fun index_ ->
      (Combo_box.set_active obj index_)

  method set_active_id : string option -> bool =
    fun active_id ->
      (Combo_box.set_active_id obj active_id)

  method set_active_iter : Tree_iter.t option -> unit =
    fun iter ->
      (Combo_box.set_active_iter obj iter)

  method set_button_sensitivity : Gtk_enums.sensitivitytype -> unit =
    fun sensitivity ->
      (Combo_box.set_button_sensitivity obj sensitivity)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Combo_box.set_child obj child)

  method set_entry_text_column : int -> unit =
    fun text_column ->
      (Combo_box.set_entry_text_column obj text_column)

  method set_id_column : int -> unit =
    fun id_column ->
      (Combo_box.set_id_column obj id_column)

  method set_popup_fixed_width : bool -> unit =
    fun fixed ->
      (Combo_box.set_popup_fixed_width obj fixed)

  method has_frame = Combo_box.get_has_frame obj
  method set_has_frame v =  Combo_box.set_has_frame obj v

  method popup_shown = Combo_box.get_popup_shown obj

    method as_combo_box = obj
end

let new_ () : combo_box_t =
  new combo_box (Combo_box.new_ ())

let new_with_entry () : combo_box_t =
  new combo_box (Combo_box.new_with_entry ())

let new_with_model (model : GTree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Combo_box.new_with_model model in
  new combo_box obj_

let new_with_model_and_entry (model : GTree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Combo_box.new_with_model_and_entry model in
  new combo_box obj_

