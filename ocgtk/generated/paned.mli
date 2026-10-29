(** Arranges its children in two panes, horizontally or vertically.

    Its methods, signals and properties are on {!class-type-paned_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Paned}. *)

(** {1:class Class} *)

class type paned_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_accept_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to accept the current position of the handle when moving it using
      key bindings.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Return</kbd> or
      <kbd>Space</kbd>. *)

  method on_cancel_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to cancel moving the position of the handle using key bindings.

      The position of the handle will be reset to the value prior to moving it.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Escape</kbd>. *)

  method on_cycle_child_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to cycle the focus between the children of the paned.

      This is a keybinding signal.

      The default binding is <kbd>F6</kbd>. *)

  method on_cycle_handle_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to cycle whether the paned should grab focus to allow the user to
      change position of the handle by using key bindings.

      This is a keybinding signal.

      The default binding for this signal is <kbd>F8</kbd>. *)

  method on_move_handle :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to move the handle with key bindings.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>←</kbd>,
      <kbd>←</kbd>, <kbd>Ctrl</kbd>+<kbd>→</kbd>, <kbd>→</kbd>,
      <kbd>Ctrl</kbd>+<kbd>↑</kbd>, <kbd>↑</kbd>, <kbd>Ctrl</kbd>+<kbd>↓</kbd>,
      <kbd>↓</kbd>, <kbd>PgUp</kbd>, <kbd>PgDn</kbd>, <kbd>Home</kbd>,
      <kbd>End</kbd>. *)

  method on_toggle_handle_focus :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to accept the current position of the handle and then move focus
      to the next widget in the focus chain.

      This is a keybinding signal.

      The default binding is <kbd>Tab</kbd>. *)

  (** {2:methods Methods} *)

  method get_end_child : unit -> Widget.widget_t option
  (** Retrieves the end child of the given [GtkPaned]. *)

  method get_position : unit -> int
  (** Obtains the position of the divider between the two panes. *)

  method get_resize_end_child : unit -> bool
  (** Returns whether the [Gtk.Paned:end-child] can be resized. *)

  method get_resize_start_child : unit -> bool
  (** Returns whether the [Gtk.Paned:start-child] can be resized. *)

  method get_shrink_end_child : unit -> bool
  (** Returns whether the [Gtk.Paned:end-child] can shrink. *)

  method get_shrink_start_child : unit -> bool
  (** Returns whether the [Gtk.Paned:start-child] can shrink. *)

  method get_start_child : unit -> Widget.widget_t option
  (** Retrieves the start child of the given [GtkPaned]. *)

  method get_wide_handle : unit -> bool
  (** Gets whether the separator should be wide. *)

  method set_end_child : Widget.widget_t option -> unit
  (** Sets the end child of [paned] to [child].

      If [child] is [None], the existing child will be removed. *)

  method set_position : int -> unit
  (** Sets the position of the divider between the two panes. *)

  method set_resize_end_child : bool -> unit
  (** Sets whether the [Gtk.Paned:end-child] can be resized. *)

  method set_resize_start_child : bool -> unit
  (** Sets whether the [Gtk.Paned:start-child] can be resized. *)

  method set_shrink_end_child : bool -> unit
  (** Sets whether the [Gtk.Paned:end-child] can shrink. *)

  method set_shrink_start_child : bool -> unit
  (** Sets whether the [Gtk.Paned:start-child] can shrink. *)

  method set_start_child : Widget.widget_t option -> unit
  (** Sets the start child of [paned] to [child].

      If [child] is [None], the existing child will be removed. *)

  method set_wide_handle : bool -> unit
  (** Sets whether the separator should be wide. *)

  (** {2:properties Properties} *)

  method max_position : int
  (** The largest possible value for the [Gtk.Paned:position] property.

      This property is derived from the size and shrinkability of the widget's
      children. *)

  method min_position : int
  (** The smallest possible value for the [Gtk.Paned:position] property.

      This property is derived from the size and shrinkability of the widget's
      children. *)

  method position_set : bool
  (** Whether the [Gtk.Paned:position] property has been set. *)

  method set_position_set : bool -> unit
  (** Whether the [Gtk.Paned:position] property has been set. *)

  (** {2:conversions Conversions} *)

  method as_paned : Raw.Paned.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Paned].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - \
     {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\
     - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}\n\n\
     Arranges its children in two panes, horizontally or vertically.\n\n\
     An example GtkPaned\n\n\
     The division between the two panes is adjustable by the user\n\
     by dragging a handle.\n\n\
     Child widgets are added to the panes of the widget with\n\
     [Gtk.Paned.set_start_child] and [Gtk.Paned.set_end_child].\n\
     The division between the two children is set by default from the size\n\
     requests of the children, but it can be adjusted by the user.\n\n\
     A paned widget draws a separator between the two child widgets and a\n\
     small handle that the user can drag to adjust the division. It does not\n\
     draw any relief around the children or around the separator. (The space\n\
     in which the separator is called the gutter.) Often, it is useful to put\n\
     each child inside a {{!Ocgtk.Frame.class-type-frame_t}[Gtk.Frame]} so \
     that the gutter appears as a\n\
     ridge. No separator is drawn if one of the children is missing.\n\n\
     Each child has two options that can be set, \"resize\" and \"shrink\". If\n\
     \"resize\" is true then, when the [GtkPaned] is resized, that child will\n\
     expand or shrink along with the paned widget. If \"shrink\" is true, then\n\
     that child can be made smaller than its requisition by the user.\n\
     Setting \"shrink\" to false allows the application to set a minimum size.\n\
     If \"resize\" is false for both children, then this is treated as if\n\
     \"resize\" is true for both children.\n\n\
     The application can set the position of the slider as if it were set\n\
     by the user, by calling [Gtk.Paned.set_position].\n\n\
     {b Shortcuts and Gestures}\n\n\
     The following signals have default keybindings:\n\n\
     - [Gtk.Paned::accept-position]\n\
     - [Gtk.Paned::cancel-position]\n\
     - [Gtk.Paned::cycle-child-focus]\n\
     - [Gtk.Paned::cycle-handle-focus]\n\
     - [Gtk.Paned::move-handle]\n\
     - [Gtk.Paned::toggle-handle-focus]\n\n\
     {b CSS nodes}\n\n\
     {[\n\
     paned\n\
     ├── <child>\n\
     ├── separator[.wide]\n\
     ╰── <child>\n\
     ]}\n\n\
     [GtkPaned] has a main CSS node with name paned, and a subnode for\n\
     the separator with name separator. The subnode gets a .wide style\n\
     class when the paned is supposed to be wide.\n\n\
     In horizontal orientation, the nodes are arranged based on the text\n\
     direction, so in left-to-right mode, :first-child will select the\n\
     leftmost child, while it will select the rightmost child in\n\
     RTL layouts.\n\n\
     {b Creating a paned widget with minimum sizes.}\n\n\
     {[\n\
     GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);\n\
     GtkWidget *frame1 = gtk_frame_new (NULL);\n\
     GtkWidget *frame2 = gtk_frame_new (NULL);\n\n\
     gtk_widget_set_size_request (hpaned, 200, -1);\n\n\
     gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);\n\
     gtk_paned_set_resize_start_child (GTK_PANED (hpaned), TRUE);\n\
     gtk_paned_set_shrink_start_child (GTK_PANED (hpaned), FALSE);\n\
     gtk_widget_set_size_request (frame1, 50, -1);\n\n\
     gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);\n\
     gtk_paned_set_resize_end_child (GTK_PANED (hpaned), FALSE);\n\
     gtk_paned_set_shrink_end_child (GTK_PANED (hpaned), FALSE);\n\
     gtk_widget_set_size_request (frame2, 50, -1);\n\
     ]}"]

class paned : Raw.Paned.t -> paned_t
(** Wraps a raw handle of {!Ocgtk.Raw.Paned.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Arranges its children in two panes, horizontally or vertically.\n\n\
 An example GtkPaned\n\n\
 The division between the two panes is adjustable by the user\n\
 by dragging a handle.\n\n\
 Child widgets are added to the panes of the widget with\n\
 [Gtk.Paned.set_start_child] and [Gtk.Paned.set_end_child].\n\
 The division between the two children is set by default from the size\n\
 requests of the children, but it can be adjusted by the user.\n\n\
 A paned widget draws a separator between the two child widgets and a\n\
 small handle that the user can drag to adjust the division. It does not\n\
 draw any relief around the children or around the separator. (The space\n\
 in which the separator is called the gutter.) Often, it is useful to put\n\
 each child inside a {{!Ocgtk.Frame.class-type-frame_t}[Gtk.Frame]} so that \
 the gutter appears as a\n\
 ridge. No separator is drawn if one of the children is missing.\n\n\
 Each child has two options that can be set, \"resize\" and \"shrink\". If\n\
 \"resize\" is true then, when the [GtkPaned] is resized, that child will\n\
 expand or shrink along with the paned widget. If \"shrink\" is true, then\n\
 that child can be made smaller than its requisition by the user.\n\
 Setting \"shrink\" to false allows the application to set a minimum size.\n\
 If \"resize\" is false for both children, then this is treated as if\n\
 \"resize\" is true for both children.\n\n\
 The application can set the position of the slider as if it were set\n\
 by the user, by calling [Gtk.Paned.set_position].\n\n\
 {b Shortcuts and Gestures}\n\n\
 The following signals have default keybindings:\n\n\
 - [Gtk.Paned::accept-position]\n\
 - [Gtk.Paned::cancel-position]\n\
 - [Gtk.Paned::cycle-child-focus]\n\
 - [Gtk.Paned::cycle-handle-focus]\n\
 - [Gtk.Paned::move-handle]\n\
 - [Gtk.Paned::toggle-handle-focus]\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 paned\n\
 ├── <child>\n\
 ├── separator[.wide]\n\
 ╰── <child>\n\
 ]}\n\n\
 [GtkPaned] has a main CSS node with name paned, and a subnode for\n\
 the separator with name separator. The subnode gets a .wide style\n\
 class when the paned is supposed to be wide.\n\n\
 In horizontal orientation, the nodes are arranged based on the text\n\
 direction, so in left-to-right mode, :first-child will select the\n\
 leftmost child, while it will select the rightmost child in\n\
 RTL layouts.\n\n\
 {b Creating a paned widget with minimum sizes.}\n\n\
 {[\n\
 GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);\n\
 GtkWidget *frame1 = gtk_frame_new (NULL);\n\
 GtkWidget *frame2 = gtk_frame_new (NULL);\n\n\
 gtk_widget_set_size_request (hpaned, 200, -1);\n\n\
 gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);\n\
 gtk_paned_set_resize_start_child (GTK_PANED (hpaned), TRUE);\n\
 gtk_paned_set_shrink_start_child (GTK_PANED (hpaned), FALSE);\n\
 gtk_widget_set_size_request (frame1, 50, -1);\n\n\
 gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);\n\
 gtk_paned_set_resize_end_child (GTK_PANED (hpaned), FALSE);\n\
 gtk_paned_set_shrink_end_child (GTK_PANED (hpaned), FALSE);\n\
 gtk_widget_set_size_request (frame2, 50, -1);\n\
 ]}"]

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> paned_t
(** Creates a new [GtkPaned] widget. *)
