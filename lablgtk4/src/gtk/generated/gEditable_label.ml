(* High-level class for EditableLabel *)
class editable_label (obj : Editable_label.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Editable_label.as_widget obj)

  method editing = Editable_label.get_editing obj
  method set_editing v = Editable_label.set_editing obj v

  method start_editing : unit -> unit = fun () -> (Editable_label.start_editing obj )

  method stop_editing : bool -> unit = fun commit -> (Editable_label.stop_editing obj commit)

  method as_widget = (Editable_label.as_widget obj)
    method as_editable_label = obj
end

