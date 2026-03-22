(* Signal class defined in gabout_dialog_signals.ml *)

class type about_dialog_t = object
    inherit GApplication_and__window_and__window_group.window_t
    inherit Gabout_dialog_signals.about_dialog_signals
    method add_credit_section : string -> string array -> unit
    method get_artists : unit -> string array
    method get_authors : unit -> string array
    method get_comments : unit -> string option
    method get_copyright : unit -> string option
    method get_documenters : unit -> string array
    method get_license : unit -> string option
    method get_logo : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
    method get_logo_icon_name : unit -> string option
    method get_program_name : unit -> string option
    method get_system_information : unit -> string option
    method get_translator_credits : unit -> string option
    method get_version : unit -> string option
    method get_website : unit -> string option
    method get_website_label : unit -> string option
    method get_wrap_license : unit -> bool
    method set_artists : string array -> unit
    method set_authors : string array -> unit
    method set_comments : string option -> unit
    method set_copyright : string option -> unit
    method set_documenters : string array -> unit
    method set_license : string option -> unit
    method set_logo : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit
    method set_logo_icon_name : string option -> unit
    method set_program_name : string option -> unit
    method set_system_information : string option -> unit
    method set_translator_credits : string option -> unit
    method set_version : string option -> unit
    method set_website : string option -> unit
    method set_website_label : string -> unit
    method set_wrap_license : bool -> unit
    method as_about_dialog : About_dialog.t
end

(* High-level class for AboutDialog *)
class about_dialog (obj : About_dialog.t) : about_dialog_t = object (self)
  inherit GApplication_and__window_and__window_group.window (Obj.magic obj : Application_and__window_and__window_group.Window.t)
  inherit Gabout_dialog_signals.about_dialog_signals obj

  method add_credit_section : string -> string array -> unit =
    fun section_name people ->
      (About_dialog.add_credit_section obj section_name people)

  method get_artists : unit -> string array =
    fun () ->
      (About_dialog.get_artists obj)

  method get_authors : unit -> string array =
    fun () ->
      (About_dialog.get_authors obj)

  method get_comments : unit -> string option =
    fun () ->
      (About_dialog.get_comments obj)

  method get_copyright : unit -> string option =
    fun () ->
      (About_dialog.get_copyright obj)

  method get_documenters : unit -> string array =
    fun () ->
      (About_dialog.get_documenters obj)

  method get_license : unit -> string option =
    fun () ->
      (About_dialog.get_license obj)

  method get_logo : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret) (About_dialog.get_logo obj)

  method get_logo_icon_name : unit -> string option =
    fun () ->
      (About_dialog.get_logo_icon_name obj)

  method get_program_name : unit -> string option =
    fun () ->
      (About_dialog.get_program_name obj)

  method get_system_information : unit -> string option =
    fun () ->
      (About_dialog.get_system_information obj)

  method get_translator_credits : unit -> string option =
    fun () ->
      (About_dialog.get_translator_credits obj)

  method get_version : unit -> string option =
    fun () ->
      (About_dialog.get_version obj)

  method get_website : unit -> string option =
    fun () ->
      (About_dialog.get_website obj)

  method get_website_label : unit -> string option =
    fun () ->
      (About_dialog.get_website_label obj)

  method get_wrap_license : unit -> bool =
    fun () ->
      (About_dialog.get_wrap_license obj)

  method set_artists : string array -> unit =
    fun artists ->
      (About_dialog.set_artists obj artists)

  method set_authors : string array -> unit =
    fun authors ->
      (About_dialog.set_authors obj authors)

  method set_comments : string option -> unit =
    fun comments ->
      (About_dialog.set_comments obj comments)

  method set_copyright : string option -> unit =
    fun copyright ->
      (About_dialog.set_copyright obj copyright)

  method set_documenters : string array -> unit =
    fun documenters ->
      (About_dialog.set_documenters obj documenters)

  method set_license : string option -> unit =
    fun license ->
      (About_dialog.set_license obj license)

  method set_logo : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit =
    fun logo ->
      let logo = Option.map (fun (c) -> c#as_paintable) logo in
      (About_dialog.set_logo obj logo)

  method set_logo_icon_name : string option -> unit =
    fun icon_name ->
      (About_dialog.set_logo_icon_name obj icon_name)

  method set_program_name : string option -> unit =
    fun name ->
      (About_dialog.set_program_name obj name)

  method set_system_information : string option -> unit =
    fun system_information ->
      (About_dialog.set_system_information obj system_information)

  method set_translator_credits : string option -> unit =
    fun translator_credits ->
      (About_dialog.set_translator_credits obj translator_credits)

  method set_version : string option -> unit =
    fun version ->
      (About_dialog.set_version obj version)

  method set_website : string option -> unit =
    fun website ->
      (About_dialog.set_website obj website)

  method set_website_label : string -> unit =
    fun website_label ->
      (About_dialog.set_website_label obj website_label)

  method set_wrap_license : bool -> unit =
    fun wrap_license ->
      (About_dialog.set_wrap_license obj wrap_license)

    method as_about_dialog = obj
end

let new_ () : about_dialog_t =
  new about_dialog (About_dialog.new_ ())

