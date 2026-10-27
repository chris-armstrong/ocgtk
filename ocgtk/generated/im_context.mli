[@@@ocaml.text
"The interface for GTK input methods.\n\n\
 [GtkIMContext] is used by GTK text input widgets like [GtkText]\n\
 to map from key events to Unicode character strings.\n\n\
 An input method may consume multiple key events in sequence before finally\n\
 outputting the composed result. This is called {i preediting}, and an input\n\
 method may provide feedback about this process by displaying the intermediate\n\
 composition states as preedit text. To do so, the [GtkIMContext] will emit\n\
 [Gtk.IMContext::preedit-start], [Gtk.IMContext::preedit-changed]\n\
 and [Gtk.IMContext::preedit-end] signals.\n\n\
 For instance, the built-in GTK input method [Gtk.IMContextSimple]\n\
 implements the input of arbitrary Unicode code points by holding down the\n\
 <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>\n\
 followed by the hexadecimal digits of the code point. When releasing the\n\
 <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the\n\
 character is inserted as text. For example,\n\n\
 Ctrl+Shift+u 2 0 A C\n\n\
 results in the € sign.\n\n\
 Additional input methods can be made available for use by GTK widgets as\n\
 loadable modules. An input method module is a small shared library which\n\
 provides a [GIOExtension] for the extension point named \"gtk-im-module\".\n\n\
 To connect a widget to the users preferred input method, you should use\n\
 [Gtk.IMMulticontext].\n\n\
 Its methods, signals and properties are on {!class-type-im_context_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Im_context}."]

(** The methods, signals and properties of a [GtkIMContext]. *)
class type im_context_t = object
  method on_commit :
    ?after:bool ->
    callback:(str:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_delete_surrounding :
    ?after:bool ->
    callback:(offset:int -> n_chars:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_preedit_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_preedit_start :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_retrieve_surrounding :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method activate_osk : Ocgdk.Event.event_t option -> bool
  method delete_surrounding : int -> int -> bool

  method filter_key :
    bool ->
    Ocgdk.Surface.surface_t ->
    Ocgdk.Device.device_t ->
    UInt32.t ->
    int ->
    Ocgdk.Enums.modifiertype ->
    int ->
    bool

  method filter_keypress : Ocgdk.Event.event_t -> bool
  method focus_in : unit -> unit
  method focus_out : unit -> unit
  method reset : unit -> unit

  method set_client_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_cursor_location : Ocgdk.Rectangle.rectangle_t -> unit
  method set_surrounding : string -> int -> int -> unit
  method set_surrounding_with_selection : string -> int -> int -> int -> unit
  method set_use_preedit : bool -> unit
  method input_hints : Enums.inputhints
  method set_input_hints : Enums.inputhints -> unit
  method input_purpose : Enums.inputpurpose
  method set_input_purpose : Enums.inputpurpose -> unit
  method as_im_context : Raw.Im_context.t
end

class im_context : Raw.Im_context.t -> im_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Im_context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkIMContext], give one already wrapped. *)
