class type color_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the color dialog button is activated.

      The [::activate] signal on [GtkColorDialogButton] is an action signal and
      emitting it causes the button to pop up its dialog. *)

  (** {2:methods Methods} *)

  method get_dialog : unit -> Color_dialog.color_dialog_t option
  (** Returns the [GtkColorDialog] of [self]. *)

  method get_rgba : unit -> Ocgdk.Rgb_a.rgb_a_t
  [@@ocaml.doc
    "Returns the color of the button.\n\n\
     This function is what should be used to obtain\n\
     the color that was chosen by the user. To get\n\
     informed about changes, listen to \"notify::rgba\"."]

  method set_dialog : Color_dialog.color_dialog_t -> unit
  (** Sets a [GtkColorDialog] object to use for creating the color chooser
      dialog that is presented when the user clicks the button. *)

  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Sets the color of the button. *)

  (** {2:conversions Conversions} *)

  method as_color_dialog_button : Raw.Color_dialog_button.t
end

(* High-level class for ColorDialogButton *)
class color_dialog_button (obj : Raw.Color_dialog_button.t) :
  color_dialog_button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Color_dialog_button.on_activate ~after self#as_color_dialog_button
        ~callback

    method get_dialog : unit -> Color_dialog.color_dialog_t option =
      fun () ->
        Option.map
          (fun ret -> new Color_dialog.color_dialog ret)
          (Raw.Color_dialog_button.get_dialog obj)

    method get_rgba : unit -> Ocgdk.Rgb_a.rgb_a_t =
      fun () -> new Ocgdk.Rgb_a.rgb_a (Raw.Color_dialog_button.get_rgba obj)

    method set_dialog : Color_dialog.color_dialog_t -> unit =
      fun dialog ->
        let dialog = dialog#as_color_dialog in
        Raw.Color_dialog_button.set_dialog obj dialog

    method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun color ->
        let color = color#as_rgb_a in
        Raw.Color_dialog_button.set_rgba obj color

    method as_color_dialog_button = obj
  end

let new_ (dialog : Color_dialog.color_dialog_t option) : color_dialog_button_t =
  let dialog = Option.map (fun c -> c#as_color_dialog) dialog in
  let obj_ = Raw.Color_dialog_button.new_ dialog in
  new color_dialog_button obj_
