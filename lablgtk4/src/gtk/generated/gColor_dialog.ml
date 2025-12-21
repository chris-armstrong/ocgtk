(* High-level class for ColorDialog *)
class color_dialog (obj : Color_dialog.t) = object (self)

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

