(* High-level class for ComboBoxText *)
class combo_box_text (obj : Combo_box_text.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Combo_box_text.as_widget obj)

  method append : string option -> string -> unit = fun id text -> (Combo_box_text.append obj id text)

  method append_text : string -> unit = fun text -> (Combo_box_text.append_text obj text)

  method insert : int -> string option -> string -> unit = fun position id text -> (Combo_box_text.insert obj position id text)

  method insert_text : int -> string -> unit = fun position text -> (Combo_box_text.insert_text obj position text)

  method prepend : string option -> string -> unit = fun id text -> (Combo_box_text.prepend obj id text)

  method prepend_text : string -> unit = fun text -> (Combo_box_text.prepend_text obj text)

  method remove : int -> unit = fun position -> (Combo_box_text.remove obj position)

  method remove_all : unit -> unit = fun () -> (Combo_box_text.remove_all obj )

  method as_widget = (Combo_box_text.as_widget obj)
    method as_combo_box_text = obj
end

