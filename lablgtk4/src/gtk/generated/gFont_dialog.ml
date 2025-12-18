(* High-level class for FontDialog *)
class font_dialog (obj : Font_dialog.t) = object (self)

  method modal = Font_dialog.get_modal obj
  method set_modal v = Font_dialog.set_modal obj v

  method title = Font_dialog.get_title obj
  method set_title v = Font_dialog.set_title obj v

  method get_filter : unit -> GFilter.filter option = fun () -> Option.map (fun ret -> new GFilter.filter ret) (Font_dialog.get_filter obj )

  method set_filter : 'p1. (#GFilter.filter as 'p1) option -> unit = fun filter -> (Font_dialog.set_filter obj ( filter |> Option.map (fun x -> x#as_filter) ))

    method as_font_dialog = obj
end

