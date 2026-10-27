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

    Its methods, signals and properties are on {!class-type-color_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Color_button}. *)

(** The methods, signals and properties of a [GtkColorButton]. *)
class type color_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Color_chooser.color_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_color_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_modal : unit -> bool
  method get_title : unit -> string
  method set_modal : bool -> unit
  method set_title : string -> unit
  method show_editor : bool
  method set_show_editor : bool -> unit
  method as_color_button : Raw.Color_button.t
end

class color_button : Raw.Color_button.t -> color_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkColorButton], give one already wrapped. *)

val new_ : unit -> color_button_t
val new_with_rgba : Ocgdk.Rgb_a.rgb_a_t -> color_button_t
