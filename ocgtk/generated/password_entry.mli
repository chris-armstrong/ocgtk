(** A single-line text entry widget for entering passwords and other secrets.

    An example GtkPasswordEntry

    It does not show its contents in clear text, does not allow to copy it to
    the clipboard, and it shows a warning when Caps Lock is engaged. If the
    underlying platform allows it, [GtkPasswordEntry] will also place the text
    in a non-pageable memory area, to avoid it being written out to disk by the
    operating system.

    Optionally, it can offer a way to reveal the contents in clear text.

    [GtkPasswordEntry] provides only minimal API and should be used with the
    [Gtk.Editable] API.

    {b CSS Nodes}

    {[
    entry.password
    ╰── text
        ├── image.caps-lock-indicator
        ┊
    ]}

    [GtkPasswordEntry] has a single CSS node with name entry that carries a
    .passwordstyle class. The text Css node below it has a child with name image
    and style class .caps-lock-indicator for the Caps Lock icon, and possibly
    other children.

    {b Accessibility}

    [GtkPasswordEntry] uses the [Gtk.AccessibleRole.text_box] role.

    Its methods, signals and properties are on {!class-type-password_entry_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Password_entry}. *)

(** The methods, signals and properties of a [GtkPasswordEntry]. *)
class type password_entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the entry is activated.

      The keybindings for this signal are all forms of the Enter key. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the menu model set with gtk_password_entry_set_extra_menu(). *)

  method get_show_peek_icon : unit -> bool
  (** Returns whether the entry is showing an icon to reveal the contents. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add when constructing the context menu for [entry].
  *)

  method set_show_peek_icon : bool -> unit
  (** Sets whether the entry should have a clickable icon to reveal the
      contents.

      Setting this to [FALSE] also hides the text again. *)

  method activates_default : bool
  method set_activates_default : bool -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method as_password_entry : Raw.Password_entry.t
end

class password_entry : Raw.Password_entry.t -> password_entry_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Password_entry.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkPasswordEntry], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> password_entry_t
(** Creates a [GtkPasswordEntry]. *)
