class about_dialog : About_dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gabout_dialog_signals.about_dialog_signals
    method comments : string
    method set_comments : string -> unit
    method copyright : string
    method set_copyright : string -> unit
    method license : string
    method set_license : string -> unit
    method logo_icon_name : string
    method set_logo_icon_name : string -> unit
    method program_name : string
    method set_program_name : string -> unit
    method system_information : string
    method set_system_information : string -> unit
    method translator_credits : string
    method set_translator_credits : string -> unit
    method version : string
    method set_version : string -> unit
    method website : string
    method set_website : string -> unit
    method website_label : string
    method set_website_label : string -> unit
    method wrap_license : bool
    method set_wrap_license : bool -> unit
    method get_artists : unit -> unit
    method get_authors : unit -> unit
    method get_documenters : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_about_dialog : About_dialog.t
  end

