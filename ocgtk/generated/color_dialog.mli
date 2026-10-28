(** Asynchronous API to present a color chooser dialog.

    Its methods, signals and properties are on {!class-type-color_dialog_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Color_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorDialog].}

    Inherits from: [GObject.Object]

    Asynchronous API to present a color chooser dialog.

    [GtkColorDialog] collects the arguments that are needed to present the
    dialog to the user, such as a title for the dialog and whether it should be
    modal.

    The dialog is shown with the [Gtk.ColorDialog.choose_rgba] function.

    See [Gtk.ColorDialogButton] for a convenient control that uses
    [GtkColorDialog] and presents the results. *)
class type color_dialog_t = object
  (** {2:methods Methods} *)

  method choose_rgba_finish :
    Ocgio.Async_result.async_result_t -> (Ocgdk.Rgb_a.rgb_a_t, GError.t) result
  (** Finishes the [Gtk.ColorDialog.choose_rgba] call

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method get_modal : unit -> bool
  (** Returns whether the color chooser dialog blocks interaction with the
      parent window while it is presented. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the color chooser dialog. *)

  method get_with_alpha : unit -> bool
  (** Returns whether colors may have alpha. *)

  method set_modal : bool -> unit
  (** Sets whether the color chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the color chooser dialog. *)

  method set_with_alpha : bool -> unit
  (** Sets whether colors may have alpha. *)

  (** {2:conversions Conversions} *)

  method as_color_dialog : Raw.Color_dialog.t
end

class color_dialog : Raw.Color_dialog.t -> color_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_dialog.t}. *)

(** {1:description Description}

    Asynchronous API to present a color chooser dialog.

    [GtkColorDialog] collects the arguments that are needed to present the
    dialog to the user, such as a title for the dialog and whether it should be
    modal.

    The dialog is shown with the [Gtk.ColorDialog.choose_rgba] function.

    See [Gtk.ColorDialogButton] for a convenient control that uses
    [GtkColorDialog] and presents the results. *)

(** {1:constructors Constructors} *)

val new_ : unit -> color_dialog_t
(** Creates a new [GtkColorDialog] object. *)
