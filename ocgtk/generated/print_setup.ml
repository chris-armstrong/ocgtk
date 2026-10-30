class type print_setup_t = object
  (** {2:methods Methods} *)

  method get_page_setup : unit -> Page_setup.page_setup_t
  (** Returns the page setup of [setup].

      It may be different from the [GtkPrintDialog]'s page setup if the user
      changed it during the setup process. *)

  method get_print_settings : unit -> Print_settings.print_settings_t
  (** Returns the print settings of [setup].

      They may be different from the [GtkPrintDialog]'s settings if the user
      changed them during the setup process. *)

  method ref : unit -> Raw.Print_setup.t
  (** Increase the reference count of [setup]. *)

  (** {2:conversions Conversions} *)

  method as_print_setup : Raw.Print_setup.t
end

(* High-level class for PrintSetup *)
class print_setup (obj : Raw.Print_setup.t) : print_setup_t =
  object (self)
    method get_page_setup : unit -> Page_setup.page_setup_t =
      fun () -> new Page_setup.page_setup (Raw.Print_setup.get_page_setup obj)

    method get_print_settings : unit -> Print_settings.print_settings_t =
      fun () ->
        new Print_settings.print_settings
          (Raw.Print_setup.get_print_settings obj)

    method ref : unit -> Raw.Print_setup.t = fun () -> Raw.Print_setup.ref obj
    method as_print_setup = obj
  end
