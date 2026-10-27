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

    Its methods, signals and properties are on {!class-type-font_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Font_button}. *)

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
  method get_title : unit -> string
  method get_use_font : unit -> bool
  method get_use_size : unit -> bool
  method set_modal : bool -> unit
  method set_title : string -> unit
  method set_use_font : bool -> unit
  method set_use_size : bool -> unit
  method as_font_button : Raw.Font_button.t
end

class font_button : Raw.Font_button.t -> font_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Font_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFontButton], give one already wrapped. *)

val new_ : unit -> font_button_t
val new_with_font : string -> font_button_t
