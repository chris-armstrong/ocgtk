(* Signal class defined in gcombo_box_signals.ml *)

(* High-level class for ComboBox *)
class combo_box (obj : Combo_box.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Combo_box.as_widget obj)
  inherit Gcombo_box_signals.combo_box_signals obj

  method active = Combo_box.get_active obj
  method set_active v = Combo_box.set_active obj v

  method active_id = Combo_box.get_active_id obj
  method set_active_id v = Combo_box.set_active_id obj v

  method entry_text_column = Combo_box.get_entry_text_column obj
  method set_entry_text_column v = Combo_box.set_entry_text_column obj v

  method has_entry = Combo_box.get_has_entry obj

  method has_frame = Combo_box.get_has_frame obj
  method set_has_frame v = Combo_box.set_has_frame obj v

  method id_column = Combo_box.get_id_column obj
  method set_id_column v = Combo_box.set_id_column obj v

  method popup_fixed_width = Combo_box.get_popup_fixed_width obj
  method set_popup_fixed_width v = Combo_box.set_popup_fixed_width obj v

  method popup_shown = Combo_box.get_popup_shown obj

  method get_button_sensitivity : unit -> Gtk_enums.sensitivitytype = fun () -> (Combo_box.get_button_sensitivity obj )

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Combo_box.get_child obj )

  method get_model : unit -> GTree_model.tree_model option = fun () -> Option.map (fun ret -> new GTree_model.tree_model ret) (Combo_box.get_model obj )

  method popdown : unit -> unit = fun () -> (Combo_box.popdown obj )

  method popup : unit -> unit = fun () -> (Combo_box.popup obj )

  method set_active_iter : Tree_iter.t option -> unit = fun iter -> (Combo_box.set_active_iter obj iter)

  method set_button_sensitivity : Gtk_enums.sensitivitytype -> unit = fun sensitivity -> (Combo_box.set_button_sensitivity obj sensitivity)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Combo_box.set_child obj child)

  method set_model : GTree_model.tree_model option -> unit = fun model -> (Combo_box.set_model obj ( model |> Option.map (fun x -> x#as_tree_model) ))

  method as_widget = (Combo_box.as_widget obj)
    method as_combo_box = obj
end

