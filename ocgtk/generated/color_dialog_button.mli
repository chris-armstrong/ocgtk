(** Opens a color chooser dialog to select a color.

    An example GtkColorDialogButton

    It is suitable widget for selecting a color in a preference dialog.

    {b CSS nodes}

    {[
    colorbutton
    ╰── button.color
        ╰── [content]
    ]}

    [GtkColorDialogButton] has a single CSS node with name colorbutton which
    contains a button node. To differentiate it from a plain [GtkButton], it
    gets the .color style class.

    Its methods, signals and properties are on
    {!class-type-color_dialog_button_t}. The functions it is built on are in
    {!Ocgtk.Raw.Color_dialog_button}. *)

(** The methods, signals and properties of a [GtkColorDialogButton]. *)
class type color_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_dialog : unit -> Color_dialog.color_dialog_t option
  (** Returns the [GtkColorDialog] of [self]. *)

  method get_rgba : unit -> Ocgdk.Rgb_a.rgb_a_t
  [@@ocaml.doc
    "Returns the color of the button.\n\n\
     This function is what should be used to obtain\n\
     the color that was chosen by the user. To get\n\
     informed about changes, listen to \"notify::rgba\"."]

  method set_dialog : Color_dialog.color_dialog_t -> unit
  (** Sets a [GtkColorDialog] object to use for creating the color chooser
      dialog that is presented when the user clicks the button. *)

  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Sets the color of the button. *)

  method as_color_dialog_button : Raw.Color_dialog_button.t
end

class color_dialog_button : Raw.Color_dialog_button.t -> color_dialog_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_dialog_button.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkColorDialogButton], give one already wrapped. *)

val new_ : Color_dialog.color_dialog_t option -> color_dialog_button_t
