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
 used) and no box-shadow.\n\n\
 Its methods, signals and properties are on {!class-type-popover_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Popover}."]

(** The methods, signals and properties of a [GtkPopover]. *)
class type popover_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t
  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_autohide : unit -> bool
  method get_cascade_popdown : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_arrow : unit -> bool
  method get_mnemonics_visible : unit -> bool
  method get_position : unit -> Enums.positiontype
  method popdown : unit -> unit
  method popup : unit -> unit
  method present : unit -> unit
  method set_autohide : bool -> unit
  method set_cascade_popdown : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_arrow : bool -> unit
  method set_mnemonics_visible : bool -> unit
  method set_offset : int -> int -> unit
  method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit
  method set_position : Enums.positiontype -> unit
  method as_popover : Raw.Popover.t
end

class popover : Raw.Popover.t -> popover_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Popover.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPopover], give one already wrapped. *)

val new_ : unit -> popover_t
