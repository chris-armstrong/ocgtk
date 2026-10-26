class type color_dialog_t = object
  method choose_rgba_finish :
    Ocgio.Async_result.async_result_t -> (Ocgdk.Rgb_a.rgb_a_t, GError.t) result

  method get_modal : unit -> bool
  method get_title : unit -> string
  method get_with_alpha : unit -> bool
  method set_modal : bool -> unit
  method set_title : string -> unit
  method set_with_alpha : bool -> unit
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
