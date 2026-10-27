(** Asynchronous API to present a color chooser dialog.

    [GtkColorDialog] collects the arguments that are needed to present the
    dialog to the user, such as a title for the dialog and whether it should be
    modal.

    The dialog is shown with the [Gtk.ColorDialog.choose_rgba] function.

    See [Gtk.ColorDialogButton] for a convenient control that uses
    [GtkColorDialog] and presents the results.

    Its methods, signals and properties are on {!class-type-color_dialog_t}. The
    functions it is built on are in {!Ocgtk.Raw.Color_dialog}. *)

(** The methods, signals and properties of a [GtkColorDialog]. *)
class type color_dialog_t = object
  method choose_rgba_finish :
    Ocgio.Async_result.async_result_t -> (Ocgdk.Rgb_a.rgb_a_t, GError.t) result

  method get_modal : unit -> bool
  method get_title : unit -> string
  method get_with_alpha : unit -> bool
  method set_modal : bool -> unit
  method set_title : string -> unit
  method set_with_alpha : bool -> unit
  method as_color_dialog : Raw.Color_dialog.t
end

class color_dialog : Raw.Color_dialog.t -> color_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkColorDialog], give one already wrapped. *)

val new_ : unit -> color_dialog_t
