(* GENERATED CODE - DO NOT EDIT *)
(* ScrolledWindow: ScrolledWindow *)

(** Makes its child scrollable.

    An example GtkScrolledWindow

    It does so using either internally added scrollbars or externally associated
    adjustments, and optionally draws a frame around the child.

    Widgets with native scrolling support, i.e. those whose classes implement
    the {{!Ocgtk.Raw.Scrollable}[Gtk.Scrollable]} interface, are added directly.
    For other types of widget, the class {{!Ocgtk.Raw.Viewport}[Gtk.Viewport]}
    acts as an adaptor, giving scrollability to other widgets.
    {{!Ocgtk.Raw.Scrolled_window.val-set_child}[Gtk.ScrolledWindow.set_child]}
    intelligently accounts for whether or not the added child is a
    [GtkScrollable]. If it isn’t, then it wraps the child in a [GtkViewport].
    Therefore, you can just add any child widget and not worry about the
    details.

    If
    {{!Ocgtk.Raw.Scrolled_window.val-set_child}[Gtk.ScrolledWindow.set_child]}
    has added a [GtkViewport] for you, it will be automatically removed when you
    unset the child. Unless
    {{!Ocgtk.Raw.Scrolled_window.val-get_hscrollbar_policy}[Gtk.ScrolledWindow:hscrollbar-policy]}
    and
    {{!Ocgtk.Raw.Scrolled_window.val-get_vscrollbar_policy}[Gtk.ScrolledWindow:vscrollbar-policy]}
    are {{!Ocgtk.Enums.type-policytype.constructor-NEVER}[GTK_POLICY_NEVER]} or
    {{!Ocgtk.Enums.type-policytype.constructor-EXTERNAL}[GTK_POLICY_EXTERNAL]},
    [GtkScrolledWindow] adds internal [GtkScrollbar] widgets around its child.
    The scroll position of the child, and if applicable the scrollbars, is
    controlled by the
    {{!Ocgtk.Raw.Scrolled_window.val-get_hadjustment}[Gtk.ScrolledWindow:hadjustment]}
    and
    {{!Ocgtk.Raw.Scrolled_window.val-get_vadjustment}[Gtk.ScrolledWindow:vadjustment]}
    that are associated with the [GtkScrolledWindow]. See the docs on
    {{!Ocgtk.Raw.Scrollbar}[Gtk.Scrollbar]} for the details, but note that the
    “step_increment” and “page_increment” fields are only effective if the
    policy causes scrollbars to be present.

    If a [GtkScrolledWindow] doesn’t behave quite as you would like, or doesn’t
    have exactly the right layout, it’s very possible to set up your own
    scrolling with [GtkScrollbar] and for example a [GtkGrid].

    {b Touch support}

    [GtkScrolledWindow] has built-in support for touch devices. When a
    touchscreen is used, swiping will move the scrolled window, and will expose
    'kinetic' behavior. This can be turned off with the
    {{!Ocgtk.Raw.Scrolled_window.val-get_kinetic_scrolling}[Gtk.ScrolledWindow:kinetic-scrolling]}
    property if it is undesired.

    [GtkScrolledWindow] also displays visual 'overshoot' indication when the
    content is pulled beyond the end, and this situation can be captured with
    the
    {{!Ocgtk.Raw.Scrolled_window.val-on_edge_overshot}[Gtk.ScrolledWindow::edge-overshot]}
    signal.

    If no mouse device is present, the scrollbars will overlaid as narrow,
    auto-hiding indicators over the content. If traditional scrollbars are
    desired although no mouse is present, this behaviour can be turned off with
    the
    {{!Ocgtk.Raw.Scrolled_window.val-get_overlay_scrolling}[Gtk.ScrolledWindow:overlay-scrolling]}
    property.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Raw.Scrolled_window.val-on_scroll_child}[Gtk.ScrolledWindow::scroll-child]}

    {b CSS nodes}

    [GtkScrolledWindow] has a main CSS node with name scrolledwindow. It gets a
    .frame style class added when
    {{!Ocgtk.Raw.Scrolled_window.val-get_has_frame}[Gtk.ScrolledWindow:has-frame]}
    is [true].

    It uses subnodes with names overshoot and undershoot to draw the overflow
    and underflow indications. These nodes get the .left, .right, .top or
    .bottom style class added depending on where the indication is drawn.

    [GtkScrolledWindow] also sets the positional style classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling
    (.overlay-indicator, .dragging, .hovering) on its scrollbars.

    If both scrollbars are visible, the area where they meet is drawn with a
    subnode named junction.

    {b Accessibility}

    Until GTK 4.10, [GtkScrolledWindow] used the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GROUP}[Gtk.AccessibleRole.group]}
    role.

    Starting from GTK 4.12, [GtkScrolledWindow] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-GENERIC}[Gtk.AccessibleRole.generic]}
    role.

    The class built on this module is in {!Ocgtk.Scrolled_window}. *)

type t =
  [ `scrolled_window | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_scrolled_window_get_type"

external new_ : unit -> t = "ml_gtk_scrolled_window_new"
(** Creates a new scrolled window. *)

(* Methods *)

external unset_placement : t -> unit = "ml_gtk_scrolled_window_unset_placement"
(** Unsets the placement of the contents with respect to the scrollbars.

    If no window placement is set for a scrolled window, it defaults to
    {{!Ocgtk.Enums.type-cornertype.constructor-TOP_LEFT}[GTK_CORNER_TOP_LEFT]}.
*)

external set_vadjustment : t -> Adjustment.t option -> unit
  = "ml_gtk_scrolled_window_set_vadjustment"
(** Sets the [GtkAdjustment] for the vertical scrollbar. *)

external set_propagate_natural_width : t -> bool -> unit
  = "ml_gtk_scrolled_window_set_propagate_natural_width"
(** Sets whether the natural width of the child should be calculated and
    propagated through the scrolled window’s requested natural width. *)

external set_propagate_natural_height : t -> bool -> unit
  = "ml_gtk_scrolled_window_set_propagate_natural_height"
(** Sets whether the natural height of the child should be calculated and
    propagated through the scrolled window’s requested natural height. *)

external set_policy :
  t -> Ocgtk_enums.policytype -> Ocgtk_enums.policytype -> unit
  = "ml_gtk_scrolled_window_set_policy"
(** Sets the scrollbar policy for the horizontal and vertical scrollbars.

    The policy determines when the scrollbar should appear; it is a value from
    the {{!Ocgtk.Enums.type-policytype}[Gtk.PolicyType]} enumeration. If
    {{!Ocgtk.Enums.type-policytype.constructor-ALWAYS}[GTK_POLICY_ALWAYS]}, the
    scrollbar is always present; if
    {{!Ocgtk.Enums.type-policytype.constructor-NEVER}[GTK_POLICY_NEVER]}, the
    scrollbar is never present; if
    {{!Ocgtk.Enums.type-policytype.constructor-AUTOMATIC}[GTK_POLICY_AUTOMATIC]},
    the scrollbar is present only if needed (that is, if the slider part of the
    bar would be smaller than the trough — the display is larger than the page
    size). *)

external set_placement : t -> Ocgtk_enums.cornertype -> unit
  = "ml_gtk_scrolled_window_set_placement"
(** Sets the placement of the contents with respect to the scrollbars for the
    scrolled window.

    The default is
    {{!Ocgtk.Enums.type-cornertype.constructor-TOP_LEFT}[GTK_CORNER_TOP_LEFT]},
    meaning the child is in the top left, with the scrollbars underneath and to
    the right. Other values in {{!Ocgtk.Enums.type-cornertype}[Gtk.CornerType]}
    are
    {{!Ocgtk.Enums.type-cornertype.constructor-TOP_RIGHT}[GTK_CORNER_TOP_RIGHT]},
    {{!Ocgtk.Enums.type-cornertype.constructor-BOTTOM_LEFT}[GTK_CORNER_BOTTOM_LEFT]},
    and
    {{!Ocgtk.Enums.type-cornertype.constructor-BOTTOM_RIGHT}[GTK_CORNER_BOTTOM_RIGHT]}.

    See also
    {{!Ocgtk.Raw.Scrolled_window.val-get_placement}[Gtk.ScrolledWindow.get_placement]}
    and
    {{!Ocgtk.Raw.Scrolled_window.val-unset_placement}[Gtk.ScrolledWindow.unset_placement]}.
*)

external set_overlay_scrolling : t -> bool -> unit
  = "ml_gtk_scrolled_window_set_overlay_scrolling"
(** Enables or disables overlay scrolling for this scrolled window. *)

external set_min_content_width : t -> int -> unit
  = "ml_gtk_scrolled_window_set_min_content_width"
(** Sets the minimum width that [scrolled_window] should keep visible.

    Note that this can and (usually will) be smaller than the minimum size of
    the content.

    It is a programming error to set the minimum content width to a value
    greater than
    {{!Ocgtk.Raw.Scrolled_window.val-get_max_content_width}[Gtk.ScrolledWindow:max-content-width]}.
*)

external set_min_content_height : t -> int -> unit
  = "ml_gtk_scrolled_window_set_min_content_height"
(** Sets the minimum height that [scrolled_window] should keep visible.

    Note that this can and (usually will) be smaller than the minimum size of
    the content.

    It is a programming error to set the minimum content height to a value
    greater than
    {{!Ocgtk.Raw.Scrolled_window.val-get_max_content_height}[Gtk.ScrolledWindow:max-content-height]}.
*)

external set_max_content_width : t -> int -> unit
  = "ml_gtk_scrolled_window_set_max_content_width"
(** Sets the maximum width that [scrolled_window] should keep visible.

    The [scrolled_window] will grow up to this width before it starts scrolling
    the content.

    It is a programming error to set the maximum content width to a value
    smaller than
    {{!Ocgtk.Raw.Scrolled_window.val-get_min_content_width}[Gtk.ScrolledWindow:min-content-width]}.
*)

external set_max_content_height : t -> int -> unit
  = "ml_gtk_scrolled_window_set_max_content_height"
(** Sets the maximum height that [scrolled_window] should keep visible.

    The [scrolled_window] will grow up to this height before it starts scrolling
    the content.

    It is a programming error to set the maximum content height to a value
    smaller than
    {{!Ocgtk.Raw.Scrolled_window.val-get_min_content_height}[Gtk.ScrolledWindow:min-content-height]}.
*)

external set_kinetic_scrolling : t -> bool -> unit
  = "ml_gtk_scrolled_window_set_kinetic_scrolling"
(** Turns kinetic scrolling on or off.

    Kinetic scrolling only applies to devices with source
    [GDK_SOURCE_TOUCHSCREEN]. *)

external set_has_frame : t -> bool -> unit
  = "ml_gtk_scrolled_window_set_has_frame"
(** Changes the frame drawn around the contents of [scrolled_window]. *)

external set_hadjustment : t -> Adjustment.t option -> unit
  = "ml_gtk_scrolled_window_set_hadjustment"
(** Sets the [GtkAdjustment] for the horizontal scrollbar. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_scrolled_window_set_child"
(** Sets the child widget of [scrolled_window].

    If [child] does not implement the {{!Ocgtk.Raw.Scrollable}[Gtk.Scrollable]}
    interface, the scrolled window will add [child] to a
    {{!Ocgtk.Raw.Viewport}[Gtk.Viewport]} instance and then add the viewport as
    its child widget. *)

external get_vscrollbar :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_scrolled_window_get_vscrollbar"
(** Returns the vertical scrollbar of [scrolled_window]. *)

external get_vadjustment : t -> Adjustment.t
  = "ml_gtk_scrolled_window_get_vadjustment"
(** Returns the vertical scrollbar’s adjustment.

    This is the adjustment used to connect the vertical scrollbar to the child
    widget’s vertical scroll functionality. *)

external get_propagate_natural_width : t -> bool
  = "ml_gtk_scrolled_window_get_propagate_natural_width"
(** Reports whether the natural width of the child will be calculated and
    propagated through the scrolled window’s requested natural width. *)

external get_propagate_natural_height : t -> bool
  = "ml_gtk_scrolled_window_get_propagate_natural_height"
(** Reports whether the natural height of the child will be calculated and
    propagated through the scrolled window’s requested natural height. *)

external get_policy : t -> Ocgtk_enums.policytype * Ocgtk_enums.policytype
  = "ml_gtk_scrolled_window_get_policy"
(** Retrieves the current policy values for the horizontal and vertical
    scrollbars.

    See
    {{!Ocgtk.Raw.Scrolled_window.val-set_policy}[Gtk.ScrolledWindow.set_policy]}.
*)

external get_placement : t -> Ocgtk_enums.cornertype
  = "ml_gtk_scrolled_window_get_placement"
(** Gets the placement of the contents with respect to the scrollbars. *)

external get_overlay_scrolling : t -> bool
  = "ml_gtk_scrolled_window_get_overlay_scrolling"
(** Returns whether overlay scrolling is enabled for this scrolled window. *)

external get_min_content_width : t -> int
  = "ml_gtk_scrolled_window_get_min_content_width"
(** Gets the minimum content width of [scrolled_window]. *)

external get_min_content_height : t -> int
  = "ml_gtk_scrolled_window_get_min_content_height"
(** Gets the minimal content height of [scrolled_window]. *)

external get_max_content_width : t -> int
  = "ml_gtk_scrolled_window_get_max_content_width"
(** Returns the maximum content width set. *)

external get_max_content_height : t -> int
  = "ml_gtk_scrolled_window_get_max_content_height"
(** Returns the maximum content height set. *)

external get_kinetic_scrolling : t -> bool
  = "ml_gtk_scrolled_window_get_kinetic_scrolling"
(** Returns the specified kinetic scrolling behavior. *)

external get_hscrollbar :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_scrolled_window_get_hscrollbar"
(** Returns the horizontal scrollbar of [scrolled_window]. *)

external get_has_frame : t -> bool = "ml_gtk_scrolled_window_get_has_frame"
(** Gets whether the scrolled window draws a frame. *)

external get_hadjustment : t -> Adjustment.t
  = "ml_gtk_scrolled_window_get_hadjustment"
(** Returns the horizontal scrollbar’s adjustment.

    This is the adjustment used to connect the horizontal scrollbar to the child
    widget’s horizontal scroll functionality. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_scrolled_window_get_child"
(** Gets the child widget of [scrolled_window].

    If the scrolled window automatically added a
    {{!Ocgtk.Raw.Viewport}[Gtk.Viewport]}, this function will return the
    viewport widget, and you can retrieve its child using
    {{!Ocgtk.Raw.Viewport.val-get_child}[Gtk.Viewport.get_child]}. *)

(* Properties *)

external get_hscrollbar_policy : t -> Ocgtk_enums.policytype
  = "ml_gtk_scrolled_window_get_hscrollbar_policy"
(** When the horizontal scrollbar is displayed.

    Use
    {{!Ocgtk.Raw.Scrolled_window.val-set_policy}[Gtk.ScrolledWindow.set_policy]}
    to set this property. *)

external set_hscrollbar_policy : t -> Ocgtk_enums.policytype -> unit
  = "ml_gtk_scrolled_window_set_hscrollbar_policy"
(** When the horizontal scrollbar is displayed.

    Use
    {{!Ocgtk.Raw.Scrolled_window.val-set_policy}[Gtk.ScrolledWindow.set_policy]}
    to set this property. *)

external get_vscrollbar_policy : t -> Ocgtk_enums.policytype
  = "ml_gtk_scrolled_window_get_vscrollbar_policy"
(** When the vertical scrollbar is displayed.

    Use
    {{!Ocgtk.Raw.Scrolled_window.val-set_policy}[Gtk.ScrolledWindow.set_policy]}
    to set this property. *)

external set_vscrollbar_policy : t -> Ocgtk_enums.policytype -> unit
  = "ml_gtk_scrolled_window_set_vscrollbar_policy"
(** When the vertical scrollbar is displayed.

    Use
    {{!Ocgtk.Raw.Scrolled_window.val-set_policy}[Gtk.ScrolledWindow.set_policy]}
    to set this property. *)

let on_edge_overshot ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let pos =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Ocgtk_enums.positiontype_of_int (Gobject.Value.get_enum_int v)
        in
        callback ~pos)
  in
  Gobject.Signal.connect obj ~name:"edge-overshot" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_edge_reached ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let pos =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Ocgtk_enums.positiontype_of_int (Gobject.Value.get_enum_int v)
        in
        callback ~pos)
  in
  Gobject.Signal.connect obj ~name:"edge-reached" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_move_focus_out ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let direction_type =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Ocgtk_enums.directiontype_of_int (Gobject.Value.get_enum_int v)
        in
        callback ~direction_type)
  in
  Gobject.Signal.connect obj ~name:"move-focus-out" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_scroll_child ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let scroll =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Ocgtk_enums.scrolltype_of_int (Gobject.Value.get_enum_int v)
        in
        let horizontal =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_boolean v
        in
        let result = callback ~scroll ~horizontal in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"scroll-child" ~callback:closure
    ~after:(Option.value after ~default:false)
