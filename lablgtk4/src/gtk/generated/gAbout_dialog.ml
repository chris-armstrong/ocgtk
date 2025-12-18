(* Signal class defined in gabout_dialog_signals.ml *)

(* High-level class for AboutDialog *)
class about_dialog (obj : About_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (About_dialog.as_widget obj)
  inherit Gabout_dialog_signals.about_dialog_signals obj

  method comments = About_dialog.get_comments obj
  method set_comments v = About_dialog.set_comments obj v

  method copyright = About_dialog.get_copyright obj
  method set_copyright v = About_dialog.set_copyright obj v

  method license = About_dialog.get_license obj
  method set_license v = About_dialog.set_license obj v

  method logo_icon_name = About_dialog.get_logo_icon_name obj
  method set_logo_icon_name v = About_dialog.set_logo_icon_name obj v

  method program_name = About_dialog.get_program_name obj
  method set_program_name v = About_dialog.set_program_name obj v

  method system_information = About_dialog.get_system_information obj
  method set_system_information v = About_dialog.set_system_information obj v

  method translator_credits = About_dialog.get_translator_credits obj
  method set_translator_credits v = About_dialog.set_translator_credits obj v

  method version = About_dialog.get_version obj
  method set_version v = About_dialog.set_version obj v

  method website = About_dialog.get_website obj
  method set_website v = About_dialog.set_website obj v

  method website_label = About_dialog.get_website_label obj
  method set_website_label v = About_dialog.set_website_label obj v

  method wrap_license = About_dialog.get_wrap_license obj
  method set_wrap_license v = About_dialog.set_wrap_license obj v

  method get_artists : unit -> unit = fun () -> (About_dialog.get_artists obj )

  method get_authors : unit -> unit = fun () -> (About_dialog.get_authors obj )

  method get_documenters : unit -> unit = fun () -> (About_dialog.get_documenters obj )

  method as_widget = (About_dialog.as_widget obj)
    method as_about_dialog = obj
end

