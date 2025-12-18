(* High-level class for PrintDialog *)
class print_dialog (obj : Print_dialog.t) = object (self)

  method accept_label = Print_dialog.get_accept_label obj
  method set_accept_label v = Print_dialog.set_accept_label obj v

  method modal = Print_dialog.get_modal obj
  method set_modal v = Print_dialog.set_modal obj v

  method title = Print_dialog.get_title obj
  method set_title v = Print_dialog.set_title obj v

    method as_print_dialog = obj
end

