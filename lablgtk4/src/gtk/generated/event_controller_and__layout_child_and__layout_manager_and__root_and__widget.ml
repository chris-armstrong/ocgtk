(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Event_controller : sig
  type t = [`event_controller] Gobject.obj

  (* Methods *)
  (** Sets a name on the controller that can be used for debugging. *)
  external set_static_name : t -> string option -> unit = "ml_gtk_event_controller_set_static_name"

  (** Sets the propagation phase at which a controller handles events.

  If @phase is %GTK_PHASE_NONE, no automatic event handling will be
  performed, but other additional gesture maintenance will. *)
  external set_propagation_phase : t -> Gtk_enums.propagationphase -> unit = "ml_gtk_event_controller_set_propagation_phase"

  (** Sets the event propagation limit on the event controller.

  If the limit is set to %GTK_LIMIT_SAME_NATIVE, the controller
  won't handle events that are targeted at widgets on a different
  surface, such as popovers. *)
  external set_propagation_limit : t -> Gtk_enums.propagationlimit -> unit = "ml_gtk_event_controller_set_propagation_limit"

  (** Sets a name on the controller that can be used for debugging. *)
  external set_name : t -> string option -> unit = "ml_gtk_event_controller_set_name"

  (** Resets the @controller to a clean state. *)
  external reset : t -> unit = "ml_gtk_event_controller_reset"

  (** Returns the `GtkWidget` this controller relates to. *)
  external get_widget : t -> Widget.t = "ml_gtk_event_controller_get_widget"

  (** Gets the propagation phase at which @controller handles events. *)
  external get_propagation_phase : t -> Gtk_enums.propagationphase = "ml_gtk_event_controller_get_propagation_phase"

  (** Gets the propagation limit of the event controller. *)
  external get_propagation_limit : t -> Gtk_enums.propagationlimit = "ml_gtk_event_controller_get_propagation_limit"

  (** Gets the name of @controller. *)
  external get_name : t -> string option = "ml_gtk_event_controller_get_name"

  (* Properties *)


end = struct
  type t = [`event_controller] Gobject.obj

  (* Methods *)
  (** Sets a name on the controller that can be used for debugging. *)
  external set_static_name : t -> string option -> unit = "ml_gtk_event_controller_set_static_name"

  (** Sets the propagation phase at which a controller handles events.

  If @phase is %GTK_PHASE_NONE, no automatic event handling will be
  performed, but other additional gesture maintenance will. *)
  external set_propagation_phase : t -> Gtk_enums.propagationphase -> unit = "ml_gtk_event_controller_set_propagation_phase"

  (** Sets the event propagation limit on the event controller.

  If the limit is set to %GTK_LIMIT_SAME_NATIVE, the controller
  won't handle events that are targeted at widgets on a different
  surface, such as popovers. *)
  external set_propagation_limit : t -> Gtk_enums.propagationlimit -> unit = "ml_gtk_event_controller_set_propagation_limit"

  (** Sets a name on the controller that can be used for debugging. *)
  external set_name : t -> string option -> unit = "ml_gtk_event_controller_set_name"

  (** Resets the @controller to a clean state. *)
  external reset : t -> unit = "ml_gtk_event_controller_reset"

  (** Returns the `GtkWidget` this controller relates to. *)
  external get_widget : t -> Widget.t = "ml_gtk_event_controller_get_widget"

  (** Gets the propagation phase at which @controller handles events. *)
  external get_propagation_phase : t -> Gtk_enums.propagationphase = "ml_gtk_event_controller_get_propagation_phase"

  (** Gets the propagation limit of the event controller. *)
  external get_propagation_limit : t -> Gtk_enums.propagationlimit = "ml_gtk_event_controller_get_propagation_limit"

  (** Gets the name of @controller. *)
  external get_name : t -> string option = "ml_gtk_event_controller_get_name"

  (* Properties *)


end

and Layout_child
 : sig
  type t = [`layout_child | `object_] Gobject.obj

  (* Methods *)
  (** Retrieves the `GtkLayoutManager` instance that created the
  given @layout_child. *)
  external get_layout_manager : t -> Layout_manager.t = "ml_gtk_layout_child_get_layout_manager"

  (** Retrieves the `GtkWidget` associated to the given @layout_child. *)
  external get_child_widget : t -> Widget.t = "ml_gtk_layout_child_get_child_widget"

  (* Properties *)


end = struct
  type t = [`layout_child | `object_] Gobject.obj

  (* Methods *)
  (** Retrieves the `GtkLayoutManager` instance that created the
  given @layout_child. *)
  external get_layout_manager : t -> Layout_manager.t = "ml_gtk_layout_child_get_layout_manager"

  (** Retrieves the `GtkWidget` associated to the given @layout_child. *)
  external get_child_widget : t -> Widget.t = "ml_gtk_layout_child_get_child_widget"

  (* Properties *)


end

and Layout_manager
 : sig
  type t = [`layout_manager] Gobject.obj

  (* Methods *)
  (** Measures the size of the @widget using @manager, for the
  given @orientation and size.

  See the [class@Gtk.Widget] documentation on layout management for
  more details. *)
  external measure : t -> Widget.t -> Gtk_enums.orientation -> int -> int * int * int * int = "ml_gtk_layout_manager_measure"

  (** Queues a resize on the `GtkWidget` using @manager, if any.

  This function should be called by subclasses of `GtkLayoutManager`
  in response to changes to their layout management policies. *)
  external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"

  (** Retrieves the `GtkWidget` using the given `GtkLayoutManager`. *)
  external get_widget : t -> Widget.t option = "ml_gtk_layout_manager_get_widget"

  (** Retrieves the request mode of @manager. *)
  external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_layout_manager_get_request_mode"

  (** Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
  creating one if necessary.

  The @child widget must be a child of the widget using @manager.

  The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
  and is guaranteed to exist as long as @child is a child of the
  `GtkWidget` using the given `GtkLayoutManager`. *)
  external get_layout_child : t -> Widget.t -> Layout_child.t = "ml_gtk_layout_manager_get_layout_child"

  (** Assigns the given @width, @height, and @baseline to
  a @widget, and computes the position and sizes of the children of
  the @widget using the layout management policy of @manager. *)
  external allocate : t -> Widget.t -> int -> int -> int -> unit = "ml_gtk_layout_manager_allocate"


end = struct
  type t = [`layout_manager] Gobject.obj

  (* Methods *)
  (** Measures the size of the @widget using @manager, for the
  given @orientation and size.

  See the [class@Gtk.Widget] documentation on layout management for
  more details. *)
  external measure : t -> Widget.t -> Gtk_enums.orientation -> int -> int * int * int * int = "ml_gtk_layout_manager_measure"

  (** Queues a resize on the `GtkWidget` using @manager, if any.

  This function should be called by subclasses of `GtkLayoutManager`
  in response to changes to their layout management policies. *)
  external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"

  (** Retrieves the `GtkWidget` using the given `GtkLayoutManager`. *)
  external get_widget : t -> Widget.t option = "ml_gtk_layout_manager_get_widget"

  (** Retrieves the request mode of @manager. *)
  external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_layout_manager_get_request_mode"

  (** Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
  creating one if necessary.

  The @child widget must be a child of the widget using @manager.

  The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
  and is guaranteed to exist as long as @child is a child of the
  `GtkWidget` using the given `GtkLayoutManager`. *)
  external get_layout_child : t -> Widget.t -> Layout_child.t = "ml_gtk_layout_manager_get_layout_child"

  (** Assigns the given @width, @height, and @baseline to
  a @widget, and computes the position and sizes of the children of
  the @widget using the layout management policy of @manager. *)
  external allocate : t -> Widget.t -> int -> int -> int -> unit = "ml_gtk_layout_manager_allocate"


end

and Root
 : sig
  type t = [`root] Gobject.obj

  (* Methods *)
  (** If @focus is not the current focus widget, and is focusable, sets
  it as the focus widget for the root.

  If @focus is %NULL, unsets the focus widget for the root.

  To set the focus to a particular widget in the root, it is usually
  more convenient to use [method@Gtk.Widget.grab_focus] instead of
  this function. *)
  external set_focus : t -> Widget.t option -> unit = "ml_gtk_root_set_focus"

  (** Retrieves the current focused widget within the root.

  Note that this is the widget that would have the focus
  if the root is active; if the root is not focused then
  `gtk_widget_has_focus (widget)` will be %FALSE for the
  widget. *)
  external get_focus : t -> Widget.t option = "ml_gtk_root_get_focus"


end = struct
  type t = [`root] Gobject.obj

  (* Methods *)
  (** If @focus is not the current focus widget, and is focusable, sets
  it as the focus widget for the root.

  If @focus is %NULL, unsets the focus widget for the root.

  To set the focus to a particular widget in the root, it is usually
  more convenient to use [method@Gtk.Widget.grab_focus] instead of
  this function. *)
  external set_focus : t -> Widget.t option -> unit = "ml_gtk_root_set_focus"

  (** Retrieves the current focused widget within the root.

  Note that this is the widget that would have the focus
  if the root is active; if the root is not focused then
  `gtk_widget_has_focus (widget)` will be %FALSE for the
  widget. *)
  external get_focus : t -> Widget.t option = "ml_gtk_root_get_focus"


end

and Widget
 : sig
  type t = [`widget] Gobject.obj

  (* Methods *)
  (** Causes a widget to be unrealized (frees all GDK resources
  associated with the widget).

  This function is only useful in widget implementations. *)
  external unrealize : t -> unit = "ml_gtk_widget_unrealize"

  (** Dissociate @widget from its parent.

  This function is only for use in widget implementations,
  typically in dispose. *)
  external unparent : t -> unit = "ml_gtk_widget_unparent"

  (** Causes a widget to be unmapped if it’s currently mapped.

  This function is only for use in widget implementations. *)
  external unmap : t -> unit = "ml_gtk_widget_unmap"

  (** Triggers a tooltip query on the display where the toplevel
  of @widget is located. *)
  external trigger_tooltip_query : t -> unit = "ml_gtk_widget_trigger_tooltip_query"

  (** Translate coordinates relative to @src_widget’s allocation
  to coordinates relative to @dest_widget’s allocations.

  In order to perform this operation, both widget must share
  a common ancestor. *)
  external translate_coordinates : t -> t -> float -> float -> bool * float * float = "ml_gtk_widget_translate_coordinates"

  (** Snapshot the a child of @widget.

  When a widget receives a call to the snapshot function,
  it must send synthetic [vfunc@Gtk.Widget.snapshot] calls
  to all children. This function provides a convenient way
  of doing this. A widget, when it receives a call to its
  [vfunc@Gtk.Widget.snapshot] function, calls
  gtk_widget_snapshot_child() once for each child, passing in
  the @snapshot the widget received.

  gtk_widget_snapshot_child() takes care of translating the origin of
  @snapshot, and deciding whether the child needs to be snapshot.

  This function does nothing for children that implement `GtkNative`. *)
  external snapshot_child : t -> t -> Snapshot.t -> unit = "ml_gtk_widget_snapshot_child"

  (** Flags a widget to be displayed.

  Any widget that isn’t shown will not appear on the screen.

  Remember that you have to show the containers containing a widget,
  in addition to the widget itself, before it will appear onscreen.

  When a toplevel container is shown, it is immediately realized and
  mapped; other shown widgets are realized and mapped when their
  toplevel container is realized and mapped. *)
  external show : t -> unit = "ml_gtk_widget_show"

  (** Returns whether @widget should contribute to
  the measuring and allocation of its parent.

  This is %FALSE for invisible children, but also
  for children that have their own surface. *)
  external should_layout : t -> bool = "ml_gtk_widget_should_layout"

  (** Sets the visibility state of @widget.

  Note that setting this to %TRUE doesn’t mean the widget is
  actually viewable, see [method@Gtk.Widget.get_visible]. *)
  external set_visible : t -> bool -> unit = "ml_gtk_widget_set_visible"

  (** Sets whether the vexpand flag will be used.

  See [method@Gtk.Widget.set_hexpand_set] for more detail. *)
  external set_vexpand_set : t -> bool -> unit = "ml_gtk_widget_set_vexpand_set"

  (** Sets whether the widget would like any available extra vertical
  space.

  See [method@Gtk.Widget.set_hexpand] for more detail. *)
  external set_vexpand : t -> bool -> unit = "ml_gtk_widget_set_vexpand"

  (** Sets the vertical alignment of @widget. *)
  external set_valign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_valign"

  (** Sets @text as the contents of the tooltip.

  If @text contains any markup, it will be escaped.

  This function will take care of setting
  [property@Gtk.Widget:has-tooltip] as a side effect,
  and of the default handler for the
  [signal@Gtk.Widget::query-tooltip] signal.

  See also [method@Gtk.Tooltip.set_text]. *)
  external set_tooltip_text : t -> string option -> unit = "ml_gtk_widget_set_tooltip_text"

  (** Sets @markup as the contents of the tooltip, which is marked
  up with Pango markup.

  This function will take care of setting the
  [property@Gtk.Widget:has-tooltip] as a side effect, and of the
  default handler for the [signal@Gtk.Widget::query-tooltip] signal.

  See also [method@Gtk.Tooltip.set_markup]. *)
  external set_tooltip_markup : t -> string option -> unit = "ml_gtk_widget_set_tooltip_markup"

  (** Sets the minimum size of a widget.

  That is, the widget’s size request will be at least @width
  by @height. You can use this function to force a widget to
  be larger than it normally would be.

  In most cases, [method@Gtk.Window.set_default_size] is a better
  choice for toplevel windows than this function; setting the default
  size will still allow users to shrink the window. Setting the size
  request will force them to leave the window at least as large as
  the size request.

  Note the inherent danger of setting any fixed size - themes,
  translations into other languages, different fonts, and user action
  can all change the appropriate size for a given widget. So, it's
  basically impossible to hardcode a size that will always be
  correct.

  The size request of a widget is the smallest size a widget can
  accept while still functioning well and drawing itself correctly.
  However in some strange cases a widget may be allocated less than
  its requested size, and in many cases a widget may be allocated more
  space than it requested.

  If the size request in a given direction is -1 (unset), then
  the “natural” size request of the widget will be used instead.

  The size request set here does not include any margin from the
  properties
  [property@Gtk.Widget:margin-start],
  [property@Gtk.Widget:margin-end],
  [property@Gtk.Widget:margin-top], and
  [property@Gtk.Widget:margin-bottom], but it does include pretty
  much all other padding or border properties set by any subclass
  of `GtkWidget`. *)
  external set_size_request : t -> int -> int -> unit = "ml_gtk_widget_set_size_request"

  (** Sets the sensitivity of a widget.

  A widget is sensitive if the user can interact with it.
  Insensitive widgets are “grayed out” and the user can’t
  interact with them. Insensitive widgets are known as
  “inactive”, “disabled”, or “ghosted” in some other toolkits. *)
  external set_sensitive : t -> bool -> unit = "ml_gtk_widget_set_sensitive"

  (** Specifies whether @widget will be treated as the default
  widget within its toplevel when it has the focus, even if
  another widget is the default. *)
  external set_receives_default : t -> bool -> unit = "ml_gtk_widget_set_receives_default"

  (** Sets @parent as the parent widget of @widget.

  This takes care of details such as updating the state and style
  of the child to reflect its new location and resizing the parent.
  The opposite function is [method@Gtk.Widget.unparent].

  This function is useful only when implementing subclasses of
  `GtkWidget`. *)
  external set_parent : t -> t -> unit = "ml_gtk_widget_set_parent"

  (** Sets how @widget treats content that is drawn outside the
  widget's content area.

  See the definition of [enum@Gtk.Overflow] for details.

  This setting is provided for widget implementations and
  should not be used by application code.

  The default value is %GTK_OVERFLOW_VISIBLE. *)
  external set_overflow : t -> Gtk_enums.overflow -> unit = "ml_gtk_widget_set_overflow"

  (** Request the @widget to be rendered partially transparent.

  An opacity of 0 is fully transparent and an opacity of 1
  is fully opaque.

  Opacity works on both toplevel widgets and child widgets, although
  there are some limitations: For toplevel widgets, applying opacity
  depends on the capabilities of the windowing system. On X11, this
  has any effect only on X displays with a compositing manager,
  see gdk_display_is_composited(). On Windows and Wayland it should
  always work, although setting a window’s opacity after the window
  has been shown may cause some flicker.

  Note that the opacity is inherited through inclusion — if you set
  a toplevel to be partially translucent, all of its content will
  appear translucent, since it is ultimatively rendered on that
  toplevel. The opacity value itself is not inherited by child
  widgets (since that would make widgets deeper in the hierarchy
  progressively more translucent). As a consequence, [class@Gtk.Popover]s
  and other [iface@Gtk.Native] widgets with their own surface will use their
  own opacity value, and thus by default appear non-translucent,
  even if they are attached to a toplevel that is translucent. *)
  external set_opacity : t -> float -> unit = "ml_gtk_widget_set_opacity"

  (** Sets a widgets name.

  Setting a name allows you to refer to the widget from a
  CSS file. You can apply a style to widgets with a particular name
  in the CSS file. See the documentation for the CSS syntax (on the
  same page as the docs for [class@Gtk.StyleContext].

  Note that the CSS syntax has certain special characters to delimit
  and represent elements in a selector (period, #, >, *...), so using
  these will make your widget impossible to match by name. Any combination
  of alphanumeric symbols, dashes and underscores will suffice. *)
  external set_name : t -> string -> unit = "ml_gtk_widget_set_name"

  (** Sets the top margin of @widget. *)
  external set_margin_top : t -> int -> unit = "ml_gtk_widget_set_margin_top"

  (** Sets the start margin of @widget. *)
  external set_margin_start : t -> int -> unit = "ml_gtk_widget_set_margin_start"

  (** Sets the end margin of @widget. *)
  external set_margin_end : t -> int -> unit = "ml_gtk_widget_set_margin_end"

  (** Sets the bottom margin of @widget. *)
  external set_margin_bottom : t -> int -> unit = "ml_gtk_widget_set_margin_bottom"

  (** Sets the layout manager delegate instance that provides an
  implementation for measuring and allocating the children of @widget. *)
  external set_layout_manager : t -> Layout_manager.t option -> unit = "ml_gtk_widget_set_layout_manager"

  (** Sets whether the hexpand flag will be used.

  The [property@Gtk.Widget:hexpand-set] property will be set
  automatically when you call [method@Gtk.Widget.set_hexpand]
  to set hexpand, so the most likely reason to use this function
  would be to unset an explicit expand flag.

  If hexpand is set, then it overrides any computed
  expand value based on child widgets. If hexpand is not
  set, then the expand value depends on whether any
  children of the widget would like to expand.

  There are few reasons to use this function, but it’s here
  for completeness and consistency. *)
  external set_hexpand_set : t -> bool -> unit = "ml_gtk_widget_set_hexpand_set"

  (** Sets whether the widget would like any available extra horizontal
  space.

  When a user resizes a `GtkWindow`, widgets with expand=TRUE
  generally receive the extra space. For example, a list or
  scrollable area or document in your window would often be set to
  expand.

  Call this function to set the expand flag if you would like your
  widget to become larger horizontally when the window has extra
  room.

  By default, widgets automatically expand if any of their children
  want to expand. (To see if a widget will automatically expand given
  its current children and state, call [method@Gtk.Widget.compute_expand].
  A container can decide how the expandability of children affects the
  expansion of the container by overriding the compute_expand virtual
  method on `GtkWidget`.).

  Setting hexpand explicitly with this function will override the
  automatic expand behavior.

  This function forces the widget to expand or not to expand,
  regardless of children.  The override occurs because
  [method@Gtk.Widget.set_hexpand] sets the hexpand-set property (see
  [method@Gtk.Widget.set_hexpand_set]) which causes the widget’s hexpand
  value to be used, rather than looking at children and widget state. *)
  external set_hexpand : t -> bool -> unit = "ml_gtk_widget_set_hexpand"

  (** Sets the `has-tooltip` property on @widget to @has_tooltip. *)
  external set_has_tooltip : t -> bool -> unit = "ml_gtk_widget_set_has_tooltip"

  (** Sets the horizontal alignment of @widget. *)
  external set_halign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_halign"

  (** Specifies whether @widget can own the input focus.

  Widget implementations should set @focusable to %TRUE in
  their init() function if they want to receive keyboard input.

  Note that having @focusable be %TRUE is only one of the
  necessary conditions for being focusable. A widget must
  also be sensitive and can-focus and not have an ancestor
  that is marked as not can-focus in order to receive input
  focus.

  See [method@Gtk.Widget.grab_focus] for actually setting
  the input focus on a widget. *)
  external set_focusable : t -> bool -> unit = "ml_gtk_widget_set_focusable"

  (** Sets whether the widget should grab focus when it is clicked
  with the mouse.

  Making mouse clicks not grab focus is useful in places like
  toolbars where you don’t want the keyboard focus removed from
  the main area of the application. *)
  external set_focus_on_click : t -> bool -> unit = "ml_gtk_widget_set_focus_on_click"

  (** Set @child as the current focus child of @widget.

  This function is only suitable for widget implementations.
  If you want a certain widget to get the input focus, call
  [method@Gtk.Widget.grab_focus] on it. *)
  external set_focus_child : t -> t option -> unit = "ml_gtk_widget_set_focus_child"

  (** Sets the reading direction on a particular widget.

  This direction controls the primary direction for widgets
  containing text, and also the direction in which the children
  of a container are packed. The ability to set the direction is
  present in order so that correct localization into languages with
  right-to-left reading directions can be done. Generally, applications
  will let the default reading direction present, except for containers
  where the containers are arranged in an order that is explicitly
  visual rather than logical (such as buttons for text justification).

  If the direction is set to %GTK_TEXT_DIR_NONE, then the value
  set by [func@Gtk.Widget.set_default_direction] will be used. *)
  external set_direction : t -> Gtk_enums.textdirection -> unit = "ml_gtk_widget_set_direction"

  (** Sets a named cursor to be shown when pointer devices point
  towards @widget.

  This is a utility function that creates a cursor via
  [ctor@Gdk.Cursor.new_from_name] and then sets it on @widget
  with [method@Gtk.Widget.set_cursor]. See those functions for
  details.

  On top of that, this function allows @name to be %NULL, which
  will do the same as calling [method@Gtk.Widget.set_cursor]
  with a %NULL cursor. *)
  external set_cursor_from_name : t -> string option -> unit = "ml_gtk_widget_set_cursor_from_name"

  (** Sets whether @widget should be mapped along with its parent.

  The child visibility can be set for widget before it is added
  to a container with [method@Gtk.Widget.set_parent], to avoid
  mapping children unnecessary before immediately unmapping them.
  However it will be reset to its default state of %TRUE when the
  widget is removed from a container.

  Note that changing the child visibility of a widget does not
  queue a resize on the widget. Most of the time, the size of
  a widget is computed from all visible children, whether or
  not they are mapped. If this is not the case, the container
  can queue a resize itself.

  This function is only useful for container implementations
  and should never be called by an application. *)
  external set_child_visible : t -> bool -> unit = "ml_gtk_widget_set_child_visible"

  (** Sets whether @widget can be the target of pointer events. *)
  external set_can_target : t -> bool -> unit = "ml_gtk_widget_set_can_target"

  (** Specifies whether the input focus can enter the widget
  or any of its children.

  Applications should set @can_focus to %FALSE to mark a
  widget as for pointer/touch use only.

  Note that having @can_focus be %TRUE is only one of the
  necessary conditions for being focusable. A widget must
  also be sensitive and focusable and not have an ancestor
  that is marked as not can-focus in order to receive input
  focus.

  See [method@Gtk.Widget.grab_focus] for actually setting
  the input focus on a widget. *)
  external set_can_focus : t -> bool -> unit = "ml_gtk_widget_set_can_focus"

  (** Removes a tick callback previously registered with
  gtk_widget_add_tick_callback(). *)
  external remove_tick_callback : t -> int -> unit = "ml_gtk_widget_remove_tick_callback"

  (** Removes a widget from the list of mnemonic labels for this widget.

  See [method@Gtk.Widget.list_mnemonic_labels]. The widget must
  have previously been added to the list with
  [method@Gtk.Widget.add_mnemonic_label]. *)
  external remove_mnemonic_label : t -> t -> unit = "ml_gtk_widget_remove_mnemonic_label"

  (** Removes a style from @widget.

  After this, the style of @widget will stop matching for @css_class. *)
  external remove_css_class : t -> string -> unit = "ml_gtk_widget_remove_css_class"

  (** Removes @controller from @widget, so that it doesn't process
  events anymore.

  It should not be used again.

  Widgets will remove all event controllers automatically when they
  are destroyed, there is normally no need to call this function. *)
  external remove_controller : t -> Event_controller.t -> unit = "ml_gtk_widget_remove_controller"

  (** Creates the GDK resources associated with a widget.

  Normally realization happens implicitly; if you show a widget
  and all its parent containers, then the widget will be realized
  and mapped automatically.

  Realizing a widget requires all the widget’s parent widgets to be
  realized; calling this function realizes the widget’s parents
  in addition to @widget itself. If a widget is not yet inside a
  toplevel window when you realize it, bad things will happen.

  This function is primarily used in widget implementations, and
  isn’t very useful otherwise. Many times when you think you might
  need it, a better approach is to connect to a signal that will be
  called after the widget is realized automatically, such as
  [signal@Gtk.Widget::realize]. *)
  external realize : t -> unit = "ml_gtk_widget_realize"

  (** Flags a widget to have its size renegotiated.

  This should be called when a widget for some reason has a new
  size request. For example, when you change the text in a
  [class@Gtk.Label], the label queues a resize to ensure there’s
  enough space for the new text.

  Note that you cannot call gtk_widget_queue_resize() on a widget
  from inside its implementation of the [vfunc@Gtk.Widget.size_allocate]
  virtual method. Calls to gtk_widget_queue_resize() from inside
  [vfunc@Gtk.Widget.size_allocate] will be silently ignored.

  This function is only for use in widget implementations. *)
  external queue_resize : t -> unit = "ml_gtk_widget_queue_resize"

  (** Schedules this widget to be redrawn in the paint phase
  of the current or the next frame.

  This means @widget's [vfunc@Gtk.Widget.snapshot]
  implementation will be called. *)
  external queue_draw : t -> unit = "ml_gtk_widget_queue_draw"

  (** Flags the widget for a rerun of the [vfunc@Gtk.Widget.size_allocate]
  function.

  Use this function instead of [method@Gtk.Widget.queue_resize]
  when the @widget's size request didn't change but it wants to
  reposition its contents.

  An example user of this function is [method@Gtk.Widget.set_halign].

  This function is only for use in widget implementations. *)
  external queue_allocate : t -> unit = "ml_gtk_widget_queue_allocate"

  (** Emits the ::mnemonic-activate signal.

  See [signal@Gtk.Widget::mnemonic-activate]. *)
  external mnemonic_activate : t -> bool -> bool = "ml_gtk_widget_mnemonic_activate"

  (** Measures @widget in the orientation @orientation and for the given @for_size.

  As an example, if @orientation is %GTK_ORIENTATION_HORIZONTAL and @for_size
  is 300, this functions will compute the minimum and natural width of @widget
  if it is allocated at a height of 300 pixels.

  See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
  a more details on implementing `GtkWidgetClass.measure()`. *)
  external measure : t -> Gtk_enums.orientation -> int -> int * int * int * int = "ml_gtk_widget_measure"

  (** Causes a widget to be mapped if it isn’t already.

  This function is only for use in widget implementations. *)
  external map : t -> unit = "ml_gtk_widget_map"

  (** Emits the `::keynav-failed` signal on the widget.

  This function should be called whenever keyboard navigation
  within a single widget hits a boundary.

  The return value of this function should be interpreted
  in a way similar to the return value of
  [method@Gtk.Widget.child_focus]. When %TRUE is returned,
  stay in the widget, the failed keyboard  navigation is OK
  and/or there is nowhere we can/should move the focus to.
  When %FALSE is returned, the caller should continue with
  keyboard navigation outside the widget, e.g. by calling
  [method@Gtk.Widget.child_focus] on the widget’s toplevel.

  The default [signal@Gtk.Widget::keynav-failed] handler returns
  %FALSE for %GTK_DIR_TAB_FORWARD and %GTK_DIR_TAB_BACKWARD.
  For the other values of `GtkDirectionType` it returns %TRUE.

  Whenever the default handler returns %TRUE, it also calls
  [method@Gtk.Widget.error_bell] to notify the user of the
  failed keyboard navigation.

  A use case for providing an own implementation of ::keynav-failed
  (either by connecting to it or by overriding it) would be a row of
  [class@Gtk.Entry] widgets where the user should be able to navigate
  the entire row with the cursor keys, as e.g. known from user
  interfaces that require entering license keys. *)
  external keynav_failed : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_keynav_failed"

  (** Determines whether the widget and all its parents are marked as
  visible.

  This function does not check if the widget is obscured in any way.

  See also [method@Gtk.Widget.get_visible] and
  [method@Gtk.Widget.set_visible]. *)
  external is_visible : t -> bool = "ml_gtk_widget_is_visible"

  (** Returns the widget’s effective sensitivity.

  This means it is sensitive itself and also its
  parent widget is sensitive. *)
  external is_sensitive : t -> bool = "ml_gtk_widget_is_sensitive"

  (** Determines if the widget is the focus widget within its
  toplevel.

  This does not mean that the [property@Gtk.Widget:has-focus]
  property is necessarily set; [property@Gtk.Widget:has-focus]
  will only be set if the toplevel widget additionally has the
  global input focus. *)
  external is_focus : t -> bool = "ml_gtk_widget_is_focus"

  (** Determines whether @widget can be drawn to.

  A widget can be drawn if it is mapped and visible. *)
  external is_drawable : t -> bool = "ml_gtk_widget_is_drawable"

  (** Determines whether @widget is somewhere inside @ancestor,
  possibly with intermediate containers. *)
  external is_ancestor : t -> t -> bool = "ml_gtk_widget_is_ancestor"

  (** Inserts @widget into the child widget list of @parent.

  It will be placed before @next_sibling, or at the end if
  @next_sibling is %NULL.

  After calling this function, `gtk_widget_get_next_sibling(widget)`
  will return @next_sibling.

  If @parent is already set as the parent widget of @widget, this function
  can also be used to reorder @widget in the child widget list of @parent.

  This API is primarily meant for widget implementations; if you are
  just using a widget, you *must* use its own API for adding children. *)
  external insert_before : t -> t -> t option -> unit = "ml_gtk_widget_insert_before"

  (** Inserts @widget into the child widget list of @parent.

  It will be placed after @previous_sibling, or at the beginning if
  @previous_sibling is %NULL.

  After calling this function, `gtk_widget_get_prev_sibling(widget)`
  will return @previous_sibling.

  If @parent is already set as the parent widget of @widget, this
  function can also be used to reorder @widget in the child widget
  list of @parent.

  This API is primarily meant for widget implementations; if you are
  just using a widget, you *must* use its own API for adding children. *)
  external insert_after : t -> t -> t option -> unit = "ml_gtk_widget_insert_after"

  (** Creates and initializes child widgets defined in templates.

  This function must be called in the instance initializer
  for any class which assigned itself a template using
  [method@Gtk.WidgetClass.set_template].

  It is important to call this function in the instance initializer
  of a `GtkWidget` subclass and not in `GObject.constructed()` or
  `GObject.constructor()` for two reasons:

   - derived widgets will assume that the composite widgets
     defined by its parent classes have been created in their
     relative instance initializers
   - when calling `g_object_new()` on a widget with composite templates,
     it’s important to build the composite widgets before the construct
     properties are set. Properties passed to `g_object_new()` should
     take precedence over properties set in the private template XML

  A good rule of thumb is to call this function as the first thing in
  an instance initialization function. *)
  external init_template : t -> unit = "ml_gtk_widget_init_template"

  (** Returns whether the widget is currently being destroyed.

  This information can sometimes be used to avoid doing
  unnecessary work. *)
  external in_destruction : t -> bool = "ml_gtk_widget_in_destruction"

  (** Reverses the effects of gtk_widget_show().

  This is causing the widget to be hidden (invisible to the user). *)
  external hide : t -> unit = "ml_gtk_widget_hide"

  (** Determines if the widget should show a visible indication that
  it has the global input focus.

  This is a convenience function that takes into account whether
  focus indication should currently be shown in the toplevel window
  of @widget. See [method@Gtk.Window.get_focus_visible] for more
  information about focus indication.

  To find out if the widget has the global input focus, use
  [method@Gtk.Widget.has_focus]. *)
  external has_visible_focus : t -> bool = "ml_gtk_widget_has_visible_focus"

  (** Determines if the widget has the global input focus.

  See [method@Gtk.Widget.is_focus] for the difference between
  having the global input focus, and only having the focus
  within a toplevel. *)
  external has_focus : t -> bool = "ml_gtk_widget_has_focus"

  (** Determines whether @widget is the current default widget
  within its toplevel. *)
  external has_default : t -> bool = "ml_gtk_widget_has_default"

  (** Returns whether @css_class is currently applied to @widget. *)
  external has_css_class : t -> string -> bool = "ml_gtk_widget_has_css_class"

  (** Causes @widget to have the keyboard focus for the `GtkWindow` it's inside.

  If @widget is not focusable, or its [vfunc@Gtk.Widget.grab_focus]
  implementation cannot transfer the focus to a descendant of @widget
  that is focusable, it will not take focus and %FALSE will be returned.

  Calling [method@Gtk.Widget.grab_focus] on an already focused widget
  is allowed, should not have an effect, and return %TRUE. *)
  external grab_focus : t -> bool = "ml_gtk_widget_grab_focus"

  (** Returns the content width of the widget.

  This function returns the width passed to its
  size-allocate implementation, which is the width you
  should be using in [vfunc@Gtk.Widget.snapshot].

  For pointer events, see [method@Gtk.Widget.contains].

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_width : t -> int = "ml_gtk_widget_get_width"

  (** Determines whether the widget is visible.

  If you want to take into account whether the widget’s
  parent is also marked as visible, use
  [method@Gtk.Widget.is_visible] instead.

  This function does not check if the widget is
  obscured in any way.

  See [method@Gtk.Widget.set_visible]. *)
  external get_visible : t -> bool = "ml_gtk_widget_get_visible"

  (** Gets whether gtk_widget_set_vexpand() has been used to
  explicitly set the expand flag on this widget.

  See [method@Gtk.Widget.get_hexpand_set] for more detail. *)
  external get_vexpand_set : t -> bool = "ml_gtk_widget_get_vexpand_set"

  (** Gets whether the widget would like any available extra vertical
  space.

  See [method@Gtk.Widget.get_hexpand] for more detail. *)
  external get_vexpand : t -> bool = "ml_gtk_widget_get_vexpand"

  (** Gets the vertical alignment of @widget. *)
  external get_valign : t -> Gtk_enums.align = "ml_gtk_widget_get_valign"

  (** Gets the contents of the tooltip for @widget.

  If the @widget's tooltip was set using
  [method@Gtk.Widget.set_tooltip_markup],
  this function will return the escaped text. *)
  external get_tooltip_text : t -> string option = "ml_gtk_widget_get_tooltip_text"

  (** Gets the contents of the tooltip for @widget.

  If the tooltip has not been set using
  [method@Gtk.Widget.set_tooltip_markup], this
  function returns %NULL. *)
  external get_tooltip_markup : t -> string option = "ml_gtk_widget_get_tooltip_markup"

  (** Returns the style context associated to @widget.

  The returned object is guaranteed to be the same
  for the lifetime of @widget. *)
  external get_style_context : t -> Style_context.t = "ml_gtk_widget_get_style_context"

  (** Gets the size request that was explicitly set for the widget using
  gtk_widget_set_size_request().

  A value of -1 stored in @width or @height indicates that that
  dimension has not been set explicitly and the natural requisition
  of the widget will be used instead. See
  [method@Gtk.Widget.set_size_request]. To get the size a widget will
  actually request, call [method@Gtk.Widget.measure] instead of
  this function. *)
  external get_size_request : t -> int * int = "ml_gtk_widget_get_size_request"

  (** Returns the content width or height of the widget.

  Which dimension is returned depends on @orientation.

  This is equivalent to calling [method@Gtk.Widget.get_width]
  for %GTK_ORIENTATION_HORIZONTAL or [method@Gtk.Widget.get_height]
  for %GTK_ORIENTATION_VERTICAL, but can be used when
  writing orientation-independent code, such as when
  implementing [iface@Gtk.Orientable] widgets.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_size : t -> Gtk_enums.orientation -> int = "ml_gtk_widget_get_size"

  (** Gets the settings object holding the settings used for this widget.

  Note that this function can only be called when the `GtkWidget`
  is attached to a toplevel, since the settings object is specific
  to a particular `GdkDisplay`. If you want to monitor the widget for
  changes in its settings, connect to the `notify::display` signal. *)
  external get_settings : t -> Settings.t = "ml_gtk_widget_get_settings"

  (** Returns the widget’s sensitivity.

  This function returns the value that has been set using
  [method@Gtk.Widget.set_sensitive]).

  The effective sensitivity of a widget is however determined
  by both its own and its parent widget’s sensitivity.
  See [method@Gtk.Widget.is_sensitive]. *)
  external get_sensitive : t -> bool = "ml_gtk_widget_get_sensitive"

  (** Retrieves the internal scale factor that maps from window
  coordinates to the actual device pixels.

  On traditional systems this is 1, on high density outputs,
  it can be a higher value (typically 2).

  See [method@Gdk.Surface.get_scale_factor]. *)
  external get_scale_factor : t -> int = "ml_gtk_widget_get_scale_factor"

  (** Gets whether the widget prefers a height-for-width layout
  or a width-for-height layout.

  Single-child widgets generally propagate the preference of
  their child, more complex widgets need to request something
  either in context of their children or in context of their
  allocation capabilities. *)
  external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_widget_get_request_mode"

  (** Determines whether @widget is always treated as the default widget
  within its toplevel when it has the focus, even if another widget
  is the default.

  See [method@Gtk.Widget.set_receives_default]. *)
  external get_receives_default : t -> bool = "ml_gtk_widget_get_receives_default"

  (** Determines whether @widget is realized. *)
  external get_realized : t -> bool = "ml_gtk_widget_get_realized"

  (** Returns the widget’s previous sibling.

  This API is primarily meant for widget implementations. *)
  external get_prev_sibling : t -> t option = "ml_gtk_widget_get_prev_sibling"

  (** Retrieves the minimum and natural size of a widget, taking
  into account the widget’s preference for height-for-width management.

  This is used to retrieve a suitable size by container widgets which do
  not impose any restrictions on the child placement. It can be used
  to deduce toplevel window and menu sizes as well as child widgets in
  free-form containers such as `GtkFixed`.

  Handle with care. Note that the natural height of a height-for-width
  widget will generally be a smaller size than the minimum height, since
  the required height for the natural width is generally smaller than the
  required height for the minimum width.

  Use [method@Gtk.Widget.measure] if you want to support baseline alignment. *)
  external get_preferred_size : t -> Requisition.t * Requisition.t = "ml_gtk_widget_get_preferred_size"

  (** Returns the parent widget of @widget. *)
  external get_parent : t -> t option = "ml_gtk_widget_get_parent"

  (** Returns the widget’s overflow value. *)
  external get_overflow : t -> Gtk_enums.overflow = "ml_gtk_widget_get_overflow"

  (** #Fetches the requested opacity for this widget.

  See [method@Gtk.Widget.set_opacity]. *)
  external get_opacity : t -> float = "ml_gtk_widget_get_opacity"

  (** Returns the widget’s next sibling.

  This API is primarily meant for widget implementations. *)
  external get_next_sibling : t -> t option = "ml_gtk_widget_get_next_sibling"

  (** Retrieves the name of a widget.

  See [method@Gtk.Widget.set_name] for the significance of widget names. *)
  external get_name : t -> string = "ml_gtk_widget_get_name"

  (** Gets the top margin of @widget. *)
  external get_margin_top : t -> int = "ml_gtk_widget_get_margin_top"

  (** Gets the start margin of @widget. *)
  external get_margin_start : t -> int = "ml_gtk_widget_get_margin_start"

  (** Gets the end margin of @widget. *)
  external get_margin_end : t -> int = "ml_gtk_widget_get_margin_end"

  (** Gets the bottom margin of @widget. *)
  external get_margin_bottom : t -> int = "ml_gtk_widget_get_margin_bottom"

  (** Whether the widget is mapped. *)
  external get_mapped : t -> bool = "ml_gtk_widget_get_mapped"

  (** Retrieves the layout manager used by @widget.

  See [method@Gtk.Widget.set_layout_manager]. *)
  external get_layout_manager : t -> Layout_manager.t option = "ml_gtk_widget_get_layout_manager"

  (** Returns the widget’s last child.

  This API is primarily meant for widget implementations. *)
  external get_last_child : t -> t option = "ml_gtk_widget_get_last_child"

  (** Gets whether gtk_widget_set_hexpand() has been used
  to explicitly set the expand flag on this widget.

  If [property@Gtk.Widget:hexpand] property is set, then it
  overrides any computed expand value based on child widgets.
  If `hexpand` is not set, then the expand value depends on
  whether any children of the widget would like to expand.

  There are few reasons to use this function, but it’s here
  for completeness and consistency. *)
  external get_hexpand_set : t -> bool = "ml_gtk_widget_get_hexpand_set"

  (** Gets whether the widget would like any available extra horizontal
  space.

  When a user resizes a `GtkWindow`, widgets with expand=TRUE
  generally receive the extra space. For example, a list or
  scrollable area or document in your window would often be set to
  expand.

  Containers should use [method@Gtk.Widget.compute_expand] rather
  than this function, to see whether a widget, or any of its children,
  has the expand flag set. If any child of a widget wants to
  expand, the parent may ask to expand also.

  This function only looks at the widget’s own hexpand flag, rather
  than computing whether the entire widget tree rooted at this widget
  wants to expand. *)
  external get_hexpand : t -> bool = "ml_gtk_widget_get_hexpand"

  (** Returns the content height of the widget.

  This function returns the height passed to its
  size-allocate implementation, which is the height you
  should be using in [vfunc@Gtk.Widget.snapshot].

  For pointer events, see [method@Gtk.Widget.contains].

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_height : t -> int = "ml_gtk_widget_get_height"

  (** Returns the current value of the `has-tooltip` property. *)
  external get_has_tooltip : t -> bool = "ml_gtk_widget_get_has_tooltip"

  (** Gets the horizontal alignment of @widget.

  For backwards compatibility reasons this method will never return
  one of the baseline alignments, but instead it will convert it to
  `GTK_ALIGN_FILL` or `GTK_ALIGN_CENTER`.

  Baselines are not supported for horizontal alignment. *)
  external get_halign : t -> Gtk_enums.align = "ml_gtk_widget_get_halign"

  (** Determines whether @widget can own the input focus.

  See [method@Gtk.Widget.set_focusable]. *)
  external get_focusable : t -> bool = "ml_gtk_widget_get_focusable"

  (** Returns whether the widget should grab focus when it is clicked
  with the mouse.

  See [method@Gtk.Widget.set_focus_on_click]. *)
  external get_focus_on_click : t -> bool = "ml_gtk_widget_get_focus_on_click"

  (** Returns the current focus child of @widget. *)
  external get_focus_child : t -> t option = "ml_gtk_widget_get_focus_child"

  (** Returns the widget’s first child.

  This API is primarily meant for widget implementations. *)
  external get_first_child : t -> t option = "ml_gtk_widget_get_first_child"

  (** Gets the reading direction for a particular widget.

  See [method@Gtk.Widget.set_direction]. *)
  external get_direction : t -> Gtk_enums.textdirection = "ml_gtk_widget_get_direction"

  (** Returns the CSS name that is used for @self. *)
  external get_css_name : t -> string = "ml_gtk_widget_get_css_name"

  (** Gets the value set with gtk_widget_set_child_visible().

  If you feel a need to use this function, your code probably
  needs reorganization.

  This function is only useful for container implementations
  and should never be called by an application. *)
  external get_child_visible : t -> bool = "ml_gtk_widget_get_child_visible"

  (** Queries whether @widget can be the target of pointer events. *)
  external get_can_target : t -> bool = "ml_gtk_widget_get_can_target"

  (** Determines whether the input focus can enter @widget or any
  of its children.

  See [method@Gtk.Widget.set_focusable]. *)
  external get_can_focus : t -> bool = "ml_gtk_widget_get_can_focus"

  (** Returns the baseline that has currently been allocated to @widget.

  This function is intended to be used when implementing handlers
  for the `GtkWidget`Class.snapshot() function, and when allocating
  child widgets in `GtkWidget`Class.size_allocate(). *)
  external get_baseline : t -> int = "ml_gtk_widget_get_baseline"

  (** Returns the width that has currently been allocated to @widget.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_allocated_width : t -> int = "ml_gtk_widget_get_allocated_width"

  (** Returns the height that has currently been allocated to @widget.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_allocated_height : t -> int = "ml_gtk_widget_get_allocated_height"

  (** Returns the baseline that has currently been allocated to @widget.

  This function is intended to be used when implementing handlers
  for the `GtkWidget`Class.snapshot() function, and when allocating
  child widgets in `GtkWidget`Class.size_allocate(). *)
  external get_allocated_baseline : t -> int = "ml_gtk_widget_get_allocated_baseline"

  (** Notifies the user about an input-related error on this widget.

  If the [property@Gtk.Settings:gtk-error-bell] setting is %TRUE,
  it calls [method@Gdk.Surface.beep], otherwise it does nothing.

  Note that the effect of [method@Gdk.Surface.beep] can be configured
  in many ways, depending on the windowing backend and the desktop
  environment or window manager that is used. *)
  external error_bell : t -> unit = "ml_gtk_widget_error_bell"

  (** Checks to see if a drag movement has passed the GTK drag threshold. *)
  external drag_check_threshold : t -> int -> int -> int -> int -> bool = "ml_gtk_drag_check_threshold"

  (** Tests if the point at (@x, @y) is contained in @widget.

  The coordinates for (@x, @y) must be in widget coordinates, so
  (0, 0) is assumed to be the top left of @widget's content area. *)
  external contains : t -> float -> float -> bool = "ml_gtk_widget_contains"

  (** Computes whether a container should give this widget
  extra space when possible.

  Containers should check this, rather than looking at
  [method@Gtk.Widget.get_hexpand] or [method@Gtk.Widget.get_vexpand].

  This function already checks whether the widget is visible, so
  visibility does not need to be checked separately. Non-visible
  widgets are not expanded.

  The computed expand value uses either the expand setting explicitly
  set on the widget itself, or, if none has been explicitly set,
  the widget may expand if some of its children do. *)
  external compute_expand : t -> Gtk_enums.orientation -> bool = "ml_gtk_widget_compute_expand"

  (** Called by widgets as the user moves around the window using
  keyboard shortcuts.

  The @direction argument indicates what kind of motion is taking place (up,
  down, left, right, tab forward, tab backward).

  This function calls the [vfunc@Gtk.Widget.focus] virtual function; widgets
  can override the virtual function in order to implement appropriate focus
  behavior.

  The default `focus()` virtual function for a widget should return `TRUE` if
  moving in @direction left the focus on a focusable location inside that
  widget, and `FALSE` if moving in @direction moved the focus outside the
  widget. When returning `TRUE`, widgets normally call [method@Gtk.Widget.grab_focus]
  to place the focus accordingly; when returning `FALSE`, they don’t modify
  the current focus location.

  This function is used by custom widget implementations; if you're
  writing an app, you’d use [method@Gtk.Widget.grab_focus] to move
  the focus to a particular widget. *)
  external child_focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_child_focus"

  (** Adds a widget to the list of mnemonic labels for this widget.

  See [method@Gtk.Widget.list_mnemonic_labels]. Note the
  list of mnemonic labels for the widget is cleared when the
  widget is destroyed, so the caller must make sure to update
  its internal state at this point as well. *)
  external add_mnemonic_label : t -> t -> unit = "ml_gtk_widget_add_mnemonic_label"

  (** Adds a style class to @widget.

  After calling this function, the widget’s style will match
  for @css_class, according to CSS matching rules.

  Use [method@Gtk.Widget.remove_css_class] to remove the
  style again. *)
  external add_css_class : t -> string -> unit = "ml_gtk_widget_add_css_class"

  (** Adds @controller to @widget so that it will receive events.

  You will usually want to call this function right after
  creating any kind of [class@Gtk.EventController]. *)
  external add_controller : t -> Event_controller.t -> unit = "ml_gtk_widget_add_controller"

  (** Activates the `default.activate` action from @widget. *)
  external activate_default : t -> unit = "ml_gtk_widget_activate_default"

  (** For widgets that can be “activated” (buttons, menu items, etc.),
  this function activates them.

  The activation will emit the signal set using
  [method@Gtk.WidgetClass.set_activate_signal] during class initialization.

  Activation is what happens when you press <kbd>Enter</kbd>
  on a widget during key navigation.

  If you wish to handle the activation keybinding yourself, it is
  recommended to use [method@Gtk.WidgetClass.add_shortcut] with an action
  created with [ctor@Gtk.SignalAction.new].

  If @widget isn't activatable, the function returns %FALSE. *)
  external activate : t -> bool = "ml_gtk_widget_activate"

  (** Enable or disable an action installed with
  gtk_widget_class_install_action(). *)
  external action_set_enabled : t -> string -> bool -> unit = "ml_gtk_widget_action_set_enabled"

  (* Properties *)

  (** Get property: height-request *)
  external get_height_request : t -> int = "ml_gtk_widget_get_height_request"

  (** Set property: height-request *)
  external set_height_request : t -> int -> unit = "ml_gtk_widget_set_height_request"

  (** Get property: width-request *)
  external get_width_request : t -> int = "ml_gtk_widget_get_width_request"

  (** Set property: width-request *)
  external set_width_request : t -> int -> unit = "ml_gtk_widget_set_width_request"


end = struct
  type t = [`widget] Gobject.obj

  (* Methods *)
  (** Causes a widget to be unrealized (frees all GDK resources
  associated with the widget).

  This function is only useful in widget implementations. *)
  external unrealize : t -> unit = "ml_gtk_widget_unrealize"

  (** Dissociate @widget from its parent.

  This function is only for use in widget implementations,
  typically in dispose. *)
  external unparent : t -> unit = "ml_gtk_widget_unparent"

  (** Causes a widget to be unmapped if it’s currently mapped.

  This function is only for use in widget implementations. *)
  external unmap : t -> unit = "ml_gtk_widget_unmap"

  (** Triggers a tooltip query on the display where the toplevel
  of @widget is located. *)
  external trigger_tooltip_query : t -> unit = "ml_gtk_widget_trigger_tooltip_query"

  (** Translate coordinates relative to @src_widget’s allocation
  to coordinates relative to @dest_widget’s allocations.

  In order to perform this operation, both widget must share
  a common ancestor. *)
  external translate_coordinates : t -> t -> float -> float -> bool * float * float = "ml_gtk_widget_translate_coordinates"

  (** Snapshot the a child of @widget.

  When a widget receives a call to the snapshot function,
  it must send synthetic [vfunc@Gtk.Widget.snapshot] calls
  to all children. This function provides a convenient way
  of doing this. A widget, when it receives a call to its
  [vfunc@Gtk.Widget.snapshot] function, calls
  gtk_widget_snapshot_child() once for each child, passing in
  the @snapshot the widget received.

  gtk_widget_snapshot_child() takes care of translating the origin of
  @snapshot, and deciding whether the child needs to be snapshot.

  This function does nothing for children that implement `GtkNative`. *)
  external snapshot_child : t -> t -> Snapshot.t -> unit = "ml_gtk_widget_snapshot_child"

  (** Flags a widget to be displayed.

  Any widget that isn’t shown will not appear on the screen.

  Remember that you have to show the containers containing a widget,
  in addition to the widget itself, before it will appear onscreen.

  When a toplevel container is shown, it is immediately realized and
  mapped; other shown widgets are realized and mapped when their
  toplevel container is realized and mapped. *)
  external show : t -> unit = "ml_gtk_widget_show"

  (** Returns whether @widget should contribute to
  the measuring and allocation of its parent.

  This is %FALSE for invisible children, but also
  for children that have their own surface. *)
  external should_layout : t -> bool = "ml_gtk_widget_should_layout"

  (** Sets the visibility state of @widget.

  Note that setting this to %TRUE doesn’t mean the widget is
  actually viewable, see [method@Gtk.Widget.get_visible]. *)
  external set_visible : t -> bool -> unit = "ml_gtk_widget_set_visible"

  (** Sets whether the vexpand flag will be used.

  See [method@Gtk.Widget.set_hexpand_set] for more detail. *)
  external set_vexpand_set : t -> bool -> unit = "ml_gtk_widget_set_vexpand_set"

  (** Sets whether the widget would like any available extra vertical
  space.

  See [method@Gtk.Widget.set_hexpand] for more detail. *)
  external set_vexpand : t -> bool -> unit = "ml_gtk_widget_set_vexpand"

  (** Sets the vertical alignment of @widget. *)
  external set_valign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_valign"

  (** Sets @text as the contents of the tooltip.

  If @text contains any markup, it will be escaped.

  This function will take care of setting
  [property@Gtk.Widget:has-tooltip] as a side effect,
  and of the default handler for the
  [signal@Gtk.Widget::query-tooltip] signal.

  See also [method@Gtk.Tooltip.set_text]. *)
  external set_tooltip_text : t -> string option -> unit = "ml_gtk_widget_set_tooltip_text"

  (** Sets @markup as the contents of the tooltip, which is marked
  up with Pango markup.

  This function will take care of setting the
  [property@Gtk.Widget:has-tooltip] as a side effect, and of the
  default handler for the [signal@Gtk.Widget::query-tooltip] signal.

  See also [method@Gtk.Tooltip.set_markup]. *)
  external set_tooltip_markup : t -> string option -> unit = "ml_gtk_widget_set_tooltip_markup"

  (** Sets the minimum size of a widget.

  That is, the widget’s size request will be at least @width
  by @height. You can use this function to force a widget to
  be larger than it normally would be.

  In most cases, [method@Gtk.Window.set_default_size] is a better
  choice for toplevel windows than this function; setting the default
  size will still allow users to shrink the window. Setting the size
  request will force them to leave the window at least as large as
  the size request.

  Note the inherent danger of setting any fixed size - themes,
  translations into other languages, different fonts, and user action
  can all change the appropriate size for a given widget. So, it's
  basically impossible to hardcode a size that will always be
  correct.

  The size request of a widget is the smallest size a widget can
  accept while still functioning well and drawing itself correctly.
  However in some strange cases a widget may be allocated less than
  its requested size, and in many cases a widget may be allocated more
  space than it requested.

  If the size request in a given direction is -1 (unset), then
  the “natural” size request of the widget will be used instead.

  The size request set here does not include any margin from the
  properties
  [property@Gtk.Widget:margin-start],
  [property@Gtk.Widget:margin-end],
  [property@Gtk.Widget:margin-top], and
  [property@Gtk.Widget:margin-bottom], but it does include pretty
  much all other padding or border properties set by any subclass
  of `GtkWidget`. *)
  external set_size_request : t -> int -> int -> unit = "ml_gtk_widget_set_size_request"

  (** Sets the sensitivity of a widget.

  A widget is sensitive if the user can interact with it.
  Insensitive widgets are “grayed out” and the user can’t
  interact with them. Insensitive widgets are known as
  “inactive”, “disabled”, or “ghosted” in some other toolkits. *)
  external set_sensitive : t -> bool -> unit = "ml_gtk_widget_set_sensitive"

  (** Specifies whether @widget will be treated as the default
  widget within its toplevel when it has the focus, even if
  another widget is the default. *)
  external set_receives_default : t -> bool -> unit = "ml_gtk_widget_set_receives_default"

  (** Sets @parent as the parent widget of @widget.

  This takes care of details such as updating the state and style
  of the child to reflect its new location and resizing the parent.
  The opposite function is [method@Gtk.Widget.unparent].

  This function is useful only when implementing subclasses of
  `GtkWidget`. *)
  external set_parent : t -> t -> unit = "ml_gtk_widget_set_parent"

  (** Sets how @widget treats content that is drawn outside the
  widget's content area.

  See the definition of [enum@Gtk.Overflow] for details.

  This setting is provided for widget implementations and
  should not be used by application code.

  The default value is %GTK_OVERFLOW_VISIBLE. *)
  external set_overflow : t -> Gtk_enums.overflow -> unit = "ml_gtk_widget_set_overflow"

  (** Request the @widget to be rendered partially transparent.

  An opacity of 0 is fully transparent and an opacity of 1
  is fully opaque.

  Opacity works on both toplevel widgets and child widgets, although
  there are some limitations: For toplevel widgets, applying opacity
  depends on the capabilities of the windowing system. On X11, this
  has any effect only on X displays with a compositing manager,
  see gdk_display_is_composited(). On Windows and Wayland it should
  always work, although setting a window’s opacity after the window
  has been shown may cause some flicker.

  Note that the opacity is inherited through inclusion — if you set
  a toplevel to be partially translucent, all of its content will
  appear translucent, since it is ultimatively rendered on that
  toplevel. The opacity value itself is not inherited by child
  widgets (since that would make widgets deeper in the hierarchy
  progressively more translucent). As a consequence, [class@Gtk.Popover]s
  and other [iface@Gtk.Native] widgets with their own surface will use their
  own opacity value, and thus by default appear non-translucent,
  even if they are attached to a toplevel that is translucent. *)
  external set_opacity : t -> float -> unit = "ml_gtk_widget_set_opacity"

  (** Sets a widgets name.

  Setting a name allows you to refer to the widget from a
  CSS file. You can apply a style to widgets with a particular name
  in the CSS file. See the documentation for the CSS syntax (on the
  same page as the docs for [class@Gtk.StyleContext].

  Note that the CSS syntax has certain special characters to delimit
  and represent elements in a selector (period, #, >, *...), so using
  these will make your widget impossible to match by name. Any combination
  of alphanumeric symbols, dashes and underscores will suffice. *)
  external set_name : t -> string -> unit = "ml_gtk_widget_set_name"

  (** Sets the top margin of @widget. *)
  external set_margin_top : t -> int -> unit = "ml_gtk_widget_set_margin_top"

  (** Sets the start margin of @widget. *)
  external set_margin_start : t -> int -> unit = "ml_gtk_widget_set_margin_start"

  (** Sets the end margin of @widget. *)
  external set_margin_end : t -> int -> unit = "ml_gtk_widget_set_margin_end"

  (** Sets the bottom margin of @widget. *)
  external set_margin_bottom : t -> int -> unit = "ml_gtk_widget_set_margin_bottom"

  (** Sets the layout manager delegate instance that provides an
  implementation for measuring and allocating the children of @widget. *)
  external set_layout_manager : t -> Layout_manager.t option -> unit = "ml_gtk_widget_set_layout_manager"

  (** Sets whether the hexpand flag will be used.

  The [property@Gtk.Widget:hexpand-set] property will be set
  automatically when you call [method@Gtk.Widget.set_hexpand]
  to set hexpand, so the most likely reason to use this function
  would be to unset an explicit expand flag.

  If hexpand is set, then it overrides any computed
  expand value based on child widgets. If hexpand is not
  set, then the expand value depends on whether any
  children of the widget would like to expand.

  There are few reasons to use this function, but it’s here
  for completeness and consistency. *)
  external set_hexpand_set : t -> bool -> unit = "ml_gtk_widget_set_hexpand_set"

  (** Sets whether the widget would like any available extra horizontal
  space.

  When a user resizes a `GtkWindow`, widgets with expand=TRUE
  generally receive the extra space. For example, a list or
  scrollable area or document in your window would often be set to
  expand.

  Call this function to set the expand flag if you would like your
  widget to become larger horizontally when the window has extra
  room.

  By default, widgets automatically expand if any of their children
  want to expand. (To see if a widget will automatically expand given
  its current children and state, call [method@Gtk.Widget.compute_expand].
  A container can decide how the expandability of children affects the
  expansion of the container by overriding the compute_expand virtual
  method on `GtkWidget`.).

  Setting hexpand explicitly with this function will override the
  automatic expand behavior.

  This function forces the widget to expand or not to expand,
  regardless of children.  The override occurs because
  [method@Gtk.Widget.set_hexpand] sets the hexpand-set property (see
  [method@Gtk.Widget.set_hexpand_set]) which causes the widget’s hexpand
  value to be used, rather than looking at children and widget state. *)
  external set_hexpand : t -> bool -> unit = "ml_gtk_widget_set_hexpand"

  (** Sets the `has-tooltip` property on @widget to @has_tooltip. *)
  external set_has_tooltip : t -> bool -> unit = "ml_gtk_widget_set_has_tooltip"

  (** Sets the horizontal alignment of @widget. *)
  external set_halign : t -> Gtk_enums.align -> unit = "ml_gtk_widget_set_halign"

  (** Specifies whether @widget can own the input focus.

  Widget implementations should set @focusable to %TRUE in
  their init() function if they want to receive keyboard input.

  Note that having @focusable be %TRUE is only one of the
  necessary conditions for being focusable. A widget must
  also be sensitive and can-focus and not have an ancestor
  that is marked as not can-focus in order to receive input
  focus.

  See [method@Gtk.Widget.grab_focus] for actually setting
  the input focus on a widget. *)
  external set_focusable : t -> bool -> unit = "ml_gtk_widget_set_focusable"

  (** Sets whether the widget should grab focus when it is clicked
  with the mouse.

  Making mouse clicks not grab focus is useful in places like
  toolbars where you don’t want the keyboard focus removed from
  the main area of the application. *)
  external set_focus_on_click : t -> bool -> unit = "ml_gtk_widget_set_focus_on_click"

  (** Set @child as the current focus child of @widget.

  This function is only suitable for widget implementations.
  If you want a certain widget to get the input focus, call
  [method@Gtk.Widget.grab_focus] on it. *)
  external set_focus_child : t -> t option -> unit = "ml_gtk_widget_set_focus_child"

  (** Sets the reading direction on a particular widget.

  This direction controls the primary direction for widgets
  containing text, and also the direction in which the children
  of a container are packed. The ability to set the direction is
  present in order so that correct localization into languages with
  right-to-left reading directions can be done. Generally, applications
  will let the default reading direction present, except for containers
  where the containers are arranged in an order that is explicitly
  visual rather than logical (such as buttons for text justification).

  If the direction is set to %GTK_TEXT_DIR_NONE, then the value
  set by [func@Gtk.Widget.set_default_direction] will be used. *)
  external set_direction : t -> Gtk_enums.textdirection -> unit = "ml_gtk_widget_set_direction"

  (** Sets a named cursor to be shown when pointer devices point
  towards @widget.

  This is a utility function that creates a cursor via
  [ctor@Gdk.Cursor.new_from_name] and then sets it on @widget
  with [method@Gtk.Widget.set_cursor]. See those functions for
  details.

  On top of that, this function allows @name to be %NULL, which
  will do the same as calling [method@Gtk.Widget.set_cursor]
  with a %NULL cursor. *)
  external set_cursor_from_name : t -> string option -> unit = "ml_gtk_widget_set_cursor_from_name"

  (** Sets whether @widget should be mapped along with its parent.

  The child visibility can be set for widget before it is added
  to a container with [method@Gtk.Widget.set_parent], to avoid
  mapping children unnecessary before immediately unmapping them.
  However it will be reset to its default state of %TRUE when the
  widget is removed from a container.

  Note that changing the child visibility of a widget does not
  queue a resize on the widget. Most of the time, the size of
  a widget is computed from all visible children, whether or
  not they are mapped. If this is not the case, the container
  can queue a resize itself.

  This function is only useful for container implementations
  and should never be called by an application. *)
  external set_child_visible : t -> bool -> unit = "ml_gtk_widget_set_child_visible"

  (** Sets whether @widget can be the target of pointer events. *)
  external set_can_target : t -> bool -> unit = "ml_gtk_widget_set_can_target"

  (** Specifies whether the input focus can enter the widget
  or any of its children.

  Applications should set @can_focus to %FALSE to mark a
  widget as for pointer/touch use only.

  Note that having @can_focus be %TRUE is only one of the
  necessary conditions for being focusable. A widget must
  also be sensitive and focusable and not have an ancestor
  that is marked as not can-focus in order to receive input
  focus.

  See [method@Gtk.Widget.grab_focus] for actually setting
  the input focus on a widget. *)
  external set_can_focus : t -> bool -> unit = "ml_gtk_widget_set_can_focus"

  (** Removes a tick callback previously registered with
  gtk_widget_add_tick_callback(). *)
  external remove_tick_callback : t -> int -> unit = "ml_gtk_widget_remove_tick_callback"

  (** Removes a widget from the list of mnemonic labels for this widget.

  See [method@Gtk.Widget.list_mnemonic_labels]. The widget must
  have previously been added to the list with
  [method@Gtk.Widget.add_mnemonic_label]. *)
  external remove_mnemonic_label : t -> t -> unit = "ml_gtk_widget_remove_mnemonic_label"

  (** Removes a style from @widget.

  After this, the style of @widget will stop matching for @css_class. *)
  external remove_css_class : t -> string -> unit = "ml_gtk_widget_remove_css_class"

  (** Removes @controller from @widget, so that it doesn't process
  events anymore.

  It should not be used again.

  Widgets will remove all event controllers automatically when they
  are destroyed, there is normally no need to call this function. *)
  external remove_controller : t -> Event_controller.t -> unit = "ml_gtk_widget_remove_controller"

  (** Creates the GDK resources associated with a widget.

  Normally realization happens implicitly; if you show a widget
  and all its parent containers, then the widget will be realized
  and mapped automatically.

  Realizing a widget requires all the widget’s parent widgets to be
  realized; calling this function realizes the widget’s parents
  in addition to @widget itself. If a widget is not yet inside a
  toplevel window when you realize it, bad things will happen.

  This function is primarily used in widget implementations, and
  isn’t very useful otherwise. Many times when you think you might
  need it, a better approach is to connect to a signal that will be
  called after the widget is realized automatically, such as
  [signal@Gtk.Widget::realize]. *)
  external realize : t -> unit = "ml_gtk_widget_realize"

  (** Flags a widget to have its size renegotiated.

  This should be called when a widget for some reason has a new
  size request. For example, when you change the text in a
  [class@Gtk.Label], the label queues a resize to ensure there’s
  enough space for the new text.

  Note that you cannot call gtk_widget_queue_resize() on a widget
  from inside its implementation of the [vfunc@Gtk.Widget.size_allocate]
  virtual method. Calls to gtk_widget_queue_resize() from inside
  [vfunc@Gtk.Widget.size_allocate] will be silently ignored.

  This function is only for use in widget implementations. *)
  external queue_resize : t -> unit = "ml_gtk_widget_queue_resize"

  (** Schedules this widget to be redrawn in the paint phase
  of the current or the next frame.

  This means @widget's [vfunc@Gtk.Widget.snapshot]
  implementation will be called. *)
  external queue_draw : t -> unit = "ml_gtk_widget_queue_draw"

  (** Flags the widget for a rerun of the [vfunc@Gtk.Widget.size_allocate]
  function.

  Use this function instead of [method@Gtk.Widget.queue_resize]
  when the @widget's size request didn't change but it wants to
  reposition its contents.

  An example user of this function is [method@Gtk.Widget.set_halign].

  This function is only for use in widget implementations. *)
  external queue_allocate : t -> unit = "ml_gtk_widget_queue_allocate"

  (** Emits the ::mnemonic-activate signal.

  See [signal@Gtk.Widget::mnemonic-activate]. *)
  external mnemonic_activate : t -> bool -> bool = "ml_gtk_widget_mnemonic_activate"

  (** Measures @widget in the orientation @orientation and for the given @for_size.

  As an example, if @orientation is %GTK_ORIENTATION_HORIZONTAL and @for_size
  is 300, this functions will compute the minimum and natural width of @widget
  if it is allocated at a height of 300 pixels.

  See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
  a more details on implementing `GtkWidgetClass.measure()`. *)
  external measure : t -> Gtk_enums.orientation -> int -> int * int * int * int = "ml_gtk_widget_measure"

  (** Causes a widget to be mapped if it isn’t already.

  This function is only for use in widget implementations. *)
  external map : t -> unit = "ml_gtk_widget_map"

  (** Emits the `::keynav-failed` signal on the widget.

  This function should be called whenever keyboard navigation
  within a single widget hits a boundary.

  The return value of this function should be interpreted
  in a way similar to the return value of
  [method@Gtk.Widget.child_focus]. When %TRUE is returned,
  stay in the widget, the failed keyboard  navigation is OK
  and/or there is nowhere we can/should move the focus to.
  When %FALSE is returned, the caller should continue with
  keyboard navigation outside the widget, e.g. by calling
  [method@Gtk.Widget.child_focus] on the widget’s toplevel.

  The default [signal@Gtk.Widget::keynav-failed] handler returns
  %FALSE for %GTK_DIR_TAB_FORWARD and %GTK_DIR_TAB_BACKWARD.
  For the other values of `GtkDirectionType` it returns %TRUE.

  Whenever the default handler returns %TRUE, it also calls
  [method@Gtk.Widget.error_bell] to notify the user of the
  failed keyboard navigation.

  A use case for providing an own implementation of ::keynav-failed
  (either by connecting to it or by overriding it) would be a row of
  [class@Gtk.Entry] widgets where the user should be able to navigate
  the entire row with the cursor keys, as e.g. known from user
  interfaces that require entering license keys. *)
  external keynav_failed : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_keynav_failed"

  (** Determines whether the widget and all its parents are marked as
  visible.

  This function does not check if the widget is obscured in any way.

  See also [method@Gtk.Widget.get_visible] and
  [method@Gtk.Widget.set_visible]. *)
  external is_visible : t -> bool = "ml_gtk_widget_is_visible"

  (** Returns the widget’s effective sensitivity.

  This means it is sensitive itself and also its
  parent widget is sensitive. *)
  external is_sensitive : t -> bool = "ml_gtk_widget_is_sensitive"

  (** Determines if the widget is the focus widget within its
  toplevel.

  This does not mean that the [property@Gtk.Widget:has-focus]
  property is necessarily set; [property@Gtk.Widget:has-focus]
  will only be set if the toplevel widget additionally has the
  global input focus. *)
  external is_focus : t -> bool = "ml_gtk_widget_is_focus"

  (** Determines whether @widget can be drawn to.

  A widget can be drawn if it is mapped and visible. *)
  external is_drawable : t -> bool = "ml_gtk_widget_is_drawable"

  (** Determines whether @widget is somewhere inside @ancestor,
  possibly with intermediate containers. *)
  external is_ancestor : t -> t -> bool = "ml_gtk_widget_is_ancestor"

  (** Inserts @widget into the child widget list of @parent.

  It will be placed before @next_sibling, or at the end if
  @next_sibling is %NULL.

  After calling this function, `gtk_widget_get_next_sibling(widget)`
  will return @next_sibling.

  If @parent is already set as the parent widget of @widget, this function
  can also be used to reorder @widget in the child widget list of @parent.

  This API is primarily meant for widget implementations; if you are
  just using a widget, you *must* use its own API for adding children. *)
  external insert_before : t -> t -> t option -> unit = "ml_gtk_widget_insert_before"

  (** Inserts @widget into the child widget list of @parent.

  It will be placed after @previous_sibling, or at the beginning if
  @previous_sibling is %NULL.

  After calling this function, `gtk_widget_get_prev_sibling(widget)`
  will return @previous_sibling.

  If @parent is already set as the parent widget of @widget, this
  function can also be used to reorder @widget in the child widget
  list of @parent.

  This API is primarily meant for widget implementations; if you are
  just using a widget, you *must* use its own API for adding children. *)
  external insert_after : t -> t -> t option -> unit = "ml_gtk_widget_insert_after"

  (** Creates and initializes child widgets defined in templates.

  This function must be called in the instance initializer
  for any class which assigned itself a template using
  [method@Gtk.WidgetClass.set_template].

  It is important to call this function in the instance initializer
  of a `GtkWidget` subclass and not in `GObject.constructed()` or
  `GObject.constructor()` for two reasons:

   - derived widgets will assume that the composite widgets
     defined by its parent classes have been created in their
     relative instance initializers
   - when calling `g_object_new()` on a widget with composite templates,
     it’s important to build the composite widgets before the construct
     properties are set. Properties passed to `g_object_new()` should
     take precedence over properties set in the private template XML

  A good rule of thumb is to call this function as the first thing in
  an instance initialization function. *)
  external init_template : t -> unit = "ml_gtk_widget_init_template"

  (** Returns whether the widget is currently being destroyed.

  This information can sometimes be used to avoid doing
  unnecessary work. *)
  external in_destruction : t -> bool = "ml_gtk_widget_in_destruction"

  (** Reverses the effects of gtk_widget_show().

  This is causing the widget to be hidden (invisible to the user). *)
  external hide : t -> unit = "ml_gtk_widget_hide"

  (** Determines if the widget should show a visible indication that
  it has the global input focus.

  This is a convenience function that takes into account whether
  focus indication should currently be shown in the toplevel window
  of @widget. See [method@Gtk.Window.get_focus_visible] for more
  information about focus indication.

  To find out if the widget has the global input focus, use
  [method@Gtk.Widget.has_focus]. *)
  external has_visible_focus : t -> bool = "ml_gtk_widget_has_visible_focus"

  (** Determines if the widget has the global input focus.

  See [method@Gtk.Widget.is_focus] for the difference between
  having the global input focus, and only having the focus
  within a toplevel. *)
  external has_focus : t -> bool = "ml_gtk_widget_has_focus"

  (** Determines whether @widget is the current default widget
  within its toplevel. *)
  external has_default : t -> bool = "ml_gtk_widget_has_default"

  (** Returns whether @css_class is currently applied to @widget. *)
  external has_css_class : t -> string -> bool = "ml_gtk_widget_has_css_class"

  (** Causes @widget to have the keyboard focus for the `GtkWindow` it's inside.

  If @widget is not focusable, or its [vfunc@Gtk.Widget.grab_focus]
  implementation cannot transfer the focus to a descendant of @widget
  that is focusable, it will not take focus and %FALSE will be returned.

  Calling [method@Gtk.Widget.grab_focus] on an already focused widget
  is allowed, should not have an effect, and return %TRUE. *)
  external grab_focus : t -> bool = "ml_gtk_widget_grab_focus"

  (** Returns the content width of the widget.

  This function returns the width passed to its
  size-allocate implementation, which is the width you
  should be using in [vfunc@Gtk.Widget.snapshot].

  For pointer events, see [method@Gtk.Widget.contains].

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_width : t -> int = "ml_gtk_widget_get_width"

  (** Determines whether the widget is visible.

  If you want to take into account whether the widget’s
  parent is also marked as visible, use
  [method@Gtk.Widget.is_visible] instead.

  This function does not check if the widget is
  obscured in any way.

  See [method@Gtk.Widget.set_visible]. *)
  external get_visible : t -> bool = "ml_gtk_widget_get_visible"

  (** Gets whether gtk_widget_set_vexpand() has been used to
  explicitly set the expand flag on this widget.

  See [method@Gtk.Widget.get_hexpand_set] for more detail. *)
  external get_vexpand_set : t -> bool = "ml_gtk_widget_get_vexpand_set"

  (** Gets whether the widget would like any available extra vertical
  space.

  See [method@Gtk.Widget.get_hexpand] for more detail. *)
  external get_vexpand : t -> bool = "ml_gtk_widget_get_vexpand"

  (** Gets the vertical alignment of @widget. *)
  external get_valign : t -> Gtk_enums.align = "ml_gtk_widget_get_valign"

  (** Gets the contents of the tooltip for @widget.

  If the @widget's tooltip was set using
  [method@Gtk.Widget.set_tooltip_markup],
  this function will return the escaped text. *)
  external get_tooltip_text : t -> string option = "ml_gtk_widget_get_tooltip_text"

  (** Gets the contents of the tooltip for @widget.

  If the tooltip has not been set using
  [method@Gtk.Widget.set_tooltip_markup], this
  function returns %NULL. *)
  external get_tooltip_markup : t -> string option = "ml_gtk_widget_get_tooltip_markup"

  (** Returns the style context associated to @widget.

  The returned object is guaranteed to be the same
  for the lifetime of @widget. *)
  external get_style_context : t -> Style_context.t = "ml_gtk_widget_get_style_context"

  (** Gets the size request that was explicitly set for the widget using
  gtk_widget_set_size_request().

  A value of -1 stored in @width or @height indicates that that
  dimension has not been set explicitly and the natural requisition
  of the widget will be used instead. See
  [method@Gtk.Widget.set_size_request]. To get the size a widget will
  actually request, call [method@Gtk.Widget.measure] instead of
  this function. *)
  external get_size_request : t -> int * int = "ml_gtk_widget_get_size_request"

  (** Returns the content width or height of the widget.

  Which dimension is returned depends on @orientation.

  This is equivalent to calling [method@Gtk.Widget.get_width]
  for %GTK_ORIENTATION_HORIZONTAL or [method@Gtk.Widget.get_height]
  for %GTK_ORIENTATION_VERTICAL, but can be used when
  writing orientation-independent code, such as when
  implementing [iface@Gtk.Orientable] widgets.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_size : t -> Gtk_enums.orientation -> int = "ml_gtk_widget_get_size"

  (** Gets the settings object holding the settings used for this widget.

  Note that this function can only be called when the `GtkWidget`
  is attached to a toplevel, since the settings object is specific
  to a particular `GdkDisplay`. If you want to monitor the widget for
  changes in its settings, connect to the `notify::display` signal. *)
  external get_settings : t -> Settings.t = "ml_gtk_widget_get_settings"

  (** Returns the widget’s sensitivity.

  This function returns the value that has been set using
  [method@Gtk.Widget.set_sensitive]).

  The effective sensitivity of a widget is however determined
  by both its own and its parent widget’s sensitivity.
  See [method@Gtk.Widget.is_sensitive]. *)
  external get_sensitive : t -> bool = "ml_gtk_widget_get_sensitive"

  (** Retrieves the internal scale factor that maps from window
  coordinates to the actual device pixels.

  On traditional systems this is 1, on high density outputs,
  it can be a higher value (typically 2).

  See [method@Gdk.Surface.get_scale_factor]. *)
  external get_scale_factor : t -> int = "ml_gtk_widget_get_scale_factor"

  (** Gets whether the widget prefers a height-for-width layout
  or a width-for-height layout.

  Single-child widgets generally propagate the preference of
  their child, more complex widgets need to request something
  either in context of their children or in context of their
  allocation capabilities. *)
  external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_widget_get_request_mode"

  (** Determines whether @widget is always treated as the default widget
  within its toplevel when it has the focus, even if another widget
  is the default.

  See [method@Gtk.Widget.set_receives_default]. *)
  external get_receives_default : t -> bool = "ml_gtk_widget_get_receives_default"

  (** Determines whether @widget is realized. *)
  external get_realized : t -> bool = "ml_gtk_widget_get_realized"

  (** Returns the widget’s previous sibling.

  This API is primarily meant for widget implementations. *)
  external get_prev_sibling : t -> t option = "ml_gtk_widget_get_prev_sibling"

  (** Retrieves the minimum and natural size of a widget, taking
  into account the widget’s preference for height-for-width management.

  This is used to retrieve a suitable size by container widgets which do
  not impose any restrictions on the child placement. It can be used
  to deduce toplevel window and menu sizes as well as child widgets in
  free-form containers such as `GtkFixed`.

  Handle with care. Note that the natural height of a height-for-width
  widget will generally be a smaller size than the minimum height, since
  the required height for the natural width is generally smaller than the
  required height for the minimum width.

  Use [method@Gtk.Widget.measure] if you want to support baseline alignment. *)
  external get_preferred_size : t -> Requisition.t * Requisition.t = "ml_gtk_widget_get_preferred_size"

  (** Returns the parent widget of @widget. *)
  external get_parent : t -> t option = "ml_gtk_widget_get_parent"

  (** Returns the widget’s overflow value. *)
  external get_overflow : t -> Gtk_enums.overflow = "ml_gtk_widget_get_overflow"

  (** #Fetches the requested opacity for this widget.

  See [method@Gtk.Widget.set_opacity]. *)
  external get_opacity : t -> float = "ml_gtk_widget_get_opacity"

  (** Returns the widget’s next sibling.

  This API is primarily meant for widget implementations. *)
  external get_next_sibling : t -> t option = "ml_gtk_widget_get_next_sibling"

  (** Retrieves the name of a widget.

  See [method@Gtk.Widget.set_name] for the significance of widget names. *)
  external get_name : t -> string = "ml_gtk_widget_get_name"

  (** Gets the top margin of @widget. *)
  external get_margin_top : t -> int = "ml_gtk_widget_get_margin_top"

  (** Gets the start margin of @widget. *)
  external get_margin_start : t -> int = "ml_gtk_widget_get_margin_start"

  (** Gets the end margin of @widget. *)
  external get_margin_end : t -> int = "ml_gtk_widget_get_margin_end"

  (** Gets the bottom margin of @widget. *)
  external get_margin_bottom : t -> int = "ml_gtk_widget_get_margin_bottom"

  (** Whether the widget is mapped. *)
  external get_mapped : t -> bool = "ml_gtk_widget_get_mapped"

  (** Retrieves the layout manager used by @widget.

  See [method@Gtk.Widget.set_layout_manager]. *)
  external get_layout_manager : t -> Layout_manager.t option = "ml_gtk_widget_get_layout_manager"

  (** Returns the widget’s last child.

  This API is primarily meant for widget implementations. *)
  external get_last_child : t -> t option = "ml_gtk_widget_get_last_child"

  (** Gets whether gtk_widget_set_hexpand() has been used
  to explicitly set the expand flag on this widget.

  If [property@Gtk.Widget:hexpand] property is set, then it
  overrides any computed expand value based on child widgets.
  If `hexpand` is not set, then the expand value depends on
  whether any children of the widget would like to expand.

  There are few reasons to use this function, but it’s here
  for completeness and consistency. *)
  external get_hexpand_set : t -> bool = "ml_gtk_widget_get_hexpand_set"

  (** Gets whether the widget would like any available extra horizontal
  space.

  When a user resizes a `GtkWindow`, widgets with expand=TRUE
  generally receive the extra space. For example, a list or
  scrollable area or document in your window would often be set to
  expand.

  Containers should use [method@Gtk.Widget.compute_expand] rather
  than this function, to see whether a widget, or any of its children,
  has the expand flag set. If any child of a widget wants to
  expand, the parent may ask to expand also.

  This function only looks at the widget’s own hexpand flag, rather
  than computing whether the entire widget tree rooted at this widget
  wants to expand. *)
  external get_hexpand : t -> bool = "ml_gtk_widget_get_hexpand"

  (** Returns the content height of the widget.

  This function returns the height passed to its
  size-allocate implementation, which is the height you
  should be using in [vfunc@Gtk.Widget.snapshot].

  For pointer events, see [method@Gtk.Widget.contains].

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_height : t -> int = "ml_gtk_widget_get_height"

  (** Returns the current value of the `has-tooltip` property. *)
  external get_has_tooltip : t -> bool = "ml_gtk_widget_get_has_tooltip"

  (** Gets the horizontal alignment of @widget.

  For backwards compatibility reasons this method will never return
  one of the baseline alignments, but instead it will convert it to
  `GTK_ALIGN_FILL` or `GTK_ALIGN_CENTER`.

  Baselines are not supported for horizontal alignment. *)
  external get_halign : t -> Gtk_enums.align = "ml_gtk_widget_get_halign"

  (** Determines whether @widget can own the input focus.

  See [method@Gtk.Widget.set_focusable]. *)
  external get_focusable : t -> bool = "ml_gtk_widget_get_focusable"

  (** Returns whether the widget should grab focus when it is clicked
  with the mouse.

  See [method@Gtk.Widget.set_focus_on_click]. *)
  external get_focus_on_click : t -> bool = "ml_gtk_widget_get_focus_on_click"

  (** Returns the current focus child of @widget. *)
  external get_focus_child : t -> t option = "ml_gtk_widget_get_focus_child"

  (** Returns the widget’s first child.

  This API is primarily meant for widget implementations. *)
  external get_first_child : t -> t option = "ml_gtk_widget_get_first_child"

  (** Gets the reading direction for a particular widget.

  See [method@Gtk.Widget.set_direction]. *)
  external get_direction : t -> Gtk_enums.textdirection = "ml_gtk_widget_get_direction"

  (** Returns the CSS name that is used for @self. *)
  external get_css_name : t -> string = "ml_gtk_widget_get_css_name"

  (** Gets the value set with gtk_widget_set_child_visible().

  If you feel a need to use this function, your code probably
  needs reorganization.

  This function is only useful for container implementations
  and should never be called by an application. *)
  external get_child_visible : t -> bool = "ml_gtk_widget_get_child_visible"

  (** Queries whether @widget can be the target of pointer events. *)
  external get_can_target : t -> bool = "ml_gtk_widget_get_can_target"

  (** Determines whether the input focus can enter @widget or any
  of its children.

  See [method@Gtk.Widget.set_focusable]. *)
  external get_can_focus : t -> bool = "ml_gtk_widget_get_can_focus"

  (** Returns the baseline that has currently been allocated to @widget.

  This function is intended to be used when implementing handlers
  for the `GtkWidget`Class.snapshot() function, and when allocating
  child widgets in `GtkWidget`Class.size_allocate(). *)
  external get_baseline : t -> int = "ml_gtk_widget_get_baseline"

  (** Returns the width that has currently been allocated to @widget.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_allocated_width : t -> int = "ml_gtk_widget_get_allocated_width"

  (** Returns the height that has currently been allocated to @widget.

  To learn more about widget sizes, see the coordinate
  system [overview](coordinates.html). *)
  external get_allocated_height : t -> int = "ml_gtk_widget_get_allocated_height"

  (** Returns the baseline that has currently been allocated to @widget.

  This function is intended to be used when implementing handlers
  for the `GtkWidget`Class.snapshot() function, and when allocating
  child widgets in `GtkWidget`Class.size_allocate(). *)
  external get_allocated_baseline : t -> int = "ml_gtk_widget_get_allocated_baseline"

  (** Notifies the user about an input-related error on this widget.

  If the [property@Gtk.Settings:gtk-error-bell] setting is %TRUE,
  it calls [method@Gdk.Surface.beep], otherwise it does nothing.

  Note that the effect of [method@Gdk.Surface.beep] can be configured
  in many ways, depending on the windowing backend and the desktop
  environment or window manager that is used. *)
  external error_bell : t -> unit = "ml_gtk_widget_error_bell"

  (** Checks to see if a drag movement has passed the GTK drag threshold. *)
  external drag_check_threshold : t -> int -> int -> int -> int -> bool = "ml_gtk_drag_check_threshold"

  (** Tests if the point at (@x, @y) is contained in @widget.

  The coordinates for (@x, @y) must be in widget coordinates, so
  (0, 0) is assumed to be the top left of @widget's content area. *)
  external contains : t -> float -> float -> bool = "ml_gtk_widget_contains"

  (** Computes whether a container should give this widget
  extra space when possible.

  Containers should check this, rather than looking at
  [method@Gtk.Widget.get_hexpand] or [method@Gtk.Widget.get_vexpand].

  This function already checks whether the widget is visible, so
  visibility does not need to be checked separately. Non-visible
  widgets are not expanded.

  The computed expand value uses either the expand setting explicitly
  set on the widget itself, or, if none has been explicitly set,
  the widget may expand if some of its children do. *)
  external compute_expand : t -> Gtk_enums.orientation -> bool = "ml_gtk_widget_compute_expand"

  (** Called by widgets as the user moves around the window using
  keyboard shortcuts.

  The @direction argument indicates what kind of motion is taking place (up,
  down, left, right, tab forward, tab backward).

  This function calls the [vfunc@Gtk.Widget.focus] virtual function; widgets
  can override the virtual function in order to implement appropriate focus
  behavior.

  The default `focus()` virtual function for a widget should return `TRUE` if
  moving in @direction left the focus on a focusable location inside that
  widget, and `FALSE` if moving in @direction moved the focus outside the
  widget. When returning `TRUE`, widgets normally call [method@Gtk.Widget.grab_focus]
  to place the focus accordingly; when returning `FALSE`, they don’t modify
  the current focus location.

  This function is used by custom widget implementations; if you're
  writing an app, you’d use [method@Gtk.Widget.grab_focus] to move
  the focus to a particular widget. *)
  external child_focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_widget_child_focus"

  (** Adds a widget to the list of mnemonic labels for this widget.

  See [method@Gtk.Widget.list_mnemonic_labels]. Note the
  list of mnemonic labels for the widget is cleared when the
  widget is destroyed, so the caller must make sure to update
  its internal state at this point as well. *)
  external add_mnemonic_label : t -> t -> unit = "ml_gtk_widget_add_mnemonic_label"

  (** Adds a style class to @widget.

  After calling this function, the widget’s style will match
  for @css_class, according to CSS matching rules.

  Use [method@Gtk.Widget.remove_css_class] to remove the
  style again. *)
  external add_css_class : t -> string -> unit = "ml_gtk_widget_add_css_class"

  (** Adds @controller to @widget so that it will receive events.

  You will usually want to call this function right after
  creating any kind of [class@Gtk.EventController]. *)
  external add_controller : t -> Event_controller.t -> unit = "ml_gtk_widget_add_controller"

  (** Activates the `default.activate` action from @widget. *)
  external activate_default : t -> unit = "ml_gtk_widget_activate_default"

  (** For widgets that can be “activated” (buttons, menu items, etc.),
  this function activates them.

  The activation will emit the signal set using
  [method@Gtk.WidgetClass.set_activate_signal] during class initialization.

  Activation is what happens when you press <kbd>Enter</kbd>
  on a widget during key navigation.

  If you wish to handle the activation keybinding yourself, it is
  recommended to use [method@Gtk.WidgetClass.add_shortcut] with an action
  created with [ctor@Gtk.SignalAction.new].

  If @widget isn't activatable, the function returns %FALSE. *)
  external activate : t -> bool = "ml_gtk_widget_activate"

  (** Enable or disable an action installed with
  gtk_widget_class_install_action(). *)
  external action_set_enabled : t -> string -> bool -> unit = "ml_gtk_widget_action_set_enabled"

  (* Properties *)

  (** Get property: height-request *)
  external get_height_request : t -> int = "ml_gtk_widget_get_height_request"

  (** Set property: height-request *)
  external set_height_request : t -> int -> unit = "ml_gtk_widget_set_height_request"

  (** Get property: width-request *)
  external get_width_request : t -> int = "ml_gtk_widget_get_width_request"

  (** Set property: width-request *)
  external set_width_request : t -> int -> unit = "ml_gtk_widget_set_width_request"


end
