
class type event_controller_t = object
    method get_current_event : unit -> Ocgtk_gdk.Gdk.Event.event_t option
    method get_current_event_device : unit -> Ocgtk_gdk.Gdk.Device.device_t option
    method get_current_event_state : unit -> Ocgtk_gdk.Gdk.modifiertype
    method get_name : unit -> string option
    method get_propagation_limit : unit -> Gtk_enums.propagationlimit
    method get_propagation_phase : unit -> Gtk_enums.propagationphase
    method get_widget : unit -> widget_t
    method reset : unit -> unit
    method set_name : string option -> unit
    method set_propagation_limit : Gtk_enums.propagationlimit -> unit
    method set_propagation_phase : Gtk_enums.propagationphase -> unit
    method set_static_name : string option -> unit
    method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
end

and layout_child_t = object
    method get_child_widget : unit -> widget_t
    method get_layout_manager : unit -> layout_manager_t
    method as_layout_child : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t
end

and layout_manager_t = object
    method allocate : widget_t -> int -> int -> int -> unit
    method get_layout_child : widget_t -> layout_child_t
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method get_widget : unit -> widget_t option
    method layout_changed : unit -> unit
    method as_layout_manager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
end

and root_t = object
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_focus : unit -> widget_t option
    method set_focus : widget_t option -> unit
    method as_root : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t
end

and widget_t = object
    inherit GAt_context_and__accessible.accessible_t
    inherit GBuildable.buildable_t
    inherit GConstraint_target.constraint_target_t
    inherit Gwidget_signals.widget_signals
    method action_set_enabled : string -> bool -> unit
    method activate : unit -> bool
    method activate_default : unit -> unit
    method add_controller : event_controller_t -> unit
    method add_css_class : string -> unit
    method add_mnemonic_label : widget_t -> unit
    method allocate : int -> int -> int -> Ocgtk_gsk.Gsk.Transform.transform_t option -> unit
    method child_focus : Gtk_enums.directiontype -> bool
    method compute_expand : Gtk_enums.orientation -> bool
    method contains : float -> float -> bool
    method create_pango_context : unit -> Ocgtk_pango.Pango.Context.context_t
    method create_pango_layout : string option -> Ocgtk_pango.Pango.Layout.layout_t
    method drag_check_threshold : int -> int -> int -> int -> bool
    method error_bell : unit -> unit
    method get_allocated_baseline : unit -> int
    method get_allocated_height : unit -> int
    method get_allocated_width : unit -> int
    method get_baseline : unit -> int
    method get_can_focus : unit -> bool
    method get_can_target : unit -> bool
    method get_child_visible : unit -> bool
    method get_clipboard : unit -> Ocgtk_gdk.Gdk.Clipboard.clipboard_t
    method get_css_classes : unit -> string array
    method get_css_name : unit -> string
    method get_cursor : unit -> Ocgtk_gdk.Gdk.Cursor.cursor_t option
    method get_direction : unit -> Gtk_enums.textdirection
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_first_child : unit -> widget_t option
    method get_focus_child : unit -> widget_t option
    method get_focus_on_click : unit -> bool
    method get_focusable : unit -> bool
    method get_font_map : unit -> Ocgtk_pango.Pango.Font_map.font_map_t option
    method get_font_options : unit -> Ocgtk_cairo.Cairo.Font_options.font_options_t option
    method get_frame_clock : unit -> Ocgtk_gdk.Gdk.Frame_clock.frame_clock_t option
    method get_halign : unit -> Gtk_enums.align
    method get_has_tooltip : unit -> bool
    method get_height : unit -> int
    method get_hexpand : unit -> bool
    method get_hexpand_set : unit -> bool
    method get_last_child : unit -> widget_t option
    method get_layout_manager : unit -> layout_manager_t option
    method get_mapped : unit -> bool
    method get_margin_bottom : unit -> int
    method get_margin_end : unit -> int
    method get_margin_start : unit -> int
    method get_margin_top : unit -> int
    method get_name : unit -> string
    method get_native : unit -> GNative.native_t option
    method get_next_sibling : unit -> widget_t option
    method get_opacity : unit -> float
    method get_overflow : unit -> Gtk_enums.overflow
    method get_pango_context : unit -> Ocgtk_pango.Pango.Context.context_t
    method get_parent : unit -> widget_t option
    method get_prev_sibling : unit -> widget_t option
    method get_primary_clipboard : unit -> Ocgtk_gdk.Gdk.Clipboard.clipboard_t
    method get_realized : unit -> bool
    method get_receives_default : unit -> bool
    method get_request_mode : unit -> Gtk_enums.sizerequestmode
    method get_root : unit -> root_t option
    method get_scale_factor : unit -> int
    method get_sensitive : unit -> bool
    method get_settings : unit -> GSettings.settings_t
    method get_size : Gtk_enums.orientation -> int
    method get_state_flags : unit -> Gtk_enums.stateflags
    method get_style_context : unit -> GStyle_context.style_context_t
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
    method insert_action_group : string -> Ocgtk_gio.Gio.Action_group.action_group_t option -> unit
    method insert_after : widget_t -> widget_t option -> unit
    method insert_before : widget_t -> widget_t option -> unit
    method is_ancestor : widget_t -> bool
    method is_drawable : unit -> bool
    method is_focus : unit -> bool
    method is_sensitive : unit -> bool
    method is_visible : unit -> bool
    method keynav_failed : Gtk_enums.directiontype -> bool
    method list_mnemonic_labels : unit -> widget_t list
    method map : unit -> unit
    method mnemonic_activate : bool -> bool
    method observe_children : unit -> Ocgtk_gio.Gio.List_model.list_model_t
    method observe_controllers : unit -> Ocgtk_gio.Gio.List_model.list_model_t
    method pick : float -> float -> Gtk_enums.pickflags -> widget_t option
    method queue_allocate : unit -> unit
    method queue_draw : unit -> unit
    method queue_resize : unit -> unit
    method realize : unit -> unit
    method remove_controller : event_controller_t -> unit
    method remove_css_class : string -> unit
    method remove_mnemonic_label : widget_t -> unit
    method remove_tick_callback : int -> unit
    method set_can_focus : bool -> unit
    method set_can_target : bool -> unit
    method set_child_visible : bool -> unit
    method set_css_classes : string array -> unit
    method set_cursor : Ocgtk_gdk.Gdk.Cursor.cursor_t option -> unit
    method set_cursor_from_name : string option -> unit
    method set_direction : Gtk_enums.textdirection -> unit
    method set_focus_child : widget_t option -> unit
    method set_focus_on_click : bool -> unit
    method set_focusable : bool -> unit
    method set_font_map : Ocgtk_pango.Pango.Font_map.font_map_t option -> unit
    method set_font_options : Ocgtk_cairo.Cairo.Font_options.font_options_t option -> unit
    method set_halign : Gtk_enums.align -> unit
    method set_has_tooltip : bool -> unit
    method set_hexpand : bool -> unit
    method set_hexpand_set : bool -> unit
    method set_layout_manager : layout_manager_t option -> unit
    method set_margin_bottom : int -> unit
    method set_margin_end : int -> unit
    method set_margin_start : int -> unit
    method set_margin_top : int -> unit
    method set_name : string -> unit
    method set_opacity : float -> unit
    method set_overflow : Gtk_enums.overflow -> unit
    method set_parent : widget_t -> unit
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
    method snapshot_child : widget_t -> GSnapshot.snapshot_t -> unit
    method trigger_tooltip_query : unit -> unit
    method unmap : unit -> unit
    method unparent : unit -> unit
    method unrealize : unit -> unit
    method unset_state_flags : Gtk_enums.stateflags -> unit
    method height_request : int
    method set_height_request : int -> unit
    method width_request : int
    method set_width_request : int -> unit
    method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
end


class event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t -> event_controller_t

and layout_child : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t -> layout_child_t

and layout_manager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t -> layout_manager_t

and root : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t -> root_t

and widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> widget_t
