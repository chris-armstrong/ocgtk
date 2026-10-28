class type check_button_t = object
  inherit Widget.widget_t
  inherit Actionable.actionable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the check button is activated.

      The [::activate] signal on [GtkCheckButton] is an action signal and
      emitting it causes the button to animate press then release.

      Applications should never connect to this signal, but use the
      [Gtk.CheckButton::toggled] signal.

      The default bindings for this signal are all forms of the <kbd>␣</kbd> and
      <kbd>Enter</kbd> keys. *)

  method on_toggled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the buttons's [Gtk.CheckButton:active] property changes. *)

  (** {2:methods Methods} *)

  method get_active : unit -> bool
  (** Returns whether the check button is active. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [button] or [None] if [CheckButton:label] is set.
  *)

  method get_inconsistent : unit -> bool
  (** Returns whether the check button is in an inconsistent state. *)

  method get_label : unit -> string option
  (** Returns the label of the check button or [None] if [CheckButton:child] is
      set. *)

  method get_use_underline : unit -> bool
  (** Returns whether underlines in the label indicate mnemonics. *)

  method set_active : bool -> unit
  (** Changes the check buttons active state. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [button].

      Note that by using this API, you take full responsibility for setting up
      the proper accessibility label and description information for [button].
      Most likely, you'll either set the accessibility label or description for
      [button] explicitly, or you'll set a labelled-by or described-by relations
      from [child] to [button]. *)

  method set_group : check_button_t option -> unit
  (** Adds [self] to the group of [group].

      In a group of multiple check buttons, only one button can be active at a
      time. The behavior of a checkbutton in a group is also commonly known as a
      {i radio button}.

      Setting the group of a check button also changes the css name of the
      indicator widget's CSS node to 'radio'.

      Setting up groups in a cycle leads to undefined behavior.

      Note that the same effect can be achieved via the [Gtk.Actionable] API, by
      using the same action with parameter type and state type 's' for all
      buttons in the group, and giving each button its own target value. *)

  method set_inconsistent : bool -> unit
  (** Sets the [GtkCheckButton] to inconsistent state.

      You should turn off the inconsistent state again if the user checks the
      check button. This has to be done manually. *)

  method set_label : string option -> unit
  (** Sets the text of [self].

      If [Gtk.CheckButton:use-underline] is [true], an underscore in [label] is
      interpreted as mnemonic indicator, see [Gtk.CheckButton.set_use_underline]
      for details on this behavior. *)

  method set_use_underline : bool -> unit
  (** Sets whether underlines in the label indicate mnemonics.

      If [setting] is [true], an underscore character in [self]'s label
      indicates a mnemonic accelerator key. This behavior is similar to
      [Gtk.Label:use-underline]. *)

  (** {2:conversions Conversions} *)

  method as_check_button : Raw.Check_button.t
end

(* High-level class for CheckButton *)
class check_button (obj : Raw.Check_button.t) : check_button_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Check_button.on_activate ~after self#as_check_button ~callback

    method on_toggled ?(after = false) ~callback () =
      Raw.Check_button.on_toggled ~after self#as_check_button ~callback

    method get_active : unit -> bool = fun () -> Raw.Check_button.get_active obj

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Check_button.get_child obj)

    method get_inconsistent : unit -> bool =
      fun () -> Raw.Check_button.get_inconsistent obj

    method get_label : unit -> string option =
      fun () -> Raw.Check_button.get_label obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Check_button.get_use_underline obj

    method set_active : bool -> unit =
      fun setting -> Raw.Check_button.set_active obj setting

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Check_button.set_child obj child

    method set_group : check_button_t option -> unit =
      fun group ->
        let group = Option.map (fun c -> c#as_check_button) group in
        Raw.Check_button.set_group obj group

    method set_inconsistent : bool -> unit =
      fun inconsistent -> Raw.Check_button.set_inconsistent obj inconsistent

    method set_label : string option -> unit =
      fun label -> Raw.Check_button.set_label obj label

    method set_use_underline : bool -> unit =
      fun setting -> Raw.Check_button.set_use_underline obj setting

    method as_check_button = obj
  end

let new_ () : check_button_t = new check_button (Raw.Check_button.new_ ())

let new_with_label (label : string option) : check_button_t =
  let obj_ = Raw.Check_button.new_with_label label in
  new check_button obj_

let new_with_mnemonic (label : string option) : check_button_t =
  let obj_ = Raw.Check_button.new_with_mnemonic label in
  new check_button obj_
