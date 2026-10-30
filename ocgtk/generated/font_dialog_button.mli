(** Opens a font chooser dialog to select a font.

    Its methods, signals and properties are on
    {!class-type-font_dialog_button_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Font_dialog_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontDialogButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Opens a font chooser dialog to select a font.

    An example GtkFontDialogButton

    It is suitable widget for selecting a font in a preference dialog.

    {b CSS nodes}

    {[
    fontbutton
    ╰── button.font
        ╰── [content]
    ]}

    [GtkFontDialogButton] has a single CSS node with name fontbutton which
    contains a button node with the .font style class. *)
class type font_dialog_button_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the font dialog button is activated.

      The [::activate] signal on [GtkFontDialogButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  (** {2:methods Methods} *)

  method get_dialog : unit -> Font_dialog.font_dialog_t option
  (** Returns the [GtkFontDialog] of [self]. *)

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option
  [@@ocaml.doc
    "Returns the font of the button.\n\n\
     This function is what should be used to obtain\n\
     the font that was chosen by the user. To get\n\
     informed about changes, listen to \"notify::font-desc\"."]

  method get_font_features : unit -> string option
  [@@ocaml.doc
    "Returns the font features of the button.\n\n\
     This function is what should be used to obtain the font features\n\
     that were chosen by the user. To get informed about changes, listen\n\
     to \"notify::font-features\".\n\n\
     Note that the button will only let users choose font features\n\
     if [Gtk.FontDialogButton:level] is set to\n\
     [GTK_FONT_LEVEL_FEATURES]."]

  method get_language : unit -> Ocpango.Language.language_t option
  (** Returns the language that is used for font features. *)

  method get_level : unit -> Enums.fontlevel
  (** Returns the level of detail at which this dialog lets the user select
      fonts. *)

  method get_use_font : unit -> bool
  (** Returns whether the selected font is used in the label. *)

  method get_use_size : unit -> bool
  (** Returns whether the selected font size is used in the label. *)

  method set_dialog : Font_dialog.font_dialog_t -> unit
  (** Sets a [GtkFontDialog] object to use for creating the font chooser dialog
      that is presented when the user clicks the button. *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Sets the font of the button. *)

  method set_font_features : string option -> unit
  (** Sets the font features of the button. *)

  method set_language : Ocpango.Language.language_t option -> unit
  (** Sets the language to use for font features. *)

  method set_level : Enums.fontlevel -> unit
  (** Sets the level of detail at which this dialog lets the user select fonts.
  *)

  method set_use_font : bool -> unit
  (** If [use_font] is [true], the font name will be written using the selected
      font. *)

  method set_use_size : bool -> unit
  (** If [use_size] is [true], the font name will be written using the selected
      font size. *)

  (** {2:conversions Conversions} *)

  method as_font_dialog_button : Raw.Font_dialog_button.t
end

class font_dialog_button : Raw.Font_dialog_button.t -> font_dialog_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Font_dialog_button.t}. *)

(** {1:description Description}

    Opens a font chooser dialog to select a font.

    An example GtkFontDialogButton

    It is suitable widget for selecting a font in a preference dialog.

    {b CSS nodes}

    {[
    fontbutton
    ╰── button.font
        ╰── [content]
    ]}

    [GtkFontDialogButton] has a single CSS node with name fontbutton which
    contains a button node with the .font style class. *)

(** {1:constructors Constructors} *)

val new_ : Font_dialog.font_dialog_t option -> font_dialog_button_t
(** Creates a new [GtkFontDialogButton] with the given [GtkFontDialog].

    You can pass [None] to this function and set a [GtkFontDialog] later. The
    button will be insensitive until that happens. *)
