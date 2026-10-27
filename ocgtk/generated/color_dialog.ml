class type color_dialog_t = object
  method choose_rgba_finish :
    Ocgio.Async_result.async_result_t -> (Ocgdk.Rgb_a.rgb_a_t, GError.t) result
  (** Finishes the [Gtk.ColorDialog.choose_rgba] call

      Note that this function returns a [Gtk.DialogError.DISMISSED] error if the
      user cancels the dialog. *)

  method get_modal : unit -> bool
  (** Returns whether the color chooser dialog blocks interaction with the
      parent window while it is presented. *)

  method get_title : unit -> string
  (** Returns the title that will be shown on the color chooser dialog. *)

  method get_with_alpha : unit -> bool
  (** Returns whether colors may have alpha. *)

  method set_modal : bool -> unit
  (** Sets whether the color chooser dialog blocks interaction with the parent
      window while it is presented. *)

  method set_title : string -> unit
  (** Sets the title that will be shown on the color chooser dialog. *)

  method set_with_alpha : bool -> unit
  (** Sets whether colors may have alpha. *)

  method as_color_dialog : Raw.Color_dialog.t
end

(* High-level class for ColorDialog *)
class color_dialog (obj : Raw.Color_dialog.t) : color_dialog_t =
  object (self)
    method choose_rgba_finish :
        Ocgio.Async_result.async_result_t ->
        (Ocgdk.Rgb_a.rgb_a_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Ocgdk.Rgb_a.rgb_a ret)
          (Raw.Color_dialog.choose_rgba_finish obj result)

    method get_modal : unit -> bool = fun () -> Raw.Color_dialog.get_modal obj
    method get_title : unit -> string = fun () -> Raw.Color_dialog.get_title obj

    method get_with_alpha : unit -> bool =
      fun () -> Raw.Color_dialog.get_with_alpha obj

    method set_modal : bool -> unit =
      fun modal -> Raw.Color_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Color_dialog.set_title obj title

    method set_with_alpha : bool -> unit =
      fun with_alpha -> Raw.Color_dialog.set_with_alpha obj with_alpha

    method as_color_dialog = obj
  end

let new_ () : color_dialog_t = new color_dialog (Raw.Color_dialog.new_ ())
