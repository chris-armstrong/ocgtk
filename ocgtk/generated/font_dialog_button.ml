class type font_dialog_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_dialog : unit -> Font_dialog.font_dialog_t option

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option

  method get_font_features : unit -> string option
  method get_language : unit -> Ocpango.Language.language_t option
  method get_level : unit -> Enums.fontlevel
  method get_use_font : unit -> bool
  method get_use_size : unit -> bool
  method set_dialog : Font_dialog.font_dialog_t -> unit
  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  method set_font_features : string option -> unit
  method set_language : Ocpango.Language.language_t option -> unit
  method set_level : Enums.fontlevel -> unit
  method set_use_font : bool -> unit
  method set_use_size : bool -> unit
  method as_font_dialog_button : Raw.Font_dialog_button.t
end

(* High-level class for FontDialogButton *)
class font_dialog_button (obj : Raw.Font_dialog_button.t) : font_dialog_button_t
  =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Font_dialog_button.on_activate ~after self#as_font_dialog_button
        ~callback

    method get_dialog : unit -> Font_dialog.font_dialog_t option =
      fun () ->
        Option.map
          (fun ret -> new Font_dialog.font_dialog ret)
          (Raw.Font_dialog_button.get_dialog obj)

    method get_font_desc :
        unit -> Ocpango.Font_description.font_description_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Font_description.font_description ret)
          (Raw.Font_dialog_button.get_font_desc obj)

    method get_font_features : unit -> string option =
      fun () -> Raw.Font_dialog_button.get_font_features obj

    method get_language : unit -> Ocpango.Language.language_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Language.language ret)
          (Raw.Font_dialog_button.get_language obj)

    method get_level : unit -> Enums.fontlevel =
      fun () -> Raw.Font_dialog_button.get_level obj

    method get_use_font : unit -> bool =
      fun () -> Raw.Font_dialog_button.get_use_font obj

    method get_use_size : unit -> bool =
      fun () -> Raw.Font_dialog_button.get_use_size obj

    method set_dialog : Font_dialog.font_dialog_t -> unit =
      fun dialog ->
        let dialog = dialog#as_font_dialog in
        Raw.Font_dialog_button.set_dialog obj dialog

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun font_desc ->
        let font_desc = font_desc#as_font_description in
        Raw.Font_dialog_button.set_font_desc obj font_desc

    method set_font_features : string option -> unit =
      fun font_features ->
        Raw.Font_dialog_button.set_font_features obj font_features

    method set_language : Ocpango.Language.language_t option -> unit =
      fun language ->
        let language = Option.map (fun c -> c#as_language) language in
        Raw.Font_dialog_button.set_language obj language

    method set_level : Enums.fontlevel -> unit =
      fun level -> Raw.Font_dialog_button.set_level obj level

    method set_use_font : bool -> unit =
      fun use_font -> Raw.Font_dialog_button.set_use_font obj use_font

    method set_use_size : bool -> unit =
      fun use_size -> Raw.Font_dialog_button.set_use_size obj use_size

    method as_font_dialog_button = obj
  end

let new_ (dialog : Font_dialog.font_dialog_t option) : font_dialog_button_t =
  let dialog = Option.map (fun c -> c#as_font_dialog) dialog in
  let obj_ = Raw.Font_dialog_button.new_ dialog in
  new font_dialog_button obj_
