class type color_dialog_t = object
  method choose_rgba_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t option, GError.t) result

  method get_modal : unit -> bool
  method get_title : unit -> string
  method get_with_alpha : unit -> bool
  method set_modal : bool -> unit
  method set_title : string -> unit
  method set_with_alpha : bool -> unit
  method as_color_dialog : Color_dialog.t
end

(* High-level class for ColorDialog *)
class color_dialog (obj : Color_dialog.t) : color_dialog_t =
  object (self)
    method choose_rgba_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgtk_gdk.Gdk.Rgb_a.rgb_a ret) ret)
          (Color_dialog.choose_rgba_finish obj result)

    method get_modal : unit -> bool = fun () -> Color_dialog.get_modal obj
    method get_title : unit -> string = fun () -> Color_dialog.get_title obj

    method get_with_alpha : unit -> bool =
      fun () -> Color_dialog.get_with_alpha obj

    method set_modal : bool -> unit =
      fun modal -> Color_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Color_dialog.set_title obj title

    method set_with_alpha : bool -> unit =
      fun with_alpha -> Color_dialog.set_with_alpha obj with_alpha

    method as_color_dialog = obj
  end

let new_ () : color_dialog_t = new color_dialog (Color_dialog.new_ ())
