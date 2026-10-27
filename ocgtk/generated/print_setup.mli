class type print_setup_t = object
  method get_page_setup : unit -> Page_setup.page_setup_t
  method get_print_settings : unit -> Print_settings.print_settings_t
  method ref : unit -> Raw.Print_setup.t
  method as_print_setup : Raw.Print_setup.t
end

class print_setup : Raw.Print_setup.t -> print_setup_t
