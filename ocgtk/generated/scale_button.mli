(** Provides a button which pops up a scale widget.

    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [Gtk.VolumeButton] subclass that is
    tailored for this use case.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ScaleButton::popup]

    {b CSS nodes}

    {[
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ]}

    [GtkScaleButton] has a single CSS node with name scalebutton and [.scale]
    style class, and contains a [button] node with a [.toggle] style class.

    Its methods, signals and properties are on {!class-type-scale_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Scale_button}. *)

(** The methods, signals and properties of a [GtkScaleButton]. *)
class type scale_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_popdown :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_active : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_has_frame : unit -> bool
  method get_minus_button : unit -> Button.button_t
  method get_plus_button : unit -> Button.button_t

  method get_popup :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_value : unit -> float
  method set_adjustment : Adjustment.adjustment_t -> unit
  method set_has_frame : bool -> unit
  method set_icons : string array -> unit
  method set_value : float -> unit
  method as_scale_button : Raw.Scale_button.t
end

class scale_button : Raw.Scale_button.t -> scale_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Scale_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkScaleButton], give one already wrapped. *)

val new_ : float -> float -> float -> string array option -> scale_button_t
