class combo_box_text : Combo_box_text.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method append : string option -> string -> unit
    method append_text : string -> unit
    method insert : int -> string option -> string -> unit
    method insert_text : int -> string -> unit
    method prepend : string option -> string -> unit
    method prepend_text : string -> unit
    method remove : int -> unit
    method remove_all : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_combo_box_text : Combo_box_text.t
  end

