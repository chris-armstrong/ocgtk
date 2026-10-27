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
    a reference until you are done with the object.

    Its methods, signals and properties are on {!class-type-native_dialog_t}.
    The functions it is built on are in {!Ocgtk.Raw.Native_dialog}. *)

(** The methods, signals and properties of a [GtkNativeDialog]. *)
class type native_dialog_t = object
  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method destroy : unit -> unit
  (** Destroys a dialog.

      When a dialog is destroyed, it will break any references it holds to other
      objects.

      If it is visible it will be hidden and any underlying window system
      resources will be destroyed.

      Note that this does not release any reference to the object (as opposed to
      destroying a [GtkWindow]) because there is no reference from the windowing
      system to the [GtkNativeDialog]. *)

  method get_modal : unit -> bool
  (** Returns whether the dialog is modal. *)

  method get_title : unit -> string option
  (** Gets the title of the [GtkNativeDialog]. *)

  method get_transient_for :
    unit -> Application_and__window_and__window_group.window_t option
  (** Fetches the transient parent for this window. *)

  method get_visible : unit -> bool
  (** Determines whether the dialog is visible. *)

  method hide : unit -> unit
  (** Hides the dialog if it is visible, aborting any interaction.

      Once this is called the [Gtk.NativeDialog::response] signal will {i not}
      be emitted until after the next call to [Gtk.NativeDialog.show].

      If the dialog is not visible this does nothing. *)

  method set_modal : bool -> unit
  (** Sets a dialog modal or non-modal.

      Modal dialogs prevent interaction with other windows in the same
      application. To keep modal dialogs on top of main application windows, use
      [Gtk.NativeDialog.set_transient_for] to make the dialog transient for the
      parent; most window managers will then disallow lowering the dialog below
      the parent. *)

  method set_title : string -> unit
  (** Sets the title of the [GtkNativeDialog.] *)

  method set_transient_for :
    Application_and__window_and__window_group.window_t option -> unit
  (** Dialog windows should be set transient for the main application window
      they were spawned from.

      This allows window managers to e.g. keep the dialog on top of the main
      window, or center the dialog over the main window.

      Passing [NULL] for [parent] unsets the current transient window. *)

  method show : unit -> unit
  (** Shows the dialog on the display.

      When the user accepts the state of the dialog the dialog will be
      automatically hidden and the [Gtk.NativeDialog::response] signal will be
      emitted.

      Multiple calls while the dialog is visible will be ignored. *)

  method as_native_dialog : Raw.Native_dialog.t
end

class native_dialog : Raw.Native_dialog.t -> native_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Native_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNativeDialog], give one already wrapped. *)
