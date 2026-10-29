(** Calls a callback function when the button is clicked.

    Its methods, signals and properties are on {!class-type-button_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Button].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Actionable.class-type-actionable_t}Ocgtk.Actionable}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Calls a callback function when the button is clicked.

    An example GtkButton

    The [GtkButton] widget can hold any valid child widget. That is, it can hold
    almost any other standard [GtkWidget]. The most commonly used child is the
    [GtkLabel].

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Button.class-type-button_t.method-on_activate}[Gtk.Button::activate]}

    {b CSS nodes}

    [GtkButton] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an image
    or label, respectively. It may also receive the .flat style class. When
    activating a button via the keyboard, the button will temporarily gain the
    .keyboard-activating style class.

    Other style classes that are commonly used with [GtkButton] include
    .suggested-action and .destructive-action. In special cases, buttons can be
    made round by adding the .circular style class.

    Button-like widgets like
    {{!Ocgtk.Toggle_button.class-type-toggle_button_t}[Gtk.ToggleButton]},
    {{!Ocgtk.Menu_button.class-type-menu_button_t}[Gtk.MenuButton]},
    {{!Ocgtk.Volume_button.class-type-volume_button_t}[Gtk.VolumeButton]},
    {{!Ocgtk.Lock_button.class-type-lock_button_t}[Gtk.LockButton]},
    {{!Ocgtk.Color_button.class-type-color_button_t}[Gtk.ColorButton]} or
    {{!Ocgtk.Font_button.class-type-font_button_t}[Gtk.FontButton]} use style
    classes such as .toggle, .popup, .scale, .lock, .color on the button node to
    differentiate themselves from a plain [GtkButton].

    {b Accessibility}

    [GtkButton] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-BUTTON}[Gtk.AccessibleRole.button]}
    role. *)
class type button_t = object
  inherit Widget.widget_t
  inherit Actionable.actionable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to animate press then release.

      This is an action signal. Applications should never connect to this
      signal, but use the [Gtk.Button::clicked] signal.

      The default bindings for this signal are all forms of the <kbd>␣</kbd> and
      <kbd>Enter</kbd> keys. *)

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the button has been activated (pressed and released). *)

  (** {2:methods Methods} *)

  method get_can_shrink : unit -> bool
  (** Retrieves whether the button can be smaller than the natural size of its
      contents. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [button]. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_icon_name : unit -> string option
  (** Returns the icon name of the button.

      If the icon name has not been set with [Gtk.Button.set_icon_name] the
      return value will be [None]. This will be the case if you create an empty
      button with [Gtk.Button.new] to use as a container. *)

  method get_label : unit -> string option
  (** Fetches the text from the label of the button.

      If the label text has not been set with [Gtk.Button.set_label] the return
      value will be [None]. This will be the case if you create an empty button
      with [Gtk.Button.new] to use as a container. *)

  method get_use_underline : unit -> bool
  (** gets whether underlines are interpreted as mnemonics.

      See [Gtk.Button.set_use_underline]. *)

  method set_can_shrink : bool -> unit
  (** Sets whether the button size can be smaller than the natural size of its
      contents.

      For text buttons, setting [can_shrink] to true will ellipsize the label.

      For icons and custom children, this function has no effect. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [button].

      Note that by using this API, you take full responsibility for setting up
      the proper accessibility label and description information for [button].
      Most likely, you'll either set the accessibility label or description for
      [button] explicitly, or you'll set a labelled-by or described-by relations
      from [child] to [button]. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button.

      Buttons can have a flat appearance or have a frame drawn around them. *)

  method set_icon_name : string -> unit
  (** Adds a [GtkImage] with the given icon name as a child.

      If [button] already contains a child widget, that child widget will be
      removed and replaced with the image. *)

  method set_label : string -> unit
  (** Sets the text of the label of the button to [label].

      This will also clear any previously set labels. *)

  method set_use_underline : bool -> unit
  (** Sets whether to use underlines as mnemonics.

      If true, an underline in the text of the button label indicates the next
      character should be used for the mnemonic accelerator key. *)

  (** {2:conversions Conversions} *)

  method as_button : Raw.Button.t
end

class button : Raw.Button.t -> button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Button.t}. *)

(** {1:description Description}

    Calls a callback function when the button is clicked.

    An example GtkButton

    The [GtkButton] widget can hold any valid child widget. That is, it can hold
    almost any other standard [GtkWidget]. The most commonly used child is the
    [GtkLabel].

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Button.class-type-button_t.method-on_activate}[Gtk.Button::activate]}

    {b CSS nodes}

    [GtkButton] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an image
    or label, respectively. It may also receive the .flat style class. When
    activating a button via the keyboard, the button will temporarily gain the
    .keyboard-activating style class.

    Other style classes that are commonly used with [GtkButton] include
    .suggested-action and .destructive-action. In special cases, buttons can be
    made round by adding the .circular style class.

    Button-like widgets like
    {{!Ocgtk.Toggle_button.class-type-toggle_button_t}[Gtk.ToggleButton]},
    {{!Ocgtk.Menu_button.class-type-menu_button_t}[Gtk.MenuButton]},
    {{!Ocgtk.Volume_button.class-type-volume_button_t}[Gtk.VolumeButton]},
    {{!Ocgtk.Lock_button.class-type-lock_button_t}[Gtk.LockButton]},
    {{!Ocgtk.Color_button.class-type-color_button_t}[Gtk.ColorButton]} or
    {{!Ocgtk.Font_button.class-type-font_button_t}[Gtk.FontButton]} use style
    classes such as .toggle, .popup, .scale, .lock, .color on the button node to
    differentiate themselves from a plain [GtkButton].

    {b Accessibility}

    [GtkButton] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-BUTTON}[Gtk.AccessibleRole.button]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : unit -> button_t
(** Creates a new [GtkButton] widget.

    To add a child widget to the button, use
    {{!Ocgtk.Button.class-type-button_t.method-set_child}[Gtk.Button.set_child]}.
*)

val new_from_icon_name : string -> button_t
(** Creates a new button containing an icon from the current icon theme.

    If the icon name isn’t known, a “broken image” icon will be displayed
    instead. If the current icon theme is changed, the icon will be updated
    appropriately. *)

val new_with_label : string -> button_t
(** Creates a [GtkButton] widget with a [GtkLabel] child. *)

val new_with_mnemonic : string -> button_t
(** Creates a new [GtkButton] containing a label.

    If characters in [label] are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use “__” (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic. Pressing <kbd>Alt</kbd> and that key
    activates the button. *)
