(* High-level class for FileChooser *)
class file_chooser (obj : File_chooser.t) = object (self)

  method add_choice : string -> string -> string array option -> string array option -> unit =
    fun id label options option_labels ->
      (File_chooser.add_choice obj id label options option_labels)

  method add_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit =
    fun filter ->
      let filter = filter#as_file_filter in
      (File_chooser.add_filter obj filter)

  method add_shortcut_folder : 'p1. (#Ocgtk_gio.Gio.file as 'p1) -> (bool, GError.t) result =
    fun folder ->
      let folder = folder#as_file in
      (File_chooser.add_shortcut_folder obj folder)

  method get_action : unit -> Gtk_enums.filechooseraction =
    fun () ->
      (File_chooser.get_action obj)

  method get_choice : string -> string option =
    fun id ->
      (File_chooser.get_choice obj id)

  method get_create_folders : unit -> bool =
    fun () ->
      (File_chooser.get_create_folders obj)

  method get_current_folder : unit -> Ocgtk_gio.Gio.file option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (File_chooser.get_current_folder obj)

  method get_current_name : unit -> string option =
    fun () ->
      (File_chooser.get_current_name obj)

  method get_file : unit -> Ocgtk_gio.Gio.file option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (File_chooser.get_file obj)

  method get_files : unit -> Ocgtk_gio.Gio.list_model =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(File_chooser.get_files obj)

  method get_filter : unit -> GFile_filter.file_filter option =
    fun () ->
      Option.map (fun ret -> new GFile_filter.file_filter ret) (File_chooser.get_filter obj)

  method get_filters : unit -> Ocgtk_gio.Gio.list_model =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(File_chooser.get_filters obj)

  method get_select_multiple : unit -> bool =
    fun () ->
      (File_chooser.get_select_multiple obj)

  method get_shortcut_folders : unit -> Ocgtk_gio.Gio.list_model =
    fun () ->
      new  Ocgtk_gio.Gio.list_model(File_chooser.get_shortcut_folders obj)

  method remove_choice : string -> unit =
    fun id ->
      (File_chooser.remove_choice obj id)

  method remove_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit =
    fun filter ->
      let filter = filter#as_file_filter in
      (File_chooser.remove_filter obj filter)

  method remove_shortcut_folder : 'p1. (#Ocgtk_gio.Gio.file as 'p1) -> (bool, GError.t) result =
    fun folder ->
      let folder = folder#as_file in
      (File_chooser.remove_shortcut_folder obj folder)

  method set_action : Gtk_enums.filechooseraction -> unit =
    fun action ->
      (File_chooser.set_action obj action)

  method set_choice : string -> string -> unit =
    fun id option ->
      (File_chooser.set_choice obj id option)

  method set_create_folders : bool -> unit =
    fun create_folders ->
      (File_chooser.set_create_folders obj create_folders)

  method set_current_folder : 'p1. (#Ocgtk_gio.Gio.file as 'p1) option -> (bool, GError.t) result =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (File_chooser.set_current_folder obj file)

  method set_current_name : string -> unit =
    fun name ->
      (File_chooser.set_current_name obj name)

  method set_file : 'p1. (#Ocgtk_gio.Gio.file as 'p1) -> (bool, GError.t) result =
    fun file ->
      let file = file#as_file in
      (File_chooser.set_file obj file)

  method set_filter : 'p1. (#GFile_filter.file_filter as 'p1) -> unit =
    fun filter ->
      let filter = filter#as_file_filter in
      (File_chooser.set_filter obj filter)

  method set_select_multiple : bool -> unit =
    fun select_multiple ->
      (File_chooser.set_select_multiple obj select_multiple)

    method as_file_chooser = obj
end

