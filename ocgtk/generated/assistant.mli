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

    Its methods, signals and properties are on {!class-type-assistant_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Assistant}. *)

(** The methods, signals and properties of a [Assistant]. *)
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

class assistant : Raw.Assistant.t -> assistant_t
(** Wraps a raw handle of {!Ocgtk.Raw.Assistant.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> assistant_t
(** Creates a new [GtkAssistant]. *)
