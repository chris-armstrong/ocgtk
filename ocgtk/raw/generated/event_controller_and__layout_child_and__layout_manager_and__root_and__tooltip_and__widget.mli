(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgtk.Raw.Event_controller},
    {!Ocgtk.Raw.Layout_child}, {!Ocgtk.Raw.Layout_manager}, {!Ocgtk.Raw.Root},
    {!Ocgtk.Raw.Tooltip}, {!Ocgtk.Raw.Widget}, defined together because they
    refer to each other. Each has a module of its own that re-exports it; use
    that module rather than this one. *)

(** The base class for event controllers.

    These are ancillary objects associated to widgets, which react to
    [GdkEvents], and possibly trigger actions as a consequence.

    Event controllers are added to a widget with [Gtk.Widget.add_controller]. It
    is rarely necessary to explicitly remove a controller with
    [Gtk.Widget.remove_controller].

    See the chapter on input handling for an overview of the basic concepts,
    such as the capture and bubble phases of event propagation.

    The class built on this module is in {!Ocgtk.Event_controller}. *)
module rec Event_controller : sig
  type t = [ `event_controller | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_event_controller_get_type"

  (* Methods *)

  external set_static_name : t -> string option -> unit
    = "ml_gtk_event_controller_set_static_name"
  (** Sets a name on the controller that can be used for debugging. *)

  external set_propagation_phase : t -> Ocgtk_enums.propagationphase -> unit
    = "ml_gtk_event_controller_set_propagation_phase"
  (** Sets the propagation phase at which a controller handles events.

      If [phase] is [GTK_PHASE_NONE], no automatic event handling will be
      performed, but other additional gesture maintenance will. *)

  external set_propagation_limit : t -> Ocgtk_enums.propagationlimit -> unit
    = "ml_gtk_event_controller_set_propagation_limit"
  (** Sets the event propagation limit on the event controller.

      If the limit is set to [GTK_LIMIT_SAME_NATIVE], the controller won't
      handle events that are targeted at widgets on a different surface, such as
      popovers. *)

  external set_name : t -> string option -> unit
    = "ml_gtk_event_controller_set_name"
  (** Sets a name on the controller that can be used for debugging. *)

  external reset : t -> unit = "ml_gtk_event_controller_reset"
  (** Resets the [controller] to a clean state. *)

  external get_widget : t -> Widget.t option
    = "ml_gtk_event_controller_get_widget"
  (** Returns the [GtkWidget] this controller relates to. *)

  external get_propagation_phase : t -> Ocgtk_enums.propagationphase
    = "ml_gtk_event_controller_get_propagation_phase"
  (** Gets the propagation phase at which [controller] handles events. *)

  external get_propagation_limit : t -> Ocgtk_enums.propagationlimit
    = "ml_gtk_event_controller_get_propagation_limit"
  (** Gets the propagation limit of the event controller. *)

  external get_name : t -> string option = "ml_gtk_event_controller_get_name"
  (** Gets the name of [controller]. *)

  external get_current_event_time : t -> UInt32.t
    = "ml_gtk_event_controller_get_current_event_time"
  (** Returns the timestamp of the event that is currently being handled by the
      controller.

      At other times, 0 is returned. *)

  external get_current_event_state : t -> Ocgdk_enums.modifiertype
    = "ml_gtk_event_controller_get_current_event_state"
  (** Returns the modifier state of the event that is currently being handled by
      the controller.

      At other times, 0 is returned. *)

  external get_current_event_device : t -> Ocgdk_raw.Device.t option
    = "ml_gtk_event_controller_get_current_event_device"
  (** Returns the device of the event that is currently being handled by the
      controller.

      At other times, [NULL] is returned. *)

  external get_current_event : t -> Ocgdk_raw.Event.t option
    = "ml_gtk_event_controller_get_current_event"
  (** Returns the event that is currently being handled by the controller.

      At other times, [NULL] is returned. *)

  (* Properties *)
end

(** The base class for objects that are meant to hold layout properties.

    If a [GtkLayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [GtkLayoutChild] implementation to store those
    properties.

    A [GtkLayoutChild] instance is only ever valid while a widget is part of a
    layout.

    The class built on this module is in {!Ocgtk.Layout_child}. *)
and Layout_child : sig
  type t = [ `layout_child | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_layout_child_get_type"

  (* Methods *)

  external get_layout_manager : t -> Layout_manager.t
    = "ml_gtk_layout_child_get_layout_manager"
  (** Retrieves the [GtkLayoutManager] instance that created the given
      [layout_child]. *)

  external get_child_widget : t -> Widget.t
    = "ml_gtk_layout_child_get_child_widget"
  (** Retrieves the [GtkWidget] associated to the given [layout_child]. *)

  (* Properties *)
end

and Layout_manager : sig
  type t = [ `layout_manager | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_layout_manager_get_type"

  (* Methods *)

  external measure :
    t -> Widget.t -> Ocgtk_enums.orientation -> int -> int * int * int * int
    = "ml_gtk_layout_manager_measure"
  (** Measures the size of the [widget] using [manager], for the given
      [orientation] and size.

      See the [Gtk.Widget] documentation on layout management for more details.
  *)

  external layout_changed : t -> unit = "ml_gtk_layout_manager_layout_changed"
  (** Queues a resize on the [GtkWidget] using [manager], if any.

      This function should be called by subclasses of [GtkLayoutManager] in
      response to changes to their layout management policies. *)

  external get_widget : t -> Widget.t option
    = "ml_gtk_layout_manager_get_widget"
  (** Retrieves the [GtkWidget] using the given [GtkLayoutManager]. *)

  external get_request_mode : t -> Ocgtk_enums.sizerequestmode
    = "ml_gtk_layout_manager_get_request_mode"
  (** Retrieves the request mode of [manager]. *)

  external get_layout_child : t -> Widget.t -> Layout_child.t
    = "ml_gtk_layout_manager_get_layout_child"
  (** Retrieves a [GtkLayoutChild] instance for the [GtkLayoutManager], creating
      one if necessary.

      The [child] widget must be a child of the widget using [manager].

      The [GtkLayoutChild] instance is owned by the [GtkLayoutManager], and is
      guaranteed to exist as long as [child] is a child of the [GtkWidget] using
      the given [GtkLayoutManager]. *)

  external allocate : t -> Widget.t -> int -> int -> int -> unit
    = "ml_gtk_layout_manager_allocate"
  (** Assigns the given [width], [height], and [baseline] to a [widget], and
      computes the position and sizes of the children of the [widget] using the
      layout management policy of [manager]. *)
end
[@@ocaml.doc
  "Handles the preferred size and allocation for children of a widget.\n\n\
   You typically subclass [GtkLayoutManager] if you want to implement a\n\
   layout policy for the children of a widget, or if you want to determine\n\
   the size of a widget depending on its contents.\n\n\
   Each [GtkWidget] can only have a [GtkLayoutManager] instance associated\n\
   to it at any given time; it is possible, though, to replace the layout\n\
   manager instance using [Gtk.Widget.set_layout_manager].\n\n\
   {b Layout properties}\n\n\
   A layout manager can expose properties for controlling the layout of\n\
   each child, by creating an object type derived from [Gtk.LayoutChild]\n\
   and installing the properties on it as normal [GObject] properties.\n\n\
   Each [GtkLayoutChild] instance storing the layout properties for a\n\
   specific child is created through the [Gtk.LayoutManager.get_layout_child]\n\
   method; a [GtkLayoutManager] controls the creation of its [GtkLayoutChild]\n\
   instances by overriding the GtkLayoutManagerClass.create_layout_child()\n\
   virtual function. The typical implementation should look like:\n\n\
   {[\n\
   static GtkLayoutChild *\n\
   create_layout_child (GtkLayoutManager *manager,\n\
  \                     GtkWidget        *container,\n\
  \                     GtkWidget        *child)\n\
   {\n\
  \  return g_object_new (your_layout_child_get_type (),\n\
  \                       \"layout-manager\", manager,\n\
  \                       \"child-widget\", child,\n\
  \                       NULL);\n\
   }\n\
   ]}\n\n\
   The [Gtk.LayoutChild:layout-manager] and\n\
   [Gtk.LayoutChild:child-widget] properties\n\
   on the newly created [GtkLayoutChild] instance are mandatory. The\n\
   [GtkLayoutManager] will cache the newly created [GtkLayoutChild] instance\n\
   until the widget is removed from its parent, or the parent removes the\n\
   layout manager.\n\n\
   Each [GtkLayoutManager] instance creating a [GtkLayoutChild] should use\n\
   [Gtk.LayoutManager.get_layout_child] every time it needs to query\n\
   the layout properties; each [GtkLayoutChild] instance should call\n\
   [Gtk.LayoutManager.layout_changed] every time a property is\n\
   updated, in order to queue a new size measuring and allocation.\n\n\
   The class built on this module is in {!Ocgtk.Layout_manager}."]

(** An interface for widgets that can act as the root of a widget hierarchy.

    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.

    The obvious example of a [GtkRoot] is [GtkWindow].

    To get the display to which a [GtkRoot] belongs, use [Gtk.Root.get_display].

    [GtkRoot] also maintains the location of keyboard focus inside its widget
    hierarchy, with [Gtk.Root.set_focus] and [Gtk.Root.get_focus].

    The class built on this module is in {!Ocgtk.Root}. *)
and Root : sig
  type t = [ `root ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_root_get_type"
  external from_gobject : 'a Gobject.obj -> t = "ml_gtk_root_from_gobject"

  (* Methods *)

  external set_focus : t -> Widget.t option -> unit = "ml_gtk_root_set_focus"
  (** If [focus] is not the current focus widget, and is focusable, sets it as
      the focus widget for the root.

      If [focus] is [NULL], unsets the focus widget for the root.

      To set the focus to a particular widget in the root, it is usually more
      convenient to use [Gtk.Widget.grab_focus] instead of this function. *)

  external get_focus : t -> Widget.t option = "ml_gtk_root_get_focus"
  (** Retrieves the current focused widget within the root.

      Note that this is the widget that would have the focus if the root is
      active; if the root is not focused then [gtk_widget_has_focus (widget)]
      will be [FALSE] for the widget. *)

  external get_display : t -> Ocgdk_raw.Display.t = "ml_gtk_root_get_display"
  (** Returns the display that this [GtkRoot] is on. *)
end

(** Represents a widget tooltip.

    Basic tooltips can be realized simply by using [Gtk.Widget.set_tooltip_text]
    or [Gtk.Widget.set_tooltip_markup] without any explicit tooltip object.

    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per [GtkTreeView]
    row or cell, you will have to do a little more work:

    - Set the [Gtk.Widget:has-tooltip] property to [TRUE]. This will make GTK
      monitor the widget for motion and related events which are needed to
      determine when and where to show a tooltip.

    - Connect to the [Gtk.Widget::query-tooltip] signal. This signal will be
      emitted when a tooltip is supposed to be shown. One of the arguments
      passed to the signal handler is a [GtkTooltip] object. This is the object
      that we are about to display as a tooltip, and can be manipulated in your
      callback using functions like [Gtk.Tooltip.set_icon]. There are functions
      for setting the tooltip’s markup, setting an image from a named icon, or
      even putting in a custom widget.

    - Return [TRUE] from your ::query-tooltip handler. This causes the tooltip
      to be show. If you return [FALSE], it will not be shown.

    The class built on this module is in {!Ocgtk.Tooltip}. *)
and Tooltip : sig
  type t = [ `tooltip | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_tooltip_get_type"

  (* Methods *)

  external set_tip_area : t -> Ocgdk_raw.Rectangle.t -> unit
    = "ml_gtk_tooltip_set_tip_area"
  (** Sets the area of the widget, where the contents of this tooltip apply, to
      be [rect] (in widget coordinates). This is especially useful for properly
      setting tooltips on [GtkTreeView] rows and cells, [GtkIconViews], etc.

      For setting tooltips on [GtkTreeView], please refer to the convenience
      functions for this: gtk_tree_view_set_tooltip_row() and
      gtk_tree_view_set_tooltip_cell(). *)

  external set_text : t -> string option -> unit = "ml_gtk_tooltip_set_text"
  (** Sets the text of the tooltip to be [text].

      If [text] is [NULL], the label will be hidden. See also
      [Gtk.Tooltip.set_markup]. *)

  external set_markup : t -> string option -> unit = "ml_gtk_tooltip_set_markup"
  (** Sets the text of the tooltip to be [markup].

      The string must be marked up with Pango markup. If [markup] is [NULL], the
      label will be hidden. *)

  external set_icon_from_icon_name : t -> string option -> unit
    = "ml_gtk_tooltip_set_icon_from_icon_name"
  (** Sets the icon of the tooltip (which is in front of the text) to be the
      icon indicated by [icon_name] with the size indicated by [size]. If
      [icon_name] is [NULL], the image will be hidden. *)

  external set_icon_from_gicon : t -> Ocgio_raw.Icon.t option -> unit
    = "ml_gtk_tooltip_set_icon_from_gicon"
  (** Sets the icon of the tooltip (which is in front of the text) to be the
      icon indicated by [gicon] with the size indicated by [size]. If [gicon] is
      [NULL], the image will be hidden. *)

  external set_icon : t -> Ocgdk_raw.Paintable.t option -> unit
    = "ml_gtk_tooltip_set_icon"
  (** Sets the icon of the tooltip (which is in front of the text) to be
      [paintable]. If [paintable] is [NULL], the image will be hidden. *)

  external set_custom : t -> Widget.t option -> unit
    = "ml_gtk_tooltip_set_custom"
  (** Replaces the widget packed into the tooltip with [custom_widget].
      [custom_widget] does not get destroyed when the tooltip goes away. By
      default a box with a [GtkImage] and [GtkLabel] is embedded in the tooltip,
      which can be configured using gtk_tooltip_set_markup() and
      gtk_tooltip_set_icon(). *)
end

and Widget : sig
  type t = [ `widget | `initially_unowned | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gtk_widget_get_type"

  (* Methods *)

  external unset_state_flags : t -> Ocgtk_enums.stateflags -> unit
    = "ml_gtk_widget_unset_state_flags"
  (** Turns off flag values for the current widget state.

      See [Gtk.Widget.set_state_flags].

      This function is for use in widget implementations. *)

  external unrealize : t -> unit = "ml_gtk_widget_unrealize"
  (** Causes a widget to be unrealized.

      This frees all GDK resources associated with the widget.

      This function is only useful in widget implementations. *)

  external unparent : t -> unit = "ml_gtk_widget_unparent"
  (** Removes [widget] from its parent.

      This function is only for use in widget implementations, typically in
      dispose. *)

  external unmap : t -> unit = "ml_gtk_widget_unmap"
  (** Causes a widget to be unmapped if it’s currently mapped.

      This function is only for use in widget implementations. *)

  external trigger_tooltip_query : t -> unit
    = "ml_gtk_widget_trigger_tooltip_query"
  (** Triggers a tooltip query on the display of the widget. *)

  external translate_coordinates :
    t -> t -> float -> float -> bool * float * float
    = "ml_gtk_widget_translate_coordinates"
  (** Translates coordinates relative to [src_widget]’s allocation to
      coordinates relative to [dest_widget]’s allocations.

      In order to perform this operation, both widget must share a common
      ancestor. If that is not the case, [dest_x] and [dest_y] are set to 0 and
      false is returned. *)

  external snapshot_child : t -> t -> Snapshot.t -> unit
    = "ml_gtk_widget_snapshot_child"
  (** Snapshots a child of the widget.

      When a widget receives a call to the snapshot function, it must send
      synthetic [Gtk.Widget.snapshot] calls to all children. This function
      provides a convenient way of doing this. A widget, when it receives a call
      to its [Gtk.Widget.snapshot] function, calls gtk_widget_snapshot_child()
      once for each child, passing in the [snapshot] the widget received.

      This function takes care of translating the origin of [snapshot], and
      deciding whether the child needs to be snapshot.

      It does nothing for children that implement [GtkNative]. *)

  external show : t -> unit = "ml_gtk_widget_show"
  (** Flags a widget to be displayed.

      Any widget that isn’t shown will not appear on the screen.

      Remember that you have to show the containers containing a widget, in
      addition to the widget itself, before it will appear onscreen.

      When a toplevel widget is shown, it is immediately realized and mapped;
      other shown widgets are realized and mapped when their toplevel widget is
      realized and mapped. *)

  external should_layout : t -> bool = "ml_gtk_widget_should_layout"
  (** Returns whether the widget should contribute to the measuring and
      allocation of its parent.

      This is false for invisible children, but also for children that have
      their own surface, such as [Gtk.Popover] instances. *)

  external set_visible : t -> bool -> unit = "ml_gtk_widget_set_visible"
  (** Sets the visibility state of [widget].

      Note that setting this to true doesn’t mean the widget is actually
      viewable, see [Gtk.Widget.get_visible]. *)

  external set_vexpand_set : t -> bool -> unit = "ml_gtk_widget_set_vexpand_set"
  (** Sets whether the vexpand flag will be used.

      See [Gtk.Widget.set_hexpand_set] for more detail. *)

  external set_vexpand : t -> bool -> unit = "ml_gtk_widget_set_vexpand"
  (** Sets whether the widget would like any available extra vertical space.

      See [Gtk.Widget.set_hexpand] for more detail. *)

  external set_valign : t -> Ocgtk_enums.align -> unit
    = "ml_gtk_widget_set_valign"
  (** Sets the vertical alignment of the widget. *)

  external set_tooltip_text : t -> string option -> unit
    = "ml_gtk_widget_set_tooltip_text"
  (** Sets the contents of the tooltip for the widget.

      If [text] contains any markup, it will be escaped.

      This function will take care of setting [Gtk.Widget:has-tooltip] as a side
      effect, and of the default handler for the [Gtk.Widget::query-tooltip]
      signal.

      See also [Gtk.Tooltip.set_text]. *)

  external set_tooltip_markup : t -> string option -> unit
    = "ml_gtk_widget_set_tooltip_markup"
  (** Sets the contents of the tooltip for widget.

      [markup] must contain Pango markup.

      This function will take care of setting the [Gtk.Widget:has-tooltip] as a
      side effect, and of the default handler for the
      [Gtk.Widget::query-tooltip] signal.

      See also [Gtk.Tooltip.set_markup]. *)

  external set_state_flags : t -> Ocgtk_enums.stateflags -> bool -> unit
    = "ml_gtk_widget_set_state_flags"
  (** Turns on flag values in the current widget state.

      Typical widget states are insensitive, prelighted, etc.

      This function accepts the values [Gtk.StateFlags.dir-ltr] and
      [Gtk.StateFlags.dir-rtl] but ignores them. If you want to set the widget's
      direction, use [Gtk.Widget.set_direction].

      This function is for use in widget implementations. *)

  external set_size_request : t -> int -> int -> unit
    = "ml_gtk_widget_set_size_request"
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

  external set_sensitive : t -> bool -> unit = "ml_gtk_widget_set_sensitive"
  (** Sets the sensitivity of the widget.

      A widget is sensitive if the user can interact with it. Insensitive
      widgets are “grayed out” and the user can’t interact with them.
      Insensitive widgets are known as “inactive”, “disabled”, or “ghosted” in
      some other toolkits. *)

  external set_receives_default : t -> bool -> unit
    = "ml_gtk_widget_set_receives_default"
  (** Sets whether the widget will be treated as the default widget within its
      toplevel when it has the focus, even if another widget is the default. *)

  external set_parent : t -> t -> unit = "ml_gtk_widget_set_parent"
  (** Sets the parent widget of the widget.

      This takes care of details such as updating the state and style of the
      child to reflect its new location and resizing the parent. The opposite
      function is [Gtk.Widget.unparent].

      This function is useful only when implementing subclasses of [GtkWidget].
  *)

  external set_overflow : t -> Ocgtk_enums.overflow -> unit
    = "ml_gtk_widget_set_overflow"
  (** Sets how the widget treats content that is drawn outside the it's content
      area.

      See the definition of [Gtk.Overflow] for details.

      This setting is provided for widget implementations and should not be used
      by application code.

      The default value is [Gtk.Overflow.visible]. *)

  external set_opacity : t -> float -> unit = "ml_gtk_widget_set_opacity"
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

  external set_name : t -> string -> unit = "ml_gtk_widget_set_name"
  (** Sets a widgets name.

      Setting a name allows you to refer to the widget from a CSS file. You can
      apply a style to widgets with a particular name in the CSS file. See the
      documentation for the CSS syntax (on the same page as the docs for
      [Gtk.StyleContext].

      Note that the CSS syntax has certain special characters to delimit and
      represent elements in a selector (period, #, >, *...), so using these will
      make your widget impossible to match by name. Any combination of
      alphanumeric symbols, dashes and underscores will suffice. *)

  external set_margin_top : t -> int -> unit = "ml_gtk_widget_set_margin_top"
  (** Sets the top margin of the widget. *)

  external set_margin_start : t -> int -> unit
    = "ml_gtk_widget_set_margin_start"
  (** Sets the start margin of the widget. *)

  external set_margin_end : t -> int -> unit = "ml_gtk_widget_set_margin_end"
  (** Sets the end margin of the widget. *)

  external set_margin_bottom : t -> int -> unit
    = "ml_gtk_widget_set_margin_bottom"
  (** Sets the bottom margin of the widget. *)

  external set_limit_events : t -> bool -> unit
    = "ml_gtk_widget_set_limit_events"
  (** Sets whether the widget acts like a modal dialog, with respect to event
      delivery. *)

  external set_layout_manager : t -> Layout_manager.t option -> unit
    = "ml_gtk_widget_set_layout_manager"
  (** Sets the layout manager to use for measuring and allocating children of
      the widget. *)

  external set_hexpand_set : t -> bool -> unit = "ml_gtk_widget_set_hexpand_set"
  (** Sets whether the hexpand flag will be used.

      The [Gtk.Widget:hexpand-set] property will be set automatically when you
      call [Gtk.Widget.set_hexpand] to set hexpand, so the most likely reason to
      use this function would be to unset an explicit expand flag.

      If hexpand is set, then it overrides any computed expand value based on
      child widgets. If hexpand is not set, then the expand value depends on
      whether any children of the widget would like to expand.

      There are few reasons to use this function, but it’s here for completeness
      and consistency. *)

  external set_hexpand : t -> bool -> unit = "ml_gtk_widget_set_hexpand"
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

  external set_has_tooltip : t -> bool -> unit = "ml_gtk_widget_set_has_tooltip"
  (** Sets the [has-tooltip] property on the widget. *)

  external set_halign : t -> Ocgtk_enums.align -> unit
    = "ml_gtk_widget_set_halign"
  (** Sets the horizontal alignment of the widget. *)

  external set_font_options : t -> Occairo_raw.Font_options.t option -> unit
    = "ml_gtk_widget_set_font_options"
  (** Sets the [cairo_font_options_t] used for text rendering in the widget.

      When not set, the default font options for the [GdkDisplay] will be used.
  *)

  external set_font_map : t -> Ocpango_raw.Font_map.t option -> unit
    = "ml_gtk_widget_set_font_map"
  (** Sets the font map to use for text rendering in the widget.

      The font map is the object that is used to look up fonts. Setting a custom
      font map can be useful in special situations, e.g. when you need to add
      application-specific fonts to the set of available fonts.

      When not set, the widget will inherit the font map from its parent. *)

  external set_focusable : t -> bool -> unit = "ml_gtk_widget_set_focusable"
  (** Sets whether the widget can own the input focus.

      Widget implementations should set [focusable] to true in their init()
      function if they want to receive keyboard input.

      Note that having [focusable] be true is only one of the necessary
      conditions for being focusable. A widget must also be sensitive and
      can-focus and not have an ancestor that is marked as not can-focus in
      order to receive input focus.

      See [Gtk.Widget.grab_focus] for actually setting the input focus on a
      widget. *)

  external set_focus_on_click : t -> bool -> unit
    = "ml_gtk_widget_set_focus_on_click"
  (** Sets whether the widget should grab focus when it is clicked with the
      mouse.

      Making mouse clicks not grab focus is useful in places like toolbars where
      you don’t want the keyboard focus removed from the main area of the
      application. *)

  external set_focus_child : t -> t option -> unit
    = "ml_gtk_widget_set_focus_child"
  (** Set the focus child of the widget.

      This function is only suitable for widget implementations. If you want a
      certain widget to get the input focus, call [Gtk.Widget.grab_focus] on it.
  *)

  external set_direction : t -> Ocgtk_enums.textdirection -> unit
    = "ml_gtk_widget_set_direction"
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

  external set_cursor_from_name : t -> string option -> unit
    = "ml_gtk_widget_set_cursor_from_name"
  (** Sets the cursor to be shown when the pointer hovers over the widget.

      This is a utility function that creates a cursor via
      [Gdk.Cursor.new_from_name] and then sets it on [widget] with
      [Gtk.Widget.set_cursor]. See those functions for details.

      On top of that, this function allows [name] to be [NULL], which will do
      the same as calling [Gtk.Widget.set_cursor] with a [NULL] cursor. *)

  external set_cursor : t -> Ocgdk_raw.Cursor.t option -> unit
    = "ml_gtk_widget_set_cursor"
  (** Sets the cursor to be shown when the pointer hovers over the widget.

      If the [cursor] is [NULL], [widget] will use the cursor inherited from its
      parent. *)

  external set_css_classes : t -> string array -> unit
    = "ml_gtk_widget_set_css_classes"
  (** Replaces the current style classes of the widget with [classes]. *)

  external set_child_visible : t -> bool -> unit
    = "ml_gtk_widget_set_child_visible"
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

  external set_can_target : t -> bool -> unit = "ml_gtk_widget_set_can_target"
  (** Sets whether the widget can be the target of pointer events. *)

  external set_can_focus : t -> bool -> unit = "ml_gtk_widget_set_can_focus"
  (** Sets whether the input focus can enter the widget or any of its children.

      Applications should set [can_focus] to false to mark a widget as for
      pointer/touch use only.

      Note that having [can_focus] be true is only one of the necessary
      conditions for being focusable. A widget must also be sensitive and
      focusable and not have an ancestor that is marked as not can-focus in
      order to receive input focus.

      See [Gtk.Widget.grab_focus] for actually setting the input focus on a
      widget. *)

  external remove_tick_callback : t -> int -> unit
    = "ml_gtk_widget_remove_tick_callback"
  (** Removes a tick callback previously registered with
      [Gtk.Widget.add_tick_callback]. *)

  external remove_mnemonic_label : t -> t -> unit
    = "ml_gtk_widget_remove_mnemonic_label"
  (** Removes a widget from the list of mnemonic labels for this widget.

      See [Gtk.Widget.list_mnemonic_labels].

      The widget must have previously been added to the list with
      [Gtk.Widget.add_mnemonic_label]. *)

  external remove_css_class : t -> string -> unit
    = "ml_gtk_widget_remove_css_class"
  (** Removes a style from the widget.

      After this, the style of [widget] will stop matching for [css_class]. *)

  external remove_controller : t -> Event_controller.t -> unit
    = "ml_gtk_widget_remove_controller"
  (** Removes an event controller from the widget.

      The removed event controller will not receive any more events, and should
      not be used again.

      Widgets will remove all event controllers automatically when they are
      destroyed, there is normally no need to call this function. *)

  external realize : t -> unit = "ml_gtk_widget_realize"
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

  external queue_resize : t -> unit = "ml_gtk_widget_queue_resize"
  (** Flags a widget to have its size renegotiated.

      This should be called when a widget for some reason has a new size
      request. For example, when you change the text in a [Gtk.Label], the label
      queues a resize to ensure there’s enough space for the new text.

      Note that you cannot call gtk_widget_queue_resize() on a widget from
      inside its implementation of the [Gtk.Widget.size_allocate] virtual
      method. Calls to gtk_widget_queue_resize() from inside
      [Gtk.Widget.size_allocate] will be silently ignored.

      This function is only for use in widget implementations. *)

  external queue_draw : t -> unit = "ml_gtk_widget_queue_draw"
  (** Schedules this widget to be redrawn.

      The redraw will happen in the paint phase of the current or the next
      frame.

      This means [widget]'s [Gtk.Widget.snapshot] implementation will be called.
  *)

  external queue_allocate : t -> unit = "ml_gtk_widget_queue_allocate"
  (** Flags the widget for a rerun of the [Gtk.Widget.size_allocate] function.

      Use this function instead of [Gtk.Widget.queue_resize] when the [widget]'s
      size request didn't change but it wants to reposition its contents.

      An example user of this function is [Gtk.Widget.set_halign].

      This function is only for use in widget implementations. *)

  external pick : t -> float -> float -> Ocgtk_enums.pickflags -> t option
    = "ml_gtk_widget_pick"
  (** Finds the descendant of the widget closest to a point.

      The point (x, y) must be given in widget coordinates, so (0, 0) is assumed
      to be the top left of [widget]'s content area.

      Usually widgets will return [NULL] if the given coordinate is not
      contained in [widget] checked via [Gtk.Widget.contains]. Otherwise they
      will recursively try to find a child that does not return [NULL]. Widgets
      are however free to customize their picking algorithm.

      This function is used on the toplevel to determine the widget below the
      mouse cursor for purposes of hover highlighting and delivering events. *)

  external observe_controllers : t -> Ocgio_raw.List_model.t
    = "ml_gtk_widget_observe_controllers"
  (** Returns a list model to track the event controllers of the widget.

      Calling this function will enable extra internal bookkeeping to track
      controllers and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  external observe_children : t -> Ocgio_raw.List_model.t
    = "ml_gtk_widget_observe_children"
  (** Returns a list model to track the children of the widget.

      Calling this function will enable extra internal bookkeeping to track
      children and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  external mnemonic_activate : t -> bool -> bool
    = "ml_gtk_widget_mnemonic_activate"
  (** Emits the [Gtk.Widget::mnemonic-activate] signal. *)

  external measure :
    t -> Ocgtk_enums.orientation -> int -> int * int * int * int
    = "ml_gtk_widget_measure"
  (** Measures [widget] in the orientation [orientation] and for the given
      [for_size].

      As an example, if [orientation] is [GTK_ORIENTATION_HORIZONTAL] and
      [for_size] is 300, this functions will compute the minimum and natural
      width of [widget] if it is allocated at a height of 300 pixels.

      See GtkWidget’s geometry management section for a more details on
      implementing [GtkWidgetClass.measure()]. *)

  external map : t -> unit = "ml_gtk_widget_map"
  (** Causes a widget to be mapped if it isn’t already.

      This function is only for use in widget implementations. *)

  external list_mnemonic_labels : t -> t list
    = "ml_gtk_widget_list_mnemonic_labels"
  (** Returns the widgets for which this widget is the target of a mnemonic.

      Typically, these widgets will be labels. See, for example,
      [Gtk.Label.set_mnemonic_widget].

      The widgets in the list are not individually referenced. If you want to
      iterate through the list and perform actions involving callbacks that
      might destroy the widgets, you must call
      [g_list_foreach (result, (GFunc)g_object_ref, NULL)] first, and then unref
      all the widgets afterwards. *)

  external keynav_failed : t -> Ocgtk_enums.directiontype -> bool
    = "ml_gtk_widget_keynav_failed"
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

  external is_visible : t -> bool = "ml_gtk_widget_is_visible"
  (** Determines whether the widget and all its parents are marked as visible.

      This function does not check if the widget is obscured in any way.

      See also [Gtk.Widget.get_visible] and [Gtk.Widget.set_visible]. *)

  external is_sensitive : t -> bool = "ml_gtk_widget_is_sensitive"
  (** Returns the widget’s effective sensitivity.

      This means it is sensitive itself and also its parent widget is sensitive.
  *)

  external is_focus : t -> bool = "ml_gtk_widget_is_focus"
  (** Determines if the widget is the focus widget within its toplevel.

      This does not mean that the [Gtk.Widget:has-focus] property is necessarily
      set; [Gtk.Widget:has-focus] will only be set if the toplevel widget
      additionally has the global input focus. *)

  external is_drawable : t -> bool = "ml_gtk_widget_is_drawable"
  (** Determines whether the widget can be drawn to.

      A widget can be drawn if it is mapped and visible. *)

  external is_ancestor : t -> t -> bool = "ml_gtk_widget_is_ancestor"
  (** Determines whether the widget is a descendent of [ancestor]. *)

  external insert_before : t -> t -> t option -> unit
    = "ml_gtk_widget_insert_before"
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

  external insert_after : t -> t -> t option -> unit
    = "ml_gtk_widget_insert_after"
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

  external insert_action_group :
    t -> string -> Ocgio_raw.Action_group.t option -> unit
    = "ml_gtk_widget_insert_action_group"
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

  external init_template : t -> unit = "ml_gtk_widget_init_template"
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

  external in_destruction : t -> bool = "ml_gtk_widget_in_destruction"
  (** Returns whether the widget is currently being destroyed.

      This information can sometimes be used to avoid doing unnecessary work. *)

  external hide : t -> unit = "ml_gtk_widget_hide"
  (** Reverses the effects of \[method.Gtk.Widget.show\].

      This is causing the widget to be hidden (invisible to the user). *)

  external has_visible_focus : t -> bool = "ml_gtk_widget_has_visible_focus"
  (** Determines if the widget should show a visible indication that it has the
      global input focus.

      This is a convenience function that takes into account whether focus
      indication should currently be shown in the toplevel window of [widget].
      See [Gtk.Window.get_focus_visible] for more information about focus
      indication.

      To find out if the widget has the global input focus, use
      [Gtk.Widget.has_focus]. *)

  external has_focus : t -> bool = "ml_gtk_widget_has_focus"
  (** Determines if the widget has the global input focus.

      See [Gtk.Widget.is_focus] for the difference between having the global
      input focus, and only having the focus within a toplevel. *)

  external has_default : t -> bool = "ml_gtk_widget_has_default"
  (** Determines whether the widget is the current default widget within its
      toplevel. *)

  external has_css_class : t -> string -> bool = "ml_gtk_widget_has_css_class"
  (** Returns whether a style class is currently applied to the widget. *)

  external grab_focus : t -> bool = "ml_gtk_widget_grab_focus"
  (** Causes [widget] to have the keyboard focus for the window that it belongs
      to.

      If [widget] is not focusable, or its [Gtk.Widget.grab_focus]
      implementation cannot transfer the focus to a descendant of [widget] that
      is focusable, it will not take focus and false will be returned.

      Calling [Gtk.Widget.grab_focus] on an already focused widget is allowed,
      should not have an effect, and return true. *)

  external get_width : t -> int = "ml_gtk_widget_get_width"
  (** Returns the content width of the widget.

      This function returns the width passed to its size-allocate
      implementation, which is the width you should be using in
      [Gtk.Widget.snapshot].

      For pointer events, see [Gtk.Widget.contains].

      To learn more about widget sizes, see the coordinate system overview. *)

  external get_visible : t -> bool = "ml_gtk_widget_get_visible"
  (** Determines whether the widget is visible.

      If you want to take into account whether the widget’s parent is also
      marked as visible, use [Gtk.Widget.is_visible] instead.

      This function does not check if the widget is obscured in any way.

      See [Gtk.Widget.set_visible]. *)

  external get_vexpand_set : t -> bool = "ml_gtk_widget_get_vexpand_set"
  (** Gets whether the [vexpand] flag has been explicitly set.

      See [Gtk.Widget.get_hexpand_set] for more detail. *)

  external get_vexpand : t -> bool = "ml_gtk_widget_get_vexpand"
  (** Gets whether the widget would like any available extra vertical space.

      See [Gtk.Widget.get_hexpand] for more detail. *)

  external get_valign : t -> Ocgtk_enums.align = "ml_gtk_widget_get_valign"
  (** Gets the vertical alignment of the widget. *)

  external get_tooltip_text : t -> string option
    = "ml_gtk_widget_get_tooltip_text"
  (** Gets the contents of the tooltip for the widget.

      If the [widget]'s tooltip was set using [Gtk.Widget.set_tooltip_markup],
      this function will return the escaped text. *)

  external get_tooltip_markup : t -> string option
    = "ml_gtk_widget_get_tooltip_markup"
  (** Gets the contents of the tooltip for the widget.

      If the tooltip has not been set using [Gtk.Widget.set_tooltip_markup],
      this function returns [NULL]. *)

  external get_template_child :
    t -> Gobject.Type.t -> string -> [ `object_ ] Gobject.obj
    = "ml_gtk_widget_get_template_child"
  (** Fetches an object build from the template XML for [widget_type] in the
      widget.

      This will only report children which were previously declared with
      [Gtk.WidgetClass.bind_template_child_full] or one of its variants.

      This function is only meant to be called for code which is private to the
      [widget_type] which declared the child and is meant for language bindings
      which cannot easily make use of the GObject structure offsets. *)

  external get_style_context : t -> Style_context.t
    = "ml_gtk_widget_get_style_context"
  (** Returns the style context associated to the widget.

      The returned object is guaranteed to be the same for the lifetime of
      [widget]. *)

  external get_state_flags : t -> Ocgtk_enums.stateflags
    = "ml_gtk_widget_get_state_flags"
  (** Returns the widget state as a flag set.

      It is worth mentioning that the effective [Gtk.StateFlags.insensitive]
      state will be returned, that is, also based on parent insensitivity, even
      if [widget] itself is sensitive.

      Also note that if you are looking for a way to obtain the [Gtk.StateFlags]
      to pass to a [Gtk.StyleContext] method, you should look at
      [Gtk.StyleContext.get_state]. *)

  external get_size_request : t -> int * int = "ml_gtk_widget_get_size_request"
  (** Gets the size request that was explicitly set for the widget.

      A value of -1 stored in [width] or [height] indicates that that dimension
      has not been set explicitly and the natural requisition of the widget will
      be used instead.

      See [Gtk.Widget.set_size_request].

      To get the size a widget will actually request, call [Gtk.Widget.measure]
      instead of this function. *)

  external get_size : t -> Ocgtk_enums.orientation -> int
    = "ml_gtk_widget_get_size"
  (** Returns the content width or height of the widget.

      Which dimension is returned depends on [orientation].

      This is equivalent to calling [Gtk.Widget.get_width] for
      [Gtk.Orientation.horizontal] or [Gtk.Widget.get_height] for
      [Gtk.Orientation.vertical], but can be used when writing
      orientation-independent code, such as when implementing [Gtk.Orientable]
      widgets.

      To learn more about widget sizes, see the coordinate system overview. *)

  external get_settings : t -> Settings.t = "ml_gtk_widget_get_settings"
  (** Gets the settings object holding the settings used for the widget.

      Note that this function can only be called when the [GtkWidget] is
      attached to a toplevel, since the settings object is specific to a
      particular display. If you want to monitor the widget for changes in its
      settings, connect to the [notify::display] signal. *)

  external get_sensitive : t -> bool = "ml_gtk_widget_get_sensitive"
  (** Returns the widget’s sensitivity.

      This function returns the value that has been set using
      [Gtk.Widget.set_sensitive]).

      The effective sensitivity of a widget is however determined by both its
      own and its parent widget’s sensitivity. See [Gtk.Widget.is_sensitive]. *)

  external get_scale_factor : t -> int = "ml_gtk_widget_get_scale_factor"
  (** Retrieves the internal scale factor that maps from window coordinates to
      the actual device pixels.

      On traditional systems this is 1, on high density outputs, it can be a
      higher value (typically 2).

      See [Gdk.Surface.get_scale_factor].

      Note that modern systems may support {i fractional} scaling, where the
      scale factor is not an integer. On such systems, this function will return
      the next higher integer value, but you probably want to use
      [Gdk.Surface.get_scale] to get the fractional scale value. *)

  external get_root : t -> Root.t option = "ml_gtk_widget_get_root"
  (** Returns the [GtkRoot] widget of the widget.

      This function will return [NULL] if the widget is not contained inside a
      widget tree with a root widget.

      [GtkRoot] widgets will return themselves here. *)

  external get_request_mode : t -> Ocgtk_enums.sizerequestmode
    = "ml_gtk_widget_get_request_mode"
  (** Gets whether the widget prefers a height-for-width layout or a
      width-for-height layout.

      Single-child widgets generally propagate the preference of their child,
      more complex widgets need to request something either in context of their
      children or in context of their allocation capabilities. *)

  external get_receives_default : t -> bool
    = "ml_gtk_widget_get_receives_default"
  (** Determines whether the widget is always treated as the default widget
      within its toplevel when it has the focus, even if another widget is the
      default.

      See [Gtk.Widget.set_receives_default]. *)

  external get_realized : t -> bool = "ml_gtk_widget_get_realized"
  (** Determines whether the widget is realized. *)

  external get_primary_clipboard : t -> Ocgdk_raw.Clipboard.t
    = "ml_gtk_widget_get_primary_clipboard"
  (** Gets the primary clipboard of the widget.

      This is a utility function to get the primary clipboard object for the
      display that [widget] is using.

      Note that this function always works, even when [widget] is not realized
      yet. *)

  external get_prev_sibling : t -> t option = "ml_gtk_widget_get_prev_sibling"
  (** Returns the widget’s previous sibling.

      This function is primarily meant for widget implementations. *)

  external get_preferred_size : t -> Requisition.t * Requisition.t
    = "ml_gtk_widget_get_preferred_size"
  (** Retrieves the minimum and natural size of a widget, taking into account
      the widget’s preference for height-for-width management.

      This is used to retrieve a suitable size by container widgets which do not
      impose any restrictions on the child placement. It can be used to deduce
      toplevel window and menu sizes as well as child widgets in free-form
      containers such as [GtkFixed].

      Handle with care. Note that the natural height of a height-for-width
      widget will generally be a smaller size than the minimum height, since the
      required height for the natural width is generally smaller than the
      required height for the minimum width.

      Use [Gtk.Widget.measure] if you want to support baseline alignment. *)

  external get_parent : t -> t option = "ml_gtk_widget_get_parent"
  (** Returns the parent widget of the widget. *)

  external get_pango_context : t -> Ocpango_raw.Context.t
    = "ml_gtk_widget_get_pango_context"
  (** Gets a [PangoContext] that is configured for the widget.

      The [PangoContext] will have the appropriate font map, font description,
      and base direction set.

      Unlike the context returned by [Gtk.Widget.create_pango_context], this
      context is owned by the widget (it can be used until the screen for the
      widget changes or the widget is removed from its toplevel), and will be
      updated to match any changes to the widget’s attributes. This can be
      tracked by listening to changes of the [Gtk.Widget:root] property on the
      widget. *)

  external get_overflow : t -> Ocgtk_enums.overflow
    = "ml_gtk_widget_get_overflow"
  (** Returns the widget’s overflow value. *)

  external get_opacity : t -> float = "ml_gtk_widget_get_opacity"
  (** Fetches the requested opacity for the widget.

      See [Gtk.Widget.set_opacity]. *)

  external get_next_sibling : t -> t option = "ml_gtk_widget_get_next_sibling"
  (** Returns the widget’s next sibling.

      This function is primarily meant for widget implementations. *)

  external get_native : t -> Native.t option = "ml_gtk_widget_get_native"
  (** Returns the nearest [GtkNative] ancestor of the widget.

      This function will return [NULL] if the widget is not contained inside a
      widget tree with a native ancestor.

      [GtkNative] widgets will return themselves here. *)

  external get_name : t -> string = "ml_gtk_widget_get_name"
  (** Retrieves the name of a widget.

      See [Gtk.Widget.set_name] for the significance of widget names. *)

  external get_margin_top : t -> int = "ml_gtk_widget_get_margin_top"
  (** Gets the top margin of the widget. *)

  external get_margin_start : t -> int = "ml_gtk_widget_get_margin_start"
  (** Gets the start margin of the widget. *)

  external get_margin_end : t -> int = "ml_gtk_widget_get_margin_end"
  (** Gets the end margin of the widget. *)

  external get_margin_bottom : t -> int = "ml_gtk_widget_get_margin_bottom"
  (** Gets the bottom margin of the widget. *)

  external get_mapped : t -> bool = "ml_gtk_widget_get_mapped"
  (** Returns whether the widget is mapped. *)

  external get_limit_events : t -> bool = "ml_gtk_widget_get_limit_events"
  (** Gets the value of the [Gtk.Widget:limit-events] property. *)

  external get_layout_manager : t -> Layout_manager.t option
    = "ml_gtk_widget_get_layout_manager"
  (** Retrieves the layout manager of the widget.

      See [Gtk.Widget.set_layout_manager]. *)

  external get_last_child : t -> t option = "ml_gtk_widget_get_last_child"
  (** Returns the widget’s last child.

      This function is primarily meant for widget implementations. *)

  external get_hexpand_set : t -> bool = "ml_gtk_widget_get_hexpand_set"
  (** Gets whether the [hexpand] flag has been explicitly set.

      If [Gtk.Widget:hexpand] property is set, then it overrides any computed
      expand value based on child widgets. If [hexpand] is not set, then the
      expand value depends on whether any children of the widget would like to
      expand.

      There are few reasons to use this function, but it’s here for completeness
      and consistency. *)

  external get_hexpand : t -> bool = "ml_gtk_widget_get_hexpand"
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

  external get_height : t -> int = "ml_gtk_widget_get_height"
  (** Returns the content height of the widget.

      This function returns the height passed to its size-allocate
      implementation, which is the height you should be using in
      [Gtk.Widget.snapshot].

      For pointer events, see [Gtk.Widget.contains].

      To learn more about widget sizes, see the coordinate system overview. *)

  external get_has_tooltip : t -> bool = "ml_gtk_widget_get_has_tooltip"
  (** Returns the current value of the [has-tooltip] property. *)

  external get_halign : t -> Ocgtk_enums.align = "ml_gtk_widget_get_halign"
  (** Gets the horizontal alignment of the widget.

      For backwards compatibility reasons this method will never return one of
      the baseline alignments, but instead it will convert it to
      [Gtk.Align.fill] or [Gtk.Align.center].

      Baselines are not supported for horizontal alignment. *)

  external get_frame_clock : t -> Ocgdk_raw.Frame_clock.t option
    = "ml_gtk_widget_get_frame_clock"
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

  external get_font_options : t -> Occairo_raw.Font_options.t option
    = "ml_gtk_widget_get_font_options"
  (** Returns the [cairo_font_options_t] of the widget.

      Seee [Gtk.Widget.set_font_options]. *)

  external get_font_map : t -> Ocpango_raw.Font_map.t option
    = "ml_gtk_widget_get_font_map"
  (** Gets the font map of the widget.

      See [Gtk.Widget.set_font_map]. *)

  external get_focusable : t -> bool = "ml_gtk_widget_get_focusable"
  (** Determines whether the widget can own the input focus.

      See [Gtk.Widget.set_focusable]. *)

  external get_focus_on_click : t -> bool = "ml_gtk_widget_get_focus_on_click"
  (** Returns whether the widget should grab focus when it is clicked with the
      mouse.

      See [Gtk.Widget.set_focus_on_click]. *)

  external get_focus_child : t -> t option = "ml_gtk_widget_get_focus_child"
  (** Returns the focus child of the widget. *)

  external get_first_child : t -> t option = "ml_gtk_widget_get_first_child"
  (** Returns the widget’s first child.

      This function is primarily meant for widget implementations. *)

  external get_display : t -> Ocgdk_raw.Display.t = "ml_gtk_widget_get_display"
  (** Get the display for the window that the widget belongs to.

      This function can only be called after the widget has been added to a
      widget hierarchy with a [GtkRoot] at the top.

      In general, you should only create display-specific resources when a
      widget has been realized, and you should free those resources when the
      widget is unrealized. *)

  external get_direction : t -> Ocgtk_enums.textdirection
    = "ml_gtk_widget_get_direction"
  (** Gets the reading direction for the widget.

      See [Gtk.Widget.set_direction]. *)

  external get_cursor : t -> Ocgdk_raw.Cursor.t option
    = "ml_gtk_widget_get_cursor"
  (** Gets the cursor set on the widget.

      See [Gtk.Widget.set_cursor] for details. *)

  external get_css_name : t -> string = "ml_gtk_widget_get_css_name"
  (** Returns the CSS name of the widget. *)

  external get_css_classes : t -> string array = "ml_gtk_widget_get_css_classes"
  (** Returns the list of style classes applied to the widget. *)

  external get_color : t -> Ocgdk_raw.Rgb_a.t = "ml_gtk_widget_get_color"
  (** Gets the current foreground color for the widget’s style.

      This function should only be used in snapshot implementations that need to
      do custom drawing with the foreground color. *)

  external get_clipboard : t -> Ocgdk_raw.Clipboard.t
    = "ml_gtk_widget_get_clipboard"
  (** Gets the clipboard object for the widget.

      This is a utility function to get the clipboard object for the display
      that [widget] is using.

      Note that this function always works, even when [widget] is not realized
      yet. *)

  external get_child_visible : t -> bool = "ml_gtk_widget_get_child_visible"
  (** Gets the value set with [Gtk.Widget.set_child_visible].

      If you feel a need to use this function, your code probably needs
      reorganization.

      This function is only useful for widget implementations and should never
      be called by an application. *)

  external get_can_target : t -> bool = "ml_gtk_widget_get_can_target"
  (** Queries whether the widget can be the target of pointer events. *)

  external get_can_focus : t -> bool = "ml_gtk_widget_get_can_focus"
  (** Determines whether the input focus can enter the widget or any of its
      children.

      See [Gtk.Widget.set_can_focus]. *)

  external get_baseline : t -> int = "ml_gtk_widget_get_baseline"
  (** Returns the baseline that has currently been allocated to the widget.

      This function is intended to be used when implementing handlers for the
      [GtkWidgetClass.snapshot()] function, and when allocating child widgets in
      [GtkWidgetClass.size_allocate()]. *)

  external get_ancestor : t -> Gobject.Type.t -> t option
    = "ml_gtk_widget_get_ancestor"
  (** Gets the first ancestor of the widget with type [widget_type].

      For example, [gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)] gets the
      first [GtkBox] that’s an ancestor of [widget]. No reference will be added
      to the returned widget; it should not be unreferenced.

      Note that unlike [Gtk.Widget.is_ancestor], this function considers
      [widget] to be an ancestor of itself. *)

  external get_allocated_width : t -> int = "ml_gtk_widget_get_allocated_width"
  (** Returns the width that has currently been allocated to the widget.

      To learn more about widget sizes, see the coordinate system overview. *)

  external get_allocated_height : t -> int
    = "ml_gtk_widget_get_allocated_height"
  (** Returns the height that has currently been allocated to the widget.

      To learn more about widget sizes, see the coordinate system overview. *)

  external get_allocated_baseline : t -> int
    = "ml_gtk_widget_get_allocated_baseline"
  (** Returns the baseline that has currently been allocated to the widget.

      This function is intended to be used when implementing handlers for the
      [GtkWidget]Class.snapshot() function, and when allocating child widgets in
      [GtkWidget]Class.size_allocate(). *)

  external error_bell : t -> unit = "ml_gtk_widget_error_bell"
  (** Notifies the user about an input-related error on the widget.

      If the [Gtk.Settings:gtk-error-bell] setting is true, it calls
      [Gdk.Surface.beep], otherwise it does nothing.

      Note that the effect of [Gdk.Surface.beep] can be configured in many ways,
      depending on the windowing backend and the desktop environment or window
      manager that is used. *)

  external drag_check_threshold : t -> int -> int -> int -> int -> bool
    = "ml_gtk_drag_check_threshold"
  (** Checks to see if a drag movement has passed the GTK drag threshold. *)

  external dispose_template : t -> Gobject.Type.t -> unit
    = "ml_gtk_widget_dispose_template"
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

  external create_pango_layout : t -> string option -> Ocpango_raw.Layout.t
    = "ml_gtk_widget_create_pango_layout"
  (** Creates a new [PangoLayout] that is configured for the widget.

      The [PangoLayout] will have the appropriate font map, font description,
      and base direction set.

      If you keep a [PangoLayout] created in this way around, you need to
      re-create it when the widgets [PangoContext] is replaced. This can be
      tracked by listening to changes of the [Gtk.Widget:root] property on the
      widget. *)

  external create_pango_context : t -> Ocpango_raw.Context.t
    = "ml_gtk_widget_create_pango_context"
  (** Creates a new [PangoContext] that is configured for the widget.

      The [PangoContext] will have the appropriate font map, font options, font
      description, and base direction set.

      See also [Gtk.Widget.get_pango_context]. *)

  external contains : t -> float -> float -> bool = "ml_gtk_widget_contains"
  (** Tests if a given point is contained in the widget.

      The coordinates for (x, y) must be in widget coordinates, so (0, 0) is
      assumed to be the top left of [widget]'s content area. *)

  external compute_transform : t -> t -> bool * Ocgraphene_raw.Matrix.t
    = "ml_gtk_widget_compute_transform"
  (** Computes a matrix suitable to describe a transformation from [widget]'s
      coordinate system into [target]'s coordinate system.

      The transform can not be computed in certain cases, for example when
      [widget] and [target] do not share a common ancestor. In that case
      [out_transform] gets set to the identity matrix.

      To learn more about widget coordinate systems, see the coordinate system
      overview. *)

  external compute_point :
    t -> t -> Ocgraphene_raw.Point.t -> bool * Ocgraphene_raw.Point.t
    = "ml_gtk_widget_compute_point"
  (** Translates the given [point] in [widget]'s coordinates to coordinates in
      [target]’s coordinate system.

      In order to perform this operation, both widgets must share a a common
      ancestor. If that is not the case, [out_point] is set to (0, 0) and false
      is returned. *)

  external compute_expand : t -> Ocgtk_enums.orientation -> bool
    = "ml_gtk_widget_compute_expand"
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

  external compute_bounds : t -> t -> bool * Ocgraphene_raw.Rect.t
    = "ml_gtk_widget_compute_bounds"
  (** Computes the bounds for [widget] in the coordinate space of [target].

      The bounds of widget are (the bounding box of) the region that it is
      expected to draw in. See the coordinate system overview to learn more.

      If the operation is successful, true is returned. If [widget] has no
      bounds or the bounds cannot be expressed in [target]'s coordinate space
      (for example if both widgets are in different windows), false is returned
      and [bounds] is set to the zero rectangle.

      It is valid for [widget] and [target] to be the same widget. *)

  external child_focus : t -> Ocgtk_enums.directiontype -> bool
    = "ml_gtk_widget_child_focus"
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

  external allocate :
    t -> int -> int -> int -> Ocgsk_raw.Transform.t option -> unit
    = "ml_gtk_widget_allocate"
  (** Assigns size, position, (optionally) a baseline and transform to a child
      widget.

      In this function, the allocation and baseline may be adjusted. The given
      allocation will be forced to be bigger than the widget's minimum size, as
      well as at least 0×0 in size.

      This function is only used by widget implementations.

      For a version that does not take a transform, see
      [Gtk.Widget.size_allocate]. *)

  external add_mnemonic_label : t -> t -> unit
    = "ml_gtk_widget_add_mnemonic_label"
  (** Adds a widget to the list of mnemonic labels for this widget.

      See [Gtk.Widget.list_mnemonic_labels].

      Note that the list of mnemonic labels for the widget is cleared when the
      widget is destroyed, so the caller must make sure to update its internal
      state at this point as well. *)

  external add_css_class : t -> string -> unit = "ml_gtk_widget_add_css_class"
  (** Adds a style class to the widget.

      After calling this function, the widget’s style will match for
      [css_class], according to CSS matching rules.

      Use [Gtk.Widget.remove_css_class] to remove the style again. *)

  external add_controller : t -> Event_controller.t -> unit
    = "ml_gtk_widget_add_controller"
  (** Adds an event controller to the widget.

      The event controllers of a widget handle the events that are propagated to
      the widget.

      You will usually want to call this function right after creating any kind
      of [Gtk.EventController]. *)

  external activate_default : t -> unit = "ml_gtk_widget_activate_default"
  (** Activates the [default.activate] action for the widget.

      The action is looked up in the same was as for
      [Gtk.Widget.activate_action]. *)

  external activate_action_variant : t -> string -> Gvariant.t option -> bool
    = "ml_gtk_widget_activate_action_variant"
  (** Activates an action for the widget.

      The action is looked up in the action groups associated with [widget] and
      its ancestors.

      If the action is in an action group added with
      [Gtk.Widget.insert_action_group], the [name] is expected to be prefixed
      with the prefix that was used when the group was inserted.

      The arguments must match the actions expected parameter type, as returned
      by [Gio.Action.get_parameter_type]. *)

  external activate : t -> bool = "ml_gtk_widget_activate"
  (** Activates the widget.

      The activation will emit the signal set using
      [Gtk.WidgetClass.set_activate_signal] during class initialization.

      Activation is what happens when you press <kbd>Enter</kbd> on a widget.

      If you wish to handle the activation keybinding yourself, it is
      recommended to use [Gtk.WidgetClass.add_shortcut] with an action created
      with [Gtk.SignalAction.new].

      If [widget] is not activatable, the function returns false. *)

  external action_set_enabled : t -> string -> bool -> unit
    = "ml_gtk_widget_action_set_enabled"
  (** Enables or disables an action installed with
      [Gtk.WidgetClass.install_action]. *)

  (* Properties *)

  external get_height_request : t -> int = "ml_gtk_widget_get_height_request"
  (** Get property: height-request *)

  external set_height_request : t -> int -> unit
    = "ml_gtk_widget_set_height_request"
  (** Set property: height-request *)

  external get_width_request : t -> int = "ml_gtk_widget_get_width_request"
  (** Get property: width-request *)

  external set_width_request : t -> int -> unit
    = "ml_gtk_widget_set_width_request"
  (** Set property: width-request *)

  val on_destroy :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_direction_changed :
    ?after:bool ->
    t ->
    callback:(previous_direction:Ocgtk_enums.textdirection -> unit) ->
    Gobject.Signal.handler_id

  val on_hide :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_keynav_failed :
    ?after:bool ->
    t ->
    callback:(direction:Ocgtk_enums.directiontype -> bool) ->
    Gobject.Signal.handler_id

  val on_map :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_mnemonic_activate :
    ?after:bool ->
    t ->
    callback:(group_cycling:bool -> bool) ->
    Gobject.Signal.handler_id

  val on_move_focus :
    ?after:bool ->
    t ->
    callback:(direction:Ocgtk_enums.directiontype -> unit) ->
    Gobject.Signal.handler_id

  val on_query_tooltip :
    ?after:bool ->
    t ->
    callback:(x:int -> y:int -> keyboard_mode:bool -> tooltip:Tooltip.t -> bool) ->
    Gobject.Signal.handler_id

  val on_realize :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_show :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_state_flags_changed :
    ?after:bool ->
    t ->
    callback:(flags:Ocgtk_enums.stateflags -> unit) ->
    Gobject.Signal.handler_id

  val on_unmap :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

  val on_unrealize :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
end
[@@ocaml.doc
  "The base class for all widgets.\n\n\
   It manages the widget lifecycle, layout, states and style.\n\n\
   {b Height-for-width Geometry Management}\n\n\
   GTK uses a height-for-width (and width-for-height) geometry management\n\
   system. Height-for-width means that a widget can change how much\n\
   vertical space it needs, depending on the amount of horizontal space\n\
   that it is given (and similar for width-for-height). The most common\n\
   example is a label that reflows to fill up the available width, wraps\n\
   to fewer lines, and therefore needs less height.\n\n\
   Height-for-width geometry management is implemented in GTK by way\n\
   of two virtual methods:\n\n\
   - [Gtk.Widget.get_request_mode]\n\
   - [Gtk.Widget.measure]\n\n\
   There are some important things to keep in mind when implementing\n\
   height-for-width and when using it in widget implementations.\n\n\
   If you implement a direct [GtkWidget] subclass that supports\n\
   height-for-width or width-for-height geometry management for itself\n\
   or its child widgets, the [Gtk.Widget.get_request_mode] virtual\n\
   function must be implemented as well and return the widget's preferred\n\
   request mode. The default implementation of this virtual function\n\
   returns [GTK_SIZE_REQUEST_CONSTANT_SIZE], which means that the widget will\n\
   only ever get -1 passed as the for_size value to its\n\
   [Gtk.Widget.measure] implementation.\n\n\
   The geometry management system will query a widget hierarchy in\n\
   only one orientation at a time. When widgets are initially queried\n\
   for their minimum sizes it is generally done in two initial passes\n\
   in the [Gtk.SizeRequestMode] chosen by the toplevel.\n\n\
   For example, when queried in the normal [GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH] \
   mode:\n\n\
   First, the default minimum and natural width for each widget\n\
   in the interface will be computed using [Gtk.Widget.measure] with an\n\
   orientation of [GTK_ORIENTATION_HORIZONTAL] and a for_size of -1.\n\
   Because the preferred widths for each widget depend on the preferred\n\
   widths of their children, this information propagates up the hierarchy,\n\
   and finally a minimum and natural width is determined for the entire\n\
   toplevel. Next, the toplevel will use the minimum width to query for the\n\
   minimum height contextual to that width using [Gtk.Widget.measure] with an\n\
   orientation of [GTK_ORIENTATION_VERTICAL] and a for_size of the just computed\n\
   width. This will also be a highly recursive operation. The minimum height\n\
   for the minimum width is normally used to set the minimum size constraint\n\
   on the toplevel.\n\n\
   After the toplevel window has initially requested its size in both\n\
   dimensions it can go on to allocate itself a reasonable size (or a size\n\
   previously specified with [Gtk.Window.set_default_size]). During the\n\
   recursive allocation process it’s important to note that request cycles\n\
   will be recursively executed while widgets allocate their children.\n\
   Each widget, once allocated a size, will go on to first share the\n\
   space in one orientation among its children and then request each child's\n\
   height for its target allocated width or its width for allocated height,\n\
   depending. In this way a widget will typically be requested its size\n\
   a number of times before actually being allocated a size. The size a\n\
   widget is finally allocated can of course differ from the size it has\n\
   requested. For this reason, [GtkWidget] caches a  small number of results\n\
   to avoid re-querying for the same sizes in one allocation cycle.\n\n\
   If a widget does move content around to intelligently use up the\n\
   allocated size then it must support the request in both\n\
   [GtkSizeRequestMode]s even if the widget in question only\n\
   trades sizes in a single orientation.\n\n\
   For instance, a [Gtk.Label] that does height-for-width word wrapping\n\
   will not expect to have [Gtk.Widget.measure] with an orientation of\n\
   [GTK_ORIENTATION_VERTICAL] called because that call is specific to a\n\
   width-for-height request. In this case the label must return the height\n\
   required for its own minimum possible width. By following this rule any\n\
   widget that handles height-for-width or width-for-height requests will\n\
   always be allocated at least enough space to fit its own content.\n\n\
   Here are some examples of how a [GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH] widget\n\
   generally deals with width-for-height requests:\n\n\
   {[\n\
   static void\n\
   foo_widget_measure (GtkWidget      *widget,\n\
  \                    GtkOrientation  orientation,\n\
  \                    int             for_size,\n\
  \                    int            *minimum_size,\n\
  \                    int            *natural_size,\n\
  \                    int            *minimum_baseline,\n\
  \                    int            *natural_baseline)\n\
   {\n\
  \  if (orientation == GTK_ORIENTATION_HORIZONTAL)\n\
  \    {\n\
  \      // Calculate minimum and natural width\n\
  \    }\n\
  \  else // VERTICAL\n\
  \    {\n\
  \      if (i_am_in_height_for_width_mode)\n\
  \        {\n\
  \          int min_width, dummy;\n\n\
  \          // First, get the minimum width of our widget\n\
  \          GTK_WIDGET_GET_CLASS (widget)->measure (widget, \
   GTK_ORIENTATION_HORIZONTAL, -1,\n\
  \                                                  &min_width, &dummy, \
   &dummy, &dummy);\n\n\
  \          // Now use the minimum width to retrieve the minimum and natural \
   height to display\n\
  \          // that width.\n\
  \          GTK_WIDGET_GET_CLASS (widget)->measure (widget, \
   GTK_ORIENTATION_VERTICAL, min_width,\n\
  \                                                  minimum_size, \
   natural_size, &dummy, &dummy);\n\
  \        }\n\
  \      else\n\
  \        {\n\
  \          // ... some widgets do both.\n\
  \        }\n\
  \    }\n\
   }\n\
   ]}\n\n\
   Often a widget needs to get its own request during size request or\n\
   allocation. For example, when computing height it may need to also\n\
   compute width. Or when deciding how to use an allocation, the widget\n\
   may need to know its natural size. In these cases, the widget should\n\
   be careful to call its virtual methods directly, like in the code\n\
   example above.\n\n\
   It will not work to use the wrapper function [Gtk.Widget.measure]\n\
   inside your own [Gtk.Widget.size_allocate] implementation.\n\
   These return a request adjusted by [Gtk.SizeGroup], the widget's\n\
   align and expand flags, as well as its CSS style.\n\n\
   If a widget used the wrappers inside its virtual method implementations,\n\
   then the adjustments (such as widget margins) would be applied\n\
   twice. GTK therefore does not allow this and will warn if you try\n\
   to do it.\n\n\
   Of course if you are getting the size request for another widget, such\n\
   as a child widget, you must use [Gtk.Widget.measure]; otherwise, you\n\
   would not properly consider widget margins, [Gtk.SizeGroup], and\n\
   so forth.\n\n\
   GTK also supports baseline vertical alignment of widgets. This\n\
   means that widgets are positioned such that the typographical baseline of\n\
   widgets in the same row are aligned. This happens if a widget supports\n\
   baselines, has a vertical alignment using baselines, and is inside\n\
   a widget that supports baselines and has a natural “row” that it aligns to\n\
   the baseline, or a baseline assigned to it by the grandparent.\n\n\
   Baseline alignment support for a widget is also done by the\n\
   [Gtk.Widget.measure] virtual function. It allows you to report\n\
   both a minimum and natural size.\n\n\
   If a widget ends up baseline aligned it will be allocated all the space in\n\
   the parent as if it was [GTK_ALIGN_FILL], but the selected baseline can be\n\
   found via [Gtk.Widget.get_baseline]. If the baseline has a\n\
   value other than -1 you need to align the widget such that the baseline\n\
   appears at the position.\n\n\
   {b GtkWidget as GtkBuildable}\n\n\
   The [GtkWidget] implementation of the [GtkBuildable] interface\n\
   supports various custom elements to specify additional aspects of widgets\n\
   that are not directly expressed as properties.\n\n\
   If the widget uses a [Gtk.LayoutManager], [GtkWidget] supports\n\
   a custom [<layout>] element, used to define layout properties:\n\n\
   {[\n\
   <object class=\"GtkGrid\" id=\"my_grid\">\n\
  \  <child>\n\
  \    <object class=\"GtkLabel\" id=\"label1\">\n\
  \      <property name=\"label\">Description</property>\n\
  \      <layout>\n\
  \        <property name=\"column\">0</property>\n\
  \        <property name=\"row\">0</property>\n\
  \        <property name=\"row-span\">1</property>\n\
  \        <property name=\"column-span\">1</property>\n\
  \      </layout>\n\
  \    </object>\n\
  \  </child>\n\
  \  <child>\n\
  \    <object class=\"GtkEntry\" id=\"description_entry\">\n\
  \      <layout>\n\
  \        <property name=\"column\">1</property>\n\
  \        <property name=\"row\">0</property>\n\
  \        <property name=\"row-span\">1</property>\n\
  \        <property name=\"column-span\">1</property>\n\
  \      </layout>\n\
  \    </object>\n\
  \  </child>\n\
   </object>\n\
   ]}\n\n\
   [GtkWidget] allows style information such as style classes to\n\
   be associated with widgets, using the custom [<style>] element:\n\n\
   {[\n\
   <object class=\"GtkButton\" id=\"button1\">\n\
  \  <style>\n\
  \    <class name=\"my-special-button-class\"/>\n\
  \    <class name=\"dark-button\"/>\n\
  \  </style>\n\
   </object>\n\
   ]}\n\n\
   [GtkWidget] allows defining accessibility information, such as properties,\n\
   relations, and states, using the custom [<accessibility>] element:\n\n\
   {[\n\
   <object class=\"GtkButton\" id=\"button1\">\n\
  \  <accessibility>\n\
  \    <property name=\"label\">Download</property>\n\
  \    <relation name=\"labelled-by\">label1</relation>\n\
  \  </accessibility>\n\
   </object>\n\
   ]}\n\n\
   {b Building composite widgets from template XML}\n\n\
   [GtkWidget ]exposes some facilities to automate the procedure\n\
   of creating composite widgets using \"templates\".\n\n\
   To create composite widgets with [GtkBuilder] XML, one must associate\n\
   the interface description with the widget class at class initialization\n\
   time using [Gtk.WidgetClass.set_template].\n\n\
   The interface description semantics expected in composite template \
   descriptions\n\
   is slightly different from regular [Gtk.Builder] XML.\n\n\
   Unlike regular interface descriptions, [Gtk.WidgetClass.set_template]\n\
   will expect a [<template>] tag as a direct child of the toplevel\n\
   [<interface>] tag. The [<template>] tag must specify the “class” attribute\n\
   which must be the type name of the widget. Optionally, the “parent”\n\
   attribute may be specified to specify the direct parent type of the widget\n\
   type; this is ignored by [GtkBuilder] but can be used by UI design tools to\n\
   introspect what kind of properties and internal children exist for a given\n\
   type when the actual type does not exist.\n\n\
   The XML which is contained inside the [<template>] tag behaves as if it were\n\
   added to the [<object>] tag defining the widget itself. You may set \
   properties\n\
   on a widget by inserting [<property>] tags into the [<template>] tag, and \
   also\n\
   add [<child>] tags to add children and extend a widget in the normal way you\n\
   would with [<object>] tags.\n\n\
   Additionally, [<object>] tags can also be added before and after the initial\n\
   [<template>] tag in the normal way, allowing one to define auxiliary objects\n\
   which might be referenced by other widgets declared as children of the\n\
   [<template>] tag.\n\n\
   Since, unlike the [<object>] tag, the [<template>] tag does not contain an\n\
   “id” attribute, if you need to refer to the instance of the object itself \
   that\n\
   the template will create, simply refer to the template class name in an\n\
   applicable element content.\n\n\
   Here is an example of a template definition, which includes an example of\n\
   this in the [<signal>] tag:\n\n\
   {[\n\
   <interface>\n\
  \  <template class=\"FooWidget\" parent=\"GtkBox\">\n\
  \    <property name=\"orientation\">horizontal</property>\n\
  \    <property name=\"spacing\">4</property>\n\
  \    <child>\n\
  \      <object class=\"GtkButton\" id=\"hello_button\">\n\
  \        <property name=\"label\">Hello World</property>\n\
  \        <signal name=\"clicked\" handler=\"hello_button_clicked\" \
   object=\"FooWidget\" swapped=\"yes\"/>\n\
  \      </object>\n\
  \    </child>\n\
  \    <child>\n\
  \      <object class=\"GtkButton\" id=\"goodbye_button\">\n\
  \        <property name=\"label\">Goodbye World</property>\n\
  \      </object>\n\
  \    </child>\n\
  \  </template>\n\
   </interface>\n\
   ]}\n\n\
   Typically, you'll place the template fragment into a file that is\n\
   bundled with your project, using [GResource]. In order to load the\n\
   template, you need to call [Gtk.WidgetClass.set_template_from_resource]\n\
   from the class initialization of your [GtkWidget] type:\n\n\
   {[\n\
   static void\n\
   foo_widget_class_init (FooWidgetClass *klass)\n\
   {\n\
  \  // ...\n\n\
  \  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
  \                                               \
   \"/com/example/ui/foowidget.ui\");\n\
   }\n\
   ]}\n\n\
   You will also need to call [Gtk.Widget.init_template] from the\n\
   instance initialization function:\n\n\
   {[\n\
   static void\n\
   foo_widget_init (FooWidget *self)\n\
   {\n\
  \  gtk_widget_init_template (GTK_WIDGET (self));\n\n\
  \  // Initialize the rest of the widget...\n\
   }\n\
   ]}\n\n\
   as well as calling [Gtk.Widget.dispose_template] from the dispose\n\
   function:\n\n\
   {[\n\
   static void\n\
   foo_widget_dispose (GObject *gobject)\n\
   {\n\
  \  FooWidget *self = FOO_WIDGET (gobject);\n\n\
  \  // Dispose objects for which you have a reference...\n\n\
  \  // Clear the template children for this widget type\n\
  \  gtk_widget_dispose_template (GTK_WIDGET (self), FOO_TYPE_WIDGET);\n\n\
  \  G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);\n\
   }\n\
   ]}\n\n\
   You can access widgets defined in the template using the\n\
   [Gtk.Widget.get_template_child] function, but you will typically declare\n\
   a pointer in the instance private data structure of your type using the same\n\
   name as the widget in the template definition, and call\n\
   [Gtk.WidgetClass.bind_template_child_full] (or one of its wrapper macros\n\
   [Gtk.widget_class_bind_template_child] and \
   [Gtk.widget_class_bind_template_child_private])\n\
   with that name, e.g.\n\n\
   {[\n\
   typedef struct {\n\
  \  GtkWidget *hello_button;\n\
  \  GtkWidget *goodbye_button;\n\
   } FooWidgetPrivate;\n\n\
   G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)\n\n\
   static void\n\
   foo_widget_dispose (GObject *gobject)\n\
   {\n\
  \  gtk_widget_dispose_template (GTK_WIDGET (gobject), FOO_TYPE_WIDGET);\n\n\
  \  G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);\n\
   }\n\n\
   static void\n\
   foo_widget_class_init (FooWidgetClass *klass)\n\
   {\n\
  \  // ...\n\
  \  G_OBJECT_CLASS (klass)->dispose = foo_widget_dispose;\n\n\
  \  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
  \                                               \
   \"/com/example/ui/foowidget.ui\");\n\
  \  gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),\n\
  \                                                FooWidget, hello_button);\n\
  \  gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),\n\
  \                                                FooWidget, goodbye_button);\n\
   }\n\n\
   static void\n\
   foo_widget_init (FooWidget *widget)\n\
   {\n\
  \  gtk_widget_init_template (GTK_WIDGET (widget));\n\
   }\n\
   ]}\n\n\
   You can also use [Gtk.WidgetClass.bind_template_callback_full] (or\n\
   is wrapper macro [Gtk.widget_class_bind_template_callback]) to connect\n\
   a signal callback defined in the template with a function visible in the\n\
   scope of the class, e.g.\n\n\
   {[\n\
   // the signal handler has the instance and user data swapped\n\
   // because of the swapped=\"yes\" attribute in the template XML\n\
   static void\n\
   hello_button_clicked (FooWidget *self,\n\
  \                      GtkButton *button)\n\
   {\n\
  \  g_print (\"Hello, world!\\n\");\n\
   }\n\n\
   static void\n\
   foo_widget_class_init (FooWidgetClass *klass)\n\
   {\n\
  \  // ...\n\
  \  gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),\n\
  \                                               \
   \"/com/example/ui/foowidget.ui\");\n\
  \  gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), \
   hello_button_clicked);\n\
   }\n\
   ]}\n\n\
   The class built on this module is in {!Ocgtk.Widget}."]
