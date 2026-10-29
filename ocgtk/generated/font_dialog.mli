(** Asynchronous API to present a font chooser dialog.

    Its methods, signals and properties are on {!class-type-font_dialog_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Font_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontDialog].}

    Asynchronous API to present a font chooser dialog.

    [GtkFontDialog] collects the arguments that are needed to present the dialog
    to the user, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.FontDialog.choose_font] function or its
    variants.

    See [Gtk.FontDialogButton] for a convenient control that uses
    [GtkFontDialog] and presents the results. *)
class type font_dialog_t = object
  (** {2:methods Methods} *)

  method choose_face_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_face.font_face_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_face] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method choose_family_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_family.font_family_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_family] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method choose_font_finish :
    Ocgio.Async_result.async_result_t ->
    (Ocpango.Font_description.font_description_t, GError.t) result
  (** Finishes the [Gtk.FontDialog.choose_font] call.

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method get_filter : unit -> Filter.filter_t option
  (** Returns the filter that decides which fonts to display in the font chooser
      dialog. *)

  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  (** Returns the fontmap from which fonts are selected, or [None] for the
      default fontmap. *)

  method get_language : unit -> Ocpango.Language.language_t option
  (** Returns the language for which font features are applied. *)

  method get_modal : unit -> bool
  (** Returns whether the font chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the font chooser dialog. *)

  method set_filter : Filter.filter_t option -> unit
  (** Adds a filter that decides which fonts to display in the font chooser
      dialog.

      The filter must be able to handle both [PangoFontFamily] and
      [PangoFontFace] objects. *)

  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  (** Sets the fontmap from which fonts are selected.

      If [fontmap] is [None], the default fontmap is used. *)

  method set_language : Ocpango.Language.language_t -> unit
  (** Sets the language for which font features are applied. *)

  method set_modal : bool -> unit
  (** Sets whether the font chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the font chooser dialog. *)

  (** {2:conversions Conversions} *)

  method as_font_dialog : Raw.Font_dialog.t
end

class font_dialog : Raw.Font_dialog.t -> font_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Font_dialog.t}. *)

(** {1:description Description}

    Asynchronous API to present a font chooser dialog.

    [GtkFontDialog] collects the arguments that are needed to present the dialog
    to the user, such as a title for the dialog and whether it should be modal.

    The dialog is shown with the [Gtk.FontDialog.choose_font] function or its
    variants.

    See [Gtk.FontDialogButton] for a convenient control that uses
    [GtkFontDialog] and presents the results. *)

(** {1:constructors Constructors} *)

val new_ : unit -> font_dialog_t
(** Creates a new [GtkFontDialog] object. *)
