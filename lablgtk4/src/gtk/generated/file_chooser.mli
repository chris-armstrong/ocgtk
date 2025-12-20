(* GENERATED CODE - DO NOT EDIT *)
(* FileChooser: FileChooser *)

type t = [`file_chooser] Gobject.obj

(* Methods *)
(** Sets whether multiple files can be selected in the file chooser.

This is only relevant if the action is set to be
%GTK_FILE_CHOOSER_ACTION_OPEN or
%GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER. *)
external set_select_multiple : t -> bool -> unit = "ml_gtk_file_chooser_set_select_multiple"

(** Sets the current filter.

Only the files that pass the filter will be displayed.
If the user-selectable list of filters is non-empty, then
the filter should be one of the filters in that list.

Setting the current filter when the list of filters is
empty is useful if you want to restrict the displayed
set of files without letting the user change it. *)
external set_filter : t -> File_filter.t -> unit = "ml_gtk_file_chooser_set_filter"

(** Sets the current name in the file selector, as if entered
by the user.

Note that the name passed in here is a UTF-8 string rather
than a filename. This function is meant for such uses as a
suggested name in a “Save As...” dialog.  You can pass
“Untitled.doc” or a similarly suitable suggestion for the @name.

If you want to preselect a particular existing file, you should
use [method@Gtk.FileChooser.set_file] instead.

Please see the documentation for those functions for an example
of using [method@Gtk.FileChooser.set_current_name] as well. *)
external set_current_name : t -> string -> unit = "ml_gtk_file_chooser_set_current_name"

(** Sets whether file chooser will offer to create new folders.

This is only relevant if the action is not set to be
%GTK_FILE_CHOOSER_ACTION_OPEN. *)
external set_create_folders : t -> bool -> unit = "ml_gtk_file_chooser_set_create_folders"

(** Selects an option in a 'choice' that has been added with
gtk_file_chooser_add_choice().

For a boolean choice, the possible options are "true" and "false". *)
external set_choice : t -> string -> string -> unit = "ml_gtk_file_chooser_set_choice"

(** Sets the type of operation that the chooser is performing.

The user interface is adapted to suit the selected action.

For example, an option to create a new folder might be shown
if the action is %GTK_FILE_CHOOSER_ACTION_SAVE but not if the
action is %GTK_FILE_CHOOSER_ACTION_OPEN. *)
external set_action : t -> Gtk_enums.filechooseraction -> unit = "ml_gtk_file_chooser_set_action"

(** Removes @filter from the list of filters that the user can select between. *)
external remove_filter : t -> File_filter.t -> unit = "ml_gtk_file_chooser_remove_filter"

(** Removes a 'choice' that has been added with gtk_file_chooser_add_choice(). *)
external remove_choice : t -> string -> unit = "ml_gtk_file_chooser_remove_choice"

(** Gets whether multiple files can be selected in the file
chooser. *)
external get_select_multiple : t -> bool = "ml_gtk_file_chooser_get_select_multiple"

(** Gets the current filter. *)
external get_filter : t -> File_filter.t option = "ml_gtk_file_chooser_get_filter"

(** Gets the current name in the file selector, as entered by the user.

This is meant to be used in save dialogs, to get the currently typed
filename when the file itself does not exist yet. *)
external get_current_name : t -> string option = "ml_gtk_file_chooser_get_current_name"

(** Gets whether file chooser will offer to create new folders. *)
external get_create_folders : t -> bool = "ml_gtk_file_chooser_get_create_folders"

(** Gets the currently selected option in the 'choice' with the given ID. *)
external get_choice : t -> string -> string option = "ml_gtk_file_chooser_get_choice"

(** Gets the type of operation that the file chooser is performing. *)
external get_action : t -> Gtk_enums.filechooseraction = "ml_gtk_file_chooser_get_action"

(** Adds @filter to the list of filters that the user can select between.

When a filter is selected, only files that are passed by that
filter are displayed.

Note that the @chooser takes ownership of the filter if it is floating,
so you have to ref and sink it if you want to keep a reference. *)
external add_filter : t -> File_filter.t -> unit = "ml_gtk_file_chooser_add_filter"

(* Properties *)

