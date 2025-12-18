(* High-level class for FileDialog *)
class file_dialog (obj : File_dialog.t) = object (self)

  method get_accept_label : unit -> string option = fun () -> (File_dialog.get_accept_label obj )

  method get_default_filter : unit -> GFile_filter.file_filter option = fun () -> Option.map (fun ret -> new GFile_filter.file_filter ret) (File_dialog.get_default_filter obj )

  method get_initial_name : unit -> string option = fun () -> (File_dialog.get_initial_name obj )

  method get_modal : unit -> bool = fun () -> (File_dialog.get_modal obj )

  method get_title : unit -> string = fun () -> (File_dialog.get_title obj )

  method set_accept_label : string option -> unit = fun accept_label -> (File_dialog.set_accept_label obj accept_label)

  method set_default_filter : 'p1. (#GFile_filter.file_filter as 'p1) option -> unit = fun filter -> (File_dialog.set_default_filter obj ( filter |> Option.map (fun x -> x#as_file_filter) ))

  method set_initial_name : string option -> unit = fun name -> (File_dialog.set_initial_name obj name)

  method set_modal : bool -> unit = fun modal -> (File_dialog.set_modal obj modal)

  method set_title : string -> unit = fun title -> (File_dialog.set_title obj title)

    method as_file_dialog = obj
end

