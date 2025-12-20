(* High-level class for ShortcutLabel *)
class shortcut_label (obj : Shortcut_label.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcut_label.as_widget obj)

  method get_accelerator : unit -> string option =
    fun () ->
      (Shortcut_label.get_accelerator obj)

  method get_disabled_text : unit -> string option =
    fun () ->
      (Shortcut_label.get_disabled_text obj)

  method set_accelerator : string -> unit =
    fun accelerator ->
      (Shortcut_label.set_accelerator obj accelerator)

  method set_disabled_text : string -> unit =
    fun disabled_text ->
      (Shortcut_label.set_disabled_text obj disabled_text)

  method as_widget = (Shortcut_label.as_widget obj)
    method as_shortcut_label = obj
end

