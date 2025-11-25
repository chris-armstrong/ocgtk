(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextBuffer *)

type t = Gtk.widget

(** Create a new TextBuffer *)
external new_ : Gtk.widget option -> t = "ml_gtk_text_buffer_new"

(* Properties *)

(** Undoes the last undoable action on the buffer, if there is one. *)
external undo : t -> unit = "ml_gtk_text_buffer_undo"

(** Deletes current contents of @buffer, and inserts @text instead. This is
automatically marked as an irreversible action in the undo stack. If you
wish to mark this action as part of a larger undo operation, call
[method@TextBuffer.delete] and [method@TextBuffer.insert] directly instead.

If @len is -1, @text must be nul-terminated.
@text must be valid UTF-8. *)
external set_text : t -> string -> int -> unit = "ml_gtk_text_buffer_set_text"

(** Used to keep track of whether the buffer has been
modified since the last time it was saved.

Whenever the buffer is saved to disk, call
`gtk_text_buffer_set_modified (@buffer, FALSE)`.
When the buffer is modified, it will automatically
toggle on the modified bit again. When the modified
bit flips, the buffer emits the
[signal@Gtk.TextBuffer::modified-changed] signal. *)
external set_modified : t -> bool -> unit = "ml_gtk_text_buffer_set_modified"

(** Sets the maximum number of undo levels to perform.

If 0, unlimited undo actions may be performed. Note that this may
have a memory usage impact as it requires storing an additional
copy of the inserted or removed text within the text buffer. *)
external set_max_undo_levels : t -> int -> unit = "ml_gtk_text_buffer_set_max_undo_levels"

(** Sets whether or not to enable undoable actions in the text buffer.

Undoable actions in this context are changes to the text content of
the buffer. Changes to tags and marks are not tracked.

If enabled, the user will be able to undo the last number of actions
up to [method@Gtk.TextBuffer.get_max_undo_levels].

See [method@Gtk.TextBuffer.begin_irreversible_action] and
[method@Gtk.TextBuffer.end_irreversible_action] to create
changes to the buffer that cannot be undone. *)
external set_enable_undo : t -> bool -> unit = "ml_gtk_text_buffer_set_enable_undo"

(** Redoes the next redoable action on the buffer, if there is one. *)
external redo : t -> unit = "ml_gtk_text_buffer_redo"

(** Inserts the text in @markup at position @iter.

@markup will be inserted in its entirety and must be nul-terminated
and valid UTF-8. Emits the [signal@Gtk.TextBuffer::insert-text] signal,
possibly multiple times; insertion actually occurs in the default handler
for the signal. @iter will point to the end of the inserted text on return. *)
external insert_markup : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_text_buffer_insert_markup"

(** Inserts @text in @buffer.

Calls [method@Gtk.TextBuffer.insert_interactive]
at the cursor position.

@default_editable indicates the editability of text that doesn't
have a tag affecting editability applied to it. Typically the
result of [method@Gtk.TextView.get_editable] is appropriate here. *)
external insert_interactive_at_cursor : t -> string -> int -> bool -> bool = "ml_gtk_text_buffer_insert_interactive_at_cursor"

(** Inserts @text in @buffer.

Like [method@Gtk.TextBuffer.insert], but the insertion will not occur
if @iter is at a non-editable location in the buffer. Usually you
want to prevent insertions at ineditable locations if the insertion
results from a user action (is interactive).

@default_editable indicates the editability of text that doesn't
have a tag affecting editability applied to it. Typically the
result of [method@Gtk.TextView.get_editable] is appropriate here. *)
external insert_interactive : t -> Gtk.widget -> string -> int -> bool -> bool = "ml_gtk_text_buffer_insert_interactive"

(** Inserts a child widget anchor into the text buffer at @iter.

The anchor will be counted as one character in character counts, and
when obtaining the buffer contents as a string, will be represented
by the Unicode “object replacement character” 0xFFFC. Note that the
“slice” variants for obtaining portions of the buffer as a string
include this character for child anchors, but the “text” variants do
not. E.g. see [method@Gtk.TextBuffer.get_slice] and
[method@Gtk.TextBuffer.get_text].

Consider [method@Gtk.TextBuffer.create_child_anchor] as a more
convenient alternative to this function. The buffer will add a
reference to the anchor, so you can unref it after insertion. *)
external insert_child_anchor : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_insert_child_anchor"

(** Inserts @text in @buffer.

Simply calls [method@Gtk.TextBuffer.insert],
using the current cursor position as the insertion point. *)
external insert_at_cursor : t -> string -> int -> unit = "ml_gtk_text_buffer_insert_at_cursor"

(** Inserts @len bytes of @text at position @iter.

If @len is -1, @text must be nul-terminated and will be inserted in its
entirety. Emits the “insert-text” signal; insertion actually occurs
in the default handler for the signal. @iter is invalidated when
insertion occurs (because the buffer contents change), but the
default signal handler revalidates it to point to the end of the
inserted text. *)
external insert : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_text_buffer_insert"

(** Get the `GtkTextTagTable` associated with this buffer. *)
external get_tag_table : t -> Gtk.widget = "ml_gtk_text_buffer_get_tag_table"

(** Initialized @iter with the first position in the text buffer.

This is the same as using [method@Gtk.TextBuffer.get_iter_at_offset]
to get the iter at character offset 0. *)
external get_start_iter : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_start_iter"

(** Returns %TRUE if some text is selected; places the bounds
of the selection in @start and @end.

If the selection has length 0, then @start and @end are filled
in with the same value. @start and @end will be in ascending order.
If @start and @end are %NULL, then they are not filled in, but the
return value still indicates whether text is selected. *)
external get_selection_bounds : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_text_buffer_get_selection_bounds"

(** Returns the mark that represents the selection bound.

Equivalent to calling [method@Gtk.TextBuffer.get_mark]
to get the mark named “selection_bound”, but very slightly
more efficient, and involves less typing.

The currently-selected text in @buffer is the region between the
“selection_bound” and “insert” marks. If “selection_bound” and
“insert” are in the same place, then there is no current selection.
[method@Gtk.TextBuffer.get_selection_bounds] is another convenient
function for handling the selection, if you just want to know whether
there’s a selection and what its bounds are. *)
external get_selection_bound : t -> Gtk.widget = "ml_gtk_text_buffer_get_selection_bound"

(** Indicates whether the buffer has been modified since the last call
to [method@Gtk.TextBuffer.set_modified] set the modification flag to
%FALSE.

Used for example to enable a “save” function in a text editor. *)
external get_modified : t -> bool = "ml_gtk_text_buffer_get_modified"

(** Gets the maximum number of undo levels to perform.

If 0, unlimited undo actions may be performed. Note that this may
have a memory usage impact as it requires storing an additional
copy of the inserted or removed text within the text buffer. *)
external get_max_undo_levels : t -> int = "ml_gtk_text_buffer_get_max_undo_levels"

(** Returns the mark named @name in buffer @buffer, or %NULL if no such
mark exists in the buffer. *)
external get_mark : t -> string -> Gtk.widget = "ml_gtk_text_buffer_get_mark"

(** Obtains the number of lines in the buffer.

This value is cached, so the function is very fast. *)
external get_line_count : t -> int = "ml_gtk_text_buffer_get_line_count"

(** Initializes @iter to a position @char_offset chars from the start
of the entire buffer.

If @char_offset is -1 or greater than the number
of characters in the buffer, @iter is initialized to the end iterator,
the iterator one past the last valid character in the buffer. *)
external get_iter_at_offset : t -> Gtk.widget -> int -> unit = "ml_gtk_text_buffer_get_iter_at_offset"

(** Initializes @iter with the current position of @mark. *)
external get_iter_at_mark : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_iter_at_mark"

(** Obtains an iterator pointing to @char_offset within the given line.

Note characters, not bytes; UTF-8 may encode one character as multiple
bytes.

If @line_number is greater than or equal to the number of lines in the @buffer,
the end iterator is returned. And if @char_offset is off the
end of the line, the iterator at the end of the line is returned. *)
external get_iter_at_line_offset : t -> Gtk.widget -> int -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line_offset"

(** Obtains an iterator pointing to @byte_index within the given line.

@byte_index must be the start of a UTF-8 character. Note bytes, not
characters; UTF-8 may encode one character as multiple bytes.

If @line_number is greater than or equal to the number of lines in the @buffer,
the end iterator is returned. And if @byte_index is off the
end of the line, the iterator at the end of the line is returned. *)
external get_iter_at_line_index : t -> Gtk.widget -> int -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line_index"

(** Initializes @iter to the start of the given line.

If @line_number is greater than or equal to the number of lines
in the @buffer, the end iterator is returned. *)
external get_iter_at_line : t -> Gtk.widget -> int -> bool = "ml_gtk_text_buffer_get_iter_at_line"

(** Obtains the location of @anchor within @buffer. *)
external get_iter_at_child_anchor : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_iter_at_child_anchor"

(** Returns the mark that represents the cursor (insertion point).

Equivalent to calling [method@Gtk.TextBuffer.get_mark]
to get the mark named “insert”, but very slightly more
efficient, and involves less typing. *)
external get_insert : t -> Gtk.widget = "ml_gtk_text_buffer_get_insert"

(** Indicates whether the buffer has some text currently selected. *)
external get_has_selection : t -> bool = "ml_gtk_text_buffer_get_has_selection"

(** Initializes @iter with the “end iterator,” one past the last valid
character in the text buffer.

If dereferenced with [method@Gtk.TextIter.get_char], the end
iterator has a character value of 0.
The entire buffer lies in the range from the first position in
the buffer (call [method@Gtk.TextBuffer.get_start_iter] to get
character position 0) to the end iterator. *)
external get_end_iter : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_end_iter"

(** Gets whether the buffer is saving modifications to the buffer
to allow for undo and redo actions.

See [method@Gtk.TextBuffer.begin_irreversible_action] and
[method@Gtk.TextBuffer.end_irreversible_action] to create
changes to the buffer that cannot be undone. *)
external get_enable_undo : t -> bool = "ml_gtk_text_buffer_get_enable_undo"

(** Gets the number of characters in the buffer.

Note that characters and bytes are not the same, you can’t e.g.
expect the contents of the buffer in string form to be this
many bytes long.

The character count is cached, so this function is very fast. *)
external get_char_count : t -> int = "ml_gtk_text_buffer_get_char_count"

(** Gets whether there is an undoable action in the history. *)
external get_can_undo : t -> bool = "ml_gtk_text_buffer_get_can_undo"

(** Gets whether there is a redoable action in the history. *)
external get_can_redo : t -> bool = "ml_gtk_text_buffer_get_can_redo"

(** Retrieves the first and last iterators in the buffer, i.e. the
entire buffer lies within the range [@start,@end). *)
external get_bounds : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_get_bounds"

(** Ends a user-visible operation.

Should be paired with a call to
[method@Gtk.TextBuffer.begin_user_action].
See that function for a full explanation. *)
external end_user_action : t -> unit = "ml_gtk_text_buffer_end_user_action"

(** Denotes the end of an action that may not be undone.

This will cause any previous operations in the undo/redo
queue to be cleared.

This should be called after completing modifications to the
text buffer after [method@Gtk.TextBuffer.begin_irreversible_action]
was called.

You may nest calls to gtk_text_buffer_begin_irreversible_action()
and gtk_text_buffer_end_irreversible_action() pairs. *)
external end_irreversible_action : t -> unit = "ml_gtk_text_buffer_end_irreversible_action"

(** Deletes the range between the “insert” and “selection_bound” marks,
that is, the currently-selected text.

If @interactive is %TRUE, the editability of the selection will be
considered (users can’t delete uneditable text). *)
external delete_selection : t -> bool -> bool -> bool = "ml_gtk_text_buffer_delete_selection"

(** Deletes the mark named @name; the mark must exist.

See [method@Gtk.TextBuffer.delete_mark] for details. *)
external delete_mark_by_name : t -> string -> unit = "ml_gtk_text_buffer_delete_mark_by_name"

(** Deletes @mark, so that it’s no longer located anywhere in the
buffer.

Removes the reference the buffer holds to the mark, so if
you haven’t called g_object_ref() on the mark, it will be freed.
Even if the mark isn’t freed, most operations on @mark become
invalid, until it gets added to a buffer again with
[method@Gtk.TextBuffer.add_mark]. Use [method@Gtk.TextMark.get_deleted]
to find out if a mark has been removed from its buffer.

The [signal@Gtk.TextBuffer::mark-deleted] signal will be emitted as
notification after the mark is deleted. *)
external delete_mark : t -> Gtk.widget -> unit = "ml_gtk_text_buffer_delete_mark"

(** Deletes all editable text in the given range.

Calls [method@Gtk.TextBuffer.delete] for each editable
sub-range of [@start,@end). @start and @end are revalidated
to point to the location of the last deleted range, or left
untouched if no text was deleted. *)
external delete_interactive : t -> Gtk.widget -> Gtk.widget -> bool -> bool = "ml_gtk_text_buffer_delete_interactive"

(** Deletes text between @start and @end.

The order of @start and @end is not actually relevant;
gtk_text_buffer_delete() will reorder them.

This function actually emits the “delete-range” signal, and
the default handler of that signal deletes the text. Because the
buffer is modified, all outstanding iterators become invalid after
calling this function; however, the @start and @end will be
re-initialized to point to the location where text was deleted. *)
external delete : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_text_buffer_delete"

(** Creates and inserts a child anchor.

This is a convenience function which simply creates a child anchor
with [ctor@Gtk.TextChildAnchor.new] and inserts it into the buffer
with [method@Gtk.TextBuffer.insert_child_anchor].

The new anchor is owned by the buffer; no reference count is
returned to the caller of this function. *)
external create_child_anchor : t -> Gtk.widget -> Gtk.widget = "ml_gtk_text_buffer_create_child_anchor"

(** Called to indicate that the buffer operations between here and a
call to gtk_text_buffer_end_user_action() are part of a single
user-visible operation.

The operations between gtk_text_buffer_begin_user_action() and
gtk_text_buffer_end_user_action() can then be grouped when creating
an undo stack. `GtkTextBuffer` maintains a count of calls to
gtk_text_buffer_begin_user_action() that have not been closed with
a call to gtk_text_buffer_end_user_action(), and emits the
“begin-user-action” and “end-user-action” signals only for the
outermost pair of calls. This allows you to build user actions
from other user actions.

The “interactive” buffer mutation functions, such as
[method@Gtk.TextBuffer.insert_interactive], automatically call
begin/end user action around the buffer operations they perform,
so there's no need to add extra calls if you user action consists
solely of a single call to one of those functions. *)
external begin_user_action : t -> unit = "ml_gtk_text_buffer_begin_user_action"

(** Denotes the beginning of an action that may not be undone.

This will cause any previous operations in the undo/redo queue
to be cleared.

This should be paired with a call to
[method@Gtk.TextBuffer.end_irreversible_action] after the irreversible
action has completed.

You may nest calls to gtk_text_buffer_begin_irreversible_action()
and gtk_text_buffer_end_irreversible_action() pairs. *)
external begin_irreversible_action : t -> unit = "ml_gtk_text_buffer_begin_irreversible_action"

(** Performs the appropriate action as if the user hit the delete
key with the cursor at the position specified by @iter.

In the normal case a single character will be deleted, but when
combining accents are involved, more than one character can
be deleted, and when precomposed character and accent combinations
are involved, less than one character will be deleted.

Because the buffer is modified, all outstanding iterators become
invalid after calling this function; however, the @iter will be
re-initialized to point to the location where text was deleted. *)
external backspace : t -> Gtk.widget -> bool -> bool -> bool = "ml_gtk_text_buffer_backspace"

