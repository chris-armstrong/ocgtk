class type editable_label_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_editing : unit -> bool
    method start_editing : unit -> unit
    method stop_editing : bool -> unit
    method as_editable_label : Editable_label.t
end

(* High-level class for EditableLabel *)
class editable_label (obj : Editable_label.t) : editable_label_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_editing : unit -> bool =
    fun () ->
      (Editable_label.get_editing obj)

  method start_editing : unit -> unit =
    fun () ->
      (Editable_label.start_editing obj)

  method stop_editing : bool -> unit =
    fun commit ->
      (Editable_label.stop_editing obj commit)

    method as_editable_label = obj
end

let new_ (str : string) : editable_label_t =
  new editable_label (Editable_label.new_ str)

