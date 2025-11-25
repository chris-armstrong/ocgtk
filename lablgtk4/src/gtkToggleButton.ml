(* Compatibility wrapper around generated Toggle_button bindings *)
type t = Toggle_button.t

let as_widget = Toggle_button.as_widget

let new_ = Toggle_button.new_
let new_with_label = Toggle_button.new_with_label
let new_with_mnemonic = Toggle_button.new_with_mnemonic

let get_active = Toggle_button.get_active
let set_active = Toggle_button.set_active

let toggled = Toggle_button.toggled
