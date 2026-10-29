class type native_dialog_t = object
  (** {2:signals Signals} *)

  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user responds to the dialog.

      When this is called the dialog has been hidden.

      If you call [Gtk.NativeDialog.hide] before the user responds to the dialog
      this signal will not be emitted. *)

  (** {2:methods Methods} *)

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

  method get_transient_for : unit -> Window.window_t option
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

  method set_transient_for : Window.window_t option -> unit
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

  (** {2:conversions Conversions} *)

  method as_native_dialog : Raw.Native_dialog.t
end

(* High-level class for NativeDialog *)
class native_dialog (obj : Raw.Native_dialog.t) : native_dialog_t =
  object (self)
    method on_response ?(after = false) ~callback () =
      Raw.Native_dialog.on_response ~after self#as_native_dialog ~callback

    method destroy : unit -> unit = fun () -> Raw.Native_dialog.destroy obj
    method get_modal : unit -> bool = fun () -> Raw.Native_dialog.get_modal obj

    method get_title : unit -> string option =
      fun () -> Raw.Native_dialog.get_title obj

    method get_transient_for : unit -> Window.window_t option =
      fun () ->
        Option.map
          (fun ret -> new Window.window ret)
          (Raw.Native_dialog.get_transient_for obj)

    method get_visible : unit -> bool =
      fun () -> Raw.Native_dialog.get_visible obj

    method hide : unit -> unit = fun () -> Raw.Native_dialog.hide obj

    method set_modal : bool -> unit =
      fun modal -> Raw.Native_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Native_dialog.set_title obj title

    method set_transient_for : Window.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Native_dialog.set_transient_for obj parent

    method show : unit -> unit = fun () -> Raw.Native_dialog.show obj
    method as_native_dialog = obj
  end
