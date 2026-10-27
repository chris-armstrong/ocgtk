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

    Its methods, signals and properties are on {!class-type-color_button_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Color_button}. *)

(** The methods, signals and properties of a [GtkColorButton]. *)
class type color_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Color_chooser.color_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the color button is activated.

      The [::activate] signal on [GtkMenuButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  method on_color_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user selects a color.

      When handling this signal, use [Gtk.ColorChooser.get_rgba] to find out
      which color was just selected.

      Note that this signal is only emitted when the user changes the color. If
      you need to react to programmatic color changes as well, use the
      notify::rgba signal. *)

  method get_modal : unit -> bool
  (** Gets whether the dialog is modal. *)

  method get_title : unit -> string
  (** Gets the title of the color chooser dialog. *)

  method set_modal : bool -> unit
  (** Sets whether the dialog should be modal. *)

  method set_title : string -> unit
  (** Sets the title for the color chooser dialog. *)

  method show_editor : bool
  method set_show_editor : bool -> unit
  method as_color_button : Raw.Color_button.t
end

class color_button : Raw.Color_button.t -> color_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkColorButton], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> color_button_t
(** Creates a new color button.

    This returns a widget in the form of a small button containing a swatch
    representing the current selected color. When the button is clicked, a color
    chooser dialog will open, allowing the user to select a color. The swatch
    will be updated to reflect the new color when the user finishes. *)

val new_with_rgba : Ocgdk.Rgb_a.rgb_a_t -> color_button_t
(** Creates a new color button showing the given color. *)
