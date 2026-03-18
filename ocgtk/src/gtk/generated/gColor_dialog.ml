(* High-level class for ColorDialog *)
class color_dialog (obj : Color_dialog.t) = object (self)

  method choose_rgba_finish : 'p1. (#Ocgtk_gio.Gio.async_result as 'p1) -> (Ocgtk_gdk.Gdk.rgb_a option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new Ocgtk_gdk.Gdk.rgb_a ret) ret)(Color_dialog.choose_rgba_finish obj result)

  method get_modal : unit -> bool =
    fun () ->
      (Color_dialog.get_modal obj)

  method get_title : unit -> string =
    fun () ->
      (Color_dialog.get_title obj)

  method get_with_alpha : unit -> bool =
    fun () ->
      (Color_dialog.get_with_alpha obj)

  method set_modal : bool -> unit =
    fun modal ->
      (Color_dialog.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Color_dialog.set_title obj title)

  method set_with_alpha : bool -> unit =
    fun with_alpha ->
      (Color_dialog.set_with_alpha obj with_alpha)

    method as_color_dialog = obj
end

