(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class event_controller (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t) = object (self)

  method name = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_name obj
  method set_name v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_name obj v

  method get_current_event : 'a. unit -> 'a Gdk.event option = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_current_event obj )

  method get_current_event_state : unit -> Gdk.modifiertype = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_current_event_state obj )

  method get_propagation_limit : unit -> Gtk_enums.propagationlimit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_propagation_limit obj )

  method get_propagation_phase : unit -> Gtk_enums.propagationphase = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_propagation_phase obj )

  method get_widget : unit -> widget = fun () -> new  widget(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.get_widget obj )

  method reset : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.reset obj )

  method set_propagation_limit : Gtk_enums.propagationlimit -> unit = fun limit -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_propagation_limit obj limit)

  method set_propagation_phase : Gtk_enums.propagationphase -> unit = fun phase -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_propagation_phase obj phase)

  method set_static_name : string option -> unit = fun name -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.set_static_name obj name)

    method as_event_controller = obj
end

and layout_child (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t) = object (self)

  method get_child_widget : unit -> widget = fun () -> new  widget(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.get_child_widget obj )

  method get_layout_manager : unit -> layout_manager = fun () -> new  layout_manager(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.get_layout_manager obj )

    method as_layout_child = obj
end

and layout_manager (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t) = object (self)

  method allocate : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> int -> int -> int -> unit =
    fun widget width height baseline ->
      let widget = widget#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.allocate obj widget width height baseline)

  method get_layout_child : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> layout_child =
    fun child ->
      let child = child#as_widget in
      new  layout_child(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_layout_child obj child)

  method get_request_mode : unit -> Gtk_enums.sizerequestmode = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_request_mode obj )

  method get_widget : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.get_widget obj )

  method layout_changed : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.layout_changed obj )

    method as_layout_manager = obj
end

and root (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t) = object (self)

  method get_focus : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.get_focus obj )

  method set_focus : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) option -> unit =
    fun focus ->
      let focus = Option.map (fun (c) -> c#as_widget) focus in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.set_focus obj focus)

    method as_root = obj
end
(* Signal class defined in gwidget_signals.ml *)


and widget (obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t) = object (self)
  inherit Gwidget_signals.widget_signals obj

  method can_focus = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_can_focus obj
  method set_can_focus v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_can_focus obj v

  method can_target = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_can_target obj
  method set_can_target v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_can_target obj v

  method css_name = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_css_name obj

  method focus_on_click = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focus_on_click obj
  method set_focus_on_click v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focus_on_click obj v

  method focusable = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focusable obj
  method set_focusable v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focusable obj v

  method has_default = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_has_default obj

  method has_focus = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_has_focus obj

  method has_tooltip = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_has_tooltip obj
  method set_has_tooltip v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_has_tooltip obj v

  method height_request = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_height_request obj
  method set_height_request v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_height_request obj v

  method hexpand = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_hexpand obj
  method set_hexpand v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_hexpand obj v

  method hexpand_set = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_hexpand_set obj
  method set_hexpand_set v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_hexpand_set obj v

  method margin_bottom = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_bottom obj
  method set_margin_bottom v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_bottom obj v

  method margin_end = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_end obj
  method set_margin_end v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_end obj v

  method margin_start = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_start obj
  method set_margin_start v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_start obj v

  method margin_top = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_margin_top obj
  method set_margin_top v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_margin_top obj v

  method name = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_name obj
  method set_name v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_name obj v

  method opacity = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_opacity obj
  method set_opacity v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_opacity obj v

  method receives_default = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_receives_default obj
  method set_receives_default v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_receives_default obj v

  method scale_factor = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_scale_factor obj

  method sensitive = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_sensitive obj
  method set_sensitive v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_sensitive obj v

  method tooltip_markup = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_tooltip_markup obj
  method set_tooltip_markup v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_tooltip_markup obj v

  method tooltip_text = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_tooltip_text obj
  method set_tooltip_text v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_tooltip_text obj v

  method vexpand = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_vexpand obj
  method set_vexpand v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_vexpand obj v

  method vexpand_set = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_vexpand_set obj
  method set_vexpand_set v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_vexpand_set obj v

  method visible = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_visible obj
  method set_visible v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_visible obj v

  method width_request = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_width_request obj
  method set_width_request v = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_width_request obj v

  method action_set_enabled : string -> bool -> unit = fun action_name enabled -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.action_set_enabled obj action_name enabled)

  method activate : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.activate obj )

  method activate_default : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.activate_default obj )

  method add_controller : 'p1. (<as_event_controller: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t; ..> as 'p1) -> unit =
    fun controller ->
      let controller = controller#as_event_controller in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_controller obj controller)

  method add_css_class : string -> unit = fun css_class -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_css_class obj css_class)

  method add_mnemonic_label : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> unit =
    fun label ->
      let label = label#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.add_mnemonic_label obj label)

  method child_focus : Gtk_enums.directiontype -> bool = fun direction -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.child_focus obj direction)

  method compute_expand : Gtk_enums.orientation -> bool = fun orientation -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.compute_expand obj orientation)

  method contains : float -> float -> bool = fun x y -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.contains obj x y)

  method drag_check_threshold : int -> int -> int -> int -> bool = fun start_x start_y current_x current_y -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.gtk_drag_check_threshold obj start_x start_y current_x current_y)

  method error_bell : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.error_bell obj )

  method get_allocated_baseline : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_baseline obj )

  method get_allocated_height : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_height obj )

  method get_allocated_width : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_allocated_width obj )

  method get_baseline : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_baseline obj )

  method get_child_visible : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_child_visible obj )

  method get_css_classes : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_css_classes obj )

  method get_direction : unit -> Gtk_enums.textdirection = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_direction obj )

  method get_first_child : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_first_child obj )

  method get_focus_child : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_focus_child obj )

  method get_halign : unit -> Gtk_enums.align = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_halign obj )

  method get_height : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_height obj )

  method get_last_child : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_last_child obj )

  method get_layout_manager : unit -> layout_manager option = fun () -> Option.map (fun ret -> new layout_manager ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_layout_manager obj )

  method get_mapped : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_mapped obj )

  method get_native : unit -> GNative.native option = fun () -> Option.map (fun ret -> new GNative.native ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_native obj )

  method get_next_sibling : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_next_sibling obj )

  method get_overflow : unit -> Gtk_enums.overflow = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_overflow obj )

  method get_parent : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_parent obj )

  method get_prev_sibling : unit -> widget option = fun () -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_prev_sibling obj )

  method get_realized : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_realized obj )

  method get_request_mode : unit -> Gtk_enums.sizerequestmode = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_request_mode obj )

  method get_root : unit -> root option = fun () -> Option.map (fun ret -> new root ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_root obj )

  method get_settings : unit -> GSettings.settings = fun () -> new  GSettings.settings(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_settings obj )

  method get_size : Gtk_enums.orientation -> int = fun orientation -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_size obj orientation)

  method get_state_flags : unit -> Gtk_enums.stateflags = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_state_flags obj )

  method get_style_context : unit -> GStyle_context.style_context = fun () -> new  GStyle_context.style_context(Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_style_context obj )

  method get_valign : unit -> Gtk_enums.align = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_valign obj )

  method get_width : unit -> int = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.get_width obj )

  method grab_focus : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.grab_focus obj )

  method has_css_class : string -> bool = fun css_class -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_css_class obj css_class)

  method has_visible_focus : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.has_visible_focus obj )

  method hide : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.hide obj )

  method in_destruction : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.in_destruction obj )

  method init_template : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.init_template obj )

  method insert_after : 'p1 'p2. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p2) option -> unit =
    fun parent previous_sibling ->
      let parent = parent#as_widget in
      let previous_sibling = Option.map (fun (c) -> c#as_widget) previous_sibling in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.insert_after obj parent previous_sibling)

  method insert_before : 'p1 'p2. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p2) option -> unit =
    fun parent next_sibling ->
      let parent = parent#as_widget in
      let next_sibling = Option.map (fun (c) -> c#as_widget) next_sibling in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.insert_before obj parent next_sibling)

  method is_ancestor : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> bool =
    fun ancestor ->
      let ancestor = ancestor#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_ancestor obj ancestor)

  method is_drawable : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_drawable obj )

  method is_focus : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_focus obj )

  method is_sensitive : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_sensitive obj )

  method is_visible : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.is_visible obj )

  method keynav_failed : Gtk_enums.directiontype -> bool = fun direction -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.keynav_failed obj direction)

  method map : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.map obj )

  method mnemonic_activate : bool -> bool = fun group_cycling -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.mnemonic_activate obj group_cycling)

  method pick : float -> float -> Gtk_enums.pickflags -> widget option = fun x y flags -> Option.map (fun ret -> new widget ret) (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.pick obj x y flags)

  method queue_allocate : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_allocate obj )

  method queue_draw : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_draw obj )

  method queue_resize : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.queue_resize obj )

  method realize : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.realize obj )

  method remove_controller : 'p1. (<as_event_controller: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t; ..> as 'p1) -> unit =
    fun controller ->
      let controller = controller#as_event_controller in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_controller obj controller)

  method remove_css_class : string -> unit = fun css_class -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_css_class obj css_class)

  method remove_mnemonic_label : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> unit =
    fun label ->
      let label = label#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_mnemonic_label obj label)

  method remove_tick_callback : int -> unit = fun id -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.remove_tick_callback obj id)

  method set_child_visible : bool -> unit = fun child_visible -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_child_visible obj child_visible)

  method set_cursor_from_name : string option -> unit = fun name -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_cursor_from_name obj name)

  method set_direction : Gtk_enums.textdirection -> unit = fun dir -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_direction obj dir)

  method set_focus_child : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_focus_child obj child)

  method set_halign : Gtk_enums.align -> unit = fun align -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_halign obj align)

  method set_layout_manager : 'p1. (<as_layout_manager: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t; ..> as 'p1) option -> unit =
    fun layout_manager ->
      let layout_manager = Option.map (fun (c) -> c#as_layout_manager) layout_manager in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_layout_manager obj layout_manager)

  method set_overflow : Gtk_enums.overflow -> unit = fun overflow -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_overflow obj overflow)

  method set_parent : 'p1. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> unit =
    fun parent ->
      let parent = parent#as_widget in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_parent obj parent)

  method set_size_request : int -> int -> unit = fun width height -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_size_request obj width height)

  method set_state_flags : Gtk_enums.stateflags -> bool -> unit = fun flags clear -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_state_flags obj flags clear)

  method set_valign : Gtk_enums.align -> unit = fun align -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.set_valign obj align)

  method should_layout : unit -> bool = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.should_layout obj )

  method show : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.show obj )

  method snapshot_child : 'p1 'p2. (<as_widget: Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t; ..> as 'p1) -> (#GSnapshot.snapshot as 'p2) -> unit =
    fun child snapshot ->
      let child = child#as_widget in
      let snapshot = snapshot#as_snapshot in
      (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.snapshot_child obj child snapshot)

  method trigger_tooltip_query : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.trigger_tooltip_query obj )

  method unmap : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unmap obj )

  method unparent : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unparent obj )

  method unrealize : unit -> unit = fun () -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unrealize obj )

  method unset_state_flags : Gtk_enums.stateflags -> unit = fun flags -> (Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.unset_state_flags obj flags)

    method as_widget = obj
end
