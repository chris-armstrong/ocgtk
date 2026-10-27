(** Asynchronous API to present a font chooser dialog.

    [GtkFontDialog] collects the arguments that are needed to present the dialog
    to the user, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.FontDialog.choose_font] function or its
    variants.

    See [Gtk.FontDialogButton] for a convenient control that uses
    [GtkFontDialog] and presents the results.

    Its methods, signals and properties are on {!class-type-font_dialog_t}. The
    functions it is built on are in {!Ocgtk.Raw.Font_dialog}. *)

(** The methods, signals and properties of a [GtkFontDialog]. *)
class type font_dialog_t = object
  method choose_face_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_face.font_face_t, GError.t) result

  method choose_family_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_family.font_family_t, GError.t) result

  method choose_font_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_description.font_description_t, GError.t) result

  method get_filter : unit -> Filter.filter_t option
  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  method get_language : unit -> Ocpango.Language.language_t option
  method get_modal : unit -> bool
  method get_title : unit -> string
  method set_filter : Filter.filter_t option -> unit
  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  method set_language : Ocpango.Language.language_t -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit
  method as_font_dialog : Raw.Font_dialog.t
end

class font_dialog : Raw.Font_dialog.t -> font_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Font_dialog.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFontDialog], give one already wrapped. *)

val new_ : unit -> font_dialog_t
