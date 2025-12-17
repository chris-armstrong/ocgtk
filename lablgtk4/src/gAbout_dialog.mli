class about_dialog : About_dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gabout_dialog_signals.about_dialog_signals
    method get_artists : unit -> unit
    method get_authors : unit -> unit
    method get_comments : unit -> string option
    method get_copyright : unit -> string option
    method get_documenters : unit -> unit
    method get_license : unit -> string option
    method get_logo_icon_name : unit -> string option
    method get_program_name : unit -> string option
    method get_system_information : unit -> string option
    method get_translator_credits : unit -> string option
    method get_version : unit -> string option
    method get_website : unit -> string option
    method get_website_label : unit -> string option
    method get_wrap_license : unit -> bool
    method set_comments : string option -> unit
    method set_copyright : string option -> unit
    method set_license : string option -> unit
    method set_logo_icon_name : string option -> unit
    method set_program_name : string option -> unit
    method set_system_information : string option -> unit
    method set_translator_credits : string option -> unit
    method set_version : string option -> unit
    method set_website : string option -> unit
    method set_website_label : string -> unit
    method set_wrap_license : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_about_dialog : About_dialog.t
  end

