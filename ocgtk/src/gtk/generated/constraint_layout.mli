(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintLayout: ConstraintLayout *)

[@@@ocaml.text
"Uses constraints to describe relations between widgets.\n\n\
 [GtkConstraintLayout] is a layout manager that uses relations between\n\
 widget attributes, expressed via [Gtk.Constraint] instances, to\n\
 measure and allocate widgets.\n\n\
 {b How do constraints work}\n\n\
 Constraints are objects defining the relationship between attributes\n\
 of a widget; you can read the description of the [Gtk.Constraint]\n\
 class to have a more in depth definition.\n\n\
 By taking multiple constraints and applying them to the children of\n\
 a widget using [GtkConstraintLayout], it's possible to describe\n\
 complex layout policies; each constraint applied to a child or to the parent\n\
 widgets contributes to the full description of the layout, in terms of\n\
 parameters for resolving the value of each attribute.\n\n\
 It is important to note that a layout is defined by the totality of\n\
 constraints; removing a child, or a constraint, from an existing layout\n\
 without changing the remaining constraints may result in an unstable\n\
 or unsolvable layout.\n\n\
 Constraints have an implicit \"reading order\"; you should start describing\n\
 each edge of each child, as well as their relationship with the parent\n\
 container, from the top left (or top right, in RTL languages), horizontally\n\
 first, and then vertically.\n\n\
 A constraint-based layout with too few constraints can become \"unstable\",\n\
 that is: have more than one solution. The behavior of an unstable layout\n\
 is undefined.\n\n\
 A constraint-based layout with conflicting constraints may be unsolvable,\n\
 and lead to an unstable layout. You can use the [Gtk.Constraint:strength]\n\
 property of [Gtk.Constraint] to \"nudge\" the layout towards a solution.\n\n\
 {b GtkConstraintLayout as GtkBuildable}\n\n\
 [GtkConstraintLayout] implements the [Gtk.Buildable] interface and\n\
 has a custom \"constraints\" element which allows describing constraints in\n\
 a [Gtk.Builder] UI file.\n\n\
 An example of a UI definition fragment specifying a constraint:\n\n\
 {[\n\
\  <object class=\"GtkConstraintLayout\">\n\
\    <constraints>\n\
\      <constraint target=\"button\" target-attribute=\"start\"\n\
\                  relation=\"eq\"\n\
\                  source=\"super\" source-attribute=\"start\"\n\
\                  constant=\"12\"\n\
\                  strength=\"required\" />\n\
\      <constraint target=\"button\" target-attribute=\"width\"\n\
\                  relation=\"ge\"\n\
\                  constant=\"250\"\n\
\                  strength=\"strong\" />\n\
\    </constraints>\n\
\  </object>\n\
 ]}\n\n\
 The definition above will add two constraints to the GtkConstraintLayout:\n\n\
 - a required constraint between the leading edge of \"button\" and\n\
 the leading edge of the widget using the constraint layout, plus\n\
 12 pixels\n\
 - a strong, constant constraint making the width of \"button\" greater\n\
 than, or equal to 250 pixels\n\n\
 The \"target\" and \"target-attribute\" attributes are required.\n\n\
 The \"source\" and \"source-attribute\" attributes of the \"constraint\"\n\
 element are optional; if they are not specified, the constraint is\n\
 assumed to be a constant.\n\n\
 The \"relation\" attribute is optional; if not specified, the constraint\n\
 is assumed to be an equality.\n\n\
 The \"strength\" attribute is optional; if not specified, the constraint\n\
 is assumed to be required.\n\n\
 The \"source\" and \"target\" attributes can be set to \"super\" to indicate\n\
 that the constraint target is the widget using the GtkConstraintLayout.\n\n\
 There can be \"constant\" and \"multiplier\" attributes.\n\n\
 Additionally, the \"constraints\" element can also contain a description\n\
 of the [GtkConstraintGuides] used by the layout:\n\n\
 {[\n\
\  <constraints>\n\
\    <guide min-width=\"100\" max-width=\"500\" name=\"hspace\"/>\n\
\    <guide min-height=\"64\" nat-height=\"128\" name=\"vspace\" \
 strength=\"strong\"/>\n\
\  </constraints>\n\
 ]}\n\n\
 The \"guide\" element has the following optional attributes:\n\n\
 - \"min-width\", \"nat-width\", and \"max-width\", describe the minimum,\n\
 natural, and maximum width of the guide, respectively\n\
 - \"min-height\", \"nat-height\", and \"max-height\", describe the minimum,\n\
 natural, and maximum height of the guide, respectively\n\
 - \"strength\" describes the strength of the constraint on the natural\n\
 size of the guide; if not specified, the constraint is assumed to\n\
 have a medium strength\n\
 - \"name\" describes a name for the guide, useful when debugging\n\n\
 {b Using the Visual Format Language}\n\n\
 Complex constraints can be described using a compact syntax called VFL,\n\
 or {i Visual Format Language}.\n\n\
 The Visual Format Language describes all the constraints on a row or\n\
 column, typically starting from the leading edge towards the trailing\n\
 one. Each element of the layout is composed by \"views\", which identify\n\
 a [Gtk.ConstraintTarget].\n\n\
 For instance:\n\n\
 {[\n\
\  [button]-[textField]\n\
 ]}\n\n\
 Describes a constraint that binds the trailing edge of \"button\" to the\n\
 leading edge of \"textField\", leaving a default space between the two.\n\n\
 Using VFL is also possible to specify predicates that describe constraints\n\
 on attributes like width and height:\n\n\
 {[\n\
\  // Width must be greater than, or equal to 50\n\
\  [button(>=50)]\n\n\
\  // Width of button1 must be equal to width of button2\n\
\  [button1(==button2)]\n\
 ]}\n\n\
 The default orientation for a VFL description is horizontal, unless\n\
 otherwise specified:\n\n\
 {[\n\
\  // horizontal orientation, default attribute: width\n\
\  H:[button(>=150)]\n\n\
\  // vertical orientation, default attribute: height\n\
\  V:[button1(==button2)]\n\
 ]}\n\n\
 It's also possible to specify multiple predicates, as well as their\n\
 strength:\n\n\
 {[\n\
\  // minimum width of button must be 150\n\
\  // natural width of button can be 250\n\
\  [button(>=150@required, ==250@medium)]\n\
 ]}\n\n\
 Finally, it's also possible to use simple arithmetic operators:\n\n\
 {[\n\
\  // width of button1 must be equal to width of button2\n\
\  // divided by 2 plus 12\n\
\  [button1(button2 / 2 + 12)]\n\
 ]}"]

type t = [ `constraint_layout | `layout_manager | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_constraint_layout_new"
(** Create a new ConstraintLayout *)

(* Methods *)

external remove_guide : t -> Constraint_guide.t -> unit
  = "ml_gtk_constraint_layout_remove_guide"
(** Removes [guide] from the layout manager, so that it no longer influences the
    layout. *)

external remove_constraint : t -> Constraint.t -> unit
  = "ml_gtk_constraint_layout_remove_constraint"
(** Removes [constraint] from the layout manager, so that it no longer
    influences the layout. *)

external remove_all_constraints : t -> unit
  = "ml_gtk_constraint_layout_remove_all_constraints"
(** Removes all constraints from the layout manager. *)

external observe_guides : t -> Ocgtk_gio.Gio.Wrappers.List_model.t
  = "ml_gtk_constraint_layout_observe_guides"
(** Returns a [GListModel] to track the guides that are part of the layout.

    Calling this function will enable extra internal bookkeeping to track guides
    and emit signals on the returned listmodel. It may slow down operations a
    lot.

    Applications should try hard to avoid calling this function because of the
    slowdowns. *)

external observe_constraints : t -> Ocgtk_gio.Gio.Wrappers.List_model.t
  = "ml_gtk_constraint_layout_observe_constraints"
(** Returns a [GListModel] to track the constraints that are part of the layout.

    Calling this function will enable extra internal bookkeeping to track
    constraints and emit signals on the returned listmodel. It may slow down
    operations a lot.

    Applications should try hard to avoid calling this function because of the
    slowdowns. *)

external add_guide : t -> Constraint_guide.t -> unit
  = "ml_gtk_constraint_layout_add_guide"
(** Adds a guide to [layout].

    A guide can be used as the source or target of constraints, like a widget,
    but it is not visible.

    The [layout] acquires the ownership of [guide] after calling this function.
*)

external add_constraint : t -> Constraint.t -> unit
  = "ml_gtk_constraint_layout_add_constraint"
(** Adds a constraint to the layout manager.

    The [Gtk.Constraint:source] and [Gtk.Constraint:target] properties of
    [constraint] can be:

    - set to [NULL] to indicate that the constraint refers to the widget using
      [layout]
    - set to the [Gtk.Widget] using [layout]
    - set to a child of the [Gtk.Widget] using [layout]
    - set to a [Gtk.ConstraintGuide] that is part of [layout]

    The [layout] acquires the ownership of [constraint] after calling this
    function. *)
