(** A single-line text entry widget for entering passwords and other secrets.

    Its methods, signals and properties are on {!class-type-password_entry_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Password_entry}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PasswordEntry].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Editable.class-type-editable_t}Ocgtk.Editable}

    A single-line text entry widget for entering passwords and other secrets.

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

    [GtkPasswordEntry] uses the [Gtk.AccessibleRole.text_box] role. *)
class type password_entry_t = object
  inherit Widget.widget_t
  inherit Editable.editable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the entry is activated.

      The keybindings for this signal are all forms of the Enter key. *)

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method activates_default : bool
  (** Whether to activate the default widget when Enter is pressed. *)

  method set_activates_default : bool -> unit
  (** Whether to activate the default widget when Enter is pressed. *)

  method placeholder_text : string
  (** The text that will be displayed in the [GtkPasswordEntry] when it is empty
      and unfocused. *)

  method set_placeholder_text : string -> unit
  (** The text that will be displayed in the [GtkPasswordEntry] when it is empty
      and unfocused. *)

  (** {2:conversions Conversions} *)

  method as_password_entry : Raw.Password_entry.t
end

class password_entry : Raw.Password_entry.t -> password_entry_t
(** Wraps a raw handle of {!Ocgtk.Raw.Password_entry.t}. *)

(** {1:description Description}

    A single-line text entry widget for entering passwords and other secrets.

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

    [GtkPasswordEntry] uses the [Gtk.AccessibleRole.text_box] role. *)

(** {1:constructors Constructors} *)

val new_ : unit -> password_entry_t
(** Creates a [GtkPasswordEntry]. *)
