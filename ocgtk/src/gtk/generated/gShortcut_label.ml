class type shortcut_label_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_accelerator : unit -> string option
    method get_disabled_text : unit -> string option
    method set_accelerator : string -> unit
    method set_disabled_text : string -> unit
    method as_shortcut_label : Shortcut_label.t
end

(* High-level class for ShortcutLabel *)
class shortcut_label (obj : Shortcut_label.t) : shortcut_label_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

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

    method as_shortcut_label = obj
end

let new_ (accelerator : string) : shortcut_label_t =
  new shortcut_label (Shortcut_label.new_ accelerator)

