class type assistant_page_t = object
  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the child to which [page] belongs. *)

  (** {2:properties Properties} *)

  method complete : bool
  (** Whether all required fields are filled in.

      GTK uses this information to control the sensitivity of the navigation
      buttons. *)

  method set_complete : bool -> unit
  (** Whether all required fields are filled in.

      GTK uses this information to control the sensitivity of the navigation
      buttons. *)

  method page_type : Enums.assistantpagetype
  (** The type of the assistant page. *)

  method set_page_type : Enums.assistantpagetype -> unit
  (** The type of the assistant page. *)

  method title : string
  (** The title of the page. *)

  method set_title : string -> unit
  (** The title of the page. *)

  (** {2:conversions Conversions} *)

  method as_assistant_page : Raw.Assistant_page.t
end

(* High-level class for AssistantPage *)
class assistant_page (obj : Raw.Assistant_page.t) : assistant_page_t =
  object (self)
    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Assistant_page.get_child obj)

    method complete = Raw.Assistant_page.get_complete obj
    method set_complete v = Raw.Assistant_page.set_complete obj v
    method page_type = Raw.Assistant_page.get_page_type obj
    method set_page_type v = Raw.Assistant_page.set_page_type obj v
    method title = Raw.Assistant_page.get_title obj
    method set_title v = Raw.Assistant_page.set_title obj v
    method as_assistant_page = obj
  end
