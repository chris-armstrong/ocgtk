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

class about_dialog : About_dialog.t -> about_dialog_t

val new_ : unit -> about_dialog_t
