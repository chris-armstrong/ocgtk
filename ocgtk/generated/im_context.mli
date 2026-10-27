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
  (** The ::commit signal is emitted when a complete input sequence has been
      entered by the user.

      If the commit comes after a preediting sequence, the ::commit signal is
      emitted after ::preedit-end.

      This can be a single character immediately after a key press or the final
      result of preediting. *)

  method on_delete_surrounding :
    ?after:bool ->
    callback:(offset:int -> n_chars:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** The ::delete-surrounding signal is emitted when the input method needs to
      delete all or part of the context surrounding the cursor. *)

  method on_preedit_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The ::preedit-changed signal is emitted whenever the preedit sequence
      currently being entered has changed.

      It is also emitted at the end of a preedit sequence, in which case
      [Gtk.IMContext.get_preedit_string] returns the empty string. *)

  method on_preedit_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The ::preedit-end signal is emitted when a preediting sequence has been
      completed or canceled. *)

  method on_preedit_start :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The ::preedit-start signal is emitted when a new preediting sequence
      starts. *)

  method on_retrieve_surrounding :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** The ::retrieve-surrounding signal is emitted when the input method
      requires the context surrounding the cursor.

      The callback should set the input method surrounding context by calling
      the [Gtk.IMContext.set_surrounding] method. *)

  method activate_osk : Ocgdk.Event.event_t option -> bool
  (** Requests the platform to show an on-screen keyboard for user input.

      This method will return [TRUE] if this request was actually performed to
      the platform, other environmental factors may result in an on-screen
      keyboard effectively not showing up. *)

  method delete_surrounding : int -> int -> bool
  (** Asks the widget that the input context is attached to delete characters
      around the cursor position by emitting the [::delete_surrounding] signal.

      Note that [offset] and [n_chars] are in characters not in bytes which
      differs from the usage other places in [GtkIMContext].

      In order to use this function, you should first call
      [Gtk.IMContext.get_surrounding] to get the current context, and call this
      function immediately afterwards to make sure that you know what you are
      deleting. You should also account for the fact that even if the signal was
      handled, the input context might not have deleted all the characters that
      were requested to be deleted.

      This function is used by an input method that wants to make substitutions
      in the existing text in response to new input. It is not useful for
      applications. *)

  method filter_key :
    bool ->
    Ocgdk.Surface.surface_t ->
    Ocgdk.Device.device_t ->
    UInt32.t ->
    int ->
    Ocgdk.Enums.modifiertype ->
    int ->
    bool
  (** Allow an input method to forward key press and release events to another
      input method without necessarily having a [GdkEvent] available. *)

  method filter_keypress : Ocgdk.Event.event_t -> bool
  (** Allow an input method to internally handle key press and release events.

      If this function returns [TRUE], then no further processing should be done
      for this key event. *)

  method focus_in : unit -> unit
  (** Notify the input method that the widget to which this input context
      corresponds has gained focus.

      The input method may, for example, change the displayed feedback to
      reflect this change. *)

  method focus_out : unit -> unit
  (** Notify the input method that the widget to which this input context
      corresponds has lost focus.

      The input method may, for example, change the displayed feedback or reset
      the contexts state to reflect this change. *)

  method reset : unit -> unit
  (** Notify the input method that a change such as a change in cursor position
      has been made.

      This will typically cause the input method to clear the preedit state. *)

  method set_client_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Set the client widget for the input context.

      This is the [GtkWidget] holding the input focus. This widget is used in
      order to correctly position status windows, and may also be used for
      purposes internal to the input method. *)

  method set_cursor_location : Ocgdk.Rectangle.rectangle_t -> unit
  (** Notify the input method that a change in cursor position has been made.

      The location is relative to the client widget. *)

  method set_surrounding : string -> int -> int -> unit
  (** Sets surrounding context around the insertion point and preedit string.

      This function is expected to be called in response to the
      [Gtk.IMContext::retrieve-surrounding] signal, and will likely have no
      effect if called at other times. *)

  method set_surrounding_with_selection : string -> int -> int -> int -> unit
  (** Sets surrounding context around the insertion point and preedit string.
      This function is expected to be called in response to the
      [Gtk.IMContext::retrieve_surrounding] signal, and will likely have no
      effect if called at other times. *)

  method set_use_preedit : bool -> unit
  (** Sets whether the IM context should use the preedit string to display
      feedback.

      If [use_preedit] is [FALSE] (default is [TRUE]), then the IM context may
      use some other method to display feedback, such as displaying it in a
      child of the root window. *)

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
