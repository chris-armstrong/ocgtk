class type shortcut_label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_accelerator : unit -> string option
  (** Retrieves the current accelerator of [self]. *)

  method get_disabled_text : unit -> string option
  (** Retrieves the text that is displayed when no accelerator is set. *)

  method set_accelerator : string -> unit
  (** Sets the accelerator to be displayed by [self]. *)

  method set_disabled_text : string -> unit
  (** Sets the text to be displayed by [self] when no accelerator is set. *)

  (** {2:conversions Conversions} *)

  method as_shortcut_label : Raw.Shortcut_label.t
end

(* High-level class for ShortcutLabel *)
class shortcut_label (obj : Raw.Shortcut_label.t) : shortcut_label_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_accelerator : unit -> string option =
      fun () -> Raw.Shortcut_label.get_accelerator obj

    method get_disabled_text : unit -> string option =
      fun () -> Raw.Shortcut_label.get_disabled_text obj

    method set_accelerator : string -> unit =
      fun accelerator -> Raw.Shortcut_label.set_accelerator obj accelerator

    method set_disabled_text : string -> unit =
      fun disabled_text ->
        Raw.Shortcut_label.set_disabled_text obj disabled_text

    method as_shortcut_label = obj
  end

let new_ (accelerator : string) : shortcut_label_t =
  let obj_ = Raw.Shortcut_label.new_ accelerator in
  new shortcut_label obj_
