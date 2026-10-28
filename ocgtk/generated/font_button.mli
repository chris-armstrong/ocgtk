(** The [GtkFontButton] allows to open a font chooser dialog to change the font.

    Its methods, signals and properties are on {!class-type-font_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Font_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Font_chooser.class-type-font_chooser_t}Ocgtk.Font_chooser}

    The [GtkFontButton] allows to open a font chooser dialog to change the font.

    An example GtkFontButton

    It is suitable widget for selecting a font in a preference dialog.

    {b CSS nodes}

    {[
    fontbutton
    ╰── button.font
        ╰── [content]
    ]}

    [GtkFontButton] has a single CSS node with name fontbutton which contains a
    button node with the .font style class. *)
class type font_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the font button is activated.

      The [::activate] signal on [GtkFontButton] is an action signal and
      emitting it causes the button to present its dialog. *)

  method on_font_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user selects a font.

      When handling this signal, use [Gtk.FontChooser.get_font] to find out
      which font was just selected.

      Note that this signal is only emitted when the user changes the font. If
      you need to react to programmatic font changes as well, use the
      notify::font signal. *)

  (** {2:methods Methods} *)

  method get_modal : unit -> bool
  (** Gets whether the dialog is modal. *)

  method get_title : unit -> string
  (** Retrieves the title of the font chooser dialog. *)

  method get_use_font : unit -> bool
  (** Returns whether the selected font is used in the label. *)

  method get_use_size : unit -> bool
  (** Returns whether the selected size is used in the label. *)

  method set_modal : bool -> unit
  (** Sets whether the dialog should be modal. *)

  method set_title : string -> unit
  (** Sets the title for the font chooser dialog. *)

  method set_use_font : bool -> unit
  (** If [use_font] is [TRUE], the font name will be written using the selected
      font. *)

  method set_use_size : bool -> unit
  (** If [use_size] is [TRUE], the font name will be written using the selected
      size. *)

  (** {2:conversions Conversions} *)

  method as_font_button : Raw.Font_button.t
end

class font_button : Raw.Font_button.t -> font_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Font_button.t}. *)

(** {1:description Description}

    The [GtkFontButton] allows to open a font chooser dialog to change the font.

    An example GtkFontButton

    It is suitable widget for selecting a font in a preference dialog.

    {b CSS nodes}

    {[
    fontbutton
    ╰── button.font
        ╰── [content]
    ]}

    [GtkFontButton] has a single CSS node with name fontbutton which contains a
    button node with the .font style class. *)

(** {1:constructors Constructors} *)

val new_ : unit -> font_button_t
(** Creates a new font picker widget. *)

val new_with_font : string -> font_button_t
(** Creates a new font picker widget showing the given font. *)
