class combo_box : Combo_box.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcombo_box_signals.combo_box_signals
    method get_active : unit -> int
    method get_active_id : unit -> string option
    method get_button_sensitivity : unit -> Gtk_enums.sensitivitytype
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_entry_text_column : unit -> int
    method get_has_entry : unit -> bool
    method get_id_column : unit -> int
    method get_popup_fixed_width : unit -> bool
    method popdown : unit -> unit
    method popup : unit -> unit
    method set_active : int -> unit
    method set_active_id : string option -> bool
    method set_active_iter : Tree_iter.t option -> unit
    method set_button_sensitivity : Gtk_enums.sensitivitytype -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_entry_text_column : int -> unit
    method set_id_column : int -> unit
    method set_popup_fixed_width : bool -> unit
    method has_frame : bool
    method set_has_frame : bool -> unit
    method popup_shown : bool
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_combo_box : Combo_box.t
  end

