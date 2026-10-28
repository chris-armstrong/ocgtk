class type im_context_t = object
  (** {2:signals Signals} *)

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

  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method input_hints : Enums.inputhints
  (** Additional hints that allow input methods to fine-tune their behaviour. *)

  method set_input_hints : Enums.inputhints -> unit
  (** Additional hints that allow input methods to fine-tune their behaviour. *)

  method input_purpose : Enums.inputpurpose
  (** The purpose of the text field that the `GtkIMContext is connected to.

      This property can be used by on-screen keyboards and other input methods
      to adjust their behaviour. *)

  method set_input_purpose : Enums.inputpurpose -> unit
  (** The purpose of the text field that the `GtkIMContext is connected to.

      This property can be used by on-screen keyboards and other input methods
      to adjust their behaviour. *)

  (** {2:conversions Conversions} *)

  method as_im_context : Raw.Im_context.t
end

(* High-level class for IMContext *)
class im_context (obj : Raw.Im_context.t) : im_context_t =
  object (self)
    method on_commit ?(after = false) ~callback () =
      Raw.Im_context.on_commit ~after self#as_im_context ~callback

    method on_delete_surrounding ?(after = false) ~callback () =
      Raw.Im_context.on_delete_surrounding ~after self#as_im_context ~callback

    method on_preedit_changed ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_changed ~after self#as_im_context ~callback

    method on_preedit_end ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_end ~after self#as_im_context ~callback

    method on_preedit_start ?(after = false) ~callback () =
      Raw.Im_context.on_preedit_start ~after self#as_im_context ~callback

    method on_retrieve_surrounding ?(after = false) ~callback () =
      Raw.Im_context.on_retrieve_surrounding ~after self#as_im_context ~callback

    method activate_osk : Ocgdk.Event.event_t option -> bool =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Raw.Im_context.activate_osk obj event

    method delete_surrounding : int -> int -> bool =
      fun offset n_chars -> Raw.Im_context.delete_surrounding obj offset n_chars

    method filter_key :
        bool ->
        Ocgdk.Surface.surface_t ->
        Ocgdk.Device.device_t ->
        UInt32.t ->
        int ->
        Ocgdk.Enums.modifiertype ->
        int ->
        bool =
      fun press surface device time keycode state group ->
        let surface = surface#as_surface in
        let device = device#as_device in
        Raw.Im_context.filter_key obj press surface device time keycode state
          group

    method filter_keypress : Ocgdk.Event.event_t -> bool =
      fun event ->
        let event = event#as_event in
        Raw.Im_context.filter_keypress obj event

    method focus_in : unit -> unit = fun () -> Raw.Im_context.focus_in obj
    method focus_out : unit -> unit = fun () -> Raw.Im_context.focus_out obj
    method reset : unit -> unit = fun () -> Raw.Im_context.reset obj

    method set_client_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Im_context.set_client_widget obj widget

    method set_cursor_location : Ocgdk.Rectangle.rectangle_t -> unit =
      fun area ->
        let area = area#as_rectangle in
        Raw.Im_context.set_cursor_location obj area

    method set_surrounding : string -> int -> int -> unit =
      fun text len cursor_index ->
        Raw.Im_context.set_surrounding obj text len cursor_index

    method set_surrounding_with_selection : string -> int -> int -> int -> unit
        =
      fun text len cursor_index anchor_index ->
        Raw.Im_context.set_surrounding_with_selection obj text len cursor_index
          anchor_index

    method set_use_preedit : bool -> unit =
      fun use_preedit -> Raw.Im_context.set_use_preedit obj use_preedit

    method input_hints = Raw.Im_context.get_input_hints obj
    method set_input_hints v = Raw.Im_context.set_input_hints obj v
    method input_purpose = Raw.Im_context.get_input_purpose obj
    method set_input_purpose v = Raw.Im_context.set_input_purpose obj v
    method as_im_context = obj
  end
