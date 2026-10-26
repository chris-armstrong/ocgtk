class type print_operation_t = object
  inherit Print_operation_preview.print_operation_preview_t

  method on_begin_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_custom_widget_apply :
    ?after:bool ->
    callback:
      (widget:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_done_ :
    ?after:bool ->
    callback:(result:Enums.printoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_draw_page :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> page_nr:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_end_print :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_paginate :
    ?after:bool ->
    callback:(context:Print_context.print_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_preview :
    ?after:bool ->
    callback:
      (preview:Print_operation_preview.print_operation_preview_t ->
      context:Print_context.print_context_t ->
      parent:Application_and__window_and__window_group.window_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_request_page_setup :
    ?after:bool ->
    callback:
      (context:Print_context.print_context_t ->
      page_nr:int ->
      setup:Page_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_status_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_update_custom_widget :
    ?after:bool ->
    callback:
      (widget:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      setup:Page_setup.page_setup_t ->
      settings:Print_settings.print_settings_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method cancel : unit -> unit
  method draw_page_finish : unit -> unit
  method get_default_page_setup : unit -> Page_setup.page_setup_t
  method get_embed_page_setup : unit -> bool
  method get_error : unit -> (unit, GError.t) result
  method get_has_selection : unit -> bool
  method get_n_pages_to_print : unit -> int
  method get_print_settings : unit -> Print_settings.print_settings_t option
  method get_status : unit -> Enums.printstatus
  method get_status_string : unit -> string
  method get_support_selection : unit -> bool
  method is_finished : unit -> bool

  method run :
    Enums.printoperationaction ->
    Application_and__window_and__window_group.window_t option ->
    (Enums.printoperationresult, GError.t) result

  method set_allow_async : bool -> unit
  method set_current_page : int -> unit
  method set_custom_tab_label : string option -> unit
  method set_default_page_setup : Page_setup.page_setup_t option -> unit
  method set_defer_drawing : unit -> unit
  method set_embed_page_setup : bool -> unit
  method set_export_filename : string -> unit
  method set_has_selection : bool -> unit
  method set_job_name : string -> unit
  method set_n_pages : int -> unit
  method set_print_settings : Print_settings.print_settings_t option -> unit
  method set_show_progress : bool -> unit
  method set_support_selection : bool -> unit
  method set_track_print_status : bool -> unit
  method set_unit : Enums.unit -> unit
  method set_use_full_page : bool -> unit
  method as_print_operation : Raw.Print_operation.t
end

class print_operation : Raw.Print_operation.t -> print_operation_t

val new_ : unit -> print_operation_t
