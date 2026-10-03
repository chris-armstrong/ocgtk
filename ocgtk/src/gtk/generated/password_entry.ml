(* GENERATED CODE - DO NOT EDIT *)
(* PasswordEntry: PasswordEntry *)

type t =
  [ `password_entry | `widget | `initially_unowned | `object_ ] Gobject.obj
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

    [GtkPasswordEntry] uses the [Gtk.AccessibleRole.text_box] role. *)

external new_ : unit -> t = "ml_gtk_password_entry_new"
(** Create a new PasswordEntry *)

(* Methods *)

external set_show_peek_icon : t -> bool -> unit
  = "ml_gtk_password_entry_set_show_peek_icon"
(** Sets whether the entry should have a clickable icon to reveal the contents.

    Setting this to [FALSE] also hides the text again. *)

external set_extra_menu :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_password_entry_set_extra_menu"
(** Sets a menu model to add when constructing the context menu for [entry]. *)

external get_show_peek_icon : t -> bool
  = "ml_gtk_password_entry_get_show_peek_icon"
(** Returns whether the entry is showing an icon to reveal the contents. *)

external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_password_entry_get_extra_menu"
(** Gets the menu model set with gtk_password_entry_set_extra_menu(). *)

(* Properties *)

external get_activates_default : t -> bool
  = "ml_gtk_password_entry_get_activates_default"
(** Get property: activates-default *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_password_entry_set_activates_default"
(** Set property: activates-default *)

external get_placeholder_text : t -> string
  = "ml_gtk_password_entry_get_placeholder_text"
(** Get property: placeholder-text *)

external set_placeholder_text : t -> string -> unit
  = "ml_gtk_password_entry_set_placeholder_text"
(** Set property: placeholder-text *)

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)
