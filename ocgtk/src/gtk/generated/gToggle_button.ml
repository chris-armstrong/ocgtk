class type toggle_button_t = object
  inherit GButton.button_t
  method on_toggled : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_active : unit -> bool
  method set_active : bool -> unit
  method set_group : toggle_button_t option -> unit
  method toggled : unit -> unit
  method as_toggle_button : Toggle_button.t
end

(* High-level class for ToggleButton *)
class toggle_button (obj : Toggle_button.t) : toggle_button_t =
  object (self)
    inherit GButton.button (obj :> Button.t)

    method on_toggled ~callback =
      Toggle_button.on_toggled self#as_toggle_button ~callback

    method get_active : unit -> bool = fun () -> Toggle_button.get_active obj

    method set_active : bool -> unit =
      fun is_active -> Toggle_button.set_active obj is_active

    method set_group : toggle_button_t option -> unit =
      fun group ->
        let group = Option.map (fun c -> c#as_toggle_button) group in
        Toggle_button.set_group obj group

    method toggled : unit -> unit = fun () -> Toggle_button.toggled obj
    method as_toggle_button = obj
  end

let new_ () : toggle_button_t = new toggle_button (Toggle_button.new_ ())

let new_with_label (label : string) : toggle_button_t =
  let obj_ = Toggle_button.new_with_label label in
  new toggle_button obj_

let new_with_mnemonic (label : string) : toggle_button_t =
  let obj_ = Toggle_button.new_with_mnemonic label in
  new toggle_button obj_
