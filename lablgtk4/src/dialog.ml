(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Dialog *)

type t = [`dialog | `window | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Dialog *)
external new_ : unit -> t = "ml_gtk_dialog_new"

(** Create a new Dialog *)
external new_with_buttons : string option -> Gtk.widget option -> Gtk_enums.dialogflags -> string option -> unit -> t = "ml_gtk_dialog_new_with_buttons"

(* Properties *)

(** A convenient way to sensitize/desensitize dialog buttons.

Calls `gtk_widget_set_sensitive (widget, @setting)`
for each widget in the dialog’s action area with the given @response_id. *)
external set_response_sensitive : t -> int -> bool -> unit = "ml_gtk_dialog_set_response_sensitive"

(** Sets the default widget for the dialog based on the response ID.

Pressing “Enter” normally activates the default widget. *)
external set_default_response : t -> int -> unit = "ml_gtk_dialog_set_default_response"

(** Emits the ::response signal with the given response ID.

Used to indicate that the user has responded to the dialog in some way. *)
external response : t -> int -> unit = "ml_gtk_dialog_response"

(** Gets the widget button that uses the given response ID in the action area
of a dialog. *)
external get_widget_for_response : t -> int -> Gtk.widget option = "ml_gtk_dialog_get_widget_for_response"

(** Gets the response id of a widget in the action area
of a dialog. *)
external get_response_for_widget : t -> Gtk.widget -> int = "ml_gtk_dialog_get_response_for_widget"

(** Returns the header bar of @dialog.

Note that the headerbar is only used by the dialog if the
[property@Gtk.Dialog:use-header-bar] property is %TRUE. *)
external get_header_bar : t -> Gtk.widget = "ml_gtk_dialog_get_header_bar"

(** Returns the content area of @dialog. *)
external get_content_area : t -> Gtk.widget = "ml_gtk_dialog_get_content_area"

(** Adds a button with the given text.

GTK arranges things so that clicking the button will emit the
[signal@Gtk.Dialog::response] signal with the given @response_id.
The button is appended to the end of the dialog’s action area.
The button widget is returned, but usually you don’t need it. *)
external add_button : t -> string -> int -> Gtk.widget = "ml_gtk_dialog_add_button"

(** Adds an activatable widget to the action area of a `GtkDialog`.

GTK connects a signal handler that will emit the
[signal@Gtk.Dialog::response] signal on the dialog when the widget
is activated. The widget is appended to the end of the dialog’s action
area.

If you want to add a non-activatable widget, simply pack it into
the @action_area field of the `GtkDialog` struct. *)
external add_action_widget : t -> Gtk.widget -> int -> unit = "ml_gtk_dialog_add_action_widget"

