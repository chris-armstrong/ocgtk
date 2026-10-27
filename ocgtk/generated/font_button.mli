(** The [GtkFontButton] allows to open a font chooser dialog to change the font.

    An example GtkFontButton

    It is suitable widget for selecting a font in a preference dialog.

    {b CSS nodes}

    {[
    fontbutton
    ╰── button.font
        ╰── [content]
    ]}

    [GtkFontButton] has a single CSS node with name fontbutton which contains a
    button node with the .font style class.

    Its methods, signals and properties are on {!class-type-font_button_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Font_button}. *)

(** The methods, signals and properties of a [GtkFontButton]. *)
class type font_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_font_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

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

  method as_font_button : Raw.Font_button.t
end

class font_button : Raw.Font_button.t -> font_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Font_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFontButton], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> font_button_t
(** Creates a new font picker widget. *)

val new_with_font : string -> font_button_t
(** Creates a new font picker widget showing the given font. *)
