(* High-level class for FileChooser *)
class file_chooser (obj : File_chooser.t) = object (self)

  method create_folders = File_chooser.get_create_folders obj
  method set_create_folders v = File_chooser.set_create_folders obj v

  method select_multiple = File_chooser.get_select_multiple obj
  method set_select_multiple v = File_chooser.set_select_multiple obj v

  method add_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit = fun filter -> (File_chooser.add_filter obj ( filter#as_file_filter ))

  method get_action : unit -> Gtk_enums.filechooseraction = fun () -> (File_chooser.get_action obj )

  method get_choice : string -> string option = fun id -> (File_chooser.get_choice obj id)

  method get_filter : unit -> GFile_filter.file_filter option = fun () -> Option.map (fun ret -> new GFile_filter.file_filter ret) (File_chooser.get_filter obj )

  method remove_choice : string -> unit = fun id -> (File_chooser.remove_choice obj id)

  method remove_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit = fun filter -> (File_chooser.remove_filter obj ( filter#as_file_filter ))

  method set_action : Gtk_enums.filechooseraction -> unit = fun action -> (File_chooser.set_action obj action)

  method set_choice : string -> string -> unit = fun id option -> (File_chooser.set_choice obj id option)

  method set_current_name : string -> unit = fun name -> (File_chooser.set_current_name obj name)

  method set_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit = fun filter -> (File_chooser.set_filter obj ( filter#as_file_filter ))

    method as_file_chooser = obj
end

