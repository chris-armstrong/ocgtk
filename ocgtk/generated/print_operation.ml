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

(* High-level class for PrintOperation *)
class print_operation (obj : Raw.Print_operation.t) : print_operation_t =
  object (self)
    inherit
      Print_operation_preview.print_operation_preview
        (Raw.Print_operation_preview.from_gobject obj)

    method on_begin_print ?(after = false) ~callback () =
      Raw.Print_operation.on_begin_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_custom_widget_apply ?(after = false) ~callback () =
      Raw.Print_operation.on_custom_widget_apply ~after self#as_print_operation
        ~callback:(fun ~widget ->
          callback
            ~widget:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 widget))

    method on_done_ ?(after = false) ~callback () =
      Raw.Print_operation.on_done_ ~after self#as_print_operation ~callback

    method on_draw_page ?(after = false) ~callback () =
      Raw.Print_operation.on_draw_page ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ->
          callback ~context:(new Print_context.print_context context) ~page_nr)

    method on_end_print ?(after = false) ~callback () =
      Raw.Print_operation.on_end_print ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_paginate ?(after = false) ~callback () =
      Raw.Print_operation.on_paginate ~after self#as_print_operation
        ~callback:(fun ~context ->
          callback ~context:(new Print_context.print_context context))

    method on_preview ?(after = false) ~callback () =
      Raw.Print_operation.on_preview ~after self#as_print_operation
        ~callback:(fun ~preview ~context ~parent ->
          callback
            ~preview:
              (new Print_operation_preview.print_operation_preview preview)
            ~context:(new Print_context.print_context context)
            ~parent:
              (Option.map
                 (fun w ->
                   new Application_and__window_and__window_group.window w)
                 parent))

    method on_request_page_setup ?(after = false) ~callback () =
      Raw.Print_operation.on_request_page_setup ~after self#as_print_operation
        ~callback:(fun ~context ~page_nr ~setup ->
          callback
            ~context:(new Print_context.print_context context)
            ~page_nr
            ~setup:(new Page_setup.page_setup setup))

    method on_status_changed ?(after = false) ~callback () =
      Raw.Print_operation.on_status_changed ~after self#as_print_operation
        ~callback

    method on_update_custom_widget ?(after = false) ~callback () =
      Raw.Print_operation.on_update_custom_widget ~after self#as_print_operation
        ~callback:(fun ~widget ~setup ~settings ->
          callback
            ~widget:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 widget)
            ~setup:(new Page_setup.page_setup setup)
            ~settings:(new Print_settings.print_settings settings))

    method cancel : unit -> unit = fun () -> Raw.Print_operation.cancel obj

    method draw_page_finish : unit -> unit =
      fun () -> Raw.Print_operation.draw_page_finish obj

    method get_default_page_setup : unit -> Page_setup.page_setup_t =
      fun () ->
        new Page_setup.page_setup
          (Raw.Print_operation.get_default_page_setup obj)

    method get_embed_page_setup : unit -> bool =
      fun () -> Raw.Print_operation.get_embed_page_setup obj

    method get_error : unit -> (unit, GError.t) result =
      fun () -> Raw.Print_operation.get_error obj

    method get_has_selection : unit -> bool =
      fun () -> Raw.Print_operation.get_has_selection obj

    method get_n_pages_to_print : unit -> int =
      fun () -> Raw.Print_operation.get_n_pages_to_print obj

    method get_print_settings : unit -> Print_settings.print_settings_t option =
      fun () ->
        Option.map
          (fun ret -> new Print_settings.print_settings ret)
          (Raw.Print_operation.get_print_settings obj)

    method get_status : unit -> Enums.printstatus =
      fun () -> Raw.Print_operation.get_status obj

    method get_status_string : unit -> string =
      fun () -> Raw.Print_operation.get_status_string obj

    method get_support_selection : unit -> bool =
      fun () -> Raw.Print_operation.get_support_selection obj

    method is_finished : unit -> bool =
      fun () -> Raw.Print_operation.is_finished obj

    method run :
        Enums.printoperationaction ->
        Application_and__window_and__window_group.window_t option ->
        (Enums.printoperationresult, GError.t) result =
      fun action parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Print_operation.run obj action parent

    method set_allow_async : bool -> unit =
      fun allow_async -> Raw.Print_operation.set_allow_async obj allow_async

    method set_current_page : int -> unit =
      fun current_page -> Raw.Print_operation.set_current_page obj current_page

    method set_custom_tab_label : string option -> unit =
      fun label -> Raw.Print_operation.set_custom_tab_label obj label

    method set_default_page_setup : Page_setup.page_setup_t option -> unit =
      fun default_page_setup ->
        let default_page_setup =
          Option.map (fun c -> c#as_page_setup) default_page_setup
        in
        Raw.Print_operation.set_default_page_setup obj default_page_setup

    method set_defer_drawing : unit -> unit =
      fun () -> Raw.Print_operation.set_defer_drawing obj

    method set_embed_page_setup : bool -> unit =
      fun embed -> Raw.Print_operation.set_embed_page_setup obj embed

    method set_export_filename : string -> unit =
      fun filename -> Raw.Print_operation.set_export_filename obj filename

    method set_has_selection : bool -> unit =
      fun has_selection ->
        Raw.Print_operation.set_has_selection obj has_selection

    method set_job_name : string -> unit =
      fun job_name -> Raw.Print_operation.set_job_name obj job_name

    method set_n_pages : int -> unit =
      fun n_pages -> Raw.Print_operation.set_n_pages obj n_pages

    method set_print_settings : Print_settings.print_settings_t option -> unit =
      fun print_settings ->
        let print_settings =
          Option.map (fun c -> c#as_print_settings) print_settings
        in
        Raw.Print_operation.set_print_settings obj print_settings

    method set_show_progress : bool -> unit =
      fun show_progress ->
        Raw.Print_operation.set_show_progress obj show_progress

    method set_support_selection : bool -> unit =
      fun support_selection ->
        Raw.Print_operation.set_support_selection obj support_selection

    method set_track_print_status : bool -> unit =
      fun track_status ->
        Raw.Print_operation.set_track_print_status obj track_status

    method set_unit : Enums.unit -> unit =
      fun unit -> Raw.Print_operation.set_unit obj unit

    method set_use_full_page : bool -> unit =
      fun full_page -> Raw.Print_operation.set_use_full_page obj full_page

    method as_print_operation = obj
  end

let new_ () : print_operation_t =
  new print_operation (Raw.Print_operation.new_ ())
