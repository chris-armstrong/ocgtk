(* GENERATED CODE - DO NOT EDIT *)
(* NativeDialog: NativeDialog *)

type t = [`native_dialog | `object_] Gobject.obj

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_native_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_native_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_native_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_native_dialog_set_title"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_native_dialog_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_native_dialog_set_visible"

(** Shows the dialog on the display.

When the user accepts the state of the dialog the dialog will
be automatically hidden and the [signal@Gtk.NativeDialog::response]
signal will be emitted.

Multiple calls while the dialog is visible will be ignored. *)
external show : t -> unit = "ml_gtk_native_dialog_show"

(** Dialog windows should be set transient for the main application
window they were spawned from.

This allows window managers to e.g. keep the dialog on top of the
main window, or center the dialog over the main window.

Passing %NULL for @parent unsets the current transient window. *)
external set_transient_for : t -> Application_and__window_and__window_group.Window.t option -> unit = "ml_gtk_native_dialog_set_transient_for"

(** Hides the dialog if it is visible, aborting any interaction.

Once this is called the [signal@Gtk.NativeDialog::response] signal
will *not* be emitted until after the next call to
[method@Gtk.NativeDialog.show].

If the dialog is not visible this does nothing. *)
external hide : t -> unit = "ml_gtk_native_dialog_hide"

(** Fetches the transient parent for this window. *)
external get_transient_for : t -> Application_and__window_and__window_group.Window.t option = "ml_gtk_native_dialog_get_transient_for"

(** Destroys a dialog.

When a dialog is destroyed, it will break any references it holds
to other objects.

If it is visible it will be hidden and any underlying window system
resources will be destroyed.

Note that this does not release any reference to the object (as opposed
to destroying a `GtkWindow`) because there is no reference from the
windowing system to the `GtkNativeDialog`. *)
external destroy : t -> unit = "ml_gtk_native_dialog_destroy"

