(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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


class event_controller (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t) : event_controller_t = object (self)

  method get_current_event : unit -> Ocgtk_gdk.Gdk.Event.event_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Event.event ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_current_event obj)

  method get_current_event_device : unit -> Ocgtk_gdk.Gdk.Device.device_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Device.device ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_current_event_device obj)

  method get_current_event_state : unit -> Ocgtk_gdk.Gdk.modifiertype =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_current_event_state obj)

  method get_name : unit -> string option =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_name obj)

  method get_propagation_limit : unit -> Gtk_enums.propagationlimit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_propagation_limit obj)

  method get_propagation_phase : unit -> Gtk_enums.propagationphase =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_propagation_phase obj)

  method get_widget : unit -> widget_t =
    fun () ->
      new  widget(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_widget obj)

  method reset : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.reset obj)

  method set_name : string option -> unit =
    fun name ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_name obj name)

  method set_propagation_limit : Gtk_enums.propagationlimit -> unit =
    fun limit ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_propagation_limit obj limit)

  method set_propagation_phase : Gtk_enums.propagationphase -> unit =
    fun phase ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_propagation_phase obj phase)

  method set_static_name : string option -> unit =
    fun name ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_static_name obj name)

    method as_event_controller = obj
end

and layout_child (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t) : layout_child_t = object (self)

  method get_child_widget : unit -> widget_t =
    fun () ->
      new  widget(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.get_child_widget obj)

  method get_layout_manager : unit -> layout_manager_t =
    fun () ->
      new  layout_manager(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.get_layout_manager obj)

    method as_layout_child = obj
end

and layout_manager (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t) : layout_manager_t = object (self)

  method allocate : widget_t -> int -> int -> int -> unit =
    fun widget width height baseline ->
      let widget = widget#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.allocate obj widget width height baseline)

  method get_layout_child : widget_t -> layout_child_t =
    fun child ->
      let child = child#as_widget in
      new  layout_child(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_layout_child obj child)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_request_mode obj)

  method get_widget : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_widget obj)

  method layout_changed : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.layout_changed obj)

    method as_layout_manager = obj
end

and root (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t) : root_t = object (self)

  method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Display.display(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.get_display obj)

  method get_focus : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.get_focus obj)

  method set_focus : widget_t option -> unit =
    fun focus ->
      let focus = Option.map (fun (c) -> c#as_widget) focus in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.set_focus obj focus)

    method as_root = obj
end
(* Signal class defined in gwidget_signals.ml *)


and widget (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t) : widget_t = object (self)
  inherit GAt_context_and__accessible.accessible (At_context_and__accessible.Accessible.from_gobject obj)
  inherit GBuildable.buildable (Buildable.from_gobject obj)
  inherit GConstraint_target.constraint_target (Constraint_target.from_gobject obj)
  inherit Gwidget_signals.widget_signals obj

  method action_set_enabled : string -> bool -> unit =
    fun action_name enabled ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.action_set_enabled obj action_name enabled)

  method activate : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.activate obj)

  method activate_default : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.activate_default obj)

  method add_controller : event_controller_t -> unit =
    fun controller ->
      let controller = controller#as_event_controller in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_controller obj controller)

  method add_css_class : string -> unit =
    fun css_class ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_css_class obj css_class)

  method add_mnemonic_label : widget_t -> unit =
    fun label ->
      let label = label#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_mnemonic_label obj label)

  method allocate : int -> int -> int -> Ocgtk_gsk.Gsk.Transform.transform_t option -> unit =
    fun width height baseline transform ->
      let transform = Option.map (fun (c) -> c#as_transform) transform in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.allocate obj width height baseline transform)

  method child_focus : Gtk_enums.directiontype -> bool =
    fun direction ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.child_focus obj direction)

  method compute_expand : Gtk_enums.orientation -> bool =
    fun orientation ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.compute_expand obj orientation)

  method contains : float -> float -> bool =
    fun x y ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.contains obj x y)

  method create_pango_context : unit -> Ocgtk_pango.Pango.Context.context_t =
    fun () ->
      new  Ocgtk_pango.Pango.Context.context(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.create_pango_context obj)

  method create_pango_layout : string option -> Ocgtk_pango.Pango.Layout.layout_t =
    fun text ->
      new  Ocgtk_pango.Pango.Layout.layout(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.create_pango_layout obj text)

  method drag_check_threshold : int -> int -> int -> int -> bool =
    fun start_x start_y current_x current_y ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.drag_check_threshold obj start_x start_y current_x current_y)

  method error_bell : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.error_bell obj)

  method get_allocated_baseline : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_baseline obj)

  method get_allocated_height : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_height obj)

  method get_allocated_width : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_width obj)

  method get_baseline : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_baseline obj)

  method get_can_focus : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_can_focus obj)

  method get_can_target : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_can_target obj)

  method get_child_visible : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_child_visible obj)

  method get_clipboard : unit -> Ocgtk_gdk.Gdk.Clipboard.clipboard_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Clipboard.clipboard(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_clipboard obj)

  method get_css_classes : unit -> string array =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_css_classes obj)

  method get_css_name : unit -> string =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_css_name obj)

  method get_cursor : unit -> Ocgtk_gdk.Gdk.Cursor.cursor_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Cursor.cursor ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_cursor obj)

  method get_direction : unit -> Gtk_enums.textdirection =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_direction obj)

  method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Display.display(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_display obj)

  method get_first_child : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_first_child obj)

  method get_focus_child : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focus_child obj)

  method get_focus_on_click : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focus_on_click obj)

  method get_focusable : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focusable obj)

  method get_font_map : unit -> Ocgtk_pango.Pango.Font_map.font_map_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Font_map.font_map ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_font_map obj)

  method get_font_options : unit -> Ocgtk_cairo.Cairo.Font_options.font_options_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_cairo.Cairo.Font_options.font_options ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_font_options obj)

  method get_frame_clock : unit -> Ocgtk_gdk.Gdk.Frame_clock.frame_clock_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Frame_clock.frame_clock ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_frame_clock obj)

  method get_halign : unit -> Gtk_enums.align =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_halign obj)

  method get_has_tooltip : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_has_tooltip obj)

  method get_height : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_height obj)

  method get_hexpand : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_hexpand obj)

  method get_hexpand_set : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_hexpand_set obj)

  method get_last_child : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_last_child obj)

  method get_layout_manager : unit -> layout_manager_t option =
    fun () ->
      Option.map (fun ret -> new layout_manager ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_layout_manager obj)

  method get_mapped : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_mapped obj)

  method get_margin_bottom : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_bottom obj)

  method get_margin_end : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_end obj)

  method get_margin_start : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_start obj)

  method get_margin_top : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_top obj)

  method get_name : unit -> string =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_name obj)

  method get_native : unit -> GNative.native_t option =
    fun () ->
      Option.map (fun ret -> new GNative.native ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_native obj)

  method get_next_sibling : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_next_sibling obj)

  method get_opacity : unit -> float =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_opacity obj)

  method get_overflow : unit -> Gtk_enums.overflow =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_overflow obj)

  method get_pango_context : unit -> Ocgtk_pango.Pango.Context.context_t =
    fun () ->
      new  Ocgtk_pango.Pango.Context.context(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_pango_context obj)

  method get_parent : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_parent obj)

  method get_prev_sibling : unit -> widget_t option =
    fun () ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_prev_sibling obj)

  method get_primary_clipboard : unit -> Ocgtk_gdk.Gdk.Clipboard.clipboard_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Clipboard.clipboard(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_primary_clipboard obj)

  method get_realized : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_realized obj)

  method get_receives_default : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_receives_default obj)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_request_mode obj)

  method get_root : unit -> root_t option =
    fun () ->
      Option.map (fun ret -> new root ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_root obj)

  method get_scale_factor : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_scale_factor obj)

  method get_sensitive : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_sensitive obj)

  method get_settings : unit -> GSettings.settings_t =
    fun () ->
      new  GSettings.settings(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_settings obj)

  method get_size : Gtk_enums.orientation -> int =
    fun orientation ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_size obj orientation)

  method get_state_flags : unit -> Gtk_enums.stateflags =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_state_flags obj)

  method get_style_context : unit -> GStyle_context.style_context_t =
    fun () ->
      new  GStyle_context.style_context(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_style_context obj)

  method get_tooltip_markup : unit -> string option =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_tooltip_markup obj)

  method get_tooltip_text : unit -> string option =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_tooltip_text obj)

  method get_valign : unit -> Gtk_enums.align =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_valign obj)

  method get_vexpand : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_vexpand obj)

  method get_vexpand_set : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_vexpand_set obj)

  method get_visible : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_visible obj)

  method get_width : unit -> int =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_width obj)

  method grab_focus : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.grab_focus obj)

  method has_css_class : string -> bool =
    fun css_class ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_css_class obj css_class)

  method has_default : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_default obj)

  method has_focus : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_focus obj)

  method has_visible_focus : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_visible_focus obj)

  method hide : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.hide obj)

  method in_destruction : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.in_destruction obj)

  method init_template : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.init_template obj)

  method insert_action_group : string -> Ocgtk_gio.Gio.Action_group.action_group_t option -> unit =
    fun name group ->
      let group = Option.map (fun (c) -> c#as_action_group) group in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.insert_action_group obj name group)

  method insert_after : widget_t -> widget_t option -> unit =
    fun parent previous_sibling ->
      let parent = parent#as_widget in
      let previous_sibling = Option.map (fun (c) -> c#as_widget) previous_sibling in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.insert_after obj parent previous_sibling)

  method insert_before : widget_t -> widget_t option -> unit =
    fun parent next_sibling ->
      let parent = parent#as_widget in
      let next_sibling = Option.map (fun (c) -> c#as_widget) next_sibling in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.insert_before obj parent next_sibling)

  method is_ancestor : widget_t -> bool =
    fun ancestor ->
      let ancestor = ancestor#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_ancestor obj ancestor)

  method is_drawable : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_drawable obj)

  method is_focus : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_focus obj)

  method is_sensitive : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_sensitive obj)

  method is_visible : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_visible obj)

  method keynav_failed : Gtk_enums.directiontype -> bool =
    fun direction ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.keynav_failed obj direction)

  method list_mnemonic_labels : unit -> widget_t list =
    fun () ->
      (List.map (fun ret -> new widget ret))(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.list_mnemonic_labels obj)

  method map : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.map obj)

  method mnemonic_activate : bool -> bool =
    fun group_cycling ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.mnemonic_activate obj group_cycling)

  method observe_children : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
    fun () ->
      new  Ocgtk_gio.Gio.List_model.list_model(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.observe_children obj)

  method observe_controllers : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
    fun () ->
      new  Ocgtk_gio.Gio.List_model.list_model(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.observe_controllers obj)

  method pick : float -> float -> Gtk_enums.pickflags -> widget_t option =
    fun x y flags ->
      Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.pick obj x y flags)

  method queue_allocate : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_allocate obj)

  method queue_draw : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_draw obj)

  method queue_resize : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_resize obj)

  method realize : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.realize obj)

  method remove_controller : event_controller_t -> unit =
    fun controller ->
      let controller = controller#as_event_controller in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_controller obj controller)

  method remove_css_class : string -> unit =
    fun css_class ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_css_class obj css_class)

  method remove_mnemonic_label : widget_t -> unit =
    fun label ->
      let label = label#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_mnemonic_label obj label)

  method remove_tick_callback : int -> unit =
    fun id ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_tick_callback obj id)

  method set_can_focus : bool -> unit =
    fun can_focus ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_can_focus obj can_focus)

  method set_can_target : bool -> unit =
    fun can_target ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_can_target obj can_target)

  method set_child_visible : bool -> unit =
    fun child_visible ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_child_visible obj child_visible)

  method set_css_classes : string array -> unit =
    fun classes ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_css_classes obj classes)

  method set_cursor : Ocgtk_gdk.Gdk.Cursor.cursor_t option -> unit =
    fun cursor ->
      let cursor = Option.map (fun (c) -> c#as_cursor) cursor in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_cursor obj cursor)

  method set_cursor_from_name : string option -> unit =
    fun name ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_cursor_from_name obj name)

  method set_direction : Gtk_enums.textdirection -> unit =
    fun dir ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_direction obj dir)

  method set_focus_child : widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focus_child obj child)

  method set_focus_on_click : bool -> unit =
    fun focus_on_click ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focus_on_click obj focus_on_click)

  method set_focusable : bool -> unit =
    fun focusable ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focusable obj focusable)

  method set_font_map : Ocgtk_pango.Pango.Font_map.font_map_t option -> unit =
    fun font_map ->
      let font_map = Option.map (fun (c) -> c#as_font_map) font_map in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_font_map obj font_map)

  method set_font_options : Ocgtk_cairo.Cairo.Font_options.font_options_t option -> unit =
    fun options ->
      let options = Option.map (fun (c) -> c#as_font_options) options in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_font_options obj options)

  method set_halign : Gtk_enums.align -> unit =
    fun align ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_halign obj align)

  method set_has_tooltip : bool -> unit =
    fun has_tooltip ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_has_tooltip obj has_tooltip)

  method set_hexpand : bool -> unit =
    fun expand ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_hexpand obj expand)

  method set_hexpand_set : bool -> unit =
    fun set ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_hexpand_set obj set)

  method set_layout_manager : layout_manager_t option -> unit =
    fun layout_manager ->
      let layout_manager = Option.map (fun (c) -> c#as_layout_manager) layout_manager in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_layout_manager obj layout_manager)

  method set_margin_bottom : int -> unit =
    fun margin ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_bottom obj margin)

  method set_margin_end : int -> unit =
    fun margin ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_end obj margin)

  method set_margin_start : int -> unit =
    fun margin ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_start obj margin)

  method set_margin_top : int -> unit =
    fun margin ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_top obj margin)

  method set_name : string -> unit =
    fun name ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_name obj name)

  method set_opacity : float -> unit =
    fun opacity ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_opacity obj opacity)

  method set_overflow : Gtk_enums.overflow -> unit =
    fun overflow ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_overflow obj overflow)

  method set_parent : widget_t -> unit =
    fun parent ->
      let parent = parent#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_parent obj parent)

  method set_receives_default : bool -> unit =
    fun receives_default ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_receives_default obj receives_default)

  method set_sensitive : bool -> unit =
    fun sensitive ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_sensitive obj sensitive)

  method set_size_request : int -> int -> unit =
    fun width height ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_size_request obj width height)

  method set_state_flags : Gtk_enums.stateflags -> bool -> unit =
    fun flags clear ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_state_flags obj flags clear)

  method set_tooltip_markup : string option -> unit =
    fun markup ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_tooltip_markup obj markup)

  method set_tooltip_text : string option -> unit =
    fun text ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_tooltip_text obj text)

  method set_valign : Gtk_enums.align -> unit =
    fun align ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_valign obj align)

  method set_vexpand : bool -> unit =
    fun expand ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_vexpand obj expand)

  method set_vexpand_set : bool -> unit =
    fun set ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_vexpand_set obj set)

  method set_visible : bool -> unit =
    fun visible ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_visible obj visible)

  method should_layout : unit -> bool =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.should_layout obj)

  method show : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.show obj)

  method snapshot_child : widget_t -> GSnapshot.snapshot_t -> unit =
    fun child snapshot ->
      let child = child#as_widget in
      let snapshot = snapshot#as_snapshot in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.snapshot_child obj child snapshot)

  method trigger_tooltip_query : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.trigger_tooltip_query obj)

  method unmap : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unmap obj)

  method unparent : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unparent obj)

  method unrealize : unit -> unit =
    fun () ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unrealize obj)

  method unset_state_flags : Gtk_enums.stateflags -> unit =
    fun flags ->
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unset_state_flags obj flags)

  method height_request = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_height_request obj
  method set_height_request v =  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_height_request obj v

  method width_request = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_width_request obj
  method set_width_request v =  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_width_request obj v

    method as_widget = obj
end
