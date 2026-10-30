class type stack_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method add_child : Widget.widget_t -> Stack_page.stack_page_t
  (** Adds a child to [stack]. *)

  method add_named : Widget.widget_t -> string option -> Stack_page.stack_page_t
  (** Adds a child to [stack].

      The child is identified by the [name]. *)

  method add_titled :
    Widget.widget_t -> string option -> string -> Stack_page.stack_page_t
  (** Adds a child to [stack].

      The child is identified by the [name]. The [title] will be used by
      [GtkStackSwitcher] to represent [child] in a tab bar, so it should be
      short. *)

  method get_child_by_name : string -> Widget.widget_t option
  (** Finds the child with the name given as the argument.

      Returns [None] if there is no child with this name. *)

  method get_hhomogeneous : unit -> bool
  (** Gets whether [stack] is horizontally homogeneous. *)

  method get_interpolate_size : unit -> bool
  (** Returns whether the [GtkStack] is set up to interpolate between the sizes
      of children on page switch. *)

  method get_page : Widget.widget_t -> Stack_page.stack_page_t
  (** Returns the [GtkStackPage] object for [child]. *)

  method get_pages : unit -> Selection_model.selection_model_t
  (** Returns a [GListModel] that contains the pages of the stack.

      This can be used to keep an up-to-date view. The model also implements
      [Gtk.SelectionModel] and can be used to track and modify the visible page.
  *)

  method get_transition_duration : unit -> int
  (** Returns the amount of time (in milliseconds) that transitions between
      pages in [stack] will take. *)

  method get_transition_running : unit -> bool
  (** Returns whether the [stack] is currently in a transition from one page to
      another. *)

  method get_transition_type : unit -> Enums.stacktransitiontype
  (** Gets the type of animation that will be used for transitions between pages
      in [stack]. *)

  method get_vhomogeneous : unit -> bool
  (** Gets whether [stack] is vertically homogeneous. *)

  method get_visible_child : unit -> Widget.widget_t option
  (** Gets the currently visible child of [stack].

      Returns [None] if there are no visible children. *)

  method get_visible_child_name : unit -> string option
  (** Returns the name of the currently visible child of [stack].

      Returns [None] if there is no visible child. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child widget from [stack]. *)

  method set_hhomogeneous : bool -> unit
  (** Sets the [GtkStack] to be horizontally homogeneous or not.

      If it is homogeneous, the [GtkStack] will request the same width for all
      its children. If it isn't, the stack may change width when a different
      child becomes visible. *)

  method set_interpolate_size : bool -> unit
  (** Sets whether or not [stack] will interpolate its size when changing the
      visible child.

      If the [Gtk.Stack:interpolate-size] property is set to [true], [stack]
      will interpolate its size between the current one and the one it'll take
      after changing the visible child, according to the set transition
      duration. *)

  method set_transition_duration : int -> unit
  (** Sets the duration that transitions between pages in [stack] will take. *)

  method set_transition_type : Enums.stacktransitiontype -> unit
  (** Sets the type of animation that will be used for transitions between pages
      in [stack].

      Available types include various kinds of fades and slides.

      The transition type can be changed without problems at runtime, so it is
      possible to change the animation based on the page that is about to become
      current. *)

  method set_vhomogeneous : bool -> unit
  (** Sets the [GtkStack] to be vertically homogeneous or not.

      If it is homogeneous, the [GtkStack] will request the same height for all
      its children. If it isn't, the stack may change height when a different
      child becomes visible. *)

  method set_visible_child : Widget.widget_t -> unit
  (** Makes [child] the visible child of [stack].

      If [child] is different from the currently visible child, the transition
      between the two will be animated with the current transition type of
      [stack].

      Note that the [child] widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
  (** Makes the child with the given name visible.

      Note that the child widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  method set_visible_child_name : string -> unit
  (** Makes the child with the given name visible.

      If [child] is different from the currently visible child, the transition
      between the two will be animated with the current transition type of
      [stack].

      Note that the child widget has to be visible itself (see
      [Gtk.Widget.show]) in order to become the visible child of [stack]. *)

  (** {2:conversions Conversions} *)

  method as_stack : Raw.Stack.t
end

(* High-level class for Stack *)
class stack (obj : Raw.Stack.t) : stack_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method add_child : Widget.widget_t -> Stack_page.stack_page_t =
      fun child ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_child obj child)

    method add_named :
        Widget.widget_t -> string option -> Stack_page.stack_page_t =
      fun child name ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_named obj child name)

    method add_titled :
        Widget.widget_t -> string option -> string -> Stack_page.stack_page_t =
      fun child name title ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.add_titled obj child name title)

    method get_child_by_name : string -> Widget.widget_t option =
      fun name ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Stack.get_child_by_name obj name)

    method get_hhomogeneous : unit -> bool =
      fun () -> Raw.Stack.get_hhomogeneous obj

    method get_interpolate_size : unit -> bool =
      fun () -> Raw.Stack.get_interpolate_size obj

    method get_page : Widget.widget_t -> Stack_page.stack_page_t =
      fun child ->
        let child = child#as_widget in
        new Stack_page.stack_page (Raw.Stack.get_page obj child)

    method get_pages : unit -> Selection_model.selection_model_t =
      fun () -> new Selection_model.selection_model (Raw.Stack.get_pages obj)

    method get_transition_duration : unit -> int =
      fun () -> Raw.Stack.get_transition_duration obj

    method get_transition_running : unit -> bool =
      fun () -> Raw.Stack.get_transition_running obj

    method get_transition_type : unit -> Enums.stacktransitiontype =
      fun () -> Raw.Stack.get_transition_type obj

    method get_vhomogeneous : unit -> bool =
      fun () -> Raw.Stack.get_vhomogeneous obj

    method get_visible_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Stack.get_visible_child obj)

    method get_visible_child_name : unit -> string option =
      fun () -> Raw.Stack.get_visible_child_name obj

    method remove : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Stack.remove obj child

    method set_hhomogeneous : bool -> unit =
      fun hhomogeneous -> Raw.Stack.set_hhomogeneous obj hhomogeneous

    method set_interpolate_size : bool -> unit =
      fun interpolate_size ->
        Raw.Stack.set_interpolate_size obj interpolate_size

    method set_transition_duration : int -> unit =
      fun duration -> Raw.Stack.set_transition_duration obj duration

    method set_transition_type : Enums.stacktransitiontype -> unit =
      fun transition -> Raw.Stack.set_transition_type obj transition

    method set_vhomogeneous : bool -> unit =
      fun vhomogeneous -> Raw.Stack.set_vhomogeneous obj vhomogeneous

    method set_visible_child : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Stack.set_visible_child obj child

    method set_visible_child_full : string -> Enums.stacktransitiontype -> unit
        =
      fun name transition ->
        Raw.Stack.set_visible_child_full obj name transition

    method set_visible_child_name : string -> unit =
      fun name -> Raw.Stack.set_visible_child_name obj name

    method as_stack = obj
  end

let new_ () : stack_t = new stack (Raw.Stack.new_ ())
