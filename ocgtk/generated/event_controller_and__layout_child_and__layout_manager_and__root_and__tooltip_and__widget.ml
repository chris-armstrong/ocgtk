(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

and layout_child_t = object
  method get_child_widget : unit -> widget_t
  method get_layout_manager : unit -> layout_manager_t
  method as_layout_child : Raw.Layout_child.t
end

and layout_manager_t = object
  method allocate : widget_t -> int -> int -> int -> unit
  method get_layout_child : widget_t -> layout_child_t
  method get_request_mode : unit -> Enums.sizerequestmode
  method get_widget : unit -> widget_t option
  method layout_changed : unit -> unit
  method as_layout_manager : Raw.Layout_manager.t
end

and root_t = object
  method get_display : unit -> Ocgdk.Display.display_t
  method get_focus : unit -> widget_t option
  method set_focus : widget_t option -> unit
  method as_root : Raw.Root.t
end

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

class event_controller (obj : Raw.Event_controller.t) : event_controller_t =
  object (self)
    method get_current_event : unit -> Ocgdk.Event.event_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Event.event ret)
          (Raw.Event_controller.get_current_event obj)

    method get_current_event_device : unit -> Ocgdk.Device.device_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Device.device ret)
          (Raw.Event_controller.get_current_event_device obj)

    method get_current_event_state : unit -> Ocgdk.Enums.modifiertype =
      fun () -> Raw.Event_controller.get_current_event_state obj

    method get_current_event_time : unit -> UInt32.t =
      fun () -> Raw.Event_controller.get_current_event_time obj

    method get_name : unit -> string option =
      fun () -> Raw.Event_controller.get_name obj

    method get_propagation_limit : unit -> Enums.propagationlimit =
      fun () -> Raw.Event_controller.get_propagation_limit obj

    method get_propagation_phase : unit -> Enums.propagationphase =
      fun () -> Raw.Event_controller.get_propagation_phase obj

    method get_widget : unit -> widget_t option =
      fun () ->
        Option.map
          (fun ret -> new widget ret)
          (Raw.Event_controller.get_widget obj)

    method reset : unit -> unit = fun () -> Raw.Event_controller.reset obj

    method set_name : string option -> unit =
      fun name -> Raw.Event_controller.set_name obj name

    method set_propagation_limit : Enums.propagationlimit -> unit =
      fun limit -> Raw.Event_controller.set_propagation_limit obj limit

    method set_propagation_phase : Enums.propagationphase -> unit =
      fun phase -> Raw.Event_controller.set_propagation_phase obj phase

    method set_static_name : string option -> unit =
      fun name -> Raw.Event_controller.set_static_name obj name

    method as_event_controller = obj
  end

and layout_child (obj : Raw.Layout_child.t) : layout_child_t =
  object (self)
    method get_child_widget : unit -> widget_t =
      fun () -> new widget (Raw.Layout_child.get_child_widget obj)

    method get_layout_manager : unit -> layout_manager_t =
      fun () -> new layout_manager (Raw.Layout_child.get_layout_manager obj)

    method as_layout_child = obj
  end

and layout_manager (obj : Raw.Layout_manager.t) : layout_manager_t =
  object (self)
    method allocate : widget_t -> int -> int -> int -> unit =
      fun widget width height baseline ->
        let widget = widget#as_widget in
        Raw.Layout_manager.allocate obj widget width height baseline

    method get_layout_child : widget_t -> layout_child_t =
      fun child ->
        let child = child#as_widget in
        new layout_child (Raw.Layout_manager.get_layout_child obj child)

    method get_request_mode : unit -> Enums.sizerequestmode =
      fun () -> Raw.Layout_manager.get_request_mode obj

    method get_widget : unit -> widget_t option =
      fun () ->
        Option.map
          (fun ret -> new widget ret)
          (Raw.Layout_manager.get_widget obj)

    method layout_changed : unit -> unit =
      fun () -> Raw.Layout_manager.layout_changed obj

    method as_layout_manager = obj
  end

and root (obj : Raw.Root.t) : root_t =
  object (self)
    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Root.get_display obj)

    method get_focus : unit -> widget_t option =
      fun () -> Option.map (fun ret -> new widget ret) (Raw.Root.get_focus obj)

    method set_focus : widget_t option -> unit =
      fun focus ->
        let focus = Option.map (fun c -> c#as_widget) focus in
        Raw.Root.set_focus obj focus

    method as_root = obj
  end

and tooltip (obj : Raw.Tooltip.t) : tooltip_t =
  object (self)
    method set_custom : widget_t option -> unit =
      fun custom_widget ->
        let custom_widget = Option.map (fun c -> c#as_widget) custom_widget in
        Raw.Tooltip.set_custom obj custom_widget

    method set_icon : Ocgdk.Paintable.paintable_t option -> unit =
      fun paintable ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Tooltip.set_icon obj paintable

    method set_icon_from_gicon : Ocgio.Icon.icon_t option -> unit =
      fun gicon ->
        let gicon = Option.map (fun c -> c#as_icon) gicon in
        Raw.Tooltip.set_icon_from_gicon obj gicon

    method set_icon_from_icon_name : string option -> unit =
      fun icon_name -> Raw.Tooltip.set_icon_from_icon_name obj icon_name

    method set_markup : string option -> unit =
      fun markup -> Raw.Tooltip.set_markup obj markup

    method set_text : string option -> unit =
      fun text -> Raw.Tooltip.set_text obj text

    method set_tip_area : Ocgdk.Rectangle.rectangle_t -> unit =
      fun rect ->
        let rect = rect#as_rectangle in
        Raw.Tooltip.set_tip_area obj rect

    method as_tooltip = obj
  end

and widget (obj : Raw.Widget.t) : widget_t =
  object (self)
    inherit
      At_context_and__accessible.accessible (Raw.Accessible.from_gobject obj)

    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    inherit
      Constraint_target.constraint_target
        (Raw.Constraint_target.from_gobject obj)

    method on_destroy ?(after = false) ~callback () =
      Raw.Widget.on_destroy ~after self#as_widget ~callback

    method on_direction_changed ?(after = false) ~callback () =
      Raw.Widget.on_direction_changed ~after self#as_widget ~callback

    method on_hide ?(after = false) ~callback () =
      Raw.Widget.on_hide ~after self#as_widget ~callback

    method on_keynav_failed ?(after = false) ~callback () =
      Raw.Widget.on_keynav_failed ~after self#as_widget ~callback

    method on_map ?(after = false) ~callback () =
      Raw.Widget.on_map ~after self#as_widget ~callback

    method on_mnemonic_activate ?(after = false) ~callback () =
      Raw.Widget.on_mnemonic_activate ~after self#as_widget ~callback

    method on_move_focus ?(after = false) ~callback () =
      Raw.Widget.on_move_focus ~after self#as_widget ~callback

    method on_query_tooltip ?(after = false) ~callback () =
      Raw.Widget.on_query_tooltip ~after self#as_widget
        ~callback:(fun ~x ~y ~keyboard_mode ~tooltip ->
          callback ~x ~y ~keyboard_mode ~tooltip:(new tooltip tooltip))

    method on_realize ?(after = false) ~callback () =
      Raw.Widget.on_realize ~after self#as_widget ~callback

    method on_show ?(after = false) ~callback () =
      Raw.Widget.on_show ~after self#as_widget ~callback

    method on_state_flags_changed ?(after = false) ~callback () =
      Raw.Widget.on_state_flags_changed ~after self#as_widget ~callback

    method on_unmap ?(after = false) ~callback () =
      Raw.Widget.on_unmap ~after self#as_widget ~callback

    method on_unrealize ?(after = false) ~callback () =
      Raw.Widget.on_unrealize ~after self#as_widget ~callback

    method action_set_enabled : string -> bool -> unit =
      fun action_name enabled ->
        Raw.Widget.action_set_enabled obj action_name enabled

    method activate : unit -> bool = fun () -> Raw.Widget.activate obj

    method activate_action_variant : string -> Gvariant.t option -> bool =
      fun name args -> Raw.Widget.activate_action_variant obj name args

    method activate_default : unit -> unit =
      fun () -> Raw.Widget.activate_default obj

    method add_controller : event_controller_t -> unit =
      fun controller ->
        let controller = controller#as_event_controller in
        Raw.Widget.add_controller obj controller

    method add_css_class : string -> unit =
      fun css_class -> Raw.Widget.add_css_class obj css_class

    method add_mnemonic_label : widget_t -> unit =
      fun label ->
        let label = label#as_widget in
        Raw.Widget.add_mnemonic_label obj label

    method allocate :
        int -> int -> int -> Ocgsk.Transform.transform_t option -> unit =
      fun width height baseline transform ->
        let transform = Option.map (fun c -> c#as_transform) transform in
        Raw.Widget.allocate obj width height baseline transform

    method child_focus : Enums.directiontype -> bool =
      fun direction -> Raw.Widget.child_focus obj direction

    method compute_expand : Enums.orientation -> bool =
      fun orientation -> Raw.Widget.compute_expand obj orientation

    method contains : float -> float -> bool =
      fun x y -> Raw.Widget.contains obj x y

    method create_pango_context : unit -> Ocpango.Context.context_t =
      fun () ->
        new Ocpango.Context.context (Raw.Widget.create_pango_context obj)

    method create_pango_layout : string option -> Ocpango.Layout.layout_t =
      fun text ->
        new Ocpango.Layout.layout (Raw.Widget.create_pango_layout obj text)

    method dispose_template : Gobject.Type.t -> unit =
      fun widget_type -> Raw.Widget.dispose_template obj widget_type

    method drag_check_threshold : int -> int -> int -> int -> bool =
      fun start_x start_y current_x current_y ->
        Raw.Widget.drag_check_threshold obj start_x start_y current_x current_y

    method error_bell : unit -> unit = fun () -> Raw.Widget.error_bell obj

    method get_allocated_baseline : unit -> int =
      fun () -> Raw.Widget.get_allocated_baseline obj

    method get_allocated_height : unit -> int =
      fun () -> Raw.Widget.get_allocated_height obj

    method get_allocated_width : unit -> int =
      fun () -> Raw.Widget.get_allocated_width obj

    method get_ancestor : Gobject.Type.t -> widget_t option =
      fun widget_type ->
        Option.map
          (fun ret -> new widget ret)
          (Raw.Widget.get_ancestor obj widget_type)

    method get_baseline : unit -> int = fun () -> Raw.Widget.get_baseline obj
    method get_can_focus : unit -> bool = fun () -> Raw.Widget.get_can_focus obj

    method get_can_target : unit -> bool =
      fun () -> Raw.Widget.get_can_target obj

    method get_child_visible : unit -> bool =
      fun () -> Raw.Widget.get_child_visible obj

    method get_clipboard : unit -> Ocgdk.Clipboard.clipboard_t =
      fun () -> new Ocgdk.Clipboard.clipboard (Raw.Widget.get_clipboard obj)

    method get_css_classes : unit -> string array =
      fun () -> Raw.Widget.get_css_classes obj

    method get_css_name : unit -> string = fun () -> Raw.Widget.get_css_name obj

    method get_cursor : unit -> Ocgdk.Cursor.cursor_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Cursor.cursor ret)
          (Raw.Widget.get_cursor obj)

    method get_direction : unit -> Enums.textdirection =
      fun () -> Raw.Widget.get_direction obj

    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Widget.get_display obj)

    method get_first_child : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_first_child obj)

    method get_focus_child : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_focus_child obj)

    method get_focus_on_click : unit -> bool =
      fun () -> Raw.Widget.get_focus_on_click obj

    method get_focusable : unit -> bool = fun () -> Raw.Widget.get_focusable obj

    method get_font_map : unit -> Ocpango.Font_map.font_map_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_map.font_map ret)
          (Raw.Widget.get_font_map obj)

    method get_font_options : unit -> Occairo.Font_options.font_options_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Font_options.font_options ret)
          (Raw.Widget.get_font_options obj)

    method get_frame_clock : unit -> Ocgdk.Frame_clock.frame_clock_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Frame_clock.frame_clock ret)
          (Raw.Widget.get_frame_clock obj)

    method get_halign : unit -> Enums.align =
      fun () -> Raw.Widget.get_halign obj

    method get_has_tooltip : unit -> bool =
      fun () -> Raw.Widget.get_has_tooltip obj

    method get_height : unit -> int = fun () -> Raw.Widget.get_height obj
    method get_hexpand : unit -> bool = fun () -> Raw.Widget.get_hexpand obj

    method get_hexpand_set : unit -> bool =
      fun () -> Raw.Widget.get_hexpand_set obj

    method get_last_child : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_last_child obj)

    method get_layout_manager : unit -> layout_manager_t option =
      fun () ->
        Option.map
          (fun ret -> new layout_manager ret)
          (Raw.Widget.get_layout_manager obj)

    method get_limit_events : unit -> bool =
      fun () -> Raw.Widget.get_limit_events obj

    method get_mapped : unit -> bool = fun () -> Raw.Widget.get_mapped obj

    method get_margin_bottom : unit -> int =
      fun () -> Raw.Widget.get_margin_bottom obj

    method get_margin_end : unit -> int =
      fun () -> Raw.Widget.get_margin_end obj

    method get_margin_start : unit -> int =
      fun () -> Raw.Widget.get_margin_start obj

    method get_margin_top : unit -> int =
      fun () -> Raw.Widget.get_margin_top obj

    method get_name : unit -> string = fun () -> Raw.Widget.get_name obj

    method get_native : unit -> Native.native_t option =
      fun () ->
        Option.map
          (fun ret -> new Native.native ret)
          (Raw.Widget.get_native obj)

    method get_next_sibling : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_next_sibling obj)

    method get_opacity : unit -> float = fun () -> Raw.Widget.get_opacity obj

    method get_overflow : unit -> Enums.overflow =
      fun () -> Raw.Widget.get_overflow obj

    method get_pango_context : unit -> Ocpango.Context.context_t =
      fun () -> new Ocpango.Context.context (Raw.Widget.get_pango_context obj)

    method get_parent : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_parent obj)

    method get_prev_sibling : unit -> widget_t option =
      fun () ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.get_prev_sibling obj)

    method get_primary_clipboard : unit -> Ocgdk.Clipboard.clipboard_t =
      fun () ->
        new Ocgdk.Clipboard.clipboard (Raw.Widget.get_primary_clipboard obj)

    method get_realized : unit -> bool = fun () -> Raw.Widget.get_realized obj

    method get_receives_default : unit -> bool =
      fun () -> Raw.Widget.get_receives_default obj

    method get_request_mode : unit -> Enums.sizerequestmode =
      fun () -> Raw.Widget.get_request_mode obj

    method get_root : unit -> root_t option =
      fun () -> Option.map (fun ret -> new root ret) (Raw.Widget.get_root obj)

    method get_scale_factor : unit -> int =
      fun () -> Raw.Widget.get_scale_factor obj

    method get_sensitive : unit -> bool = fun () -> Raw.Widget.get_sensitive obj

    method get_settings : unit -> Settings.settings_t =
      fun () -> new Settings.settings (Raw.Widget.get_settings obj)

    method get_size : Enums.orientation -> int =
      fun orientation -> Raw.Widget.get_size obj orientation

    method get_state_flags : unit -> Enums.stateflags =
      fun () -> Raw.Widget.get_state_flags obj

    method get_style_context : unit -> Style_context.style_context_t =
      fun () ->
        new Style_context.style_context (Raw.Widget.get_style_context obj)

    method get_template_child :
        Gobject.Type.t -> string -> [ `object_ ] Gobject.obj =
      fun widget_type name -> Raw.Widget.get_template_child obj widget_type name

    method get_tooltip_markup : unit -> string option =
      fun () -> Raw.Widget.get_tooltip_markup obj

    method get_tooltip_text : unit -> string option =
      fun () -> Raw.Widget.get_tooltip_text obj

    method get_valign : unit -> Enums.align =
      fun () -> Raw.Widget.get_valign obj

    method get_vexpand : unit -> bool = fun () -> Raw.Widget.get_vexpand obj

    method get_vexpand_set : unit -> bool =
      fun () -> Raw.Widget.get_vexpand_set obj

    method get_visible : unit -> bool = fun () -> Raw.Widget.get_visible obj
    method get_width : unit -> int = fun () -> Raw.Widget.get_width obj
    method grab_focus : unit -> bool = fun () -> Raw.Widget.grab_focus obj

    method has_css_class : string -> bool =
      fun css_class -> Raw.Widget.has_css_class obj css_class

    method has_default : unit -> bool = fun () -> Raw.Widget.has_default obj
    method has_focus : unit -> bool = fun () -> Raw.Widget.has_focus obj

    method has_visible_focus : unit -> bool =
      fun () -> Raw.Widget.has_visible_focus obj

    method hide : unit -> unit = fun () -> Raw.Widget.hide obj

    method in_destruction : unit -> bool =
      fun () -> Raw.Widget.in_destruction obj

    method init_template : unit -> unit = fun () -> Raw.Widget.init_template obj

    method insert_action_group :
        string -> Ocgio.Action_group.action_group_t option -> unit =
      fun name group ->
        let group = Option.map (fun c -> c#as_action_group) group in
        Raw.Widget.insert_action_group obj name group

    method insert_after : widget_t -> widget_t option -> unit =
      fun parent previous_sibling ->
        let parent = parent#as_widget in
        let previous_sibling =
          Option.map (fun c -> c#as_widget) previous_sibling
        in
        Raw.Widget.insert_after obj parent previous_sibling

    method insert_before : widget_t -> widget_t option -> unit =
      fun parent next_sibling ->
        let parent = parent#as_widget in
        let next_sibling = Option.map (fun c -> c#as_widget) next_sibling in
        Raw.Widget.insert_before obj parent next_sibling

    method is_ancestor : widget_t -> bool =
      fun ancestor ->
        let ancestor = ancestor#as_widget in
        Raw.Widget.is_ancestor obj ancestor

    method is_drawable : unit -> bool = fun () -> Raw.Widget.is_drawable obj
    method is_focus : unit -> bool = fun () -> Raw.Widget.is_focus obj
    method is_sensitive : unit -> bool = fun () -> Raw.Widget.is_sensitive obj
    method is_visible : unit -> bool = fun () -> Raw.Widget.is_visible obj

    method keynav_failed : Enums.directiontype -> bool =
      fun direction -> Raw.Widget.keynav_failed obj direction

    method list_mnemonic_labels : unit -> widget_t list =
      fun () ->
        (List.map (fun ret -> new widget ret))
          (Raw.Widget.list_mnemonic_labels obj)

    method map : unit -> unit = fun () -> Raw.Widget.map obj

    method mnemonic_activate : bool -> bool =
      fun group_cycling -> Raw.Widget.mnemonic_activate obj group_cycling

    method observe_children : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Widget.observe_children obj)

    method observe_controllers : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Widget.observe_controllers obj)

    method pick : float -> float -> Enums.pickflags -> widget_t option =
      fun x y flags ->
        Option.map (fun ret -> new widget ret) (Raw.Widget.pick obj x y flags)

    method queue_allocate : unit -> unit =
      fun () -> Raw.Widget.queue_allocate obj

    method queue_draw : unit -> unit = fun () -> Raw.Widget.queue_draw obj
    method queue_resize : unit -> unit = fun () -> Raw.Widget.queue_resize obj
    method realize : unit -> unit = fun () -> Raw.Widget.realize obj

    method remove_controller : event_controller_t -> unit =
      fun controller ->
        let controller = controller#as_event_controller in
        Raw.Widget.remove_controller obj controller

    method remove_css_class : string -> unit =
      fun css_class -> Raw.Widget.remove_css_class obj css_class

    method remove_mnemonic_label : widget_t -> unit =
      fun label ->
        let label = label#as_widget in
        Raw.Widget.remove_mnemonic_label obj label

    method remove_tick_callback : int -> unit =
      fun id -> Raw.Widget.remove_tick_callback obj id

    method set_can_focus : bool -> unit =
      fun can_focus -> Raw.Widget.set_can_focus obj can_focus

    method set_can_target : bool -> unit =
      fun can_target -> Raw.Widget.set_can_target obj can_target

    method set_child_visible : bool -> unit =
      fun child_visible -> Raw.Widget.set_child_visible obj child_visible

    method set_css_classes : string array -> unit =
      fun classes -> Raw.Widget.set_css_classes obj classes

    method set_cursor : Ocgdk.Cursor.cursor_t option -> unit =
      fun cursor ->
        let cursor = Option.map (fun c -> c#as_cursor) cursor in
        Raw.Widget.set_cursor obj cursor

    method set_cursor_from_name : string option -> unit =
      fun name -> Raw.Widget.set_cursor_from_name obj name

    method set_direction : Enums.textdirection -> unit =
      fun dir -> Raw.Widget.set_direction obj dir

    method set_focus_child : widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Widget.set_focus_child obj child

    method set_focus_on_click : bool -> unit =
      fun focus_on_click -> Raw.Widget.set_focus_on_click obj focus_on_click

    method set_focusable : bool -> unit =
      fun focusable -> Raw.Widget.set_focusable obj focusable

    method set_font_map : Ocpango.Font_map.font_map_t option -> unit =
      fun font_map ->
        let font_map = Option.map (fun c -> c#as_font_map) font_map in
        Raw.Widget.set_font_map obj font_map

    method set_font_options : Occairo.Font_options.font_options_t option -> unit
        =
      fun options ->
        let options = Option.map (fun c -> c#as_font_options) options in
        Raw.Widget.set_font_options obj options

    method set_halign : Enums.align -> unit =
      fun align -> Raw.Widget.set_halign obj align

    method set_has_tooltip : bool -> unit =
      fun has_tooltip -> Raw.Widget.set_has_tooltip obj has_tooltip

    method set_hexpand : bool -> unit =
      fun expand -> Raw.Widget.set_hexpand obj expand

    method set_hexpand_set : bool -> unit =
      fun set -> Raw.Widget.set_hexpand_set obj set

    method set_layout_manager : layout_manager_t option -> unit =
      fun layout_manager ->
        let layout_manager =
          Option.map (fun c -> c#as_layout_manager) layout_manager
        in
        Raw.Widget.set_layout_manager obj layout_manager

    method set_limit_events : bool -> unit =
      fun limit_events -> Raw.Widget.set_limit_events obj limit_events

    method set_margin_bottom : int -> unit =
      fun margin -> Raw.Widget.set_margin_bottom obj margin

    method set_margin_end : int -> unit =
      fun margin -> Raw.Widget.set_margin_end obj margin

    method set_margin_start : int -> unit =
      fun margin -> Raw.Widget.set_margin_start obj margin

    method set_margin_top : int -> unit =
      fun margin -> Raw.Widget.set_margin_top obj margin

    method set_name : string -> unit = fun name -> Raw.Widget.set_name obj name

    method set_opacity : float -> unit =
      fun opacity -> Raw.Widget.set_opacity obj opacity

    method set_overflow : Enums.overflow -> unit =
      fun overflow -> Raw.Widget.set_overflow obj overflow

    method set_parent : widget_t -> unit =
      fun parent ->
        let parent = parent#as_widget in
        Raw.Widget.set_parent obj parent

    method set_receives_default : bool -> unit =
      fun receives_default ->
        Raw.Widget.set_receives_default obj receives_default

    method set_sensitive : bool -> unit =
      fun sensitive -> Raw.Widget.set_sensitive obj sensitive

    method set_size_request : int -> int -> unit =
      fun width height -> Raw.Widget.set_size_request obj width height

    method set_state_flags : Enums.stateflags -> bool -> unit =
      fun flags clear -> Raw.Widget.set_state_flags obj flags clear

    method set_tooltip_markup : string option -> unit =
      fun markup -> Raw.Widget.set_tooltip_markup obj markup

    method set_tooltip_text : string option -> unit =
      fun text -> Raw.Widget.set_tooltip_text obj text

    method set_valign : Enums.align -> unit =
      fun align -> Raw.Widget.set_valign obj align

    method set_vexpand : bool -> unit =
      fun expand -> Raw.Widget.set_vexpand obj expand

    method set_vexpand_set : bool -> unit =
      fun set -> Raw.Widget.set_vexpand_set obj set

    method set_visible : bool -> unit =
      fun visible -> Raw.Widget.set_visible obj visible

    method should_layout : unit -> bool = fun () -> Raw.Widget.should_layout obj
    method show : unit -> unit = fun () -> Raw.Widget.show obj

    method snapshot_child : widget_t -> Snapshot.snapshot_t -> unit =
      fun child snapshot ->
        let child = child#as_widget in
        let snapshot = snapshot#as_snapshot in
        Raw.Widget.snapshot_child obj child snapshot

    method trigger_tooltip_query : unit -> unit =
      fun () -> Raw.Widget.trigger_tooltip_query obj

    method unmap : unit -> unit = fun () -> Raw.Widget.unmap obj
    method unparent : unit -> unit = fun () -> Raw.Widget.unparent obj
    method unrealize : unit -> unit = fun () -> Raw.Widget.unrealize obj

    method unset_state_flags : Enums.stateflags -> unit =
      fun flags -> Raw.Widget.unset_state_flags obj flags

    method height_request = Raw.Widget.get_height_request obj
    method set_height_request v = Raw.Widget.set_height_request obj v
    method width_request = Raw.Widget.get_width_request obj
    method set_width_request v = Raw.Widget.set_width_request obj v
    method as_widget = obj
  end
