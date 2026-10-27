class type assistant_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_apply :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the apply button is clicked.

      The default behavior of the [GtkAssistant] is to switch to the page after
      the current page, unless the current page is the last one.

      A handler for the ::apply signal should carry out the actions for which
      the wizard has collected data. If the action takes a long time to
      complete, you might consider putting a page of type
      [GTK_ASSISTANT_PAGE_PROGRESS] after the confirmation page and handle this
      operation within the [Gtk.Assistant::prepare] signal of the progress page.
  *)

  method on_cancel :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when then the cancel button is clicked. *)

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted either when the close button of a summary page is clicked, or when
      the apply button in the last page in the flow (of type
      [GTK_ASSISTANT_PAGE_CONFIRM]) is clicked. *)

  method on_escape :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The action signal for the Escape binding. *)

  method on_prepare :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new page is set as the assistant's current page, before
      making the new page visible.

      A handler for this signal can do any preparations which are necessary
      before showing [page]. *)

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds a widget to the action area of a [GtkAssistant]. *)

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int
  (** Appends a page to the [assistant]. *)

  method commit : unit -> unit
  (** Erases the visited page history.

      GTK will then hide the back button on the current page, and removes the
      cancel button from subsequent pages.

      Use this when the information provided up to the current page is hereafter
      deemed permanent and cannot be modified or undone. For example, showing a
      progress page to track a long-running, unreversible operation after the
      user has clicked apply on a confirmation page. *)

  method get_current_page : unit -> int
  (** Returns the page number of the current page. *)

  method get_n_pages : unit -> int
  (** Returns the number of pages in the [assistant] *)

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the child widget contained in page number [page_num]. *)

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Assistant_page.assistant_page_t
  (** Returns the [GtkAssistantPage] object for [child]. *)

  method get_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Gets whether [page] is complete. *)

  method get_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string
  (** Gets the title for [page]. *)

  method get_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype
  (** Gets the page type of [page]. *)

  method get_pages : unit -> Ocgio.List_model.list_model_t
  (** Gets a list model of the assistant pages. *)

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int
  (** Inserts a page in the [assistant] at a given position. *)

  method next_page : unit -> unit
  (** Navigate to the next page.

      It is a programming error to call this function when there is no next
      page.

      This function is for use when creating pages of the
      [GTK_ASSISTANT_PAGE_CUSTOM] type. *)

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int
  (** Prepends a page to the [assistant]. *)

  method previous_page : unit -> unit
  (** Navigate to the previous visited page.

      It is a programming error to call this function when no previous page is
      available.

      This function is for use when creating pages of the
      [GTK_ASSISTANT_PAGE_CUSTOM] type. *)

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a widget from the action area of a [GtkAssistant]. *)

  method remove_page : int -> unit
  (** Removes the [page_num]’s page from [assistant]. *)

  method set_current_page : int -> unit
  (** Switches the page to [page_num].

      Note that this will only be necessary in custom buttons, as the
      [assistant] flow can be set with gtk_assistant_set_forward_page_func(). *)

  method set_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit
  (** Sets whether [page] contents are complete.

      This will make [assistant] update the buttons state to be able to continue
      the task. *)

  method set_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit
  (** Sets a title for [page].

      The title is displayed in the header area of the assistant when [page] is
      the current page. *)

  method set_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype ->
    unit
  (** Sets the page type for [page].

      The page type determines the page behavior in the [assistant]. *)

  method update_buttons_state : unit -> unit
  (** Forces [assistant] to recompute the buttons state.

      GTK automatically takes care of this in most situations, e.g. when the
      user goes to a different page, or when the visibility or completeness of a
      page changes.

      One situation where it can be necessary to call this function is when
      changing a value on the current page affects the future page flow of the
      assistant. *)

  method use_header_bar : int
  method as_assistant : Raw.Assistant.t
end

(* High-level class for Assistant *)
class assistant (obj : Raw.Assistant.t) : assistant_t =
  object (self)
    inherit
      Application_and__window_and__window_group.window (obj :> Raw.Window.t)

    method on_apply ?(after = false) ~callback () =
      Raw.Assistant.on_apply ~after self#as_assistant ~callback

    method on_cancel ?(after = false) ~callback () =
      Raw.Assistant.on_cancel ~after self#as_assistant ~callback

    method on_close ?(after = false) ~callback () =
      Raw.Assistant.on_close ~after self#as_assistant ~callback

    method on_escape ?(after = false) ~callback () =
      Raw.Assistant.on_escape ~after self#as_assistant ~callback

    method on_prepare ?(after = false) ~callback () =
      Raw.Assistant.on_prepare ~after self#as_assistant ~callback:(fun ~page ->
          callback
            ~page:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 page))

    method add_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Assistant.add_action_widget obj child

    method append_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.append_page obj page

    method commit : unit -> unit = fun () -> Raw.Assistant.commit obj

    method get_current_page : unit -> int =
      fun () -> Raw.Assistant.get_current_page obj

    method get_n_pages : unit -> int = fun () -> Raw.Assistant.get_n_pages obj

    method get_nth_page :
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun page_num ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Assistant.get_nth_page obj page_num)

    method get_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Assistant_page.assistant_page_t =
      fun child ->
        let child = child#as_widget in
        new Assistant_page.assistant_page (Raw.Assistant.get_page obj child)

    method get_page_complete :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_complete obj page

    method get_page_title :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_title obj page

    method get_page_type :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.assistantpagetype =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_type obj page

    method get_pages : unit -> Ocgio.List_model.list_model_t =
      fun () -> new Ocgio.List_model.list_model (Raw.Assistant.get_pages obj)

    method insert_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        int =
      fun page position ->
        let page = page#as_widget in
        Raw.Assistant.insert_page obj page position

    method next_page : unit -> unit = fun () -> Raw.Assistant.next_page obj

    method prepend_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.prepend_page obj page

    method previous_page : unit -> unit =
      fun () -> Raw.Assistant.previous_page obj

    method remove_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Assistant.remove_action_widget obj child

    method remove_page : int -> unit =
      fun page_num -> Raw.Assistant.remove_page obj page_num

    method set_current_page : int -> unit =
      fun page_num -> Raw.Assistant.set_current_page obj page_num

    method set_page_complete :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun page complete ->
        let page = page#as_widget in
        Raw.Assistant.set_page_complete obj page complete

    method set_page_title :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        unit =
      fun page title ->
        let page = page#as_widget in
        Raw.Assistant.set_page_title obj page title

    method set_page_type :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.assistantpagetype ->
        unit =
      fun page type_ ->
        let page = page#as_widget in
        Raw.Assistant.set_page_type obj page type_

    method update_buttons_state : unit -> unit =
      fun () -> Raw.Assistant.update_buttons_state obj

    method use_header_bar = Raw.Assistant.get_use_header_bar obj
    method as_assistant = obj
  end

let new_ () : assistant_t = new assistant (Raw.Assistant.new_ ())
