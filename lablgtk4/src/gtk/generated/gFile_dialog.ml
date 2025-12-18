(* High-level class for FileDialog *)
class file_dialog (obj : File_dialog.t) = object (self)

  method accept_label = File_dialog.get_accept_label obj
  method set_accept_label v = File_dialog.set_accept_label obj v

  method initial_name = File_dialog.get_initial_name obj
  method set_initial_name v = File_dialog.set_initial_name obj v

  method modal = File_dialog.get_modal obj
  method set_modal v = File_dialog.set_modal obj v

  method title = File_dialog.get_title obj
  method set_title v = File_dialog.set_title obj v

  method get_default_filter : unit -> GFile_filter.file_filter option = fun () -> Option.map (fun ret -> new GFile_filter.file_filter ret) (File_dialog.get_default_filter obj )

  method set_default_filter : 'p1. (#GFile_filter.file_filter as 'p1) option -> unit = fun filter -> (File_dialog.set_default_filter obj ( filter |> Option.map (fun x -> x#as_file_filter) ))

    method as_file_dialog = obj
end

