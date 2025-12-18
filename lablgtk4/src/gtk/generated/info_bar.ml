(* GENERATED CODE - DO NOT EDIT *)
(* Widget: InfoBar *)

type t = [`info_bar | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new InfoBar *)
external new_ : unit -> t = "ml_gtk_info_bar_new"

(** Create a new InfoBar *)
external new_with_buttons : string option -> unit -> t = "ml_gtk_info_bar_new_with_buttons"

(* Properties *)

(** Get property: revealed *)
external get_revealed : t -> bool = "ml_gtk_info_bar_get_revealed"

(** Set property: revealed *)
external set_revealed : t -> bool -> unit = "ml_gtk_info_bar_set_revealed"

(** Get property: show-close-button *)
external get_show_close_button : t -> bool = "ml_gtk_info_bar_get_show_close_button"

(** Set property: show-close-button *)
external set_show_close_button : t -> bool -> unit = "ml_gtk_info_bar_set_show_close_button"

(** Sets the sensitivity of action widgets for @response_id.

Calls `gtk_widget_set_sensitive (widget, setting)` for each
widget in the info bars’s action area with the given @response_id.
A convenient way to sensitize/desensitize buttons. *)
external set_response_sensitive : t -> int -> bool -> unit = "ml_gtk_info_bar_set_response_sensitive"

(** Sets the message type of the message area.

GTK uses this type to determine how the message is displayed. *)
external set_message_type : t -> Gtk_enums.messagetype -> unit = "ml_gtk_info_bar_set_message_type"

(** Sets the last widget in the info bar’s action area with
the given response_id as the default widget for the dialog.

Pressing “Enter” normally activates the default widget.

Note that this function currently requires @info_bar to
be added to a widget hierarchy. *)
external set_default_response : t -> int -> unit = "ml_gtk_info_bar_set_default_response"

(** Emits the “response” signal with the given @response_id. *)
external response : t -> int -> unit = "ml_gtk_info_bar_response"

(** Removes a widget from the content area of the info bar. *)
external remove_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_info_bar_remove_child"

(** Removes a widget from the action area of @info_bar.

The widget must have been put there by a call to
[method@Gtk.InfoBar.add_action_widget] or [method@Gtk.InfoBar.add_button]. *)
external remove_action_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_info_bar_remove_action_widget"

(** Returns the message type of the message area. *)
external get_message_type : t -> Gtk_enums.messagetype = "ml_gtk_info_bar_get_message_type"

(** Adds a widget to the content area of the info bar. *)
external add_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_info_bar_add_child"

(** Adds a button with the given text.

Clicking the button will emit the [signal@Gtk.InfoBar::response]
signal with the given response_id. The button is appended to the
end of the info bar's action area. The button widget is returned,
but usually you don't need it. *)
external add_button : t -> string -> int -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_info_bar_add_button"

(** Add an activatable widget to the action area of a `GtkInfoBar`.

This also connects a signal handler that will emit the
[signal@Gtk.InfoBar::response] signal on the message area
when the widget is activated. The widget is appended to the
end of the message areas action area. *)
external add_action_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int -> unit = "ml_gtk_info_bar_add_action_widget"

