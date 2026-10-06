(* GENERATED CODE - DO NOT EDIT *)
(* ComboBoxText: ComboBoxText *)

[@@@ocaml.text
"A [GtkComboBoxText] is a simple variant of [GtkComboBox] for text-only\n\
 use cases.\n\n\
 An example GtkComboBoxText\n\n\
 [GtkComboBoxText] hides the model-view complexity of [GtkComboBox].\n\n\
 To create a [GtkComboBoxText], use [Gtk.ComboBoxText.new] or\n\
 [Gtk.ComboBoxText.new_with_entry].\n\n\
 You can add items to a [GtkComboBoxText] with\n\
 [Gtk.ComboBoxText.append_text],\n\
 [Gtk.ComboBoxText.insert_text] or\n\
 [Gtk.ComboBoxText.prepend_text] and remove options with\n\
 [Gtk.ComboBoxText.remove].\n\n\
 If the [GtkComboBoxText] contains an entry (via the\n\
 [Gtk.ComboBox:has-entry] property), its contents can be retrieved\n\
 using [Gtk.ComboBoxText.get_active_text].\n\n\
 You should not call [Gtk.ComboBox.set_model] or attempt to pack more\n\
 cells into this combo box via its [Gtk.CellLayout] interface.\n\n\
 {b GtkComboBoxText as GtkBuildable}\n\n\
 The [GtkComboBoxText] implementation of the [GtkBuildable] interface supports\n\
 adding items directly using the [<items>] element and specifying [<item>]\n\
 elements for each item. Each [<item>] element can specify the “id”\n\
 corresponding to the appended text and also supports the regular\n\
 translation attributes “translatable”, “context” and “comments”.\n\n\
 Here is a UI definition fragment specifying [GtkComboBoxText] items:\n\n\
 {[\n\
 <object class=\"GtkComboBoxText\">\n\
\  <items>\n\
\    <item translatable=\"yes\" id=\"factory\">Factory</item>\n\
\    <item translatable=\"yes\" id=\"home\">Home</item>\n\
\    <item translatable=\"yes\" id=\"subway\">Subway</item>\n\
\  </items>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 combobox\n\
 ╰── box.linked\n\
\    ├── entry.combo\n\
\    ├── button.combo\n\
\    ╰── window.popup\n\
 ]}\n\n\
 [GtkComboBoxText] has a single CSS node with name combobox. It adds\n\
 the style class .combo to the main CSS nodes of its entry and button\n\
 children, and the .linked class to the node of its internal box."]

type t =
  [ `combo_box_text | `combo_box | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_combo_box_text_new"
(** Create a new ComboBoxText *)

external new_with_entry : unit -> t = "ml_gtk_combo_box_text_new_with_entry"
(** Create a new ComboBoxText *)

(* Methods *)

external remove_all : t -> unit = "ml_gtk_combo_box_text_remove_all"
(** Removes all the text entries from the combo box. *)

external remove : t -> int -> unit = "ml_gtk_combo_box_text_remove"
(** Removes the string at [position] from [combo_box]. *)

external prepend_text : t -> string -> unit
  = "ml_gtk_combo_box_text_prepend_text"
(** Prepends [text] to the list of strings stored in [combo_box].

    This is the same as calling [Gtk.ComboBoxText.insert_text] with a position
    of 0. *)

external prepend : t -> string option -> string -> unit
  = "ml_gtk_combo_box_text_prepend"
(** Prepends [text] to the list of strings stored in [combo_box].

    If [id] is non-[NULL] then it is used as the ID of the row.

    This is the same as calling [Gtk.ComboBoxText.insert] with a position of 0.
*)

external insert_text : t -> int -> string -> unit
  = "ml_gtk_combo_box_text_insert_text"
(** Inserts [text] at [position] in the list of strings stored in [combo_box].

    If [position] is negative then [text] is appended.

    This is the same as calling [Gtk.ComboBoxText.insert] with a [NULL] ID
    string. *)

external insert : t -> int -> string option -> string -> unit
  = "ml_gtk_combo_box_text_insert"
(** Inserts [text] at [position] in the list of strings stored in [combo_box].

    If [id] is non-[NULL] then it is used as the ID of the row. See
    [Gtk.ComboBox:id-column].

    If [position] is negative then [text] is appended. *)

external get_active_text : t -> string option
  = "ml_gtk_combo_box_text_get_active_text"
(** Returns the currently active string in [combo_box].

    If no row is currently selected, [NULL] is returned. If [combo_box] contains
    an entry, this function will return its contents (which will not necessarily
    be an item from the list). *)

external append_text : t -> string -> unit = "ml_gtk_combo_box_text_append_text"
(** Appends [text] to the list of strings stored in [combo_box].

    This is the same as calling [Gtk.ComboBoxText.insert_text] with a position
    of -1. *)

external append : t -> string option -> string -> unit
  = "ml_gtk_combo_box_text_append"
(** Appends [text] to the list of strings stored in [combo_box].

    If [id] is non-[NULL] then it is used as the ID of the row.

    This is the same as calling [Gtk.ComboBoxText.insert] with a position of -1.
*)
