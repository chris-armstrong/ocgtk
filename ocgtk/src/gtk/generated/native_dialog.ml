(* GENERATED CODE - DO NOT EDIT *)
(* NativeDialog: NativeDialog *)

(** Base class for platform dialogs that don't use [GtkDialog].

    Native dialogs are used in order to integrate better with a platform, by
    looking the same as other native applications and supporting platform
    specific features.

    The [Gtk.Dialog] functions cannot be used on such objects, but we need a
    similar API in order to drive them. The [GtkNativeDialog] object is an API
    that allows you to do this. It allows you to set various common properties
    on the dialog, as well as show and hide it and get a
    [Gtk.NativeDialog::response] signal when the user finished with the dialog.

    Note that unlike [GtkDialog], [GtkNativeDialog] objects are not toplevel
    widgets, and GTK does not keep them alive. It is your responsibility to keep
    a reference until you are done with the object. *)

type t = [ `native_dialog | `object_ ] Gobject.obj

(* Methods *)

external show : t -> unit = "ml_gtk_native_dialog_show"
(** Shows the dialog on the display.

    When the user accepts the state of the dialog the dialog will be
    automatically hidden and the [Gtk.NativeDialog::response] signal will be
    emitted.

    Multiple calls while the dialog is visible will be ignored. *)

external set_transient_for :
  t -> Application_and__window_and__window_group.Window.t option -> unit
  = "ml_gtk_native_dialog_set_transient_for"
(** Dialog windows should be set transient for the main application window they
    were spawned from.

    This allows window managers to e.g. keep the dialog on top of the main
    window, or center the dialog over the main window.

    Passing [NULL] for [parent] unsets the current transient window. *)

external set_title : t -> string -> unit = "ml_gtk_native_dialog_set_title"
(** Sets the title of the [GtkNativeDialog.] *)

external set_modal : t -> bool -> unit = "ml_gtk_native_dialog_set_modal"
(** Sets a dialog modal or non-modal.

    Modal dialogs prevent interaction with other windows in the same
    application. To keep modal dialogs on top of main application windows, use
    [Gtk.NativeDialog.set_transient_for] to make the dialog transient for the
    parent; most window managers will then disallow lowering the dialog below
    the parent. *)

external hide : t -> unit = "ml_gtk_native_dialog_hide"
(** Hides the dialog if it is visible, aborting any interaction.

    Once this is called the [Gtk.NativeDialog::response] signal will {i not} be
    emitted until after the next call to [Gtk.NativeDialog.show].

    If the dialog is not visible this does nothing. *)

external get_visible : t -> bool = "ml_gtk_native_dialog_get_visible"
(** Determines whether the dialog is visible. *)

external get_transient_for :
  t -> Application_and__window_and__window_group.Window.t option
  = "ml_gtk_native_dialog_get_transient_for"
(** Fetches the transient parent for this window. *)

external get_title : t -> string option = "ml_gtk_native_dialog_get_title"
(** Gets the title of the [GtkNativeDialog]. *)

external get_modal : t -> bool = "ml_gtk_native_dialog_get_modal"
(** Returns whether the dialog is modal. *)

external destroy : t -> unit = "ml_gtk_native_dialog_destroy"
(** Destroys a dialog.

    When a dialog is destroyed, it will break any references it holds to other
    objects.

    If it is visible it will be hidden and any underlying window system
    resources will be destroyed.

    Note that this does not release any reference to the object (as opposed to
    destroying a [GtkWindow]) because there is no reference from the windowing
    system to the [GtkNativeDialog]. *)

(* Properties *)

let on_response ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let response_id =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        callback ~response_id)
  in
  Gobject.Signal.connect obj ~name:"response" ~callback:closure
    ~after:(Option.value after ~default:false)
