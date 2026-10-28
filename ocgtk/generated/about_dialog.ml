class type about_dialog_t = object
  inherit Window.window_t

  (** {2:signals Signals} *)

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted every time a URL is activated.

      Applications may connect to it to override the default behaviour, which is
      to call [Gtk.FileLauncher.launch]. *)

  (** {2:methods Methods} *)

  method add_credit_section : string -> string array -> unit
  [@@ocaml.doc "Creates a new section in the \"Credits\" page."]

  method get_artists : unit -> string array
  (** Returns the names of the artists which are displayed in the credits page.
  *)

  method get_authors : unit -> string array
  (** Returns the names of the authors which are displayed in the credits page.
  *)

  method get_comments : unit -> string option
  (** Returns the comments string. *)

  method get_copyright : unit -> string option
  (** Returns the copyright string. *)

  method get_documenters : unit -> string array
  (** Returns the name of the documenters which are displayed in the credits
      page. *)

  method get_license : unit -> string option
  (** Returns the license information. *)

  method get_logo : unit -> Ocgdk.Paintable.paintable_t option
  (** Returns the paintable displayed as logo in the about dialog. *)

  method get_logo_icon_name : unit -> string option
  (** Returns the icon name displayed as logo in the about dialog. *)

  method get_program_name : unit -> string option
  (** Returns the program name displayed in the about dialog. *)

  method get_system_information : unit -> string option
  (** Returns the system information that is shown in the about dialog. *)

  method get_translator_credits : unit -> string option
  (** Returns the translator credits string which is displayed in the credits
      page. *)

  method get_version : unit -> string option
  (** Returns the version string. *)

  method get_website : unit -> string option
  (** Returns the website URL. *)

  method get_website_label : unit -> string option
  (** Returns the label used for the website link. *)

  method get_wrap_license : unit -> bool
  (** Returns whether the license text in the about dialog is automatically
      wrapped. *)

  method set_artists : string array -> unit
  [@@ocaml.doc
    "Sets the names of the artists to be displayed\nin the \"Credits\" page."]

  method set_authors : string array -> unit
  [@@ocaml.doc
    "Sets the names of the authors which are displayed\n\
     in the \"Credits\" page of the about dialog."]

  method set_comments : string option -> unit
  (** Sets the comments string to display in the about dialog.

      This should be a short string of one or two lines. *)

  method set_copyright : string option -> unit
  (** Sets the copyright string to display in the about dialog.

      This should be a short string of one or two lines. *)

  method set_documenters : string array -> unit
  [@@ocaml.doc
    "Sets the names of the documenters which are displayed\n\
     in the \"Credits\" page."]

  method set_license : string option -> unit
  (** Sets the license information to be displayed in the about dialog.

      If [license] is [NULL], the license page is hidden. *)

  method set_logo : Ocgdk.Paintable.paintable_t option -> unit
  (** Sets the logo in the about dialog. *)

  method set_logo_icon_name : string option -> unit
  (** Sets the icon name to be displayed as logo in the about dialog. *)

  method set_program_name : string option -> unit
  (** Sets the name to display in the about dialog.

      If [name] is not set, the string returned by [g_get_application_name()] is
      used. *)

  method set_system_information : string option -> unit
  (** Sets the system information to be displayed in the about dialog.

      If [system_information] is [NULL], the system information page is hidden.

      See [Gtk.AboutDialog:system-information]. *)

  method set_translator_credits : string option -> unit
  [@@ocaml.doc
    "Sets the translator credits string which is displayed in\n\
     the credits page.\n\n\
     The intended use for this string is to display the translator\n\
     of the language which is currently used in the user interface.\n\
     Using [gettext()], a simple way to achieve that is to mark the\n\
     string for translation:\n\n\
     {[\n\
     GtkWidget *about = gtk_about_dialog_new ();\n\
    \ gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),\n\
    \                                          _(\"translator-credits\"));\n\
     ]}\n\n\
     It is a good idea to use the customary [msgid] “translator-credits”\n\
     for this purpose, since translators will already know the purpose of\n\
     that [msgid], and since [GtkAboutDialog] will detect if \
     “translator-credits”\n\
     is untranslated and omit translator credits."]

  method set_version : string option -> unit
  (** Sets the version string to display in the about dialog. *)

  method set_website : string option -> unit
  (** Sets the URL to use for the website link. *)

  method set_website_label : string -> unit
  (** Sets the label to be used for the website link. *)

  method set_wrap_license : bool -> unit
  (** Sets whether the license text in the about dialog should be automatically
      wrapped. *)

  (** {2:conversions Conversions} *)

  method as_about_dialog : Raw.About_dialog.t
end

(* High-level class for AboutDialog *)
class about_dialog (obj : Raw.About_dialog.t) : about_dialog_t =
  object (self)
    inherit Window.window (obj :> Raw.Window.t)

    method on_activate_link ?(after = false) ~callback () =
      Raw.About_dialog.on_activate_link ~after self#as_about_dialog ~callback

    method add_credit_section : string -> string array -> unit =
      fun section_name people ->
        Raw.About_dialog.add_credit_section obj section_name people

    method get_artists : unit -> string array =
      fun () -> Raw.About_dialog.get_artists obj

    method get_authors : unit -> string array =
      fun () -> Raw.About_dialog.get_authors obj

    method get_comments : unit -> string option =
      fun () -> Raw.About_dialog.get_comments obj

    method get_copyright : unit -> string option =
      fun () -> Raw.About_dialog.get_copyright obj

    method get_documenters : unit -> string array =
      fun () -> Raw.About_dialog.get_documenters obj

    method get_license : unit -> string option =
      fun () -> Raw.About_dialog.get_license obj

    method get_logo : unit -> Ocgdk.Paintable.paintable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.About_dialog.get_logo obj)

    method get_logo_icon_name : unit -> string option =
      fun () -> Raw.About_dialog.get_logo_icon_name obj

    method get_program_name : unit -> string option =
      fun () -> Raw.About_dialog.get_program_name obj

    method get_system_information : unit -> string option =
      fun () -> Raw.About_dialog.get_system_information obj

    method get_translator_credits : unit -> string option =
      fun () -> Raw.About_dialog.get_translator_credits obj

    method get_version : unit -> string option =
      fun () -> Raw.About_dialog.get_version obj

    method get_website : unit -> string option =
      fun () -> Raw.About_dialog.get_website obj

    method get_website_label : unit -> string option =
      fun () -> Raw.About_dialog.get_website_label obj

    method get_wrap_license : unit -> bool =
      fun () -> Raw.About_dialog.get_wrap_license obj

    method set_artists : string array -> unit =
      fun artists -> Raw.About_dialog.set_artists obj artists

    method set_authors : string array -> unit =
      fun authors -> Raw.About_dialog.set_authors obj authors

    method set_comments : string option -> unit =
      fun comments -> Raw.About_dialog.set_comments obj comments

    method set_copyright : string option -> unit =
      fun copyright -> Raw.About_dialog.set_copyright obj copyright

    method set_documenters : string array -> unit =
      fun documenters -> Raw.About_dialog.set_documenters obj documenters

    method set_license : string option -> unit =
      fun license -> Raw.About_dialog.set_license obj license

    method set_logo : Ocgdk.Paintable.paintable_t option -> unit =
      fun logo ->
        let logo = Option.map (fun c -> c#as_paintable) logo in
        Raw.About_dialog.set_logo obj logo

    method set_logo_icon_name : string option -> unit =
      fun icon_name -> Raw.About_dialog.set_logo_icon_name obj icon_name

    method set_program_name : string option -> unit =
      fun name -> Raw.About_dialog.set_program_name obj name

    method set_system_information : string option -> unit =
      fun system_information ->
        Raw.About_dialog.set_system_information obj system_information

    method set_translator_credits : string option -> unit =
      fun translator_credits ->
        Raw.About_dialog.set_translator_credits obj translator_credits

    method set_version : string option -> unit =
      fun version -> Raw.About_dialog.set_version obj version

    method set_website : string option -> unit =
      fun website -> Raw.About_dialog.set_website obj website

    method set_website_label : string -> unit =
      fun website_label -> Raw.About_dialog.set_website_label obj website_label

    method set_wrap_license : bool -> unit =
      fun wrap_license -> Raw.About_dialog.set_wrap_license obj wrap_license

    method as_about_dialog = obj
  end

let new_ () : about_dialog_t = new about_dialog (Raw.About_dialog.new_ ())
