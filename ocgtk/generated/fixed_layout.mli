(** Places child widgets at fixed positions.

    Its methods, signals and properties are on {!class-type-fixed_layout_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Fixed_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FixedLayout].}

    Inherits from:
    {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}

    Places child widgets at fixed positions.

    Most applications should never use this layout manager; fixed positioning
    and sizing requires constant recalculations on where children need to be
    positioned and sized. Other layout managers perform this kind of work
    internally so that application developers don't need to do it. Specifically,
    widgets positioned in a fixed layout manager will need to take into account:

    - Themes, which may change widget sizes.

    - Fonts other than the one you used to write the app will of course change
      the size of widgets containing text; keep in mind that users may use a
      larger font because of difficulty reading the default, or they may be
      using a different OS that provides different fonts.

    - Translation of text into other languages changes its size. Also, display
      of non-English text will use a different font in many cases.

    In addition, [GtkFixedLayout] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately depending on the text direction, e.g. to put labels
    to the right of the thing they label when using an RTL language;
    [GtkFixedLayout] won't be able to do that for you.

    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other elements. This is a
    long-term maintenance problem for your application. *)
class type fixed_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_fixed_layout : Raw.Fixed_layout.t
end

class fixed_layout : Raw.Fixed_layout.t -> fixed_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Fixed_layout.t}. *)

(** {1:description Description}

    Places child widgets at fixed positions.

    Most applications should never use this layout manager; fixed positioning
    and sizing requires constant recalculations on where children need to be
    positioned and sized. Other layout managers perform this kind of work
    internally so that application developers don't need to do it. Specifically,
    widgets positioned in a fixed layout manager will need to take into account:

    - Themes, which may change widget sizes.

    - Fonts other than the one you used to write the app will of course change
      the size of widgets containing text; keep in mind that users may use a
      larger font because of difficulty reading the default, or they may be
      using a different OS that provides different fonts.

    - Translation of text into other languages changes its size. Also, display
      of non-English text will use a different font in many cases.

    In addition, [GtkFixedLayout] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately depending on the text direction, e.g. to put labels
    to the right of the thing they label when using an RTL language;
    [GtkFixedLayout] won't be able to do that for you.

    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other elements. This is a
    long-term maintenance problem for your application. *)

(** {1:constructors Constructors} *)

val new_ : unit -> fixed_layout_t
(** Creates a new [GtkFixedLayout]. *)
