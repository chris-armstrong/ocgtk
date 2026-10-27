(** The classes of {!Ocgtk.Event_controller}, {!Ocgtk.Layout_child},
    {!Ocgtk.Layout_manager}, {!Ocgtk.Root}, {!Ocgtk.Tooltip}, {!Ocgtk.Widget},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GtkEventController]. *)
class type event_controller_t = object
  method get_current_event : unit -> Ocgdk.Event.event_t option
  (** Returns the event that is currently being handled by the controller.

      At other times, [NULL] is returned. *)

  method get_current_event_device : unit -> Ocgdk.Device.device_t option
  (** Returns the device of the event that is currently being handled by the
      controller.

      At other times, [NULL] is returned. *)

  method get_current_event_state : unit -> Ocgdk.Enums.modifiertype
  (** Returns the modifier state of the event that is currently being handled by
      the controller.

      At other times, 0 is returned. *)

  method get_current_event_time : unit -> UInt32.t
  (** Returns the timestamp of the event that is currently being handled by the
      controller.

      At other times, 0 is returned. *)

  method get_name : unit -> string option
  (** Gets the name of [controller]. *)

  method get_propagation_limit : unit -> Enums.propagationlimit
  (** Gets the propagation limit of the event controller. *)

  method get_propagation_phase : unit -> Enums.propagationphase
  (** Gets the propagation phase at which [controller] handles events. *)

  method get_widget : unit -> widget_t option
  (** Returns the [GtkWidget] this controller relates to. *)

  method reset : unit -> unit
  (** Resets the [controller] to a clean state. *)

  method set_name : string option -> unit
  (** Sets a name on the controller that can be used for debugging. *)

  method set_propagation_limit : Enums.propagationlimit -> unit
  (** Sets the event propagation limit on the event controller.

      If the limit is set to [GTK_LIMIT_SAME_NATIVE], the controller won't
      handle events that are targeted at widgets on a different surface, such as
      popovers. *)

  method set_propagation_phase : Enums.propagationphase -> unit
  (** Sets the propagation phase at which a controller handles events.

      If [phase] is [GTK_PHASE_NONE], no automatic event handling will be
      performed, but other additional gesture maintenance will. *)

  method set_static_name : string option -> unit
  (** Sets a name on the controller that can be used for debugging. *)

  method as_event_controller : Raw.Event_controller.t
end

(** The methods, signals and properties of a [GtkLayoutChild]. *)
and layout_child_t = object
  method get_child_widget : unit -> widget_t
  (** Retrieves the [GtkWidget] associated to the given [layout_child]. *)

  method get_layout_manager : unit -> layout_manager_t
  (** Retrieves the [GtkLayoutManager] instance that created the given
      [layout_child]. *)

  method as_layout_child : Raw.Layout_child.t
end

(** The methods, signals and properties of a [GtkLayoutManager]. *)
and layout_manager_t = object
  method allocate : widget_t -> int -> int -> int -> unit
  (** Assigns the given [width], [height], and [baseline] to a [widget], and
      computes the position and sizes of the children of the [widget] using the
      layout management policy of [manager]. *)

  method get_layout_child : widget_t -> layout_child_t
  (** Retrieves a [GtkLayoutChild] instance for the [GtkLayoutManager], creating
      one if necessary.

      The [child] widget must be a child of the widget using [manager].

      The [GtkLayoutChild] instance is owned by the [GtkLayoutManager], and is
      guaranteed to exist as long as [child] is a child of the [GtkWidget] using
      the given [GtkLayoutManager]. *)

  method get_request_mode : unit -> Enums.sizerequestmode
  (** Retrieves the request mode of [manager]. *)

  method get_widget : unit -> widget_t option
  (** Retrieves the [GtkWidget] using the given [GtkLayoutManager]. *)

  method layout_changed : unit -> unit
  (** Queues a resize on the [GtkWidget] using [manager], if any.

      This function should be called by subclasses of [GtkLayoutManager] in
      response to changes to their layout management policies. *)

  method as_layout_manager : Raw.Layout_manager.t
end

(** The methods, signals and properties of a [GtkRoot]. *)
and root_t = object
  method get_display : unit -> Ocgdk.Display.display_t
  (** Returns the display that this [GtkRoot] is on. *)

  method get_focus : unit -> widget_t option
  (** Retrieves the current focused widget within the root.

      Note that this is the widget that would have the focus if the root is
      active; if the root is not focused then [gtk_widget_has_focus (widget)]
      will be [FALSE] for the widget. *)

  method set_focus : widget_t option -> unit
  (** If [focus] is not the current focus widget, and is focusable, sets it as
      the focus widget for the root.

      If [focus] is [NULL], unsets the focus widget for the root.

      To set the focus to a particular widget in the root, it is usually more
      convenient to use [Gtk.Widget.grab_focus] instead of this function. *)

  method as_root : Raw.Root.t
end

(** The methods, signals and properties of a [GtkTooltip]. *)
and tooltip_t = object
  method set_custom : widget_t option -> unit
  (** Replaces the widget packed into the tooltip with [custom_widget].
      [custom_widget] does not get destroyed when the tooltip goes away. By
      default a box with a [GtkImage] and [GtkLabel] is embedded in the tooltip,
      which can be configured using gtk_tooltip_set_markup() and
      gtk_tooltip_set_icon(). *)

  method set_icon : Ocgdk.Paintable.paintable_t option -> unit
  (** Sets the icon of the tooltip (which is in front of the text) to be
      [paintable]. If [paintable] is [NULL], the image will be hidden. *)

  method set_icon_from_gicon : Ocgio.Icon.icon_t option -> unit
  (** Sets the icon of the tooltip (which is in front of the text) to be the
      icon indicated by [gicon] with the size indicated by [size]. If [gicon] is
      [NULL], the image will be hidden. *)

  method set_icon_from_icon_name : string option -> unit
  (** Sets the icon of the tooltip (which is in front of the text) to be the
      icon indicated by [icon_name] with the size indicated by [size]. If
      [icon_name] is [NULL], the image will be hidden. *)

  method set_markup : string option -> unit
  (** Sets the text of the tooltip to be [markup].

      The string must be marked up with Pango markup. If [markup] is [NULL], the
      label will be hidden. *)

  method set_text : string option -> unit
  (** Sets the text of the tooltip to be [text].

      If [text] is [NULL], the label will be hidden. See also
      [Gtk.Tooltip.set_markup]. *)

  method set_tip_area : Ocgdk.Rectangle.rectangle_t -> unit
  (** Sets the area of the widget, where the contents of this tooltip apply, to
      be [rect] (in widget coordinates). This is especially useful for properly
      setting tooltips on [GtkTreeView] rows and cells, [GtkIconViews], etc.

      For setting tooltips on [GtkTreeView], please refer to the convenience
      functions for this: gtk_tree_view_set_tooltip_row() and
      gtk_tree_view_set_tooltip_cell(). *)

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
  (** Enables or disables an action installed with
      [Gtk.WidgetClass.install_action]. *)

  method activate : unit -> bool
  (** Activates the widget.

      The activation will emit the signal set using
      [Gtk.WidgetClass.set_activate_signal] during class initialization.

      Activation is what happens when you press <kbd>Enter</kbd> on a widget.

      If you wish to handle the activation keybinding yourself, it is
      recommended to use [Gtk.WidgetClass.add_shortcut] with an action created
      with [Gtk.SignalAction.new].

      If [widget] is not activatable, the function returns false. *)

  method activate_action_variant : string -> Gvariant.t option -> bool
  (** Activates an action for the widget.

      The action is looked up in the action groups associated with [widget] and
      its ancestors.

      If the action is in an action group added with
      [Gtk.Widget.insert_action_group], the [name] is expected to be prefixed
      with the prefix that was used when the group was inserted.

      The arguments must match the actions expected parameter type, as returned
      by [Gio.Action.get_parameter_type]. *)

  method activate_default : unit -> unit
  (** Activates the [default.activate] action for the widget.

      The action is looked up in the same was as for
      [Gtk.Widget.activate_action]. *)

  method add_controller : event_controller_t -> unit
  (** Adds an event controller to the widget.

      The event controllers of a widget handle the events that are propagated to
      the widget.

      You will usually want to call this function right after creating any kind
      of [Gtk.EventController]. *)

  method add_css_class : string -> unit
  (** Adds a style class to the widget.

      After calling this function, the widget’s style will match for
      [css_class], according to CSS matching rules.

      Use [Gtk.Widget.remove_css_class] to remove the style again. *)

  method add_mnemonic_label : widget_t -> unit
  (** Adds a widget to the list of mnemonic labels for this widget.

      See [Gtk.Widget.list_mnemonic_labels].

      Note that the list of mnemonic labels for the widget is cleared when the
      widget is destroyed, so the caller must make sure to update its internal
      state at this point as well. *)

  method allocate :
    int -> int -> int -> Ocgsk.Transform.transform_t option -> unit
  (** Assigns size, position, (optionally) a baseline and transform to a child
      widget.

      In this function, the allocation and baseline may be adjusted. The given
      allocation will be forced to be bigger than the widget's minimum size, as
      well as at least 0×0 in size.

      This function is only used by widget implementations.

      For a version that does not take a transform, see
      [Gtk.Widget.size_allocate]. *)

  method child_focus : Enums.directiontype -> bool
  (** Called by widgets as the user moves around the window using keyboard
      shortcuts.

      The [direction] argument indicates what kind of motion is taking place
      (up, down, left, right, tab forward, tab backward).

      This function calls the [Gtk.Widget.focus] virtual function; widgets can
      override the virtual function in order to implement appropriate focus
      behavior.

      The default [focus()] virtual function for a widget should return true if
      moving in [direction] left the focus on a focusable location inside that
      widget, and false if moving in [direction] moved the focus outside the
      widget. When returning true, widgets normally call [Gtk.Widget.grab_focus]
      to place the focus accordingly; when returning false, they don’t modify
      the current focus location.

      This function is used by custom widget implementations; if you're writing
      an app, you’d use [Gtk.Widget.grab_focus] to move the focus to a
      particular widget. *)

  method compute_expand : Enums.orientation -> bool
  (** Computes whether a parent widget should give this widget extra space when
      possible.

      Widgets with children should check this, rather than looking at
      [Gtk.Widget.get_hexpand] or [Gtk.Widget.get_vexpand].

      This function already checks whether the widget is visible, so visibility
      does not need to be checked separately. Non-visible widgets are not
      expanded.

      The computed expand value uses either the expand setting explicitly set on
      the widget itself, or, if none has been explicitly set, the widget may
      expand if some of its children do. *)

  method contains : float -> float -> bool
  (** Tests if a given point is contained in the widget.

      The coordinates for (x, y) must be in widget coordinates, so (0, 0) is
      assumed to be the top left of [widget]'s content area. *)

  method create_pango_context : unit -> Ocpango.Context.context_t
  (** Creates a new [PangoContext] that is configured for the widget.

      The [PangoContext] will have the appropriate font map, font options, font
      description, and base direction set.

      See also [Gtk.Widget.get_pango_context]. *)

  method create_pango_layout : string option -> Ocpango.Layout.layout_t
  (** Creates a new [PangoLayout] that is configured for the widget.

      The [PangoLayout] will have the appropriate font map, font description,
      and base direction set.

      If you keep a [PangoLayout] created in this way around, you need to
      re-create it when the widgets [PangoContext] is replaced. This can be
      tracked by listening to changes of the [Gtk.Widget:root] property on the
      widget. *)

  method dispose_template : Gobject.Type.t -> unit
  (** Clears the template children for the widget.

      This function is the opposite of [Gtk.Widget.init_template], and it is
      used to clear all the template children from a widget instance. If you
      bound a template child to a field in the instance structure, or in the
      instance private data structure, the field will be set to [NULL] after
      this function returns.

      You should call this function inside the [GObjectClass.dispose()]
      implementation of any widget that called [Gtk.Widget.init_template].
      Typically, you will want to call this function last, right before chaining
      up to the parent type's dispose implementation, e.g.

      {[
      static void
      some_widget_dispose (GObject *gobject)
      {
        SomeWidget *self = SOME_WIDGET (gobject);

        // Clear the template data for SomeWidget
        gtk_widget_dispose_template (GTK_WIDGET (self), SOME_TYPE_WIDGET);

        G_OBJECT_CLASS (some_widget_parent_class)->dispose (gobject);
      }
      ]} *)

  method drag_check_threshold : int -> int -> int -> int -> bool
  (** Checks to see if a drag movement has passed the GTK drag threshold. *)

  method error_bell : unit -> unit
  (** Notifies the user about an input-related error on the widget.

      If the [Gtk.Settings:gtk-error-bell] setting is true, it calls
      [Gdk.Surface.beep], otherwise it does nothing.

      Note that the effect of [Gdk.Surface.beep] can be configured in many ways,
      depending on the windowing backend and the desktop environment or window
      manager that is used. *)

  method get_allocated_baseline : unit -> int
  (** Returns the baseline that has currently been allocated to the widget.

      This function is intended to be used when implementing handlers for the
      [GtkWidget]Class.snapshot() function, and when allocating child widgets in
      [GtkWidget]Class.size_allocate(). *)

  method get_allocated_height : unit -> int
  (** Returns the height that has currently been allocated to the widget.

      To learn more about widget sizes, see the coordinate system overview. *)

  method get_allocated_width : unit -> int
  (** Returns the width that has currently been allocated to the widget.

      To learn more about widget sizes, see the coordinate system overview. *)

  method get_ancestor : Gobject.Type.t -> widget_t option
  (** Gets the first ancestor of the widget with type [widget_type].

      For example, [gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)] gets the
      first [GtkBox] that’s an ancestor of [widget]. No reference will be added
      to the returned widget; it should not be unreferenced.

      Note that unlike [Gtk.Widget.is_ancestor], this function considers
      [widget] to be an ancestor of itself. *)

  method get_baseline : unit -> int
  (** Returns the baseline that has currently been allocated to the widget.

      This function is intended to be used when implementing handlers for the
      [GtkWidgetClass.snapshot()] function, and when allocating child widgets in
      [GtkWidgetClass.size_allocate()]. *)

  method get_can_focus : unit -> bool
  (** Determines whether the input focus can enter the widget or any of its
      children.

      See [Gtk.Widget.set_can_focus]. *)

  method get_can_target : unit -> bool
  (** Queries whether the widget can be the target of pointer events. *)

  method get_child_visible : unit -> bool
  (** Gets the value set with [Gtk.Widget.set_child_visible].

      If you feel a need to use this function, your code probably needs
      reorganization.

      This function is only useful for widget implementations and should never
      be called by an application. *)

  method get_clipboard : unit -> Ocgdk.Clipboard.clipboard_t
  (** Gets the clipboard object for the widget.

      This is a utility function to get the clipboard object for the display
      that [widget] is using.

      Note that this function always works, even when [widget] is not realized
      yet. *)

  method get_css_classes : unit -> string array
  (** Returns the list of style classes applied to the widget. *)

  method get_css_name : unit -> string
  (** Returns the CSS name of the widget. *)

  method get_cursor : unit -> Ocgdk.Cursor.cursor_t option
  (** Gets the cursor set on the widget.

      See [Gtk.Widget.set_cursor] for details. *)

  method get_direction : unit -> Enums.textdirection
  (** Gets the reading direction for the widget.

      See [Gtk.Widget.set_direction]. *)

  method get_display : unit -> Ocgdk.Display.display_t
  (** Get the display for the window that the widget belongs to.

      This function can only be called after the widget has been added to a
      widget hierarchy with a [GtkRoot] at the top.

      In general, you should only create display-specific resources when a
      widget has been realized, and you should free those resources when the
      widget is unrealized. *)

  method get_first_child : unit -> widget_t option
  (** Returns the widget’s first child.

      This function is primarily meant for widget implementations. *)

  method get_focus_child : unit -> widget_t option
  (** Returns the focus child of the widget. *)

  method get_focus_on_click : unit -> bool
  (** Returns whether the widget should grab focus when it is clicked with the
      mouse.

      See [Gtk.Widget.set_focus_on_click]. *)

  method get_focusable : unit -> bool
  (** Determines whether the widget can own the input focus.

      See [Gtk.Widget.set_focusable]. *)

  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  (** Gets the font map of the widget.

      See [Gtk.Widget.set_font_map]. *)

  method get_font_options : unit -> Occairo.Font_options.font_options_t option
  (** Returns the [cairo_font_options_t] of the widget.

      Seee [Gtk.Widget.set_font_options]. *)

  method get_frame_clock : unit -> Ocgdk.Frame_clock.frame_clock_t option
  (** Obtains the frame clock for a widget.

      The frame clock is a global “ticker” that can be used to drive animations
      and repaints. The most common reason to get the frame clock is to call
      [Gdk.FrameClock.get_frame_time], in order to get a time to use for
      animating. For example you might record the start of the animation with an
      initial value from [Gdk.FrameClock.get_frame_time], and then update the
      animation by calling [Gdk.FrameClock.get_frame_time] again during each
      repaint.

      [Gdk.FrameClock.request_phase] will result in a new frame on the clock,
      but won’t necessarily repaint any widgets. To repaint a widget, you have
      to use [Gtk.Widget.queue_draw] which invalidates the widget (thus
      scheduling it to receive a draw on the next frame).
      [Gtk.Widget.queue_draw] will also end up requesting a frame on the
      appropriate frame clock.

      A widget’s frame clock will not change while the widget is mapped.
      Reparenting a widget (which implies a temporary unmap) can change the
      widget’s frame clock.

      Unrealized widgets do not have a frame clock. *)

  method get_halign : unit -> Enums.align
  (** Gets the horizontal alignment of the widget.

      For backwards compatibility reasons this method will never return one of
      the baseline alignments, but instead it will convert it to
      [Gtk.Align.fill] or [Gtk.Align.center].

      Baselines are not supported for horizontal alignment. *)

  method get_has_tooltip : unit -> bool
  (** Returns the current value of the [has-tooltip] property. *)

  method get_height : unit -> int
  (** Returns the content height of the widget.

      This function returns the height passed to its size-allocate
      implementation, which is the height you should be using in
      [Gtk.Widget.snapshot].

      For pointer events, see [Gtk.Widget.contains].

      To learn more about widget sizes, see the coordinate system overview. *)

  method get_hexpand : unit -> bool
  (** Gets whether the widget would like any available extra horizontal space.

      When a user resizes a window, widgets with expand set to true generally
      receive the extra space. For example, a list or scrollable area or
      document in your window would often be set to expand.

      Widgets with children should use [Gtk.Widget.compute_expand] rather than
      this function, to see whether any of its children, has the expand flag
      set. If any child of a widget wants to expand, the parent may ask to
      expand also.

      This function only looks at the widget’s own hexpand flag, rather than
      computing whether the entire widget tree rooted at this widget wants to
      expand. *)

  method get_hexpand_set : unit -> bool
  (** Gets whether the [hexpand] flag has been explicitly set.

      If [Gtk.Widget:hexpand] property is set, then it overrides any computed
      expand value based on child widgets. If [hexpand] is not set, then the
      expand value depends on whether any children of the widget would like to
      expand.

      There are few reasons to use this function, but it’s here for completeness
      and consistency. *)

  method get_last_child : unit -> widget_t option
  (** Returns the widget’s last child.

      This function is primarily meant for widget implementations. *)

  method get_layout_manager : unit -> layout_manager_t option
  (** Retrieves the layout manager of the widget.

      See [Gtk.Widget.set_layout_manager]. *)

  method get_limit_events : unit -> bool
  (** Gets the value of the [Gtk.Widget:limit-events] property. *)

  method get_mapped : unit -> bool
  (** Returns whether the widget is mapped. *)

  method get_margin_bottom : unit -> int
  (** Gets the bottom margin of the widget. *)

  method get_margin_end : unit -> int
  (** Gets the end margin of the widget. *)

  method get_margin_start : unit -> int
  (** Gets the start margin of the widget. *)

  method get_margin_top : unit -> int
  (** Gets the top margin of the widget. *)

  method get_name : unit -> string
  (** Retrieves the name of a widget.

      See [Gtk.Widget.set_name] for the significance of widget names. *)

  method get_native : unit -> Native.native_t option
  (** Returns the nearest [GtkNative] ancestor of the widget.

      This function will return [NULL] if the widget is not contained inside a
      widget tree with a native ancestor.

      [GtkNative] widgets will return themselves here. *)

  method get_next_sibling : unit -> widget_t option
  (** Returns the widget’s next sibling.

      This function is primarily meant for widget implementations. *)

  method get_opacity : unit -> float
  (** Fetches the requested opacity for the widget.

      See [Gtk.Widget.set_opacity]. *)

  method get_overflow : unit -> Enums.overflow
  (** Returns the widget’s overflow value. *)

  method get_pango_context : unit -> Ocpango.Context.context_t
  (** Gets a [PangoContext] that is configured for the widget.

      The [PangoContext] will have the appropriate font map, font description,
      and base direction set.

      Unlike the context returned by [Gtk.Widget.create_pango_context], this
      context is owned by the widget (it can be used until the screen for the
      widget changes or the widget is removed from its toplevel), and will be
      updated to match any changes to the widget’s attributes. This can be
      tracked by listening to changes of the [Gtk.Widget:root] property on the
      widget. *)

  method get_parent : unit -> widget_t option
  (** Returns the parent widget of the widget. *)

  method get_prev_sibling : unit -> widget_t option
  (** Returns the widget’s previous sibling.

      This function is primarily meant for widget implementations. *)

  method get_primary_clipboard : unit -> Ocgdk.Clipboard.clipboard_t
  (** Gets the primary clipboard of the widget.

      This is a utility function to get the primary clipboard object for the
      display that [widget] is using.

      Note that this function always works, even when [widget] is not realized
      yet. *)

  method get_realized : unit -> bool
  (** Determines whether the widget is realized. *)

  method get_receives_default : unit -> bool
  (** Determines whether the widget is always treated as the default widget
      within its toplevel when it has the focus, even if another widget is the
      default.

      See [Gtk.Widget.set_receives_default]. *)

  method get_request_mode : unit -> Enums.sizerequestmode
  (** Gets whether the widget prefers a height-for-width layout or a
      width-for-height layout.

      Single-child widgets generally propagate the preference of their child,
      more complex widgets need to request something either in context of their
      children or in context of their allocation capabilities. *)

  method get_root : unit -> root_t option
  (** Returns the [GtkRoot] widget of the widget.

      This function will return [NULL] if the widget is not contained inside a
      widget tree with a root widget.

      [GtkRoot] widgets will return themselves here. *)

  method get_scale_factor : unit -> int
  (** Retrieves the internal scale factor that maps from window coordinates to
      the actual device pixels.

      On traditional systems this is 1, on high density outputs, it can be a
      higher value (typically 2).

      See [Gdk.Surface.get_scale_factor].

      Note that modern systems may support {i fractional} scaling, where the
      scale factor is not an integer. On such systems, this function will return
      the next higher integer value, but you probably want to use
      [Gdk.Surface.get_scale] to get the fractional scale value. *)

  method get_sensitive : unit -> bool
  (** Returns the widget’s sensitivity.

      This function returns the value that has been set using
      [Gtk.Widget.set_sensitive]).

      The effective sensitivity of a widget is however determined by both its
      own and its parent widget’s sensitivity. See [Gtk.Widget.is_sensitive]. *)

  method get_settings : unit -> Settings.settings_t
  (** Gets the settings object holding the settings used for the widget.

      Note that this function can only be called when the [GtkWidget] is
      attached to a toplevel, since the settings object is specific to a
      particular display. If you want to monitor the widget for changes in its
      settings, connect to the [notify::display] signal. *)

  method get_size : Enums.orientation -> int
  (** Returns the content width or height of the widget.

      Which dimension is returned depends on [orientation].

      This is equivalent to calling [Gtk.Widget.get_width] for
      [Gtk.Orientation.horizontal] or [Gtk.Widget.get_height] for
      [Gtk.Orientation.vertical], but can be used when writing
      orientation-independent code, such as when implementing [Gtk.Orientable]
      widgets.

      To learn more about widget sizes, see the coordinate system overview. *)

  method get_state_flags : unit -> Enums.stateflags
  (** Returns the widget state as a flag set.

      It is worth mentioning that the effective [Gtk.StateFlags.insensitive]
      state will be returned, that is, also based on parent insensitivity, even
      if [widget] itself is sensitive.

      Also note that if you are looking for a way to obtain the [Gtk.StateFlags]
      to pass to a [Gtk.StyleContext] method, you should look at
      [Gtk.StyleContext.get_state]. *)

  method get_style_context : unit -> Style_context.style_context_t
  (** Returns the style context associated to the widget.

      The returned object is guaranteed to be the same for the lifetime of
      [widget]. *)

  method get_template_child :
    Gobject.Type.t -> string -> [ `object_ ] Gobject.obj
  (** Fetches an object build from the template XML for [widget_type] in the
      widget.

      This will only report children which were previously declared with
      [Gtk.WidgetClass.bind_template_child_full] or one of its variants.

      This function is only meant to be called for code which is private to the
      [widget_type] which declared the child and is meant for language bindings
      which cannot easily make use of the GObject structure offsets. *)

  method get_tooltip_markup : unit -> string option
  (** Gets the contents of the tooltip for the widget.

      If the tooltip has not been set using [Gtk.Widget.set_tooltip_markup],
      this function returns [NULL]. *)

  method get_tooltip_text : unit -> string option
  (** Gets the contents of the tooltip for the widget.

      If the [widget]'s tooltip was set using [Gtk.Widget.set_tooltip_markup],
      this function will return the escaped text. *)

  method get_valign : unit -> Enums.align
  (** Gets the vertical alignment of the widget. *)

  method get_vexpand : unit -> bool
  (** Gets whether the widget would like any available extra vertical space.

      See [Gtk.Widget.get_hexpand] for more detail. *)

  method get_vexpand_set : unit -> bool
  (** Gets whether the [vexpand] flag has been explicitly set.

      See [Gtk.Widget.get_hexpand_set] for more detail. *)

  method get_visible : unit -> bool
  (** Determines whether the widget is visible.

      If you want to take into account whether the widget’s parent is also
      marked as visible, use [Gtk.Widget.is_visible] instead.

      This function does not check if the widget is obscured in any way.

      See [Gtk.Widget.set_visible]. *)

  method get_width : unit -> int
  (** Returns the content width of the widget.

      This function returns the width passed to its size-allocate
      implementation, which is the width you should be using in
      [Gtk.Widget.snapshot].

      For pointer events, see [Gtk.Widget.contains].

      To learn more about widget sizes, see the coordinate system overview. *)

  method grab_focus : unit -> bool
  (** Causes [widget] to have the keyboard focus for the window that it belongs
      to.

      If [widget] is not focusable, or its [Gtk.Widget.grab_focus]
      implementation cannot transfer the focus to a descendant of [widget] that
      is focusable, it will not take focus and false will be returned.

      Calling [Gtk.Widget.grab_focus] on an already focused widget is allowed,
      should not have an effect, and return true. *)

  method has_css_class : string -> bool
  (** Returns whether a style class is currently applied to the widget. *)

  method has_default : unit -> bool
  (** Determines whether the widget is the current default widget within its
      toplevel. *)

  method has_focus : unit -> bool
  (** Determines if the widget has the global input focus.

      See [Gtk.Widget.is_focus] for the difference between having the global
      input focus, and only having the focus within a toplevel. *)

  method has_visible_focus : unit -> bool
  (** Determines if the widget should show a visible indication that it has the
      global input focus.

      This is a convenience function that takes into account whether focus
      indication should currently be shown in the toplevel window of [widget].
      See [Gtk.Window.get_focus_visible] for more information about focus
      indication.

      To find out if the widget has the global input focus, use
      [Gtk.Widget.has_focus]. *)

  method hide : unit -> unit
  (** Reverses the effects of \[method.Gtk.Widget.show\].

      This is causing the widget to be hidden (invisible to the user). *)

  method in_destruction : unit -> bool
  (** Returns whether the widget is currently being destroyed.

      This information can sometimes be used to avoid doing unnecessary work. *)

  method init_template : unit -> unit
  (** Creates and initializes child widgets defined in templates.

      This function must be called in the instance initializer for any class
      which assigned itself a template using [Gtk.WidgetClass.set_template].

      It is important to call this function in the instance initializer of a
      widget subclass and not in [GObject.constructed()] or
      [GObject.constructor()] for two reasons:

      - derived widgets will assume that the composite widgets defined by its
        parent classes have been created in their relative instance initializers
      - when calling [g_object_new()] on a widget with composite templates, it’s
        important to build the composite widgets before the construct properties
        are set. Properties passed to [g_object_new()] should take precedence
        over properties set in the private template XML

      A good rule of thumb is to call this function as the first thing in an
      instance initialization function. *)

  method insert_action_group :
    string -> Ocgio.Action_group.action_group_t option -> unit
  (** Inserts an action group into the widget's actions.

      Children of [widget] that implement [Gtk.Actionable] can then be
      associated with actions in [group] by setting their “action-name” to
      [prefix].[action-name].

      Note that inheritance is defined for individual actions. I.e. even if you
      insert a group with prefix [prefix], actions with the same prefix will
      still be inherited from the parent, unless the group contains an action
      with the same name.

      If [group] is [NULL], a previously inserted group for [name] is removed
      from [widget]. *)

  method insert_after : widget_t -> widget_t option -> unit
  (** Sets the parent widget of the widget.

      In contrast to [Gtk.Widget.set_parent], this function inserts [widget] at
      a specific position into the list of children of the [parent] widget.

      It will be placed after [previous_sibling], or at the beginning if
      [previous_sibling] is [NULL].

      After calling this function, [gtk_widget_get_prev_sibling (widget)] will
      return [previous_sibling].

      If [parent] is already set as the parent widget of [widget], this function
      can also be used to reorder [widget] in the child widget list of [parent].

      This function is primarily meant for widget implementations; if you are
      just using a widget, you {i must} use its own API for adding children. *)

  method insert_before : widget_t -> widget_t option -> unit
  (** Sets the parent widget of the widget.

      In contrast to [Gtk.Widget.set_parent], this function inserts [widget] at
      a specific position into the list of children of the [parent] widget.

      It will be placed before [next_sibling], or at the end if [next_sibling]
      is [NULL].

      After calling this function, [gtk_widget_get_next_sibling (widget)] will
      return [next_sibling].

      If [parent] is already set as the parent widget of [widget], this function
      can also be used to reorder [widget] in the child widget list of [parent].

      This function is primarily meant for widget implementations; if you are
      just using a widget, you {i must} use its own API for adding children. *)

  method is_ancestor : widget_t -> bool
  (** Determines whether the widget is a descendent of [ancestor]. *)

  method is_drawable : unit -> bool
  (** Determines whether the widget can be drawn to.

      A widget can be drawn if it is mapped and visible. *)

  method is_focus : unit -> bool
  (** Determines if the widget is the focus widget within its toplevel.

      This does not mean that the [Gtk.Widget:has-focus] property is necessarily
      set; [Gtk.Widget:has-focus] will only be set if the toplevel widget
      additionally has the global input focus. *)

  method is_sensitive : unit -> bool
  (** Returns the widget’s effective sensitivity.

      This means it is sensitive itself and also its parent widget is sensitive.
  *)

  method is_visible : unit -> bool
  (** Determines whether the widget and all its parents are marked as visible.

      This function does not check if the widget is obscured in any way.

      See also [Gtk.Widget.get_visible] and [Gtk.Widget.set_visible]. *)

  method keynav_failed : Enums.directiontype -> bool
  (** Emits the [Gtk.Widget::keynav-failed] signal on the widget.

      This function should be called whenever keyboard navigation within a
      single widget hits a boundary.

      The return value of this function should be interpreted in a way similar
      to the return value of [Gtk.Widget.child_focus]. When true is returned,
      stay in the widget, the failed keyboard navigation is ok and/or there is
      nowhere we can/should move the focus to. When false is returned, the
      caller should continue with keyboard navigation outside the widget, e.g.
      by calling [Gtk.Widget.child_focus] on the widget’s toplevel.

      The default [Gtk.Widget::keynav-failed] handler returns false for
      [Gtk.DirectionType.tab-forward] and [Gtk.DirectionType.tab-backward]. For
      the other values of [Gtk.DirectionType] it returns true.

      Whenever the default handler returns true, it also calls
      [Gtk.Widget.error_bell] to notify the user of the failed keyboard
      navigation.

      A use case for providing an own implementation of [::keynav-failed]
      (either by connecting to it or by overriding it) would be a row of
      [Gtk.Entry] widgets where the user should be able to navigate the entire
      row with the cursor keys, as e.g. known from user interfaces that require
      entering license keys. *)

  method list_mnemonic_labels : unit -> widget_t list
  (** Returns the widgets for which this widget is the target of a mnemonic.

      Typically, these widgets will be labels. See, for example,
      [Gtk.Label.set_mnemonic_widget].

      The widgets in the list are not individually referenced. If you want to
      iterate through the list and perform actions involving callbacks that
      might destroy the widgets, you must call
      [g_list_foreach (result, (GFunc)g_object_ref, NULL)] first, and then unref
      all the widgets afterwards. *)

  method map : unit -> unit
  (** Causes a widget to be mapped if it isn’t already.

      This function is only for use in widget implementations. *)

  method mnemonic_activate : bool -> bool
  (** Emits the [Gtk.Widget::mnemonic-activate] signal. *)

  method observe_children : unit -> Ocgio.List_model.list_model_t
  (** Returns a list model to track the children of the widget.

      Calling this function will enable extra internal bookkeeping to track
      children and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  method observe_controllers : unit -> Ocgio.List_model.list_model_t
  (** Returns a list model to track the event controllers of the widget.

      Calling this function will enable extra internal bookkeeping to track
      controllers and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  method pick : float -> float -> Enums.pickflags -> widget_t option
  (** Finds the descendant of the widget closest to a point.

      The point (x, y) must be given in widget coordinates, so (0, 0) is assumed
      to be the top left of [widget]'s content area.

      Usually widgets will return [NULL] if the given coordinate is not
      contained in [widget] checked via [Gtk.Widget.contains]. Otherwise they
      will recursively try to find a child that does not return [NULL]. Widgets
      are however free to customize their picking algorithm.

      This function is used on the toplevel to determine the widget below the
      mouse cursor for purposes of hover highlighting and delivering events. *)

  method queue_allocate : unit -> unit
  (** Flags the widget for a rerun of the [Gtk.Widget.size_allocate] function.

      Use this function instead of [Gtk.Widget.queue_resize] when the [widget]'s
      size request didn't change but it wants to reposition its contents.

      An example user of this function is [Gtk.Widget.set_halign].

      This function is only for use in widget implementations. *)

  method queue_draw : unit -> unit
  (** Schedules this widget to be redrawn.

      The redraw will happen in the paint phase of the current or the next
      frame.

      This means [widget]'s [Gtk.Widget.snapshot] implementation will be called.
  *)

  method queue_resize : unit -> unit
  (** Flags a widget to have its size renegotiated.

      This should be called when a widget for some reason has a new size
      request. For example, when you change the text in a [Gtk.Label], the label
      queues a resize to ensure there’s enough space for the new text.

      Note that you cannot call gtk_widget_queue_resize() on a widget from
      inside its implementation of the [Gtk.Widget.size_allocate] virtual
      method. Calls to gtk_widget_queue_resize() from inside
      [Gtk.Widget.size_allocate] will be silently ignored.

      This function is only for use in widget implementations. *)

  method realize : unit -> unit
  (** Creates the GDK resources associated with a widget.

      Normally realization happens implicitly; if you show a widget and all its
      parent containers, then the widget will be realized and mapped
      automatically.

      Realizing a widget requires all the widget’s parent widgets to be
      realized; calling this function realizes the widget’s parents in addition
      to [widget] itself. If a widget is not yet inside a toplevel window when
      you realize it, bad things will happen.

      This function is primarily used in widget implementations, and isn’t very
      useful otherwise. Many times when you think you might need it, a better
      approach is to connect to a signal that will be called after the widget is
      realized automatically, such as [Gtk.Widget::realize]. *)

  method remove_controller : event_controller_t -> unit
  (** Removes an event controller from the widget.

      The removed event controller will not receive any more events, and should
      not be used again.

      Widgets will remove all event controllers automatically when they are
      destroyed, there is normally no need to call this function. *)

  method remove_css_class : string -> unit
  (** Removes a style from the widget.

      After this, the style of [widget] will stop matching for [css_class]. *)

  method remove_mnemonic_label : widget_t -> unit
  (** Removes a widget from the list of mnemonic labels for this widget.

      See [Gtk.Widget.list_mnemonic_labels].

      The widget must have previously been added to the list with
      [Gtk.Widget.add_mnemonic_label]. *)

  method remove_tick_callback : int -> unit
  (** Removes a tick callback previously registered with
      [Gtk.Widget.add_tick_callback]. *)

  method set_can_focus : bool -> unit
  (** Sets whether the input focus can enter the widget or any of its children.

      Applications should set [can_focus] to false to mark a widget as for
      pointer/touch use only.

      Note that having [can_focus] be true is only one of the necessary
      conditions for being focusable. A widget must also be sensitive and
      focusable and not have an ancestor that is marked as not can-focus in
      order to receive input focus.

      See [Gtk.Widget.grab_focus] for actually setting the input focus on a
      widget. *)

  method set_can_target : bool -> unit
  (** Sets whether the widget can be the target of pointer events. *)

  method set_child_visible : bool -> unit
  (** Sets whether the widget should be mapped along with its parent.

      The child visibility can be set for widget before it is added to a
      container with [Gtk.Widget.set_parent], to avoid mapping children
      unnecessary before immediately unmapping them. However it will be reset to
      its default state of true when the widget is removed from a container.

      Note that changing the child visibility of a widget does not queue a
      resize on the widget. Most of the time, the size of a widget is computed
      from all visible children, whether or not they are mapped. If this is not
      the case, the container can queue a resize itself.

      This function is only useful for widget implementations and should never
      be called by an application. *)

  method set_css_classes : string array -> unit
  (** Replaces the current style classes of the widget with [classes]. *)

  method set_cursor : Ocgdk.Cursor.cursor_t option -> unit
  (** Sets the cursor to be shown when the pointer hovers over the widget.

      If the [cursor] is [NULL], [widget] will use the cursor inherited from its
      parent. *)

  method set_cursor_from_name : string option -> unit
  (** Sets the cursor to be shown when the pointer hovers over the widget.

      This is a utility function that creates a cursor via
      [Gdk.Cursor.new_from_name] and then sets it on [widget] with
      [Gtk.Widget.set_cursor]. See those functions for details.

      On top of that, this function allows [name] to be [NULL], which will do
      the same as calling [Gtk.Widget.set_cursor] with a [NULL] cursor. *)

  method set_direction : Enums.textdirection -> unit
  (** Sets the reading direction on the widget.

      This direction controls the primary direction for widgets containing text,
      and also the direction in which the children of a container are packed.
      The ability to set the direction is present in order so that correct
      localization into languages with right-to-left reading directions can be
      done.

      Generally, applications will let the default reading direction prevail,
      except for widgets where the children are arranged in an order that is
      explicitly visual rather than logical (such as buttons for text
      justification).

      If the direction is set to [Gtk.TextDirection.none], then the value set by
      [Gtk.Widget.set_default_direction] will be used. *)

  method set_focus_child : widget_t option -> unit
  (** Set the focus child of the widget.

      This function is only suitable for widget implementations. If you want a
      certain widget to get the input focus, call [Gtk.Widget.grab_focus] on it.
  *)

  method set_focus_on_click : bool -> unit
  (** Sets whether the widget should grab focus when it is clicked with the
      mouse.

      Making mouse clicks not grab focus is useful in places like toolbars where
      you don’t want the keyboard focus removed from the main area of the
      application. *)

  method set_focusable : bool -> unit
  (** Sets whether the widget can own the input focus.

      Widget implementations should set [focusable] to true in their init()
      function if they want to receive keyboard input.

      Note that having [focusable] be true is only one of the necessary
      conditions for being focusable. A widget must also be sensitive and
      can-focus and not have an ancestor that is marked as not can-focus in
      order to receive input focus.

      See [Gtk.Widget.grab_focus] for actually setting the input focus on a
      widget. *)

  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  (** Sets the font map to use for text rendering in the widget.

      The font map is the object that is used to look up fonts. Setting a custom
      font map can be useful in special situations, e.g. when you need to add
      application-specific fonts to the set of available fonts.

      When not set, the widget will inherit the font map from its parent. *)

  method set_font_options : Occairo.Font_options.font_options_t option -> unit
  (** Sets the [cairo_font_options_t] used for text rendering in the widget.

      When not set, the default font options for the [GdkDisplay] will be used.
  *)

  method set_halign : Enums.align -> unit
  (** Sets the horizontal alignment of the widget. *)

  method set_has_tooltip : bool -> unit
  (** Sets the [has-tooltip] property on the widget. *)

  method set_hexpand : bool -> unit
  (** Sets whether the widget would like any available extra horizontal space.

      When a user resizes a window, widgets with expand set to true generally
      receive the extra space. For example, a list or scrollable area or
      document in your window would often be set to expand.

      Call this function to set the expand flag if you would like your widget to
      become larger horizontally when the window has extra room.

      By default, widgets automatically expand if any of their children want to
      expand. (To see if a widget will automatically expand given its current
      children and state, call [Gtk.Widget.compute_expand]. A widget can decide
      how the expandability of children affects its own expansion by overriding
      the [compute_expand] virtual method on [GtkWidget].).

      Setting hexpand explicitly with this function will override the automatic
      expand behavior.

      This function forces the widget to expand or not to expand, regardless of
      children. The override occurs because [Gtk.Widget.set_hexpand] sets the
      hexpand-set property (see [Gtk.Widget.set_hexpand_set]) which causes the
      widget’s hexpand value to be used, rather than looking at children and
      widget state. *)

  method set_hexpand_set : bool -> unit
  (** Sets whether the hexpand flag will be used.

      The [Gtk.Widget:hexpand-set] property will be set automatically when you
      call [Gtk.Widget.set_hexpand] to set hexpand, so the most likely reason to
      use this function would be to unset an explicit expand flag.

      If hexpand is set, then it overrides any computed expand value based on
      child widgets. If hexpand is not set, then the expand value depends on
      whether any children of the widget would like to expand.

      There are few reasons to use this function, but it’s here for completeness
      and consistency. *)

  method set_layout_manager : layout_manager_t option -> unit
  (** Sets the layout manager to use for measuring and allocating children of
      the widget. *)

  method set_limit_events : bool -> unit
  (** Sets whether the widget acts like a modal dialog, with respect to event
      delivery. *)

  method set_margin_bottom : int -> unit
  (** Sets the bottom margin of the widget. *)

  method set_margin_end : int -> unit
  (** Sets the end margin of the widget. *)

  method set_margin_start : int -> unit
  (** Sets the start margin of the widget. *)

  method set_margin_top : int -> unit
  (** Sets the top margin of the widget. *)

  method set_name : string -> unit
  (** Sets a widgets name.

      Setting a name allows you to refer to the widget from a CSS file. You can
      apply a style to widgets with a particular name in the CSS file. See the
      documentation for the CSS syntax (on the same page as the docs for
      [Gtk.StyleContext].

      Note that the CSS syntax has certain special characters to delimit and
      represent elements in a selector (period, #, >, *...), so using these will
      make your widget impossible to match by name. Any combination of
      alphanumeric symbols, dashes and underscores will suffice. *)

  method set_opacity : float -> unit
  (** Requests the widget to be rendered partially transparent.

      An opacity of 0 is fully transparent and an opacity of 1 is fully opaque.

      Opacity works on both toplevel widgets and child widgets, although there
      are some limitations: For toplevel widgets, applying opacity depends on
      the capabilities of the windowing system. On X11, this has any effect only
      on X displays with a compositing manager, see [Gdk.Display.is_composited].
      On Windows and Wayland it will always work, although setting a window’s
      opacity after the window has been shown may cause some flicker.

      Note that the opacity is inherited through inclusion — if you set a
      toplevel to be partially translucent, all of its content will appear
      translucent, since it is ultimatively rendered on that toplevel. The
      opacity value itself is not inherited by child widgets (since that would
      make widgets deeper in the hierarchy progressively more translucent). As a
      consequence, [Gtk.Popover] instances and other [Gtk.Native] widgets with
      their own surface will use their own opacity value, and thus by default
      appear non-translucent, even if they are attached to a toplevel that is
      translucent. *)

  method set_overflow : Enums.overflow -> unit
  (** Sets how the widget treats content that is drawn outside the it's content
      area.

      See the definition of [Gtk.Overflow] for details.

      This setting is provided for widget implementations and should not be used
      by application code.

      The default value is [Gtk.Overflow.visible]. *)

  method set_parent : widget_t -> unit
  (** Sets the parent widget of the widget.

      This takes care of details such as updating the state and style of the
      child to reflect its new location and resizing the parent. The opposite
      function is [Gtk.Widget.unparent].

      This function is useful only when implementing subclasses of [GtkWidget].
  *)

  method set_receives_default : bool -> unit
  (** Sets whether the widget will be treated as the default widget within its
      toplevel when it has the focus, even if another widget is the default. *)

  method set_sensitive : bool -> unit
  (** Sets the sensitivity of the widget.

      A widget is sensitive if the user can interact with it. Insensitive
      widgets are “grayed out” and the user can’t interact with them.
      Insensitive widgets are known as “inactive”, “disabled”, or “ghosted” in
      some other toolkits. *)

  method set_size_request : int -> int -> unit
  (** Sets the minimum size of the widget.

      That is, the widget’s size request will be at least [width] by [height].
      You can use this function to force a widget to be larger than it normally
      would be.

      In most cases, [Gtk.Window.set_default_size] is a better choice for
      toplevel windows than this function; setting the default size will still
      allow users to shrink the window. Setting the size request will force them
      to leave the window at least as large as the size request.

      Note the inherent danger of setting any fixed size - themes, translations
      into other languages, different fonts, and user action can all change the
      appropriate size for a given widget. So, it is basically impossible to
      hardcode a size that will always work.

      The size request of a widget is the smallest size a widget can accept
      while still functioning well and drawing itself correctly. However in some
      strange cases a widget may be allocated less than its requested size, and
      in many cases a widget may be allocated more space than it requested.

      If the size request in a given direction is -1 (unset), then the “natural”
      size request of the widget will be used instead.

      The size request set here does not include any margin from the properties
      [Gtk.Widget:margin-start], [Gtk.Widget:margin-end],
      [Gtk.Widget:margin-top], and [Gtk.Widget:margin-bottom], but it does
      include pretty much all other padding or border properties set by any
      subclass of [GtkWidget]. *)

  method set_state_flags : Enums.stateflags -> bool -> unit
  (** Turns on flag values in the current widget state.

      Typical widget states are insensitive, prelighted, etc.

      This function accepts the values [Gtk.StateFlags.dir-ltr] and
      [Gtk.StateFlags.dir-rtl] but ignores them. If you want to set the widget's
      direction, use [Gtk.Widget.set_direction].

      This function is for use in widget implementations. *)

  method set_tooltip_markup : string option -> unit
  (** Sets the contents of the tooltip for widget.

      [markup] must contain Pango markup.

      This function will take care of setting the [Gtk.Widget:has-tooltip] as a
      side effect, and of the default handler for the
      [Gtk.Widget::query-tooltip] signal.

      See also [Gtk.Tooltip.set_markup]. *)

  method set_tooltip_text : string option -> unit
  (** Sets the contents of the tooltip for the widget.

      If [text] contains any markup, it will be escaped.

      This function will take care of setting [Gtk.Widget:has-tooltip] as a side
      effect, and of the default handler for the [Gtk.Widget::query-tooltip]
      signal.

      See also [Gtk.Tooltip.set_text]. *)

  method set_valign : Enums.align -> unit
  (** Sets the vertical alignment of the widget. *)

  method set_vexpand : bool -> unit
  (** Sets whether the widget would like any available extra vertical space.

      See [Gtk.Widget.set_hexpand] for more detail. *)

  method set_vexpand_set : bool -> unit
  (** Sets whether the vexpand flag will be used.

      See [Gtk.Widget.set_hexpand_set] for more detail. *)

  method set_visible : bool -> unit
  (** Sets the visibility state of [widget].

      Note that setting this to true doesn’t mean the widget is actually
      viewable, see [Gtk.Widget.get_visible]. *)

  method should_layout : unit -> bool
  (** Returns whether the widget should contribute to the measuring and
      allocation of its parent.

      This is false for invisible children, but also for children that have
      their own surface, such as [Gtk.Popover] instances. *)

  method show : unit -> unit
  (** Flags a widget to be displayed.

      Any widget that isn’t shown will not appear on the screen.

      Remember that you have to show the containers containing a widget, in
      addition to the widget itself, before it will appear onscreen.

      When a toplevel widget is shown, it is immediately realized and mapped;
      other shown widgets are realized and mapped when their toplevel widget is
      realized and mapped. *)

  method snapshot_child : widget_t -> Snapshot.snapshot_t -> unit
  (** Snapshots a child of the widget.

      When a widget receives a call to the snapshot function, it must send
      synthetic [Gtk.Widget.snapshot] calls to all children. This function
      provides a convenient way of doing this. A widget, when it receives a call
      to its [Gtk.Widget.snapshot] function, calls gtk_widget_snapshot_child()
      once for each child, passing in the [snapshot] the widget received.

      This function takes care of translating the origin of [snapshot], and
      deciding whether the child needs to be snapshot.

      It does nothing for children that implement [GtkNative]. *)

  method trigger_tooltip_query : unit -> unit
  (** Triggers a tooltip query on the display of the widget. *)

  method unmap : unit -> unit
  (** Causes a widget to be unmapped if it’s currently mapped.

      This function is only for use in widget implementations. *)

  method unparent : unit -> unit
  (** Removes [widget] from its parent.

      This function is only for use in widget implementations, typically in
      dispose. *)

  method unrealize : unit -> unit
  (** Causes a widget to be unrealized.

      This frees all GDK resources associated with the widget.

      This function is only useful in widget implementations. *)

  method unset_state_flags : Enums.stateflags -> unit
  (** Turns off flag values for the current widget state.

      See [Gtk.Widget.set_state_flags].

      This function is for use in widget implementations. *)

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
