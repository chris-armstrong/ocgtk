class assistant_page : Assistant_page.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method complete : bool
    method set_complete : bool -> unit
    method page_type : Gtk_enums.assistantpagetype
    method set_page_type : Gtk_enums.assistantpagetype -> unit
    method title : string
    method set_title : string -> unit
    method as_assistant_page : Assistant_page.t
  end

