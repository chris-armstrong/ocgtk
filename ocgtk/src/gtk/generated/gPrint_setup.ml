class type print_setup_t = object
  method get_page_setup : unit -> GPage_setup.page_setup_t option
  method get_print_settings : unit -> GPrint_settings.print_settings_t option
  method ref : unit -> Print_setup.t
  method unref : unit -> unit
  method as_print_setup : Print_setup.t
end

(* High-level class for PrintSetup *)
class print_setup (obj : Print_setup.t) : print_setup_t =
  object (self)
    method get_page_setup : unit -> GPage_setup.page_setup_t option =
      fun () ->
        Option.map
          (fun ret -> new GPage_setup.page_setup ret)
          (Print_setup.get_page_setup obj)

    method get_print_settings : unit -> GPrint_settings.print_settings_t option
        =
      fun () ->
        Option.map
          (fun ret -> new GPrint_settings.print_settings ret)
          (Print_setup.get_print_settings obj)

    method ref : unit -> Print_setup.t = fun () -> Print_setup.ref obj
    method unref : unit -> unit = fun () -> Print_setup.unref obj
    method as_print_setup = obj
  end
