(** Calls a callback function when the button is clicked.

    An example GtkButton

    The [GtkButton] widget can hold any valid child widget. That is, it can hold
    almost any other standard [GtkWidget]. The most commonly used child is the
    [GtkLabel].

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.Button::activate]

    {b CSS nodes}

    [GtkButton] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an image
    or label, respectively. It may also receive the .flat style class. When
    activating a button via the keyboard, the button will temporarily gain the
    .keyboard-activating style class.

    Other style classes that are commonly used with [GtkButton] include
    .suggested-action and .destructive-action. In special cases, buttons can be
    made round by adding the .circular style class.

    Button-like widgets like [Gtk.ToggleButton], [Gtk.MenuButton],
    [Gtk.VolumeButton], [Gtk.LockButton], [Gtk.ColorButton] or [Gtk.FontButton]
    use style classes such as .toggle, .popup, .scale, .lock, .color on the
    button node to differentiate themselves from a plain [GtkButton].

    {b Accessibility}

    [GtkButton] uses the [Gtk.AccessibleRole.button] role.

    Its methods, signals and properties are on {!class-type-button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Button}. *)

(** The methods, signals and properties of a [GtkButton]. *)
class type button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_use_underline : unit -> bool
  method set_can_shrink : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_use_underline : bool -> unit
  method as_button : Raw.Button.t
end

class button : Raw.Button.t -> button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Button.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkButton], give one already wrapped. *)

val new_ : unit -> button_t
val new_from_icon_name : string -> button_t
val new_with_label : string -> button_t
val new_with_mnemonic : string -> button_t
