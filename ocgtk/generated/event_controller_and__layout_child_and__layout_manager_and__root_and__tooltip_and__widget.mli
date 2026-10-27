(** The classes of {!Ocgtk.Event_controller}, {!Ocgtk.Layout_child},
    {!Ocgtk.Layout_manager}, {!Ocgtk.Root}, {!Ocgtk.Tooltip}, {!Ocgtk.Widget},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GtkEventController]. *)
class type event_controller_t = object
  method get_current_event : unit -> Ocgdk.Event.event_t option
  method get_current_event_device : unit -> Ocgdk.Device.device_t option
  method get_current_event_state : unit -> Ocgdk.Enums.modifiertype
  method get_current_event_time : unit -> UInt32.t
  method get_name : unit -> string option
  method get_propagation_limit : unit -> Enums.propagationlimit
  method get_propagation_phase : unit -> Enums.propagationphase
  method get_widget : unit -> widget_t option
  method reset : unit -> unit
  method set_name : string option -> unit
  method set_propagation_limit : Enums.propagationlimit -> unit
  method set_propagation_phase : Enums.propagationphase -> unit
  method set_static_name : string option -> unit
  method as_event_controller : Raw.Event_controller.t
end

(** The methods, signals and properties of a [GtkLayoutChild]. *)
and layout_child_t = object
  method get_child_widget : unit -> widget_t
  method get_layout_manager : unit -> layout_manager_t
  method as_layout_child : Raw.Layout_child.t
end

(** The methods, signals and properties of a [GtkLayoutManager]. *)
and layout_manager_t = object
  method allocate : widget_t -> int -> int -> int -> unit
  method get_layout_child : widget_t -> layout_child_t
  method get_request_mode : unit -> Enums.sizerequestmode
  method get_widget : unit -> widget_t option
  method layout_changed : unit -> unit
  method as_layout_manager : Raw.Layout_manager.t
end

(** The methods, signals and properties of a [GtkRoot]. *)
and root_t = object
  method get_display : unit -> Ocgdk.Display.display_t
  method get_focus : unit -> widget_t option
  method set_focus : widget_t option -> unit
  method as_root : Raw.Root.t
end

(** The methods, signals and properties of a [GtkTooltip]. *)
and tooltip_t = object
  method set_custom : widget_t option -> unit
  method set_icon : Ocgdk.Paintable.paintable_t option -> unit
  method set_icon_from_gicon : Ocgio.Icon.icon_t option -> unit
  method set_icon_from_icon_name : string option -> unit
  method set_markup : string option -> unit
  method set_text : string option -> unit
  method set_tip_area : Ocgdk.Rectangle.rectangle_t -> unit
  method as_tooltip : Raw.Tooltip.t
end

(** The methods, signals and properties of a [GtkWidget]. *)
and widget_t = object
  inherit At_context_and__accessible.accessible_t
  inherit Buildable.buildable_t
  inherit Constraint_target.constraint_target_t

  method on_destroy :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_direction_changed :
    ?after:bool ->
    callback:(previous_direction:Enums.textdirection -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_hide :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_keynav_failed :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_map :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_mnemonic_activate :
    ?after:bool ->
    callback:(group_cycling:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_query_tooltip :
    ?after:bool ->
    callback:(x:int -> y:int -> keyboard_mode:bool -> tooltip:tooltip_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_realize :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_show :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_state_flags_changed :
    ?after:bool ->
    callback:(flags:Enums.stateflags -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_unmap :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unrealize :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method action_set_enabled : string -> bool -> unit
  method activate : unit -> bool
  method activate_action_variant : string -> Gvariant.t option -> bool
  method activate_default : unit -> unit
  method add_controller : event_controller_t -> unit
  method add_css_class : string -> unit
  method add_mnemonic_label : widget_t -> unit

  method allocate :
    int -> int -> int -> Ocgsk.Transform.transform_t option -> unit

  method child_focus : Enums.directiontype -> bool
  method compute_expand : Enums.orientation -> bool
  method contains : float -> float -> bool
  method create_pango_context : unit -> Ocpango.Context.context_t
  method create_pango_layout : string option -> Ocpango.Layout.layout_t
  method dispose_template : Gobject.Type.t -> unit
  method drag_check_threshold : int -> int -> int -> int -> bool
  method error_bell : unit -> unit
  method get_allocated_baseline : unit -> int
  method get_allocated_height : unit -> int
  method get_allocated_width : unit -> int
  method get_ancestor : Gobject.Type.t -> widget_t option
  method get_baseline : unit -> int
  method get_can_focus : unit -> bool
  method get_can_target : unit -> bool
  method get_child_visible : unit -> bool
  method get_clipboard : unit -> Ocgdk.Clipboard.clipboard_t
  method get_css_classes : unit -> string array
  method get_css_name : unit -> string
  method get_cursor : unit -> Ocgdk.Cursor.cursor_t option
  method get_direction : unit -> Enums.textdirection
  method get_display : unit -> Ocgdk.Display.display_t
  method get_first_child : unit -> widget_t option
  method get_focus_child : unit -> widget_t option
  method get_focus_on_click : unit -> bool
  method get_focusable : unit -> bool
  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  method get_font_options : unit -> Occairo.Font_options.font_options_t option
  method get_frame_clock : unit -> Ocgdk.Frame_clock.frame_clock_t option
  method get_halign : unit -> Enums.align
  method get_has_tooltip : unit -> bool
  method get_height : unit -> int
  method get_hexpand : unit -> bool
  method get_hexpand_set : unit -> bool
  method get_last_child : unit -> widget_t option
  method get_layout_manager : unit -> layout_manager_t option
  method get_limit_events : unit -> bool
  method get_mapped : unit -> bool
  method get_margin_bottom : unit -> int
  method get_margin_end : unit -> int
  method get_margin_start : unit -> int
  method get_margin_top : unit -> int
  method get_name : unit -> string
  method get_native : unit -> Native.native_t option
  method get_next_sibling : unit -> widget_t option
  method get_opacity : unit -> float
  method get_overflow : unit -> Enums.overflow
  method get_pango_context : unit -> Ocpango.Context.context_t
  method get_parent : unit -> widget_t option
  method get_prev_sibling : unit -> widget_t option
  method get_primary_clipboard : unit -> Ocgdk.Clipboard.clipboard_t
  method get_realized : unit -> bool
  method get_receives_default : unit -> bool
  method get_request_mode : unit -> Enums.sizerequestmode
  method get_root : unit -> root_t option
  method get_scale_factor : unit -> int
  method get_sensitive : unit -> bool
  method get_settings : unit -> Settings.settings_t
  method get_size : Enums.orientation -> int
  method get_state_flags : unit -> Enums.stateflags
  method get_style_context : unit -> Style_context.style_context_t

  method get_template_child :
    Gobject.Type.t -> string -> [ `object_ ] Gobject.obj

  method get_tooltip_markup : unit -> string option
  method get_tooltip_text : unit -> string option
  method get_valign : unit -> Enums.align
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

  method insert_action_group :
    string -> Ocgio.Action_group.action_group_t option -> unit

  method insert_after : widget_t -> widget_t option -> unit
  method insert_before : widget_t -> widget_t option -> unit
  method is_ancestor : widget_t -> bool
  method is_drawable : unit -> bool
  method is_focus : unit -> bool
  method is_sensitive : unit -> bool
  method is_visible : unit -> bool
  method keynav_failed : Enums.directiontype -> bool
  method list_mnemonic_labels : unit -> widget_t list
  method map : unit -> unit
  method mnemonic_activate : bool -> bool
  method observe_children : unit -> Ocgio.List_model.list_model_t
  method observe_controllers : unit -> Ocgio.List_model.list_model_t
  method pick : float -> float -> Enums.pickflags -> widget_t option
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
  method set_cursor : Ocgdk.Cursor.cursor_t option -> unit
  method set_cursor_from_name : string option -> unit
  method set_direction : Enums.textdirection -> unit
  method set_focus_child : widget_t option -> unit
  method set_focus_on_click : bool -> unit
  method set_focusable : bool -> unit
  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  method set_font_options : Occairo.Font_options.font_options_t option -> unit
  method set_halign : Enums.align -> unit
  method set_has_tooltip : bool -> unit
  method set_hexpand : bool -> unit
  method set_hexpand_set : bool -> unit
  method set_layout_manager : layout_manager_t option -> unit
  method set_limit_events : bool -> unit
  method set_margin_bottom : int -> unit
  method set_margin_end : int -> unit
  method set_margin_start : int -> unit
  method set_margin_top : int -> unit
  method set_name : string -> unit
  method set_opacity : float -> unit
  method set_overflow : Enums.overflow -> unit
  method set_parent : widget_t -> unit
  method set_receives_default : bool -> unit
  method set_sensitive : bool -> unit
  method set_size_request : int -> int -> unit
  method set_state_flags : Enums.stateflags -> bool -> unit
  method set_tooltip_markup : string option -> unit
  method set_tooltip_text : string option -> unit
  method set_valign : Enums.align -> unit
  method set_vexpand : bool -> unit
  method set_vexpand_set : bool -> unit
  method set_visible : bool -> unit
  method should_layout : unit -> bool
  method show : unit -> unit
  method snapshot_child : widget_t -> Snapshot.snapshot_t -> unit
  method trigger_tooltip_query : unit -> unit
  method unmap : unit -> unit
  method unparent : unit -> unit
  method unrealize : unit -> unit
  method unset_state_flags : Enums.stateflags -> unit
  method height_request : int
  method set_height_request : int -> unit
  method width_request : int
  method set_width_request : int -> unit
  method as_widget : Raw.Widget.t
end

(** Wraps a layer 1 handle, {!Ocgtk.Raw.Event_controller.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkEventController], give one already wrapped. *)
class event_controller : Raw.Event_controller.t -> event_controller_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Layout_child.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLayoutChild], give one already wrapped. *)

and layout_child : Raw.Layout_child.t -> layout_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Layout_manager.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkLayoutManager], give one already wrapped. *)

and layout_manager : Raw.Layout_manager.t -> layout_manager_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Root.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRoot], give one already wrapped. *)

and root : Raw.Root.t -> root_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tooltip.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTooltip], give one already wrapped. *)

and tooltip : Raw.Tooltip.t -> tooltip_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Widget.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkWidget], give one already wrapped. *)

and widget : Raw.Widget.t -> widget_t
