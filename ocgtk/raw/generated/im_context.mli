(* GENERATED CODE - DO NOT EDIT *)
(* IMContext: IMContext *)

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
 The class built on this module is in {!Ocgtk.Im_context}."]

type t = [ `im_context | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_im_context_get_type"

(* Methods *)

external set_use_preedit : t -> bool -> unit
  = "ml_gtk_im_context_set_use_preedit"
(** Sets whether the IM context should use the preedit string to display
    feedback.

    If [use_preedit] is [false] (default is [true]), then the IM context may use
    some other method to display feedback, such as displaying it in a child of
    the root window. *)

external set_surrounding_with_selection :
  t -> string -> int -> int -> int -> unit
  = "ml_gtk_im_context_set_surrounding_with_selection"
(** Sets surrounding context around the insertion point and preedit string. This
    function is expected to be called in response to the
    [Gtk.IMContext::retrieve_surrounding] signal, and will likely have no effect
    if called at other times. *)

external set_surrounding : t -> string -> int -> int -> unit
  = "ml_gtk_im_context_set_surrounding"
(** Sets surrounding context around the insertion point and preedit string.

    This function is expected to be called in response to the
    [Gtk.IMContext::retrieve-surrounding] signal, and will likely have no effect
    if called at other times. *)

external set_cursor_location : t -> Ocgdk_raw.Rectangle.t -> unit
  = "ml_gtk_im_context_set_cursor_location"
(** Notify the input method that a change in cursor position has been made.

    The location is relative to the client widget. *)

external set_client_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_im_context_set_client_widget"
(** Set the client widget for the input context.

    This is the [GtkWidget] holding the input focus. This widget is used in
    order to correctly position status windows, and may also be used for
    purposes internal to the input method. *)

external reset : t -> unit = "ml_gtk_im_context_reset"
(** Notify the input method that a change such as a change in cursor position
    has been made.

    This will typically cause the input method to clear the preedit state. *)

external focus_out : t -> unit = "ml_gtk_im_context_focus_out"
(** Notify the input method that the widget to which this input context
    corresponds has lost focus.

    The input method may, for example, change the displayed feedback or reset
    the contexts state to reflect this change. *)

external focus_in : t -> unit = "ml_gtk_im_context_focus_in"
(** Notify the input method that the widget to which this input context
    corresponds has gained focus.

    The input method may, for example, change the displayed feedback to reflect
    this change. *)

external filter_keypress : t -> Ocgdk_raw.Event.t -> bool
  = "ml_gtk_im_context_filter_keypress"
(** Allow an input method to internally handle key press and release events.

    If this function returns [true], then no further processing should be done
    for this key event. *)

external filter_key :
  t ->
  bool ->
  Ocgdk_raw.Surface.t ->
  Ocgdk_raw.Device.t ->
  UInt32.t ->
  int ->
  Ocgdk_enums.modifiertype ->
  int ->
  bool
  = "ml_gtk_im_context_filter_key_bytecode"
    "ml_gtk_im_context_filter_key_native"
(** Allow an input method to forward key press and release events to another
    input method without necessarily having a [GdkEvent] available. *)

external delete_surrounding : t -> int -> int -> bool
  = "ml_gtk_im_context_delete_surrounding"
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

    This function is used by an input method that wants to make substitutions in
    the existing text in response to new input. It is not useful for
    applications. *)

external activate_osk : t -> Ocgdk_raw.Event.t option -> bool
  = "ml_gtk_im_context_activate_osk"
(** Requests the platform to show an on-screen keyboard for user input.

    This method will return [true] if this request was actually performed to the
    platform, other environmental factors may result in an on-screen keyboard
    effectively not showing up. *)

(* Properties *)

external get_input_hints : t -> Ocgtk_enums.inputhints
  = "ml_gtk_im_context_get_input_hints"
(** Additional hints that allow input methods to fine-tune their behaviour. *)

external set_input_hints : t -> Ocgtk_enums.inputhints -> unit
  = "ml_gtk_im_context_set_input_hints"
(** Additional hints that allow input methods to fine-tune their behaviour. *)

external get_input_purpose : t -> Ocgtk_enums.inputpurpose
  = "ml_gtk_im_context_get_input_purpose"
(** The purpose of the text field that the `GtkIMContext is connected to.

    This property can be used by on-screen keyboards and other input methods to
    adjust their behaviour. *)

external set_input_purpose : t -> Ocgtk_enums.inputpurpose -> unit
  = "ml_gtk_im_context_set_input_purpose"
(** The purpose of the text field that the `GtkIMContext is connected to.

    This property can be used by on-screen keyboards and other input methods to
    adjust their behaviour. *)

val on_commit :
  ?after:bool -> t -> callback:(str:string -> unit) -> Gobject.Signal.handler_id
(** The ::commit signal is emitted when a complete input sequence has been
    entered by the user.

    If the commit comes after a preediting sequence, the ::commit signal is
    emitted after ::preedit-end.

    This can be a single character immediately after a key press or the final
    result of preediting. *)

val on_delete_surrounding :
  ?after:bool ->
  t ->
  callback:(offset:int -> n_chars:int -> bool) ->
  Gobject.Signal.handler_id
(** The ::delete-surrounding signal is emitted when the input method needs to
    delete all or part of the context surrounding the cursor. *)

val on_preedit_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** The ::preedit-changed signal is emitted whenever the preedit sequence
    currently being entered has changed.

    It is also emitted at the end of a preedit sequence, in which case
    [Gtk.IMContext.get_preedit_string] returns the empty string. *)

val on_preedit_end :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** The ::preedit-end signal is emitted when a preediting sequence has been
    completed or canceled. *)

val on_preedit_start :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** The ::preedit-start signal is emitted when a new preediting sequence starts.
*)

val on_retrieve_surrounding :
  ?after:bool -> t -> callback:(unit -> bool) -> Gobject.Signal.handler_id
(** The ::retrieve-surrounding signal is emitted when the input method requires
    the context surrounding the cursor.

    The callback should set the input method surrounding context by calling the
    [Gtk.IMContext.set_surrounding] method. *)
