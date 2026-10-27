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
  method get_modal : unit -> bool
  method get_title : unit -> string option

  method get_transient_for :
    unit -> Application_and__window_and__window_group.window_t option

  method get_visible : unit -> bool
  method hide : unit -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit

  method set_transient_for :
    Application_and__window_and__window_group.window_t option -> unit

  method show : unit -> unit
  method as_native_dialog : Raw.Native_dialog.t
end

class native_dialog : Raw.Native_dialog.t -> native_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Native_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNativeDialog], give one already wrapped. *)
