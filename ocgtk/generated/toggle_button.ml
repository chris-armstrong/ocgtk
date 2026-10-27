class type toggle_button_t = object
  inherit Button.button_t

  method on_toggled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the [GtkToggleButton]'s state is changed. *)

  method get_active : unit -> bool
  (** Queries a [GtkToggleButton] and returns its current state.

      Returns [TRUE] if the toggle button is pressed in and [FALSE] if it is
      raised. *)

  method set_active : bool -> unit
  (** Sets the status of the toggle button.

      Set to [TRUE] if you want the [GtkToggleButton] to be “pressed in”, and
      [FALSE] to raise it.

      If the status of the button changes, this action causes the
      [Gtk.ToggleButton::toggled] signal to be emitted. *)

  method set_group : toggle_button_t option -> unit
  (** Adds [self] to the group of [group].

      In a group of multiple toggle buttons, only one button can be active at a
      time.

      Setting up groups in a cycle leads to undefined behavior.

      Note that the same effect can be achieved via the [Gtk.Actionable] API, by
      using the same action with parameter type and state type 's' for all
      buttons in the group, and giving each button its own target value. *)

  method toggled : unit -> unit
  (** Emits the ::toggled signal on the [GtkToggleButton]. *)

  method as_toggle_button : Raw.Toggle_button.t
end

(* High-level class for ToggleButton *)
class toggle_button (obj : Raw.Toggle_button.t) : toggle_button_t =
  object (self)
    inherit Button.button (obj :> Raw.Button.t)

    method on_toggled ?(after = false) ~callback () =
      Raw.Toggle_button.on_toggled ~after self#as_toggle_button ~callback

    method get_active : unit -> bool =
      fun () -> Raw.Toggle_button.get_active obj

    method set_active : bool -> unit =
      fun is_active -> Raw.Toggle_button.set_active obj is_active

    method set_group : toggle_button_t option -> unit =
      fun group ->
        let group = Option.map (fun c -> c#as_toggle_button) group in
        Raw.Toggle_button.set_group obj group

    method toggled : unit -> unit = fun () -> Raw.Toggle_button.toggled obj
    method as_toggle_button = obj
  end

let new_ () : toggle_button_t = new toggle_button (Raw.Toggle_button.new_ ())

let new_with_label (label : string) : toggle_button_t =
  let obj_ = Raw.Toggle_button.new_with_label label in
  new toggle_button obj_

let new_with_mnemonic (label : string) : toggle_button_t =
  let obj_ = Raw.Toggle_button.new_with_mnemonic label in
  new toggle_button obj_
