class type print_setup_t = object
  method get_page_setup : unit -> Page_setup.page_setup_t
  method get_print_settings : unit -> Print_settings.print_settings_t
  method ref : unit -> Raw.Print_setup.t
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
