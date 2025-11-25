(* Compatibility wrapper around generated Check_button bindings *)
type t = Check_button.t

let as_widget = Check_button.as_widget

let new_ = Check_button.new_
let new_with_label = Check_button.new_with_label
let new_with_mnemonic = Check_button.new_with_mnemonic
let get_active = Check_button.get_active
let set_active = Check_button.set_active
let get_label t = Option.value ~default:"" (Check_button.get_label t)
let set_label t s = Check_button.set_label t (Some s)
let get_use_underline = Check_button.get_use_underline
let set_use_underline = Check_button.set_use_underline
let get_inconsistent = Check_button.get_inconsistent
let set_inconsistent = Check_button.set_inconsistent
let set_group t opt = Check_button.set_group t (Option.map Check_button.as_widget opt)
