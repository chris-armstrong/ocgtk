(* GENERATED CODE - DO NOT EDIT *)
(* LinkButton: LinkButton *)

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

    The class built on this module is in {!Ocgtk.Link_button}. *)

type t =
  [ `link_button | `button | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_link_button_get_type"

external new_ : string -> t = "ml_gtk_link_button_new"
(** Creates a new [GtkLinkButton] with the URI as its text. *)

external new_with_label : string -> string option -> t
  = "ml_gtk_link_button_new_with_label"
(** Creates a new [GtkLinkButton] containing a label. *)

(* Methods *)

external set_visited : t -> bool -> unit = "ml_gtk_link_button_set_visited"
(** Sets the “visited” state of the [GtkLinkButton].

    See [Gtk.LinkButton.get_visited] for more details. *)

external set_uri : t -> string -> unit = "ml_gtk_link_button_set_uri"
(** Sets [uri] as the URI where the [GtkLinkButton] points.

    As a side-effect this unsets the “visited” state of the button. *)

external get_visited : t -> bool = "ml_gtk_link_button_get_visited"
(** Retrieves the “visited” state of the [GtkLinkButton].

    The button becomes visited when it is clicked. If the URI is changed on the
    button, the “visited” state is unset again.

    The state may also be changed using [Gtk.LinkButton.set_visited]. *)

external get_uri : t -> string = "ml_gtk_link_button_get_uri"
(** Retrieves the URI of the [GtkLinkButton]. *)

(* Properties *)

val on_activate_link :
  ?after:bool -> t -> callback:(unit -> bool) -> Gobject.Signal.handler_id
(** Emitted each time the [GtkLinkButton] is clicked.

    The default handler will call [Gtk.FileLauncher.launch] with the URI stored
    inside the [Gtk.LinkButton:uri] property.

    To override the default behavior, you can connect to the ::activate-link
    signal and stop the propagation of the signal by returning [TRUE] from your
    handler. *)
