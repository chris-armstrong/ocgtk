(* GENERATED CODE - DO NOT EDIT *)
(* ColorButton: ColorButton *)

(** The [GtkColorButton] allows to open a color chooser dialog to change the
    color.

    An example GtkColorButton

    It is suitable widget for selecting a color in a preference dialog.

    {b CSS nodes}

    {[
    colorbutton
    ╰── button.color
        ╰── [content]
    ]}

    [GtkColorButton] has a single CSS node with name colorbutton which contains
    a button node. To differentiate it from a plain [GtkButton], it gets the
    .color style class.

    The class built on this module is in {!Ocgtk.Color_button}. *)

type t = [ `color_button | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_color_button_get_type"

external new_ : unit -> t = "ml_gtk_color_button_new"
(** Creates a new color button.

    This returns a widget in the form of a small button containing a swatch
    representing the current selected color. When the button is clicked, a color
    chooser dialog will open, allowing the user to select a color. The swatch
    will be updated to reflect the new color when the user finishes. *)

external new_with_rgba : Ocgdk_raw.Rgb_a.t -> t
  = "ml_gtk_color_button_new_with_rgba"
(** Creates a new color button showing the given color. *)

(* Methods *)

external set_title : t -> string -> unit = "ml_gtk_color_button_set_title"
(** Sets the title for the color chooser dialog. *)

external set_modal : t -> bool -> unit = "ml_gtk_color_button_set_modal"
(** Sets whether the dialog should be modal. *)

external get_title : t -> string = "ml_gtk_color_button_get_title"
(** Gets the title of the color chooser dialog. *)

external get_modal : t -> bool = "ml_gtk_color_button_get_modal"
(** Gets whether the dialog is modal. *)

(* Properties *)

external get_show_editor : t -> bool = "ml_gtk_color_button_get_show_editor"
(** Whether the color chooser should open in editor mode.

    This property should be used in cases where the palette in the editor would
    be redundant, such as when the color button is already part of a palette. *)

external set_show_editor : t -> bool -> unit
  = "ml_gtk_color_button_set_show_editor"
(** Whether the color chooser should open in editor mode.

    This property should be used in cases where the palette in the editor would
    be redundant, such as when the color button is already part of a palette. *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted to when the color button is activated.

    The [::activate] signal on [GtkMenuButton] is an action signal and emitting
    it causes the button to pop up its dialog. *)

val on_color_set :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the user selects a color.

    When handling this signal, use [Gtk.ColorChooser.get_rgba] to find out which
    color was just selected.

    Note that this signal is only emitted when the user changes the color. If
    you need to react to programmatic color changes as well, use the
    notify::rgba signal. *)
