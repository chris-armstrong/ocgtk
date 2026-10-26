class type print_setup_t = object
  method get_page_setup : unit -> GPage_setup.page_setup_t
  method get_print_settings : unit -> GPrint_settings.print_settings_t
  method ref : unit -> Print_setup.t
  method as_print_setup : Print_setup.t
end

(* High-level class for PrintSetup *)
class print_setup (obj : Print_setup.t) : print_setup_t =
  object (self)
    method get_page_setup : unit -> GPage_setup.page_setup_t =
      fun () -> new GPage_setup.page_setup (Print_setup.get_page_setup obj)

    method get_print_settings : unit -> GPrint_settings.print_settings_t =
      fun () ->
        new GPrint_settings.print_settings (Print_setup.get_print_settings obj)

    method ref : unit -> Print_setup.t = fun () -> Print_setup.ref obj
    method as_print_setup = obj
  end
