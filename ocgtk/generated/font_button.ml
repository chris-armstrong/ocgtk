class type font_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the font button is activated.

      The [::activate] signal on [GtkFontButton] is an action signal and
      emitting it causes the button to present its dialog. *)

  method on_font_set :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user selects a font.

      When handling this signal, use [Gtk.FontChooser.get_font] to find out
      which font was just selected.

      Note that this signal is only emitted when the user changes the font. If
      you need to react to programmatic font changes as well, use the
      notify::font signal. *)

  method get_modal : unit -> bool
  (** Gets whether the dialog is modal. *)

  method get_title : unit -> string
  (** Retrieves the title of the font chooser dialog. *)

  method get_use_font : unit -> bool
  (** Returns whether the selected font is used in the label. *)

  method get_use_size : unit -> bool
  (** Returns whether the selected size is used in the label. *)

  method set_modal : bool -> unit
  (** Sets whether the dialog should be modal. *)

  method set_title : string -> unit
  (** Sets the title for the font chooser dialog. *)

  method set_use_font : bool -> unit
  (** If [use_font] is [TRUE], the font name will be written using the selected
      font. *)

  method set_use_size : bool -> unit
  (** If [use_size] is [TRUE], the font name will be written using the selected
      size. *)

  method as_font_button : Raw.Font_button.t
end

(* High-level class for FontButton *)
class font_button (obj : Raw.Font_button.t) : font_button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Font_chooser.font_chooser (Raw.Font_chooser.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Font_button.on_activate ~after self#as_font_button ~callback

    method on_font_set ?(after = false) ~callback () =
      Raw.Font_button.on_font_set ~after self#as_font_button ~callback

    method get_modal : unit -> bool = fun () -> Raw.Font_button.get_modal obj
    method get_title : unit -> string = fun () -> Raw.Font_button.get_title obj

    method get_use_font : unit -> bool =
      fun () -> Raw.Font_button.get_use_font obj

    method get_use_size : unit -> bool =
      fun () -> Raw.Font_button.get_use_size obj

    method set_modal : bool -> unit =
      fun modal -> Raw.Font_button.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Font_button.set_title obj title

    method set_use_font : bool -> unit =
      fun use_font -> Raw.Font_button.set_use_font obj use_font

    method set_use_size : bool -> unit =
      fun use_size -> Raw.Font_button.set_use_size obj use_size

    method as_font_button = obj
  end

let new_ () : font_button_t = new font_button (Raw.Font_button.new_ ())

let new_with_font (fontname : string) : font_button_t =
  let obj_ = Raw.Font_button.new_with_font fontname in
  new font_button obj_
