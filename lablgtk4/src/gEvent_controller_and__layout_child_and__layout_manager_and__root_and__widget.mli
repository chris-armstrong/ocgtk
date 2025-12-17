class event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t ->
  object
    method get_current_event : 'a. unit -> 'a Gdk.event option
    method get_current_event_state : unit -> Gdk.modifiertype
    method get_name : unit -> string option
    method get_propagation_limit : unit -> Gtk_enums.propagationlimit
    method get_propagation_phase : unit -> Gtk_enums.propagationphase
    method get_widget : unit -> widget
    method reset : unit -> unit
    method set_name : string option -> unit
    method set_propagation_limit : Gtk_enums.propagationlimit -> unit
    method set_propagation_phase : Gtk_enums.propagationphase -> unit
    method set_static_name : string option -> unit
    method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
  end

and layout_child : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t ->
  object
    method get_child_widget : unit -> widget
    method get_layout_manager : unit -> layout_manager
    method as_layout_child : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t
  end

and layout_manager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t ->
  object
    method allocate : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> int -> int -> int -> unit
    method get_layout_child : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> layout_child
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method get_widget : unit -> widget option
    method layout_changed : unit -> unit
    method as_layout_manager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
  end

and root : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t ->
  object
    method get_focus : unit -> widget option
    method set_focus : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> option -> unit
    method as_root : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t
  end

and widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t ->
  object
    inherit Gwidget_signals.widget_signals
    method action_set_enabled : string -> bool -> unit
    method activate : unit -> bool
    method activate_default : unit -> unit
    method add_controller : <as_event_controller: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t; ..> -> unit
    method add_css_class : string -> unit
    method add_mnemonic_label : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> unit
    method child_focus : Gtk_enums.directiontype -> bool
    method compute_expand : Gtk_enums.orientation -> bool
    method contains : float -> float -> bool
    method drag_check_threshold : int -> int -> int -> int -> bool
    method error_bell : unit -> unit
    method get_allocated_baseline : unit -> int
    method get_allocated_height : unit -> int
    method get_allocated_width : unit -> int
    method get_baseline : unit -> int
    method get_can_focus : unit -> bool
    method get_can_target : unit -> bool
    method get_child_visible : unit -> bool
    method get_css_classes : unit -> unit
    method get_css_name : unit -> string
    method get_direction : unit -> Gtk_enums.textdirection
    method get_first_child : unit -> widget option
    method get_focus_child : unit -> widget option
    method get_focus_on_click : unit -> bool
    method get_focusable : unit -> bool
    method get_halign : unit -> Gtk_enums.align
    method get_has_tooltip : unit -> bool
    method get_height : unit -> int
    method get_hexpand : unit -> bool
    method get_hexpand_set : unit -> bool
    method get_last_child : unit -> widget option
    method get_layout_manager : unit -> layout_manager option
    method get_mapped : unit -> bool
    method get_margin_bottom : unit -> int
    method get_margin_end : unit -> int
    method get_margin_start : unit -> int
    method get_margin_top : unit -> int
    method get_name : unit -> string
    method get_native : unit -> GNative.native option
    method get_next_sibling : unit -> widget option
    method get_opacity : unit -> float
    method get_overflow : unit -> Gtk_enums.overflow
    method get_parent : unit -> widget option
    method get_prev_sibling : unit -> widget option
    method get_realized : unit -> bool
    method get_receives_default : unit -> bool
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method get_root : unit -> root option
    method get_scale_factor : unit -> int
    method get_sensitive : unit -> bool
    method get_settings : unit -> GSettings.settings
    method get_size : Gtk_enums.orientation -> int
    method get_state_flags : unit -> Gtk_enums.stateflags
    method get_style_context : unit -> GStyle_context.style_context
    method get_tooltip_markup : unit -> string option
    method get_tooltip_text : unit -> string option
    method get_valign : unit -> Gtk_enums.align
    method get_vexpand : unit -> bool
    method get_vexpand_set : unit -> bool
    method get_visible : unit -> bool
    method get_width : unit -> int
    method grab_focus : unit -> bool
    method has_css_class : string -> bool
    method has_default : unit -> bool
    method has_focus : unit -> bool
    method has_visible_focus : unit -> bool
    method hide : unit -> unit
    method in_destruction : unit -> bool
    method init_template : unit -> unit
    method insert_after : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> option -> unit
    method insert_before : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> option -> unit
    method is_ancestor : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> bool
    method is_drawable : unit -> bool
    method is_focus : unit -> bool
    method is_sensitive : unit -> bool
    method is_visible : unit -> bool
    method keynav_failed : Gtk_enums.directiontype -> bool
    method map : unit -> unit
    method mnemonic_activate : bool -> bool
    method pick : float -> float -> Gtk_enums.pickflags -> widget option
    method queue_allocate : unit -> unit
    method queue_draw : unit -> unit
    method queue_resize : unit -> unit
    method realize : unit -> unit
    method remove_controller : <as_event_controller: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t; ..> -> unit
    method remove_css_class : string -> unit
    method remove_mnemonic_label : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> unit
    method remove_tick_callback : int -> unit
    method set_can_focus : bool -> unit
    method set_can_target : bool -> unit
    method set_child_visible : bool -> unit
    method set_cursor_from_name : string option -> unit
    method set_direction : Gtk_enums.textdirection -> unit
    method set_focus_child : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> option -> unit
    method set_focus_on_click : bool -> unit
    method set_focusable : bool -> unit
    method set_halign : Gtk_enums.align -> unit
    method set_has_tooltip : bool -> unit
    method set_hexpand : bool -> unit
    method set_hexpand_set : bool -> unit
    method set_layout_manager : <as_layout_manager: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t; ..> option -> unit
    method set_margin_bottom : int -> unit
    method set_margin_end : int -> unit
    method set_margin_start : int -> unit
    method set_margin_top : int -> unit
    method set_name : string -> unit
    method set_opacity : float -> unit
    method set_overflow : Gtk_enums.overflow -> unit
    method set_parent : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> unit
    method set_receives_default : bool -> unit
    method set_sensitive : bool -> unit
    method set_size_request : int -> int -> unit
    method set_state_flags : Gtk_enums.stateflags -> bool -> unit
    method set_tooltip_markup : string option -> unit
    method set_tooltip_text : string option -> unit
    method set_valign : Gtk_enums.align -> unit
    method set_vexpand : bool -> unit
    method set_vexpand_set : bool -> unit
    method set_visible : bool -> unit
    method should_layout : unit -> bool
    method show : unit -> unit
    method snapshot_child : <as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> -> #GSnapshot.snapshot -> unit
    method trigger_tooltip_query : unit -> unit
    method unmap : unit -> unit
    method unparent : unit -> unit
    method unrealize : unit -> unit
    method unset_state_flags : Gtk_enums.stateflags -> unit
    method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
  end
