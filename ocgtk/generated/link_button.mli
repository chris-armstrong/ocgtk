(** A button with a hyperlink.

    Its methods, signals and properties are on {!class-type-link_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Link_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LinkButton].}

    A button with a hyperlink.

    An example GtkLinkButton

    It is useful to show quick links to resources.

    A link button is created by calling either [Gtk.LinkButton.new] or
    [Gtk.LinkButton.new_with_label]. If using the former, the URI you pass to
    the constructor is used as a label for the widget.

    The URI bound to a [GtkLinkButton] can be set specifically using
    [Gtk.LinkButton.set_uri].

    By default, [GtkLinkButton] calls [Gtk.FileLauncher.launch] when the button
    is clicked. This behaviour can be overridden by connecting to the
    [Gtk.LinkButton::activate-link] signal and returning [TRUE] from the signal
    handler.

    {b Shortcuts and Gestures}

    [GtkLinkButton] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    {b Actions}

    [GtkLinkButton] defines a set of built-in actions:

    - [clipboard.copy] copies the url to the clipboard.
    - [menu.popup] opens the context menu.

    {b CSS nodes}

    [GtkLinkButton] has a single CSS node with name button. To differentiate it
    from a plain [GtkButton], it gets the .link style class.

    {b Accessibility}

    [GtkLinkButton] uses the [Gtk.AccessibleRole.link] role. *)
class type link_button_t = object
  inherit Button.button_t

  (** {2:signals Signals} *)

  method on_activate_link :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted each time the [GtkLinkButton] is clicked.

      The default handler will call [Gtk.FileLauncher.launch] with the URI
      stored inside the [Gtk.LinkButton:uri] property.

      To override the default behavior, you can connect to the ::activate-link
      signal and stop the propagation of the signal by returning [TRUE] from
      your handler. *)

  (** {2:methods Methods} *)

  method get_uri : unit -> string
  (** Retrieves the URI of the [GtkLinkButton]. *)

  method get_visited : unit -> bool
  (** Retrieves the “visited” state of the [GtkLinkButton].

      The button becomes visited when it is clicked. If the URI is changed on
      the button, the “visited” state is unset again.

      The state may also be changed using [Gtk.LinkButton.set_visited]. *)

  method set_uri : string -> unit
  (** Sets [uri] as the URI where the [GtkLinkButton] points.

      As a side-effect this unsets the “visited” state of the button. *)

  method set_visited : bool -> unit
  (** Sets the “visited” state of the [GtkLinkButton].

      See [Gtk.LinkButton.get_visited] for more details. *)

  (** {2:conversions Conversions} *)

  method as_link_button : Raw.Link_button.t
end

class link_button : Raw.Link_button.t -> link_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Link_button.t}. *)

(** {1:description Description}

    A button with a hyperlink.

    An example GtkLinkButton

    It is useful to show quick links to resources.

    A link button is created by calling either [Gtk.LinkButton.new] or
    [Gtk.LinkButton.new_with_label]. If using the former, the URI you pass to
    the constructor is used as a label for the widget.

    The URI bound to a [GtkLinkButton] can be set specifically using
    [Gtk.LinkButton.set_uri].

    By default, [GtkLinkButton] calls [Gtk.FileLauncher.launch] when the button
    is clicked. This behaviour can be overridden by connecting to the
    [Gtk.LinkButton::activate-link] signal and returning [TRUE] from the signal
    handler.

    {b Shortcuts and Gestures}

    [GtkLinkButton] supports the following keyboard shortcuts:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.

    {b Actions}

    [GtkLinkButton] defines a set of built-in actions:

    - [clipboard.copy] copies the url to the clipboard.
    - [menu.popup] opens the context menu.

    {b CSS nodes}

    [GtkLinkButton] has a single CSS node with name button. To differentiate it
    from a plain [GtkButton], it gets the .link style class.

    {b Accessibility}

    [GtkLinkButton] uses the [Gtk.AccessibleRole.link] role. *)

(** {1:constructors Constructors} *)

val new_ : string -> link_button_t
(** Creates a new [GtkLinkButton] with the URI as its text. *)

val new_with_label : string -> string option -> link_button_t
(** Creates a new [GtkLinkButton] containing a label. *)
