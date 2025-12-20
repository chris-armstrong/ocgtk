(* High-level class for EditableLabel *)
class editable_label (obj : Editable_label.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Editable_label.as_widget obj)

  method get_editing : unit -> bool =
    fun () ->
      (Editable_label.get_editing obj)

  method start_editing : unit -> unit =
    fun () ->
      (Editable_label.start_editing obj)

  method stop_editing : bool -> unit =
    fun commit ->
      (Editable_label.stop_editing obj commit)

  method as_widget = (Editable_label.as_widget obj)
    method as_editable_label = obj
end

