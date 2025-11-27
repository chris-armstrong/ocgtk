(* GENERATED CODE - DO NOT EDIT *)
(* Record: TextIter *)

(** An iterator for the contents of a `GtkTextBuffer`.

You may wish to begin by reading the
[text widget conceptual overview](section-text-widget.html),
which gives an overview of all the objects and data types
related to the text widget and how they work together. *)
type t = Obj.t

(** Gets whether a range with @tag applied to it begins
or ends at @iter.

This is equivalent to (gtk_text_iter_starts_tag() ||
gtk_text_iter_ends_tag()) *)
external toggles_tag : t -> Gtk.widget option -> bool = "ml_gtk_text_iter_toggles_tag"

(** Determines whether @iter begins a natural-language word.

Word breaks are determined by Pango and should be correct
for nearly any language. *)
external starts_word : t -> bool = "ml_gtk_text_iter_starts_word"

(** Returns %TRUE if @tag is toggled on at exactly this point.

If @tag is %NULL, returns %TRUE if any tag is toggled on at this point.

Note that if this function returns %TRUE, it means that
@iter is at the beginning of the tagged range, and that the
character at @iter is inside the tagged range. In other
words, unlike [method@Gtk.TextIter.ends_tag], if
this function returns %TRUE, [method@Gtk.TextIter.has_tag]
will also return %TRUE for the same parameters. *)
external starts_tag : t -> Gtk.widget option -> bool = "ml_gtk_text_iter_starts_tag"

(** Determines whether @iter begins a sentence.

Sentence boundaries are determined by Pango and
should be correct for nearly any language. *)
external starts_sentence : t -> bool = "ml_gtk_text_iter_starts_sentence"

(** Returns %TRUE if @iter begins a paragraph.

This is the case if [method@Gtk.TextIter.get_line_offset]
would return 0. However this function is potentially more
efficient than [method@Gtk.TextIter.get_line_offset], because
it doesn’t have to compute the offset, it just has to see
whether it’s 0. *)
external starts_line : t -> bool = "ml_gtk_text_iter_starts_line"

(** Like [method@Gtk.TextIter.set_line_offset], but the offset is in visible
characters, i.e. text with a tag making it invisible is not
counted in the offset. *)
external set_visible_line_offset : t -> int -> unit = "ml_gtk_text_iter_set_visible_line_offset"

(** Like [method@Gtk.TextIter.set_line_index], but the index is in visible
bytes, i.e. text with a tag making it invisible is not counted
in the index. *)
external set_visible_line_index : t -> int -> unit = "ml_gtk_text_iter_set_visible_line_index"

(** Sets @iter to point to @char_offset.

@char_offset counts from the start
of the entire text buffer, starting with 0. *)
external set_offset : t -> int -> unit = "ml_gtk_text_iter_set_offset"

(** Moves @iter within a line, to a new character (not byte) offset.

The given character offset must be less than or equal to the number
of characters in the line; if equal, @iter moves to the start of the
next line. See [method@Gtk.TextIter.set_line_index] if you have a byte
index rather than a character offset. *)
external set_line_offset : t -> int -> unit = "ml_gtk_text_iter_set_line_offset"

(** Same as [method@Gtk.TextIter.set_line_offset], but works with a
byte index. The given byte index must be at
the start of a character, it can’t be in the middle of a UTF-8
encoded character. *)
external set_line_index : t -> int -> unit = "ml_gtk_text_iter_set_line_index"

(** Moves iterator @iter to the start of the line @line_number.

If @line_number is negative or larger than or equal to the number of lines
in the buffer, moves @iter to the start of the last line in the buffer. *)
external set_line : t -> int -> unit = "ml_gtk_text_iter_set_line"

(** Swaps the value of @first and @second if @second comes before
@first in the buffer.

That is, ensures that @first and @second are in sequence.
Most text buffer functions that take a range call this
automatically on your behalf, so there’s no real reason to
call it yourself in those cases. There are some exceptions,
such as [method@Gtk.TextIter.in_range], that expect a
pre-sorted range. *)
external order : t -> Obj.t -> unit = "ml_gtk_text_iter_order"

(** Returns %TRUE if @iter is the first iterator in the buffer. *)
external is_start : t -> bool = "ml_gtk_text_iter_is_start"

(** Returns %TRUE if @iter is the end iterator.

This means it is one past the last dereferenceable iterator
in the buffer. [method@Gtk.TextIter.is_end] is the most efficient
way to check whether an iterator is the end iterator. *)
external is_end : t -> bool = "ml_gtk_text_iter_is_end"

(** Determine if @iter is at a cursor position.

See [method@Gtk.TextIter.forward_cursor_position] or
[struct@Pango.LogAttr] or [func@Pango.break] for details
on what a cursor position is. *)
external is_cursor_position : t -> bool = "ml_gtk_text_iter_is_cursor_position"

(** Determines whether the character pointed by @iter is part of a
natural-language word (as opposed to say inside some whitespace).

Word breaks are determined by Pango and should be correct
for nearly any language.

Note that if [method@Gtk.TextIter.starts_word] returns %TRUE,
then this function returns %TRUE too, since @iter points to
the first character of the word. *)
external inside_word : t -> bool = "ml_gtk_text_iter_inside_word"

(** Determines whether @iter is inside a sentence (as opposed to in
between two sentences, e.g. after a period and before the first
letter of the next sentence).

Sentence boundaries are determined by Pango and should be correct
for nearly any language. *)
external inside_sentence : t -> bool = "ml_gtk_text_iter_inside_sentence"

(** Checks whether @iter falls in the range [@start, @end).

@start and @end must be in ascending order. *)
external in_range : t -> Obj.t -> Obj.t -> bool = "ml_gtk_text_iter_in_range"

(** Returns %TRUE if @iter points to a character that is part
of a range tagged with @tag.

See also [method@Gtk.TextIter.starts_tag] and
[method@Gtk.TextIter.ends_tag]. *)
external has_tag : t -> Gtk.widget -> bool = "ml_gtk_text_iter_has_tag"

(** Returns the offset in characters from the start of the
line to the given @iter, not counting characters that
are invisible due to tags with the “invisible” flag
toggled on. *)
external get_visible_line_offset : t -> int = "ml_gtk_text_iter_get_visible_line_offset"

(** Returns the number of bytes from the start of the
line to the given @iter, not counting bytes that
are invisible due to tags with the “invisible” flag
toggled on. *)
external get_visible_line_index : t -> int = "ml_gtk_text_iter_get_visible_line_index"

(** Returns the character offset of an iterator.

Each character in a `GtkTextBuffer` has an offset,
starting with 0 for the first character in the buffer.
Use [method@Gtk.TextBuffer.get_iter_at_offset] to convert
an offset back into an iterator. *)
external get_offset : t -> int = "ml_gtk_text_iter_get_offset"

(** Returns the character offset of the iterator,
counting from the start of a newline-terminated line.

The first character on the line has offset 0. *)
external get_line_offset : t -> int = "ml_gtk_text_iter_get_line_offset"

(** Returns the byte index of the iterator, counting
from the start of a newline-terminated line.

Remember that `GtkTextBuffer` encodes text in
UTF-8, and that characters can require a variable
number of bytes to represent. *)
external get_line_index : t -> int = "ml_gtk_text_iter_get_line_index"

(** Returns the line number containing the iterator.

Lines in a `GtkTextBuffer` are numbered beginning
with 0 for the first line in the buffer. *)
external get_line : t -> int = "ml_gtk_text_iter_get_line"

(** If the location at @iter contains a child anchor, the
anchor is returned.

Otherwise, %NULL is returned. *)
external get_child_anchor : t -> Gtk.widget option = "ml_gtk_text_iter_get_child_anchor"

(** Returns the number of characters in the line containing @iter,
including the paragraph delimiters. *)
external get_chars_in_line : t -> int = "ml_gtk_text_iter_get_chars_in_line"

(** Returns the number of bytes in the line containing @iter,
including the paragraph delimiters. *)
external get_bytes_in_line : t -> int = "ml_gtk_text_iter_get_bytes_in_line"

(** Returns the `GtkTextBuffer` this iterator is associated with. *)
external get_buffer : t -> Gtk.widget = "ml_gtk_text_iter_get_buffer"

(** Calls [method@Gtk.TextIter.forward_word_end] up to @count times. *)
external forward_word_ends : t -> int -> bool = "ml_gtk_text_iter_forward_word_ends"

(** Moves forward to the next word end.

If @iter is currently on a word end, moves forward to the
next one after that.

Word breaks are determined by Pango and should be correct
for nearly any language. *)
external forward_word_end : t -> bool = "ml_gtk_text_iter_forward_word_end"

(** Calls [method@Gtk.TextIter.forward_visible_word_end] up to @count times. *)
external forward_visible_word_ends : t -> int -> bool = "ml_gtk_text_iter_forward_visible_word_ends"

(** Moves forward to the next visible word end.

If @iter is currently on a word end, moves forward to the
next one after that.

Word breaks are determined by Pango and should be correct
for nearly any language *)
external forward_visible_word_end : t -> bool = "ml_gtk_text_iter_forward_visible_word_end"

(** Moves @count visible lines forward, if possible.

If @count would move past the start or end of the buffer, moves to
the start or end of the buffer.

The return value indicates whether the iterator moved
onto a dereferenceable position; if the iterator didn’t move, or
moved onto the end iterator, then %FALSE is returned. If @count is 0,
the function does nothing and returns %FALSE. If @count is negative,
moves backward by 0 - @count lines. *)
external forward_visible_lines : t -> int -> bool = "ml_gtk_text_iter_forward_visible_lines"

(** Moves @iter to the start of the next visible line.

Returns %TRUE if there
was a next line to move to, and %FALSE if @iter was simply moved to
the end of the buffer and is now not dereferenceable, or if @iter was
already at the end of the buffer. *)
external forward_visible_line : t -> bool = "ml_gtk_text_iter_forward_visible_line"

(** Moves up to @count visible cursor positions.

See [method@Gtk.TextIter.forward_cursor_position] for details. *)
external forward_visible_cursor_positions : t -> int -> bool = "ml_gtk_text_iter_forward_visible_cursor_positions"

(** Moves @iter forward to the next visible cursor position.

See [method@Gtk.TextIter.forward_cursor_position] for details. *)
external forward_visible_cursor_position : t -> bool = "ml_gtk_text_iter_forward_visible_cursor_position"

(** Moves forward to the next toggle (on or off) of the
@tag, or to the next toggle of any tag if
@tag is %NULL.

If no matching tag toggles are found,
returns %FALSE, otherwise %TRUE. Does not return toggles
located at @iter, only toggles after @iter. Sets @iter to
the location of the toggle, or to the end of the buffer
if no toggle is found. *)
external forward_to_tag_toggle : t -> Gtk.widget option -> bool = "ml_gtk_text_iter_forward_to_tag_toggle"

(** Moves the iterator to point to the paragraph delimiter characters.

The possible characters are either a newline, a carriage return,
a carriage return/newline in sequence, or the Unicode paragraph
separator character.

If the iterator is already at the paragraph delimiter
characters, moves to the paragraph delimiter characters for the
next line. If @iter is on the last line in the buffer, which does
not end in paragraph delimiters, moves to the end iterator (end of
the last line), and returns %FALSE. *)
external forward_to_line_end : t -> bool = "ml_gtk_text_iter_forward_to_line_end"

(** Moves @iter forward to the “end iterator”, which points
one past the last valid character in the buffer.

[method@Gtk.TextIter.get_char] called on the end iterator
returns 0, which is convenient for writing loops. *)
external forward_to_end : t -> unit = "ml_gtk_text_iter_forward_to_end"

(** Calls [method@Gtk.TextIter.forward_sentence_end] @count times.

If @count is negative, moves backward instead of forward. *)
external forward_sentence_ends : t -> int -> bool = "ml_gtk_text_iter_forward_sentence_ends"

(** Moves forward to the next sentence end.

If @iter is at the end of a sentence, moves to the next
end of sentence.

Sentence boundaries are determined by Pango and should
be correct for nearly any language. *)
external forward_sentence_end : t -> bool = "ml_gtk_text_iter_forward_sentence_end"

(** Searches forward for @str.

Any match is returned by setting @match_start to the first character
of the match and @match_end to the first character after the match.
The search will not continue past @limit. Note that a search is a
linear or O(n) operation, so you may wish to use @limit to avoid
locking up your UI on large buffers.

@match_start will never be set to a `GtkTextIter` located before @iter,
even if there is a possible @match_end after or at @iter. *)
external forward_search : t -> string -> Gtk_enums.textsearchflags -> Obj.t option -> bool * Obj.t * Obj.t = "ml_gtk_text_iter_forward_search_bytecode" "ml_gtk_text_iter_forward_search_native"

(** Moves @count lines forward, if possible.

If @count would move past the start or end of the buffer, moves to
the start or end of the buffer.

The return value indicates whether the iterator moved
onto a dereferenceable position; if the iterator didn’t move, or
moved onto the end iterator, then %FALSE is returned. If @count is 0,
the function does nothing and returns %FALSE. If @count is negative,
moves backward by 0 - @count lines. *)
external forward_lines : t -> int -> bool = "ml_gtk_text_iter_forward_lines"

(** Moves @iter to the start of the next line.

If the iter is already on the last line of the buffer,
moves the iter to the end of the current line. If after
the operation, the iter is at the end of the buffer and not
dereferenceable, returns %FALSE. Otherwise, returns %TRUE. *)
external forward_line : t -> bool = "ml_gtk_text_iter_forward_line"

(** Moves up to @count cursor positions.

See [method@Gtk.TextIter.forward_cursor_position] for details. *)
external forward_cursor_positions : t -> int -> bool = "ml_gtk_text_iter_forward_cursor_positions"

(** Moves @iter forward by a single cursor position.

Cursor positions are (unsurprisingly) positions where the
cursor can appear. Perhaps surprisingly, there may not be
a cursor position between all characters. The most common
example for European languages would be a carriage return/newline
sequence.

For some Unicode characters, the equivalent of say the letter “a”
with an accent mark will be represented as two characters, first
the letter then a "combining mark" that causes the accent to be
rendered; so the cursor can’t go between those two characters.

See also the [struct@Pango.LogAttr] struct and the [func@Pango.break]
function. *)
external forward_cursor_position : t -> bool = "ml_gtk_text_iter_forward_cursor_position"

(** Moves @count characters if possible.

If @count would move past the start or end of the buffer,
moves to the start or end of the buffer.

The return value indicates whether the new position of
@iter is different from its original position, and dereferenceable
(the last iterator in the buffer is not dereferenceable). If @count
is 0, the function does nothing and returns %FALSE. *)
external forward_chars : t -> int -> bool = "ml_gtk_text_iter_forward_chars"

(** Moves @iter forward by one character offset.

Note that images embedded in the buffer occupy 1 character slot, so
this function may actually move onto an image instead of a character,
if you have images in your buffer. If @iter is the end iterator or
one character before it, @iter will now point at the end iterator,
and this function returns %FALSE for convenience when writing loops. *)
external forward_char : t -> bool = "ml_gtk_text_iter_forward_char"

(** Tests whether two iterators are equal, using the fastest possible
mechanism.

This function is very fast; you can expect it to perform
better than e.g. getting the character offset for each
iterator and comparing the offsets yourself. Also, it’s a
bit faster than [method@Gtk.TextIter.compare]. *)
external equal : t -> Obj.t -> bool = "ml_gtk_text_iter_equal"

(** Determines whether @iter ends a natural-language word.

Word breaks are determined by Pango and should be correct
for nearly any language. *)
external ends_word : t -> bool = "ml_gtk_text_iter_ends_word"

(** Returns %TRUE if @tag is toggled off at exactly this point.

If @tag is %NULL, returns %TRUE if any tag is toggled off at this point.

Note that if this function returns %TRUE, it means that
@iter is at the end of the tagged range, but that the character
at @iter is outside the tagged range. In other words,
unlike [method@Gtk.TextIter.starts_tag], if this function
returns %TRUE, [method@Gtk.TextIter.has_tag] will return
%FALSE for the same parameters. *)
external ends_tag : t -> Gtk.widget option -> bool = "ml_gtk_text_iter_ends_tag"

(** Determines whether @iter ends a sentence.

Sentence boundaries are determined by Pango and should
be correct for nearly any language. *)
external ends_sentence : t -> bool = "ml_gtk_text_iter_ends_sentence"

(** Returns %TRUE if @iter points to the start of the paragraph
delimiter characters for a line.

Delimiters will be either a newline, a carriage return, a carriage
return followed by a newline, or a Unicode paragraph separator
character.

Note that an iterator pointing to the \n of a \r\n pair will not be
counted as the end of a line, the line ends before the \r. The end
iterator is considered to be at the end of a line, even though there
are no paragraph delimiter chars there. *)
external ends_line : t -> bool = "ml_gtk_text_iter_ends_line"

(** Returns whether the character at @iter is within an editable region
of text.

Non-editable text is “locked” and can’t be changed by the
user via `GtkTextView`. If no tags applied to this text affect
editability, @default_setting will be returned.

You don’t want to use this function to decide whether text can be
inserted at @iter, because for insertion you don’t want to know
whether the char at @iter is inside an editable range, you want to
know whether a new character inserted at @iter would be inside an
editable range. Use [method@Gtk.TextIter.can_insert] to handle this
case. *)
external editable : t -> bool -> bool = "ml_gtk_text_iter_editable"

(** A qsort()-style function that returns negative if @lhs is less than
@rhs, positive if @lhs is greater than @rhs, and 0 if they’re equal.

Ordering is in character offset order, i.e. the first character
in the buffer is less than the second character in the buffer. *)
external compare : t -> Obj.t -> int = "ml_gtk_text_iter_compare"

(** Considering the default editability of the buffer, and tags that
affect editability, determines whether text inserted at @iter would
be editable.

If text inserted at @iter would be editable then the
user should be allowed to insert text at @iter.
[method@Gtk.TextBuffer.insert_interactive] uses this function
to decide whether insertions are allowed at a given position. *)
external can_insert : t -> bool -> bool = "ml_gtk_text_iter_can_insert"

(** Calls [method@Gtk.TextIter.backward_word_start] up to @count times. *)
external backward_word_starts : t -> int -> bool = "ml_gtk_text_iter_backward_word_starts"

(** Moves backward to the previous word start.

If @iter is currently on a word start, moves backward to the
next one after that.

Word breaks are determined by Pango and should be correct
for nearly any language *)
external backward_word_start : t -> bool = "ml_gtk_text_iter_backward_word_start"

(** Calls [method@Gtk.TextIter.backward_visible_word_start] up to @count times. *)
external backward_visible_word_starts : t -> int -> bool = "ml_gtk_text_iter_backward_visible_word_starts"

(** Moves backward to the previous visible word start.

If @iter is currently on a word start, moves backward to the
next one after that.

Word breaks are determined by Pango and should be correct
for nearly any language. *)
external backward_visible_word_start : t -> bool = "ml_gtk_text_iter_backward_visible_word_start"

(** Moves @count visible lines backward, if possible.

If @count would move past the start or end of the buffer, moves to
the start or end of the buffer.

The return value indicates whether the iterator moved
onto a dereferenceable position; if the iterator didn’t move, or
moved onto the end iterator, then %FALSE is returned. If @count is 0,
the function does nothing and returns %FALSE. If @count is negative,
moves forward by 0 - @count lines. *)
external backward_visible_lines : t -> int -> bool = "ml_gtk_text_iter_backward_visible_lines"

(** Moves @iter to the start of the previous visible line.

Returns %TRUE if
@iter could be moved; i.e. if @iter was at character offset 0, this
function returns %FALSE. Therefore if @iter was already on line 0,
but not at the start of the line, @iter is snapped to the start of
the line and the function returns %TRUE. (Note that this implies that
in a loop calling this function, the line number may not change on
every iteration, if your first iteration is on line 0.) *)
external backward_visible_line : t -> bool = "ml_gtk_text_iter_backward_visible_line"

(** Moves up to @count visible cursor positions.

See [method@Gtk.TextIter.backward_cursor_position] for details. *)
external backward_visible_cursor_positions : t -> int -> bool = "ml_gtk_text_iter_backward_visible_cursor_positions"

(** Moves @iter backward to the previous visible cursor position.

See [method@Gtk.TextIter.backward_cursor_position] for details. *)
external backward_visible_cursor_position : t -> bool = "ml_gtk_text_iter_backward_visible_cursor_position"

(** Moves backward to the next toggle (on or off) of the
@tag, or to the next toggle of any tag if
@tag is %NULL.

If no matching tag toggles are found,
returns %FALSE, otherwise %TRUE. Does not return toggles
located at @iter, only toggles before @iter. Sets @iter
to the location of the toggle, or the start of the buffer
if no toggle is found. *)
external backward_to_tag_toggle : t -> Gtk.widget option -> bool = "ml_gtk_text_iter_backward_to_tag_toggle"

(** Calls [method@Gtk.TextIter.backward_sentence_start] up to @count times.

If @count is negative, moves forward instead of backward. *)
external backward_sentence_starts : t -> int -> bool = "ml_gtk_text_iter_backward_sentence_starts"

(** Moves backward to the previous sentence start.

If @iter is already at the start of a sentence, moves backward
to the next one.

Sentence boundaries are determined by Pango and should
be correct for nearly any language. *)
external backward_sentence_start : t -> bool = "ml_gtk_text_iter_backward_sentence_start"

(** Same as [method@Gtk.TextIter.forward_search], but moves backward.

@match_end will never be set to a `GtkTextIter` located after @iter,
even if there is a possible @match_start before or at @iter. *)
external backward_search : t -> string -> Gtk_enums.textsearchflags -> Obj.t option -> bool * Obj.t * Obj.t = "ml_gtk_text_iter_backward_search_bytecode" "ml_gtk_text_iter_backward_search_native"

(** Moves @count lines backward, if possible.

If @count would move past the start or end of the buffer, moves to
the start or end of the buffer.

The return value indicates whether the iterator moved
onto a dereferenceable position; if the iterator didn’t move, or
moved onto the end iterator, then %FALSE is returned. If @count is 0,
the function does nothing and returns %FALSE. If @count is negative,
moves forward by 0 - @count lines. *)
external backward_lines : t -> int -> bool = "ml_gtk_text_iter_backward_lines"

(** Moves @iter to the start of the previous line.

Returns %TRUE if @iter could be moved; i.e. if @iter was at
character offset 0, this function returns %FALSE. Therefore,
if @iter was already on line 0, but not at the start of the line,
@iter is snapped to the start of the line and the function returns
%TRUE. (Note that this implies that
in a loop calling this function, the line number may not change on
every iteration, if your first iteration is on line 0.) *)
external backward_line : t -> bool = "ml_gtk_text_iter_backward_line"

(** Moves up to @count cursor positions.

See [method@Gtk.TextIter.forward_cursor_position] for details. *)
external backward_cursor_positions : t -> int -> bool = "ml_gtk_text_iter_backward_cursor_positions"

(** Like [method@Gtk.TextIter.forward_cursor_position], but moves backward. *)
external backward_cursor_position : t -> bool = "ml_gtk_text_iter_backward_cursor_position"

(** Moves @count characters backward, if possible.

If @count would move past the start or end of the buffer, moves
to the start or end of the buffer.

The return value indicates whether the iterator moved
onto a dereferenceable position; if the iterator didn’t move, or
moved onto the end iterator, then %FALSE is returned. If @count is 0,
the function does nothing and returns %FALSE. *)
external backward_chars : t -> int -> bool = "ml_gtk_text_iter_backward_chars"

(** Moves backward by one character offset.

Returns %TRUE if movement was possible; if @iter was the first
in the buffer (character offset 0), this function returns %FALSE
for convenience when writing loops. *)
external backward_char : t -> bool = "ml_gtk_text_iter_backward_char"

(** Assigns the value of @other to @iter.

This function is not useful in applications, because
iterators can be assigned with `GtkTextIter i = j;`.

The function is used by language bindings. *)
external assign : t -> Obj.t -> unit = "ml_gtk_text_iter_assign"

