(** [GtkAssistant] is used to represent a complex as a series of steps.

    An example GtkAssistant

    Each step consists of one or more pages. [GtkAssistant] guides the user
    through the pages, and controls the page flow to collect the data needed for
    the operation.

    [GtkAssistant] handles which buttons to show and to make sensitive based on
    page sequence knowledge and the [Gtk.AssistantPageType] of each page in
    addition to state information like the {i completed} and {i committed} page
    statuses.

    If you have a case that doesn’t quite fit in [GtkAssistant]s way of handling
    buttons, you can use the [GTK_ASSISTANT_PAGE_CUSTOM] page type and handle
    buttons yourself.

    [GtkAssistant] maintains a [GtkAssistantPage] object for each added child,
    which holds additional per-child properties. You obtain the
    [GtkAssistantPage] for a child with [Gtk.Assistant.get_page].

    {b GtkAssistant as GtkBuildable}

    The [GtkAssistant] implementation of the [GtkBuildable] interface exposes
    the [action_area] as internal children with the name “action_area”.

    To add pages to an assistant in [GtkBuilder], simply add it as a child to
    the [GtkAssistant] object. If you need to set per-object properties, create
    a [GtkAssistantPage] object explicitly, and set the child widget as a
    property on it.

    {b CSS nodes}

    [GtkAssistant] has a single CSS node with the name window and style class
    .assistant.

    Its methods, signals and properties are on {!class-type-assistant_t}. The
    functions it is built on are in {!Ocgtk.Raw.Assistant}. *)

(** The methods, signals and properties of a [GtkAssistant]. *)
class type assistant_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_apply :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_cancel :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_escape :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_prepare :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method commit : unit -> unit
  method get_current_page : unit -> int
  method get_n_pages : unit -> int

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Assistant_page.assistant_page_t

  method get_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method get_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string

  method get_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype

  method get_pages : unit -> Ocgio.List_model.list_model_t

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int

  method next_page : unit -> unit

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method previous_page : unit -> unit

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_page : int -> unit
  method set_current_page : int -> unit

  method set_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method set_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype ->
    unit

  method update_buttons_state : unit -> unit
  method use_header_bar : int
  method as_assistant : Raw.Assistant.t
end

class assistant : Raw.Assistant.t -> assistant_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Assistant.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAssistant], give one already wrapped. *)

val new_ : unit -> assistant_t
