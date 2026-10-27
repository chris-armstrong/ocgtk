(** A button with a hyperlink.

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

    [GtkLinkButton] uses the [Gtk.AccessibleRole.link] role.

    Its methods, signals and properties are on {!class-type-link_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Link_button}. *)

(** The methods, signals and properties of a [GtkLinkButton]. *)
class type link_button_t = object
  inherit Button.button_t

  method on_activate_link :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method get_uri : unit -> string
  method get_visited : unit -> bool
  method set_uri : string -> unit
  method set_visited : bool -> unit
  method as_link_button : Raw.Link_button.t
end

class link_button : Raw.Link_button.t -> link_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Link_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLinkButton], give one already wrapped. *)

val new_ : string -> link_button_t
val new_with_label : string -> string option -> link_button_t
