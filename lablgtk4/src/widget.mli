(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Widget *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: can-focus *)
external get_can_focus : t -> bool = "ml_gtk_widget_get_can_focus"

(** Set property: can-focus *)
external set_can_focus : t -> bool -> unit = "ml_gtk_widget_set_can_focus"

(** Get property: can-target *)
external get_can_target : t -> bool = "ml_gtk_widget_get_can_target"

(** Set property: can-target *)
external set_can_target : t -> bool -> unit = "ml_gtk_widget_set_can_target"

(** Get property: css-name *)
external get_css_name : t -> string = "ml_gtk_widget_get_css_name"

(** Get property: focus-on-click *)
external get_focus_on_click : t -> bool = "ml_gtk_widget_get_focus_on_click"

(** Set property: focus-on-click *)
external set_focus_on_click : t -> bool -> unit = "ml_gtk_widget_set_focus_on_click"

(** Get property: focusable *)
external get_focusable : t -> bool = "ml_gtk_widget_get_focusable"

(** Set property: focusable *)
external set_focusable : t -> bool -> unit = "ml_gtk_widget_set_focusable"

(** Get property: has-default *)
external get_has_default : t -> bool = "ml_gtk_widget_get_has_default"

(** Get property: has-focus *)
external get_has_focus : t -> bool = "ml_gtk_widget_get_has_focus"

(** Get property: has-tooltip *)
external get_has_tooltip : t -> bool = "ml_gtk_widget_get_has_tooltip"

(** Set property: has-tooltip *)
external set_has_tooltip : t -> bool -> unit = "ml_gtk_widget_set_has_tooltip"

(** Get property: height-request *)
external get_height_request : t -> int = "ml_gtk_widget_get_height_request"

(** Set property: height-request *)
external set_height_request : t -> int -> unit = "ml_gtk_widget_set_height_request"

(** Get property: hexpand *)
external get_hexpand : t -> bool = "ml_gtk_widget_get_hexpand"

(** Set property: hexpand *)
external set_hexpand : t -> bool -> unit = "ml_gtk_widget_set_hexpand"

(** Get property: hexpand-set *)
external get_hexpand_set : t -> bool = "ml_gtk_widget_get_hexpand_set"

(** Set property: hexpand-set *)
external set_hexpand_set : t -> bool -> unit = "ml_gtk_widget_set_hexpand_set"

(** Get property: margin-bottom *)
external get_margin_bottom : t -> int = "ml_gtk_widget_get_margin_bottom"

(** Set property: margin-bottom *)
external set_margin_bottom : t -> int -> unit = "ml_gtk_widget_set_margin_bottom"

(** Get property: margin-end *)
external get_margin_end : t -> int = "ml_gtk_widget_get_margin_end"

(** Set property: margin-end *)
external set_margin_end : t -> int -> unit = "ml_gtk_widget_set_margin_end"

(** Get property: margin-start *)
external get_margin_start : t -> int = "ml_gtk_widget_get_margin_start"

(** Set property: margin-start *)
external set_margin_start : t -> int -> unit = "ml_gtk_widget_set_margin_start"

(** Get property: margin-top *)
external get_margin_top : t -> int = "ml_gtk_widget_get_margin_top"

(** Set property: margin-top *)
external set_margin_top : t -> int -> unit = "ml_gtk_widget_set_margin_top"

(** Get property: name *)
external get_name : t -> string = "ml_gtk_widget_get_name"

(** Set property: name *)
external set_name : t -> string -> unit = "ml_gtk_widget_set_name"

(** Get property: opacity *)
external get_opacity : t -> float = "ml_gtk_widget_get_opacity"

(** Set property: opacity *)
external set_opacity : t -> float -> unit = "ml_gtk_widget_set_opacity"

(** Get property: receives-default *)
external get_receives_default : t -> bool = "ml_gtk_widget_get_receives_default"

(** Set property: receives-default *)
external set_receives_default : t -> bool -> unit = "ml_gtk_widget_set_receives_default"

(** Get property: scale-factor *)
external get_scale_factor : t -> int = "ml_gtk_widget_get_scale_factor"

(** Get property: sensitive *)
external get_sensitive : t -> bool = "ml_gtk_widget_get_sensitive"

(** Set property: sensitive *)
external set_sensitive : t -> bool -> unit = "ml_gtk_widget_set_sensitive"

(** Get property: tooltip-markup *)
external get_tooltip_markup : t -> string = "ml_gtk_widget_get_tooltip_markup"

(** Set property: tooltip-markup *)
external set_tooltip_markup : t -> string -> unit = "ml_gtk_widget_set_tooltip_markup"

(** Get property: tooltip-text *)
external get_tooltip_text : t -> string = "ml_gtk_widget_get_tooltip_text"

(** Set property: tooltip-text *)
external set_tooltip_text : t -> string -> unit = "ml_gtk_widget_set_tooltip_text"

(** Get property: vexpand *)
external get_vexpand : t -> bool = "ml_gtk_widget_get_vexpand"

(** Set property: vexpand *)
external set_vexpand : t -> bool -> unit = "ml_gtk_widget_set_vexpand"

(** Get property: vexpand-set *)
external get_vexpand_set : t -> bool = "ml_gtk_widget_get_vexpand_set"

(** Set property: vexpand-set *)
external set_vexpand_set : t -> bool -> unit = "ml_gtk_widget_set_vexpand_set"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_widget_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_widget_set_visible"

(** Get property: width-request *)
external get_width_request : t -> int = "ml_gtk_widget_get_width_request"

(** Set property: width-request *)
external set_width_request : t -> int -> unit = "ml_gtk_widget_set_width_request"

external unset_state_flags : t -> Gtk_enums.stateflags -> unit = "ml_gtk_widget_unset_state_flags"

external unrealize : t -> unit = "ml_gtk_widget_unrealize"

external unparent : t -> unit = "ml_gtk_widget_unparent"

external unmap : t -> unit = "ml_gtk_widget_unmap"

external trigger_tooltip_query : t -> unit = "ml_gtk_widget_trigger_tooltip_query"

external translate_coordinates : t -> Gtk.Widget.t -> float -> float -> float -> float -> bool = "ml_gtk_widget_translate_coordinates_bytecode" "ml_gtk_widget_translate_coordinates_native"

external snapshot_child : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_widget_snapshot_child"

external size_allocate : t -> unit -> int -> unit = "ml_gtk_widget_size_allocate"

external show : t -> unit = "ml_gtk_widget_show"

external should_layout : t -> bool = "ml_gtk_widget_should_layout"

external set_valign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_valign"

external set_state_flags : t -> Gtk_enums.stateflags -> bool -> unit = "ml_gtk_widget_set_state_flags"

external set_size_request : t -> int -> int -> unit = "ml_gtk_widget_set_size_request"

external set_parent : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_set_parent"

external set_overflow : t -> Gtk_enums.overflow -> unit = "ml_gtk_widget_set_overflow"

external set_layout_manager : t -> Gtk.Widget.t option -> unit = "ml_gtk_widget_set_layout_manager"

external set_halign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_halign"

external set_font_options : t -> unit -> unit = "ml_gtk_widget_set_font_options"

external set_font_map : t -> unit -> unit = "ml_gtk_widget_set_font_map"

external set_focus_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_widget_set_focus_child"

external set_direction : t -> Gtk_enums.textdirection -> unit = "ml_gtk_widget_set_direction"

external set_cursor_from_name : t -> string option -> unit = "ml_gtk_widget_set_cursor_from_name"

external set_cursor : t -> unit -> unit = "ml_gtk_widget_set_cursor"

external set_css_classes : t -> unit -> unit = "ml_gtk_widget_set_css_classes"

external set_child_visible : t -> bool -> unit = "ml_gtk_widget_set_child_visible"

external remove_tick_callback : t -> int -> unit = "ml_gtk_widget_remove_tick_callback"

external remove_mnemonic_label : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_remove_mnemonic_label"

external remove_css_class : t -> string -> unit = "ml_gtk_widget_remove_css_class"

external remove_controller : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_remove_controller"

external realize : t -> unit = "ml_gtk_widget_realize"

external queue_resize : t -> unit = "ml_gtk_widget_queue_resize"

external queue_draw : t -> unit = "ml_gtk_widget_queue_draw"

external queue_allocate : t -> unit = "ml_gtk_widget_queue_allocate"

external pick : t -> float -> float -> Gtk_enums.pickflags -> Gtk.Widget.t = "ml_gtk_widget_pick"

external observe_controllers : t -> unit = "ml_gtk_widget_observe_controllers"

external observe_children : t -> unit = "ml_gtk_widget_observe_children"

external mnemonic_activate : t -> bool -> bool = "ml_gtk_widget_mnemonic_activate"

external measure : t -> Gtk_enums.orientation -> int -> int -> int -> int -> int -> unit = "ml_gtk_widget_measure_bytecode" "ml_gtk_widget_measure_native"

external map : t -> unit = "ml_gtk_widget_map"

external list_mnemonic_labels : t -> unit = "ml_gtk_widget_list_mnemonic_labels"

external keynav_failed : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_keynav_failed"

external is_visible : t -> bool = "ml_gtk_widget_is_visible"

external is_sensitive : t -> bool = "ml_gtk_widget_is_sensitive"

external is_focus : t -> bool = "ml_gtk_widget_is_focus"

external is_drawable : t -> bool = "ml_gtk_widget_is_drawable"

external is_ancestor : t -> Gtk.Widget.t -> bool = "ml_gtk_widget_is_ancestor"

external insert_before : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_widget_insert_before"

external insert_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_widget_insert_after"

external insert_action_group : t -> string -> unit -> unit = "ml_gtk_widget_insert_action_group"

external init_template : t -> unit = "ml_gtk_widget_init_template"

external in_destruction : t -> bool = "ml_gtk_widget_in_destruction"

external hide : t -> unit = "ml_gtk_widget_hide"

external has_visible_focus : t -> bool = "ml_gtk_widget_has_visible_focus"

external has_focus : t -> bool = "ml_gtk_widget_has_focus"

external has_default : t -> bool = "ml_gtk_widget_has_default"

external has_css_class : t -> string -> bool = "ml_gtk_widget_has_css_class"

external grab_focus : t -> bool = "ml_gtk_widget_grab_focus"

external get_width : t -> int = "ml_gtk_widget_get_width"

external get_valign : t -> Gtk_enums.align = "ml_gtk_widget_get_valign"

external get_template_child : t -> unit -> string -> unit = "ml_gtk_widget_get_template_child"

external get_style_context : t -> Gtk.Widget.t = "ml_gtk_widget_get_style_context"

external get_state_flags : t -> Gtk_enums.stateflags = "ml_gtk_widget_get_state_flags"

external get_size_request : t -> int -> int -> unit = "ml_gtk_widget_get_size_request"

external get_size : t -> Gtk_enums.orientation -> int = "ml_gtk_widget_get_size"

external get_settings : t -> Gtk.Widget.t = "ml_gtk_widget_get_settings"

external get_root : t -> Gtk.Widget.t = "ml_gtk_widget_get_root"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_widget_get_request_mode"

external get_realized : t -> bool = "ml_gtk_widget_get_realized"

external get_primary_clipboard : t -> unit = "ml_gtk_widget_get_primary_clipboard"

external get_prev_sibling : t -> Gtk.Widget.t = "ml_gtk_widget_get_prev_sibling"

external get_preferred_size : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_widget_get_preferred_size"

external get_parent : t -> Gtk.Widget.t = "ml_gtk_widget_get_parent"

external get_pango_context : t -> unit = "ml_gtk_widget_get_pango_context"

external get_overflow : t -> Gtk_enums.overflow = "ml_gtk_widget_get_overflow"

external get_next_sibling : t -> Gtk.Widget.t = "ml_gtk_widget_get_next_sibling"

external get_native : t -> Gtk.Widget.t = "ml_gtk_widget_get_native"

external get_mapped : t -> bool = "ml_gtk_widget_get_mapped"

external get_layout_manager : t -> Gtk.Widget.t = "ml_gtk_widget_get_layout_manager"

external get_last_child : t -> Gtk.Widget.t = "ml_gtk_widget_get_last_child"

external get_height : t -> int = "ml_gtk_widget_get_height"

external get_halign : t -> Gtk_enums.align = "ml_gtk_widget_get_halign"

external get_frame_clock : t -> unit = "ml_gtk_widget_get_frame_clock"

external get_font_options : t -> unit = "ml_gtk_widget_get_font_options"

external get_font_map : t -> unit = "ml_gtk_widget_get_font_map"

external get_focus_child : t -> Gtk.Widget.t = "ml_gtk_widget_get_focus_child"

external get_first_child : t -> Gtk.Widget.t = "ml_gtk_widget_get_first_child"

external get_display : t -> unit = "ml_gtk_widget_get_display"

external get_direction : t -> Gtk_enums.textdirection = "ml_gtk_widget_get_direction"

external get_cursor : t -> unit = "ml_gtk_widget_get_cursor"

external get_css_classes : t -> unit = "ml_gtk_widget_get_css_classes"

external get_color : t -> unit -> unit = "ml_gtk_widget_get_color"

external get_clipboard : t -> unit = "ml_gtk_widget_get_clipboard"

external get_child_visible : t -> bool = "ml_gtk_widget_get_child_visible"

external get_baseline : t -> int = "ml_gtk_widget_get_baseline"

external get_ancestor : t -> unit -> Gtk.Widget.t = "ml_gtk_widget_get_ancestor"

external get_allocation : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_get_allocation"

external get_allocated_width : t -> int = "ml_gtk_widget_get_allocated_width"

external get_allocated_height : t -> int = "ml_gtk_widget_get_allocated_height"

external get_allocated_baseline : t -> int = "ml_gtk_widget_get_allocated_baseline"

external error_bell : t -> unit = "ml_gtk_widget_error_bell"

external gtk_drag_check_threshold : t -> int -> int -> int -> int -> bool = "ml_gtk_drag_check_threshold"

external dispose_template : t -> unit -> unit = "ml_gtk_widget_dispose_template"

external create_pango_layout : t -> string option -> unit = "ml_gtk_widget_create_pango_layout"

external create_pango_context : t -> unit = "ml_gtk_widget_create_pango_context"

external contains : t -> float -> float -> bool = "ml_gtk_widget_contains"

external compute_transform : t -> Gtk.Widget.t -> unit -> bool = "ml_gtk_widget_compute_transform"

external compute_point : t -> Gtk.Widget.t -> unit -> unit -> bool = "ml_gtk_widget_compute_point"

external compute_expand : t -> Gtk_enums.orientation -> bool = "ml_gtk_widget_compute_expand"

external compute_bounds : t -> Gtk.Widget.t -> unit -> bool = "ml_gtk_widget_compute_bounds"

external child_focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_child_focus"

external allocate : t -> int -> int -> int -> unit -> unit = "ml_gtk_widget_allocate"

external add_tick_callback : t -> unit -> unit -> unit -> int = "ml_gtk_widget_add_tick_callback"

external add_mnemonic_label : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_add_mnemonic_label"

external add_css_class : t -> string -> unit = "ml_gtk_widget_add_css_class"

external add_controller : t -> Gtk.Widget.t -> unit = "ml_gtk_widget_add_controller"

external activate_default : t -> unit = "ml_gtk_widget_activate_default"

external activate_action_variant : t -> string -> unit -> bool = "ml_gtk_widget_activate_action_variant"

external activate_action : t -> string -> string option -> unit -> bool = "ml_gtk_widget_activate_action"

external activate : t -> bool = "ml_gtk_widget_activate"

external action_set_enabled : t -> string -> bool -> unit = "ml_gtk_widget_action_set_enabled"

