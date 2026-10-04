(* GENERATED CODE - DO NOT EDIT *)
(* Popover: Popover *)

[@@@ocaml.text
"Presents a bubble-like popup.\n\n\
 An example GtkPopover\n\n\
 It is primarily meant to provide context-dependent information\n\
 or options. Popovers are attached to a parent widget. The parent widget\n\
 must support popover children, as [Gtk.MenuButton] and\n\
 [Gtk.PopoverMenuBar] do. If you want to make a custom widget that\n\
 has an attached popover, you need to call [Gtk.Popover.present]\n\
 in your [Gtk.Widget.size_allocate] vfunc, in order to update the\n\
 positioning of the popover.\n\n\
 The position of a popover relative to the widget it is attached to\n\
 can also be changed with [Gtk.Popover.set_position]. By default,\n\
 it points to the whole widget area, but it can be made to point to\n\
 a specific area using [Gtk.Popover.set_pointing_to].\n\n\
 By default, [GtkPopover] performs a grab, in order to ensure input\n\
 events get redirected to it while it is shown, and also so the popover\n\
 is dismissed in the expected situations (clicks outside the popover,\n\
 or the Escape key being pressed). If no such modal behavior is desired\n\
 on a popover, [Gtk.Popover.set_autohide] may be called on it to\n\
 tweak its behavior.\n\n\
 {b GtkPopover as menu replacement}\n\n\
 [GtkPopover] is often used to replace menus. The best way to do this\n\
 is to use the [Gtk.PopoverMenu] subclass which supports being\n\
 populated from a [GMenuModel] with [Gtk.PopoverMenu.new_from_model].\n\n\
 {[\n\
 <section>\n\
\  <attribute name=\"display-hint\">horizontal-buttons</attribute>\n\
\  <item>\n\
\    <attribute name=\"label\">Cut</attribute>\n\
\    <attribute name=\"action\">app.cut</attribute>\n\
\    <attribute name=\"verb-icon\">edit-cut-symbolic</attribute>\n\
\  </item>\n\
\  <item>\n\
\    <attribute name=\"label\">Copy</attribute>\n\
\    <attribute name=\"action\">app.copy</attribute>\n\
\    <attribute name=\"verb-icon\">edit-copy-symbolic</attribute>\n\
\  </item>\n\
\  <item>\n\
\    <attribute name=\"label\">Paste</attribute>\n\
\    <attribute name=\"action\">app.paste</attribute>\n\
\    <attribute name=\"verb-icon\">edit-paste-symbolic</attribute>\n\
\  </item>\n\
 </section>\n\
 ]}\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkPopover] supports the following keyboard shortcuts:\n\n\
 - <kbd>Escape</kbd> closes the popover.\n\
 - <kbd>Alt</kbd> makes the mnemonics visible.\n\n\
 The following signals have default keybindings:\n\n\
 - [Gtk.Popover::activate-default]\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 popover.background[.menu]\n\
 ├── arrow\n\
 ╰── contents\n\
\    ╰── <child>\n\
 ]}\n\n\
 [GtkPopover] has a main node with name [popover], an arrow with name [arrow],\n\
 and another node for the content named [contents]. The [popover] node always\n\
 gets the [.background] style class. It also gets the [.menu] style class\n\
 if the popover is menu-like, e.g. is a [Gtk.PopoverMenu].\n\n\
 Particular uses of [GtkPopover], such as touch selection popups or\n\
 magnifiers in [GtkEntry] or [GtkTextView] get style classes like\n\
 [.touch-selection] or [.magnifier] to differentiate from plain popovers.\n\n\
 When styling a popover directly, the [popover] node should usually\n\
 not have any background. The visible part of the popover can have\n\
 a shadow. To specify it in CSS, set the box-shadow of the [contents] node.\n\n\
 Note that, in order to accomplish appropriate arrow visuals, [GtkPopover]\n\
 uses custom drawing for the [arrow] node. This makes it possible for the\n\
 arrow to change its shape dynamically, but it also limits the possibilities\n\
 of styling it using CSS. In particular, the [arrow] gets drawn over the\n\
 [content] node's border and shadow, so they look like one shape, which\n\
 means that the border width of the [content] node and the [arrow] node should\n\
 be the same. The arrow also does not support any border shape other than\n\
 solid, no border-radius, only one border width (border-bottom-width is\n\
 used) and no box-shadow."]

type t = [ `popover | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_popover_new"
(** Create a new Popover *)

(* Methods *)

external set_position : t -> Gtk_enums.positiontype -> unit
  = "ml_gtk_popover_set_position"
(** Sets the preferred position for [popover] to appear.

    If the [popover] is currently visible, it will be immediately updated.

    This preference will be respected where possible, although on lack of space
    (eg. if close to the window edges), the [GtkPopover] may choose to appear on
    the opposite side. *)

external set_pointing_to :
  t -> Ocgtk_gdk.Gdk.Wrappers.Rectangle.t option -> unit
  = "ml_gtk_popover_set_pointing_to"
(** Sets the rectangle that [popover] points to.

    This is in the coordinate space of the [popover] parent. *)

external set_offset : t -> int -> int -> unit = "ml_gtk_popover_set_offset"
(** Sets the offset to use when calculating the position of the popover.

    These values are used when preparing the [Gdk.PopupLayout] for positioning
    the popover. *)

external set_mnemonics_visible : t -> bool -> unit
  = "ml_gtk_popover_set_mnemonics_visible"
(** Sets whether mnemonics should be visible. *)

external set_has_arrow : t -> bool -> unit = "ml_gtk_popover_set_has_arrow"
(** Sets whether this popover should draw an arrow pointing at the widget it is
    relative to. *)

external set_default_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_popover_set_default_widget"
(** Sets the default widget of a [GtkPopover].

    The default widget is the widget that’s activated when the user presses
    Enter in a dialog (for example). This function sets or unsets the default
    widget for a [GtkPopover]. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_popover_set_child"
(** Sets the child widget of [popover]. *)

external set_cascade_popdown : t -> bool -> unit
  = "ml_gtk_popover_set_cascade_popdown"
(** If [cascade_popdown] is [TRUE], the popover will be closed when a child
    modal popover is closed.

    If [FALSE], [popover] will stay visible. *)

external set_autohide : t -> bool -> unit = "ml_gtk_popover_set_autohide"
(** Sets whether [popover] is modal.

    A modal popover will grab the keyboard focus on it when being displayed.
    Focus will wrap around within the popover. Clicking outside the popover area
    or pressing Esc will dismiss the popover.

    Called this function on an already showing popup with a new autohide value
    different from the current one, will cause the popup to be hidden. *)

external present : t -> unit = "ml_gtk_popover_present"
(** Allocate a size for the [GtkPopover].

    This function needs to be called in size-allocate by widgets who have a
    [GtkPopover] as child. When using a layout manager, this is happening
    automatically.

    To make a popover appear on screen, use [Gtk.Popover.popup]. *)

external popup : t -> unit = "ml_gtk_popover_popup"
(** Pops [popover] up. *)

external popdown : t -> unit = "ml_gtk_popover_popdown"
(** Pops [popover] down.

    This may have the side-effect of closing a parent popover as well. See
    [Gtk.Popover:cascade-popdown]. *)

external get_position : t -> Gtk_enums.positiontype
  = "ml_gtk_popover_get_position"
(** Returns the preferred position of [popover]. *)

external get_pointing_to : t -> bool * Ocgtk_gdk.Gdk.Wrappers.Rectangle.t
  = "ml_gtk_popover_get_pointing_to"
(** Gets the rectangle that the popover points to.

    If a rectangle to point to has been set, this function will return [TRUE]
    and fill in [rect] with such rectangle, otherwise it will return [FALSE] and
    fill in [rect] with the parent widget coordinates. *)

external get_offset : t -> int * int = "ml_gtk_popover_get_offset"
(** Gets the offset previous set with [Gtk.Popover.set_offset]. *)

external get_mnemonics_visible : t -> bool
  = "ml_gtk_popover_get_mnemonics_visible"
(** Gets whether mnemonics are visible. *)

external get_has_arrow : t -> bool = "ml_gtk_popover_get_has_arrow"
(** Gets whether this popover is showing an arrow pointing at the widget that it
    is relative to. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_popover_get_child"
(** Gets the child widget of [popover]. *)

external get_cascade_popdown : t -> bool = "ml_gtk_popover_get_cascade_popdown"
(** Returns whether the popover will close after a modal child is closed. *)

external get_autohide : t -> bool = "ml_gtk_popover_get_autohide"
(** Returns whether the popover is modal.

    See [Gtk.Popover.set_autohide] for the implications of this. *)

(* Properties *)

let on_activate_default ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate-default" ~callback
    ~after:(Option.value after ~default:false)

let on_closed ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"closed" ~callback
    ~after:(Option.value after ~default:false)
