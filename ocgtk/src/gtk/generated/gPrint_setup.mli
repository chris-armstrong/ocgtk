class type print_setup_t = object
    method get_page_setup : unit -> GPage_setup.page_setup_t option
    method get_print_settings : unit -> GPrint_settings.print_settings_t option
    method ref : unit -> Print_setup.t
    method unref : unit -> unit
    method as_print_setup : Print_setup.t
end

class print_setup : Print_setup.t -> print_setup_t

