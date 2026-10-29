(** Shows a level indicator.

    Its methods, signals and properties are on {!class-type-level_bar_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Level_bar}. *)

(** {1:class Class} *)

class type level_bar_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_offset_changed :
    ?after:bool ->
    callback:(name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted when an offset specified on the bar changes value.\n\n\
     This typically is the result of a [Gtk.LevelBar.add_offset_value]\n\
     call.\n\n\
     The signal supports detailed connections; you can connect to the\n\
     detailed signal \"changed::x\" in order to only receive callbacks when\n\
     the value of offset \"x\" changes."]

  (** {2:methods Methods} *)

  method add_offset_value : string -> float -> unit
  (** Adds a new offset marker on [self] at the position specified by [value].

      When the bar value is in the interval topped by [value] (or between
      [value] and [Gtk.LevelBar:max-value] in case the offset is the last one on
      the bar) a style class named [level-][name] will be applied when rendering
      the level bar fill.

      If another offset marker named [name] exists, its value will be replaced
      by [value]. *)

  method get_inverted : unit -> bool
  (** Returns whether the levelbar is inverted. *)

  method get_max_value : unit -> float
  (** Returns the [max-value] of the [GtkLevelBar]. *)

  method get_min_value : unit -> float
  (** Returns the [min-value] of the [GtkLevelBar]. *)

  method get_mode : unit -> Enums.levelbarmode
  (** Returns the [mode] of the [GtkLevelBar]. *)

  method get_value : unit -> float
  (** Returns the [value] of the [GtkLevelBar]. *)

  method remove_offset_value : string option -> unit
  (** Removes an offset marker from a [GtkLevelBar].

      The marker must have been previously added with
      [Gtk.LevelBar.add_offset_value]. *)

  method set_inverted : bool -> unit
  (** Sets whether the [GtkLevelBar] is inverted. *)

  method set_max_value : float -> unit
  (** Sets the [max-value] of the [GtkLevelBar].

      You probably want to update preexisting level offsets after calling this
      function. *)

  method set_min_value : float -> unit
  (** Sets the [min-value] of the [GtkLevelBar].

      You probably want to update preexisting level offsets after calling this
      function. *)

  method set_mode : Enums.levelbarmode -> unit
  (** Sets the [mode] of the [GtkLevelBar]. *)

  method set_value : float -> unit
  (** Sets the value of the [GtkLevelBar]. *)

  (** {2:conversions Conversions} *)

  method as_level_bar : Raw.Level_bar.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [LevelBar].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - \
     {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\
     - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}\n\n\
     Shows a level indicator.\n\n\
     Typical use cases are displaying the strength of a password, or\n\
     showing the charge level of a battery.\n\n\
     An example GtkLevelBar\n\n\
     Use \
     {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_value}[Gtk.LevelBar.set_value]} \
     to set the current value, and\n\
     {{!Ocgtk.Level_bar.class-type-level_bar_t.method-add_offset_value}[Gtk.LevelBar.add_offset_value]} \
     to set the value offsets at which\n\
     the bar will be considered in a different state. GTK will add a few\n\
     offsets by default on the level bar: [GTK_LEVEL_BAR_OFFSET_LOW],\n\
     [GTK_LEVEL_BAR_OFFSET_HIGH] and [GTK_LEVEL_BAR_OFFSET_FULL], with\n\
     values 0.25, 0.75 and 1.0 respectively.\n\n\
     Note that it is your responsibility to update preexisting offsets\n\
     when changing the minimum or maximum value. GTK will simply clamp\n\
     them to the new range.\n\n\
     {b Adding a custom offset on the bar}\n\n\
     {[\n\
     static GtkWidget *\n\
     create_level_bar (void)\n\
     {\n\
    \  GtkWidget *widget;\n\
    \  GtkLevelBar *bar;\n\n\
    \  widget = gtk_level_bar_new ();\n\
    \  bar = GTK_LEVEL_BAR (widget);\n\n\
    \  // This changes the value of the default low offset\n\n\
    \  gtk_level_bar_add_offset_value (bar,\n\
    \                                  GTK_LEVEL_BAR_OFFSET_LOW,\n\
    \                                  0.10);\n\n\
    \  // This adds a new offset to the bar; the application will\n\
    \  // be able to change its color CSS like this:\n\
    \  //\n\
    \  // levelbar block.my-offset {\n\
    \  //   background-color: magenta;\n\
    \  //   border-style: solid;\n\
    \  //   border-color: black;\n\
    \  //   border-width: 1px;\n\
    \  // }\n\n\
    \  gtk_level_bar_add_offset_value (bar, \"my-offset\", 0.60);\n\n\
    \  return widget;\n\
     }\n\
     ]}\n\n\
     The default interval of values is between zero and one, but it’s possible\n\
     to modify the interval using \
     {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_min_value}[Gtk.LevelBar.set_min_value]} \
     and\n\
     {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_max_value}[Gtk.LevelBar.set_max_value]}. \
     The value will be always drawn in\n\
     proportion to the admissible interval, i.e. a value of 15 with a specified\n\
     interval between 10 and 20 is equivalent to a value of 0.5 with an interval\n\
     between 0 and 1. When [GTK_LEVEL_BAR_MODE_DISCRETE] is used, the bar level\n\
     is rendered as a finite number of separated blocks instead of a single one.\n\
     The number of blocks that will be rendered is equal to the number of units\n\
     specified by the admissible interval.\n\n\
     For instance, to build a bar rendered with five blocks, it’s sufficient to\n\
     set the minimum value to 0 and the maximum value to 5 after changing the\n\
     indicator mode to discrete.\n\n\
     {b GtkLevelBar as GtkBuildable}\n\n\
     The [GtkLevelBar] implementation of the [GtkBuildable] interface supports a\n\
     custom [<offsets>] element, which can contain any number of [<offset>] \
     elements,\n\
     each of which must have \"name\" and \"value\" attributes.\n\n\
     {b CSS nodes}\n\n\
     {[\n\
     levelbar[.discrete]\n\
     ╰── trough\n\
    \    ├── block.filled.level-name\n\
    \    ┊\n\
    \    ├── block.empty\n\
    \    ┊\n\
     ]}\n\n\
     [GtkLevelBar] has a main CSS node with name levelbar and one of the style\n\
     classes .discrete or .continuous and a subnode with name trough. Below the\n\
     trough node are a number of nodes with name block and style class .filled\n\
     or .empty. In continuous mode, there is exactly one node of each, in \
     discrete\n\
     mode, the number of filled and unfilled nodes corresponds to blocks that \
     are\n\
     drawn. The block.filled nodes also get a style class .level-name \
     corresponding\n\
     to the level for the current value.\n\n\
     In horizontal orientation, the nodes are always arranged from left to \
     right,\n\
     regardless of text direction.\n\n\
     {b Accessibility}\n\n\
     [GtkLevelBar] uses the \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-METER}[Gtk.AccessibleRole.meter]} \
     role."]

class level_bar : Raw.Level_bar.t -> level_bar_t
(** Wraps a raw handle of {!Ocgtk.Raw.Level_bar.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Shows a level indicator.\n\n\
 Typical use cases are displaying the strength of a password, or\n\
 showing the charge level of a battery.\n\n\
 An example GtkLevelBar\n\n\
 Use \
 {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_value}[Gtk.LevelBar.set_value]} \
 to set the current value, and\n\
 {{!Ocgtk.Level_bar.class-type-level_bar_t.method-add_offset_value}[Gtk.LevelBar.add_offset_value]} \
 to set the value offsets at which\n\
 the bar will be considered in a different state. GTK will add a few\n\
 offsets by default on the level bar: [GTK_LEVEL_BAR_OFFSET_LOW],\n\
 [GTK_LEVEL_BAR_OFFSET_HIGH] and [GTK_LEVEL_BAR_OFFSET_FULL], with\n\
 values 0.25, 0.75 and 1.0 respectively.\n\n\
 Note that it is your responsibility to update preexisting offsets\n\
 when changing the minimum or maximum value. GTK will simply clamp\n\
 them to the new range.\n\n\
 {b Adding a custom offset on the bar}\n\n\
 {[\n\
 static GtkWidget *\n\
 create_level_bar (void)\n\
 {\n\
\  GtkWidget *widget;\n\
\  GtkLevelBar *bar;\n\n\
\  widget = gtk_level_bar_new ();\n\
\  bar = GTK_LEVEL_BAR (widget);\n\n\
\  // This changes the value of the default low offset\n\n\
\  gtk_level_bar_add_offset_value (bar,\n\
\                                  GTK_LEVEL_BAR_OFFSET_LOW,\n\
\                                  0.10);\n\n\
\  // This adds a new offset to the bar; the application will\n\
\  // be able to change its color CSS like this:\n\
\  //\n\
\  // levelbar block.my-offset {\n\
\  //   background-color: magenta;\n\
\  //   border-style: solid;\n\
\  //   border-color: black;\n\
\  //   border-width: 1px;\n\
\  // }\n\n\
\  gtk_level_bar_add_offset_value (bar, \"my-offset\", 0.60);\n\n\
\  return widget;\n\
 }\n\
 ]}\n\n\
 The default interval of values is between zero and one, but it’s possible\n\
 to modify the interval using \
 {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_min_value}[Gtk.LevelBar.set_min_value]} \
 and\n\
 {{!Ocgtk.Level_bar.class-type-level_bar_t.method-set_max_value}[Gtk.LevelBar.set_max_value]}. \
 The value will be always drawn in\n\
 proportion to the admissible interval, i.e. a value of 15 with a specified\n\
 interval between 10 and 20 is equivalent to a value of 0.5 with an interval\n\
 between 0 and 1. When [GTK_LEVEL_BAR_MODE_DISCRETE] is used, the bar level\n\
 is rendered as a finite number of separated blocks instead of a single one.\n\
 The number of blocks that will be rendered is equal to the number of units\n\
 specified by the admissible interval.\n\n\
 For instance, to build a bar rendered with five blocks, it’s sufficient to\n\
 set the minimum value to 0 and the maximum value to 5 after changing the\n\
 indicator mode to discrete.\n\n\
 {b GtkLevelBar as GtkBuildable}\n\n\
 The [GtkLevelBar] implementation of the [GtkBuildable] interface supports a\n\
 custom [<offsets>] element, which can contain any number of [<offset>] \
 elements,\n\
 each of which must have \"name\" and \"value\" attributes.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 levelbar[.discrete]\n\
 ╰── trough\n\
\    ├── block.filled.level-name\n\
\    ┊\n\
\    ├── block.empty\n\
\    ┊\n\
 ]}\n\n\
 [GtkLevelBar] has a main CSS node with name levelbar and one of the style\n\
 classes .discrete or .continuous and a subnode with name trough. Below the\n\
 trough node are a number of nodes with name block and style class .filled\n\
 or .empty. In continuous mode, there is exactly one node of each, in discrete\n\
 mode, the number of filled and unfilled nodes corresponds to blocks that are\n\
 drawn. The block.filled nodes also get a style class .level-name corresponding\n\
 to the level for the current value.\n\n\
 In horizontal orientation, the nodes are always arranged from left to right,\n\
 regardless of text direction.\n\n\
 {b Accessibility}\n\n\
 [GtkLevelBar] uses the \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-METER}[Gtk.AccessibleRole.meter]} \
 role."]

(** {1:constructors Constructors} *)

val new_ : unit -> level_bar_t
(** Creates a new [GtkLevelBar]. *)

val new_for_interval : float -> float -> level_bar_t
(** Creates a new [GtkLevelBar] for the specified interval. *)
