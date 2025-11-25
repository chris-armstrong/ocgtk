(* Compatibility wrapper around generated Button bindings *)
type t = Button.t

let as_widget = Button.as_widget

let new_ = Button.new_
let new_with_label = Button.new_with_label
let new_with_mnemonic = Button.new_with_mnemonic
let new_from_icon_name = Button.new_from_icon_name

let get_label t = Option.value ~default:"" (Button.get_label t)
let set_label = Button.set_label

let get_has_frame = Button.get_has_frame
let set_has_frame = Button.set_has_frame

let get_use_underline = Button.get_use_underline
let set_use_underline = Button.set_use_underline

let get_icon_name t = Option.value ~default:"" (Button.get_icon_name t)
let set_icon_name = Button.set_icon_name

let get_can_shrink = Button.get_can_shrink
let set_can_shrink = Button.set_can_shrink

let get_child = Button.get_child
let set_child = Button.set_child
