(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MessageDialog *)

type t = [`message_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new MessageDialog *)
external new_ : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_bytecode" "ml_gtk_message_dialog_new_native"

(** Create a new MessageDialog *)
external new_with_markup : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_with_markup_bytecode" "ml_gtk_message_dialog_new_with_markup_native"

(* Properties *)

(** Sets the text of the message dialog. *)
external set_markup : t -> string -> unit = "ml_gtk_message_dialog_set_markup"

(** Returns the message area of the dialog.

This is the box where the dialog’s primary and secondary labels
are packed. You can add your own extra content to that box and it
will appear below those labels. See [method@Gtk.Dialog.get_content_area]
for the corresponding function in the parent [class@Gtk.Dialog]. *)
external get_message_area : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_message_dialog_get_message_area"

