(* High-level class for ShortcutLabel *)
class shortcut_label (obj : Shortcut_label.t) = object (self)

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

