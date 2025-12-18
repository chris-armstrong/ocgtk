(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MessageDialog *)

type t = [`message_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new MessageDialog *)
external new_ : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_bytecode" "ml_gtk_message_dialog_new_native"

(** Create a new MessageDialog *)
external new_with_markup : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> Gtk_enums.messagetype -> Gtk_enums.buttonstype -> string option -> unit -> t = "ml_gtk_message_dialog_new_with_markup_bytecode" "ml_gtk_message_dialog_new_with_markup_native"

(* Properties *)

(** Get property: secondary-text *)
external get_secondary_text : t -> string = "ml_gtk_message_dialog_get_secondary_text"

(** Set property: secondary-text *)
external set_secondary_text : t -> string -> unit = "ml_gtk_message_dialog_set_secondary_text"

(** Get property: secondary-use-markup *)
external get_secondary_use_markup : t -> bool = "ml_gtk_message_dialog_get_secondary_use_markup"

(** Set property: secondary-use-markup *)
external set_secondary_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_secondary_use_markup"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_message_dialog_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_message_dialog_set_text"

(** Get property: use-markup *)
external get_use_markup : t -> bool = "ml_gtk_message_dialog_get_use_markup"

(** Set property: use-markup *)
external set_use_markup : t -> bool -> unit = "ml_gtk_message_dialog_set_use_markup"

(** Sets the text of the message dialog. *)
external set_markup : t -> string -> unit = "ml_gtk_message_dialog_set_markup"

(** Returns the message area of the dialog.

This is the box where the dialog’s primary and secondary labels
are packed. You can add your own extra content to that box and it
will appear below those labels. See [method@Gtk.Dialog.get_content_area]
for the corresponding function in the parent [class@Gtk.Dialog]. *)
external get_message_area : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_message_dialog_get_message_area"

