class type stack_page_t = object
  inherit At_context_and__accessible.accessible_t

  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the stack child to which [self] belongs. *)

  method get_icon_name : unit -> string option
  (** Returns the icon name of the page. *)

  method get_name : unit -> string option
  (** Returns the name of the page. *)

  method get_needs_attention : unit -> bool
  (** Returns whether the page is marked as “needs attention”. *)

  method get_title : unit -> string option
  (** Gets the page title. *)

  method get_use_underline : unit -> bool
  (** Gets whether underlines in the page title indicate mnemonics. *)

  method get_visible : unit -> bool
  (** Returns whether [page] is visible in its [GtkStack].

      This is independent from the [Gtk.Widget:visible] property of its widget.
  *)

  method set_icon_name : string -> unit
  (** Sets the icon name of the page. *)

  method set_name : string -> unit
  (** Sets the name of the page. *)

  method set_needs_attention : bool -> unit
  (** Sets whether the page is marked as “needs attention”. *)

  method set_title : string -> unit
  (** Sets the page title. *)

  method set_use_underline : bool -> unit
  (** Sets whether underlines in the page title indicate mnemonics. *)

  method set_visible : bool -> unit
  (** Sets whether [page] is visible in its [GtkStack]. *)

  (** {2:conversions Conversions} *)

  method as_stack_page : Raw.Stack_page.t
end

(* High-level class for StackPage *)
class stack_page (obj : Raw.Stack_page.t) : stack_page_t =
  object (self)
    inherit
      At_context_and__accessible.accessible (Raw.Accessible.from_gobject obj)

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Stack_page.get_child obj)

    method get_icon_name : unit -> string option =
      fun () -> Raw.Stack_page.get_icon_name obj

    method get_name : unit -> string option =
      fun () -> Raw.Stack_page.get_name obj

    method get_needs_attention : unit -> bool =
      fun () -> Raw.Stack_page.get_needs_attention obj

    method get_title : unit -> string option =
      fun () -> Raw.Stack_page.get_title obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Stack_page.get_use_underline obj

    method get_visible : unit -> bool = fun () -> Raw.Stack_page.get_visible obj

    method set_icon_name : string -> unit =
      fun setting -> Raw.Stack_page.set_icon_name obj setting

    method set_name : string -> unit =
      fun setting -> Raw.Stack_page.set_name obj setting

    method set_needs_attention : bool -> unit =
      fun setting -> Raw.Stack_page.set_needs_attention obj setting

    method set_title : string -> unit =
      fun setting -> Raw.Stack_page.set_title obj setting

    method set_use_underline : bool -> unit =
      fun setting -> Raw.Stack_page.set_use_underline obj setting

    method set_visible : bool -> unit =
      fun visible -> Raw.Stack_page.set_visible obj visible

    method as_stack_page = obj
  end
