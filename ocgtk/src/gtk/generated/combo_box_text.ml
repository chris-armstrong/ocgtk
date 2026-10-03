(* GENERATED CODE - DO NOT EDIT *)
(* ComboBoxText: ComboBoxText *)

type t =
  [ `combo_box_text | `combo_box | `widget | `initially_unowned | `object_ ]
  Gobject.obj
(** A [GtkComboBoxText] is a simple variant of [GtkComboBox] for text-only use
    cases.

    An example GtkComboBoxText

    [GtkComboBoxText] hides the model-view complexity of [GtkComboBox].

    To create a [GtkComboBoxText], use [Gtk.ComboBoxText.new] or
    [Gtk.ComboBoxText.new_with_entry].

    You can add items to a [GtkComboBoxText] with
    [Gtk.ComboBoxText.append_text], [Gtk.ComboBoxText.insert_text] or
    [Gtk.ComboBoxText.prepend_text] and remove options with
    [Gtk.ComboBoxText.remove].

    If the [GtkComboBoxText] contains an entry (via the [Gtk.ComboBox:has-entry]
    property), its contents can be retrieved using
    [Gtk.ComboBoxText.get_active_text].

    You should not call [Gtk.ComboBox.set_model] or attempt to pack more cells
    into this combo box via its [Gtk.CellLayout] interface.

    {b GtkComboBoxText as GtkBuildable}

    The [GtkComboBoxText] implementation of the [GtkBuildable] interface
    supports adding items directly using the [<items>] element and specifying
    [<item>] elements for each item. Each [<item>] element can specify the “id”
    corresponding to the appended text and also supports the regular translation
    attributes “translatable”, “context” and “comments”.

    Here is a UI definition fragment specifying [GtkComboBoxText] items:

    {[
    <object class=”GtkComboBoxText”>
      <items>
        <item translatable=”yes” id=”factory”>Factory</item>
        <item translatable=”yes” id=”home”>Home</item>
        <item translatable=”yes” id=”subway”>Subway</item>
      </items>
    </object>
    ]}

    {b CSS nodes}

    {[
    combobox
    ╰── box.linked
        ├── entry.combo
        ├── button.combo
        ╰── window.popup
    ]}

    [GtkComboBoxText] has a single CSS node with name combobox. It adds the
    style class .combo to the main CSS nodes of its entry and button children,
    and the .linked class to the node of its internal box. *)

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
