class type print_operation_t = object
  inherit GPrint_operation_preview.print_operation_preview_t

  method on_begin_print :
    ?after:bool ->
    callback:(context:GPrint_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_custom_widget_apply :
    ?after:bool ->
    callback:
      (widget:
         GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_done_ :
    ?after:bool ->
    callback:(result:Gtk_enums.printoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_draw_page :
    ?after:bool ->
    callback:(context:GPrint_context.print_context_t -> page_nr:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_end_print :
    ?after:bool ->
    callback:(context:GPrint_context.print_context_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_paginate :
    ?after:bool ->
    callback:(context:GPrint_context.print_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_preview :
    ?after:bool ->
    callback:
      (preview:GPrint_operation_preview.print_operation_preview_t ->
      context:GPrint_context.print_context_t ->
      parent:GApplication_and__window_and__window_group.window_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_request_page_setup :
    ?after:bool ->
    callback:
      (context:GPrint_context.print_context_t ->
      page_nr:int ->
      setup:GPage_setup.page_setup_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_status_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_update_custom_widget :
    ?after:bool ->
    callback:
      (widget:
         GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      setup:GPage_setup.page_setup_t ->
      settings:GPrint_settings.print_settings_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method cancel : unit -> unit
  method draw_page_finish : unit -> unit
  method get_default_page_setup : unit -> GPage_setup.page_setup_t
  method get_embed_page_setup : unit -> bool
  method get_error : unit -> (unit, GError.t) result
  method get_has_selection : unit -> bool
  method get_n_pages_to_print : unit -> int
  method get_print_settings : unit -> GPrint_settings.print_settings_t option
  method get_status : unit -> Gtk_enums.printstatus
  method get_status_string : unit -> string
  method get_support_selection : unit -> bool
  method is_finished : unit -> bool

  method run :
    Gtk_enums.printoperationaction ->
    GApplication_and__window_and__window_group.window_t option ->
    (Gtk_enums.printoperationresult, GError.t) result

  method set_allow_async : bool -> unit
  method set_current_page : int -> unit
  method set_custom_tab_label : string option -> unit
  method set_default_page_setup : GPage_setup.page_setup_t option -> unit
  method set_defer_drawing : unit -> unit
  method set_embed_page_setup : bool -> unit
  method set_export_filename : string -> unit
  method set_has_selection : bool -> unit
  method set_job_name : string -> unit
  method set_n_pages : int -> unit
  method set_print_settings : GPrint_settings.print_settings_t option -> unit
  method set_show_progress : bool -> unit
  method set_support_selection : bool -> unit
  method set_track_print_status : bool -> unit
  method set_unit : Gtk_enums.unit -> unit
  method set_use_full_page : bool -> unit
  method as_print_operation : Print_operation.t
end

(* High-level class for PrintOperation *)
class print_operation (obj : Print_operation.t) : print_operation_t =
  object (self)
    inherit
      GPrint_operation_preview.print_operation_preview
        (Print_operation_preview.from_gobject obj)

    method on_begin_print ?(after = false) ~callback () =
      Print_operation.on_begin_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new GPrint_context.print_context context))

    method on_custom_widget_apply ?(after = false) ~callback () =
      Print_operation.on_custom_widget_apply ~after self#as_print_operation
        ~callback:(fun ~widget ->
          callback
            ~widget:
              (new
                 GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 widget))

    method on_done_ ?(after = false) ~callback () =
      Print_operation.on_done_ ~after self#as_print_operation ~callback

    method on_draw_page ?(after = false) ~callback () =
      Print_operation.on_draw_page ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ->
          callback ~context:(new GPrint_context.print_context context) ~page_nr)

    method on_end_print ?(after = false) ~callback () =
      Print_operation.on_end_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new GPrint_context.print_context context))

    method on_paginate ?(after = false) ~callback () =
      Print_operation.on_paginate ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new GPrint_context.print_context context))

    method on_preview ?(after = false) ~callback () =
      Print_operation.on_preview ~after self#as_print_operation
        ~callback:(fun ~preview ~context ~parent ->
          callback
            ~preview:
              (new GPrint_operation_preview.print_operation_preview preview)
            ~context:(new GPrint_context.print_context context)
            ~parent:
              (Option.map
                 (fun w ->
                   new GApplication_and__window_and__window_group.window w)
                 parent))

    method on_request_page_setup ?(after = false) ~callback () =
      Print_operation.on_request_page_setup ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ~setup ->
          callback
            ~context:(new GPrint_context.print_context context)
            ~page_nr
            ~setup:(new GPage_setup.page_setup setup))

    method on_status_changed ?(after = false) ~callback () =
      Print_operation.on_status_changed ~after self#as_print_operation ~callback

    method on_update_custom_widget ?(after = false) ~callback () =
      Print_operation.on_update_custom_widget ~after self#as_print_operation
        ~callback:(fun ~widget ~setup ~settings ->
          callback
            ~widget:
              (new
                 GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 widget)
            ~setup:(new GPage_setup.page_setup setup)
            ~settings:(new GPrint_settings.print_settings settings))

    method cancel : unit -> unit = fun () -> Print_operation.cancel obj

    method draw_page_finish : unit -> unit =
      fun () -> Print_operation.draw_page_finish obj

    method get_default_page_setup : unit -> GPage_setup.page_setup_t =
      fun () ->
        new GPage_setup.page_setup (Print_operation.get_default_page_setup obj)

    method get_embed_page_setup : unit -> bool =
      fun () -> Print_operation.get_embed_page_setup obj

    method get_error : unit -> (unit, GError.t) result =
      fun () -> Print_operation.get_error obj

    method get_has_selection : unit -> bool =
      fun () -> Print_operation.get_has_selection obj

    method get_n_pages_to_print : unit -> int =
      fun () -> Print_operation.get_n_pages_to_print obj

    method get_print_settings : unit -> GPrint_settings.print_settings_t option
        =
      fun () ->
        Option.map
          (fun ret -> new GPrint_settings.print_settings ret)
          (Print_operation.get_print_settings obj)

    method get_status : unit -> Gtk_enums.printstatus =
      fun () -> Print_operation.get_status obj

    method get_status_string : unit -> string =
      fun () -> Print_operation.get_status_string obj

    method get_support_selection : unit -> bool =
      fun () -> Print_operation.get_support_selection obj

    method is_finished : unit -> bool =
      fun () -> Print_operation.is_finished obj

    method run :
        Gtk_enums.printoperationaction ->
        GApplication_and__window_and__window_group.window_t option ->
        (Gtk_enums.printoperationresult, GError.t) result =
      fun action parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Print_operation.run obj action parent

    method set_allow_async : bool -> unit =
      fun allow_async -> Print_operation.set_allow_async obj allow_async

    method set_current_page : int -> unit =
      fun current_page -> Print_operation.set_current_page obj current_page

    method set_custom_tab_label : string option -> unit =
      fun label -> Print_operation.set_custom_tab_label obj label

    method set_default_page_setup : GPage_setup.page_setup_t option -> unit =
      fun default_page_setup ->
        let default_page_setup =
          Option.map (fun c -> c#as_page_setup) default_page_setup
        in
        Print_operation.set_default_page_setup obj default_page_setup

    method set_defer_drawing : unit -> unit =
      fun () -> Print_operation.set_defer_drawing obj

    method set_embed_page_setup : bool -> unit =
      fun embed -> Print_operation.set_embed_page_setup obj embed

    method set_export_filename : string -> unit =
      fun filename -> Print_operation.set_export_filename obj filename

    method set_has_selection : bool -> unit =
      fun has_selection -> Print_operation.set_has_selection obj has_selection

    method set_job_name : string -> unit =
      fun job_name -> Print_operation.set_job_name obj job_name

    method set_n_pages : int -> unit =
      fun n_pages -> Print_operation.set_n_pages obj n_pages

    method set_print_settings : GPrint_settings.print_settings_t option -> unit
        =
      fun print_settings ->
        let print_settings =
          Option.map (fun c -> c#as_print_settings) print_settings
        in
        Print_operation.set_print_settings obj print_settings

    method set_show_progress : bool -> unit =
      fun show_progress -> Print_operation.set_show_progress obj show_progress

    method set_support_selection : bool -> unit =
      fun support_selection ->
        Print_operation.set_support_selection obj support_selection

    method set_track_print_status : bool -> unit =
      fun track_status ->
        Print_operation.set_track_print_status obj track_status

    method set_unit : Gtk_enums.unit -> unit =
      fun unit -> Print_operation.set_unit obj unit

    method set_use_full_page : bool -> unit =
      fun full_page -> Print_operation.set_use_full_page obj full_page

    method as_print_operation = obj
  end

let new_ () : print_operation_t = new print_operation (Print_operation.new_ ())
