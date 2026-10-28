(** Opens a color chooser dialog to select a color.

    Its methods, signals and properties are on
    {!class-type-color_dialog_button_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Color_dialog_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorDialogButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    Opens a color chooser dialog to select a color.

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
    gets the .color style class. *)
class type color_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the color dialog button is activated.

      The [::activate] signal on [GtkColorDialogButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_color_dialog_button : Raw.Color_dialog_button.t
end

class color_dialog_button : Raw.Color_dialog_button.t -> color_dialog_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_dialog_button.t}. *)

(** {1:description Description}

    Opens a color chooser dialog to select a color.

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
    gets the .color style class. *)

(** {1:constructors Constructors} *)

val new_ : Color_dialog.color_dialog_t option -> color_dialog_button_t
(** Creates a new [GtkColorDialogButton] with the given [GtkColorDialog].

    You can pass [NULL] to this function and set a [GtkColorDialog] later. The
    button will be insensitive until that happens. *)
