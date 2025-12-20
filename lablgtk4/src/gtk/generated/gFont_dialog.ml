(* High-level class for FontDialog *)
class font_dialog (obj : Font_dialog.t) = object (self)

  method get_filter : unit -> GFilter.filter option =
    fun () ->
      Option.map (fun ret -> new GFilter.filter ret) (Font_dialog.get_filter obj)

  method get_modal : unit -> bool =
    fun () ->
      (Font_dialog.get_modal obj)

  method get_title : unit -> string =
    fun () ->
      (Font_dialog.get_title obj)

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit =
    fun filter ->
      let filter = Option.map (fun (c) -> c#as_filter) filter in
      (Font_dialog.set_filter obj filter)

  method set_modal : bool -> unit =
    fun modal ->
      (Font_dialog.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Font_dialog.set_title obj title)

    method as_font_dialog = obj
end

