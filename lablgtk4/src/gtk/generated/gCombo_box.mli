class combo_box : Combo_box.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcombo_box_signals.combo_box_signals
    method active : int
    method set_active : int -> unit
    method active_id : string
    method set_active_id : string -> unit
    method entry_text_column : int
    method set_entry_text_column : int -> unit
    method has_entry : bool
    method has_frame : bool
    method set_has_frame : bool -> unit
    method id_column : int
    method set_id_column : int -> unit
    method popup_fixed_width : bool
    method set_popup_fixed_width : bool -> unit
    method popup_shown : bool
    method get_button_sensitivity : unit -> Gtk_enums.sensitivitytype
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_model : unit -> GTree_model.tree_model option
    method popdown : unit -> unit
    method popup : unit -> unit
    method set_active_iter : Tree_iter.t option -> unit
    method set_button_sensitivity : Gtk_enums.sensitivitytype -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_model : GTree_model.tree_model option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_combo_box : Combo_box.t
  end

