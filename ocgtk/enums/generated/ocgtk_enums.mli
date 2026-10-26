(* GENERATED CODE - DO NOT EDIT *)
(* Gtk Enumeration and Bitfield Types *)

(* AccessibleAnnouncementPriority - enumeration *)
type accessibleannouncementpriority = [
  | `LOW (** The announcement is low priority,
and might be read only on the user's request. *)
  | `MEDIUM (** The announcement is of medium
priority, and is usually spoken at the next opportunity, such as at the
end of speaking the current sentence or when the user pauses typing. *)
  | `HIGH (** The announcement is of high
priority, and is usually spoken immediately. Because an interruption
might disorient users or cause them to not complete their current task,
authors SHOULD NOT use high priority announcements unless the
interruption is imperative. An example would be a notification about a
critical battery power level. *)
]

val accessibleannouncementpriority_of_int : int -> accessibleannouncementpriority
val accessibleannouncementpriority_to_int : accessibleannouncementpriority -> int

(* AccessibleAutocomplete - enumeration *)
type accessibleautocomplete = [
  | `NONE (** Automatic suggestions are not displayed. *)
  | `INLINE (** When a user is providing input, text
suggesting one way to complete the provided input may be dynamically
inserted after the caret. *)
  | `LIST (** When a user is providing input, an element
containing a collection of values that could complete the provided input
may be displayed. *)
  | `BOTH (** When a user is providing input, an element
containing a collection of values that could complete the provided input
may be displayed. If displayed, one value in the collection is automatically
selected, and the text needed to complete the automatically selected value
appears after the caret in the input. *)
]

val accessibleautocomplete_of_int : int -> accessibleautocomplete
val accessibleautocomplete_to_int : accessibleautocomplete -> int

(* AccessibleInvalidState - enumeration *)
type accessibleinvalidstate = [
  | `FALSE (** There are no detected errors in the value *)
  | `TRUE (** The value entered by the user has failed validation *)
  | `GRAMMAR (** A grammatical error was detected *)
  | `SPELLING (** A spelling error was detected *)
]

val accessibleinvalidstate_of_int : int -> accessibleinvalidstate
val accessibleinvalidstate_to_int : accessibleinvalidstate -> int

(* AccessiblePlatformState - enumeration *)
type accessibleplatformstate = [
  | `FOCUSABLE (** whether the accessible can be focused *)
  | `FOCUSED (** whether the accessible has focus *)
  | `ACTIVE (** whether the accessible is active *)
]

val accessibleplatformstate_of_int : int -> accessibleplatformstate
val accessibleplatformstate_to_int : accessibleplatformstate -> int

(* AccessibleProperty - enumeration *)
type accessibleproperty = [
  | `AUTOCOMPLETE (** Indicates whether inputting text
could trigger display of one or more predictions of the user's intended
value for a combobox, searchbox, or textbox and specifies how predictions
would be presented if they were made. Value type: [AccessibleAutocomplete] *)
  | `DESCRIPTION (** Defines a string value that describes
or annotates the current element. Value type: string *)
  | `HAS_POPUP (** Indicates the availability and type of
interactive popup element, such as menu or dialog, that can be triggered
by an element. *)
  | `KEY_SHORTCUTS (** Indicates keyboard shortcuts that an
author has implemented to activate or give focus to an element. Value type:
string. The format of the value is a space-separated list of shortcuts, with
each shortcut consisting of one or more modifiers ([Control], [Alt] or [Shift]),
followed by a non-modifier key, all separated by [+].
Examples: [F2], [Alt-F], [Control+Shift+N] *)
  | `LABEL (** Defines a string value that labels the current
element. Value type: string *)
  | `LEVEL (** Defines the hierarchical level of an element
within a structure. Value type: integer *)
  | `MODAL (** Indicates whether an element is modal when
displayed. Value type: boolean *)
  | `MULTI_LINE (** Indicates whether a text box accepts
multiple lines of input or only a single line. Value type: boolean *)
  | `MULTI_SELECTABLE (** Indicates that the user may select
more than one item from the current selectable descendants. Value type:
boolean *)
  | `ORIENTATION (** Indicates whether the element's
orientation is horizontal, vertical, or unknown/ambiguous. Value type:
[Orientation] *)
  | `PLACEHOLDER (** Defines a short hint (a word or short
phrase) intended to aid the user with data entry when the control has no
value. A hint could be a sample value or a brief description of the expected
format. Value type: string *)
  | `READ_ONLY (** Indicates that the element is not editable,
but is otherwise operable. Value type: boolean *)
  | `REQUIRED (** Indicates that user input is required on
the element before a form may be submitted. Value type: boolean *)
  | `ROLE_DESCRIPTION (** Defines a human-readable,
author-localized description for the role of an element. Value type: string *)
  | `SORT (** Indicates if items in a table or grid are
sorted in ascending or descending order. Value type: [AccessibleSort] *)
  | `VALUE_MAX (** Defines the maximum allowed value for a
range widget. Value type: double *)
  | `VALUE_MIN (** Defines the minimum allowed value for a
range widget. Value type: double *)
  | `VALUE_NOW (** Defines the current value for a range widget.
Value type: double *)
  | `VALUE_TEXT (** Defines the human readable text alternative
of [Gtk.AccessibleProperty.VALUE_NOW] for a range widget. Value type: string *)
  | `HELP_TEXT (** Defines a string value that provides a description of non-standard keyboard
interactions of the current element. Value type: string *)
]

val accessibleproperty_of_int : int -> accessibleproperty
val accessibleproperty_to_int : accessibleproperty -> int

(* AccessibleRelation - enumeration *)
type accessiblerelation = [
  | `ACTIVE_DESCENDANT (** Identifies the currently active
element when focus is on a composite widget, combobox, textbox, group,
or application. Value type: reference *)
  | `COL_COUNT (** Defines the total number of columns
in a table, grid, or treegrid. Value type: integer *)
  | `COL_INDEX (** Defines an element's column index or
position with respect to the total number of columns within a table,
grid, or treegrid. Value type: integer *)
  | `COL_INDEX_TEXT (** Defines a human readable text
alternative of [GTK_ACCESSIBLE_RELATION_COL_INDEX]. Value type: string *)
  | `COL_SPAN (** Defines the number of columns spanned
by a cell or gridcell within a table, grid, or treegrid. Value type: integer *)
  | `CONTROLS (** Identifies the element (or elements) whose
contents or presence are controlled by the current element. Value type: reference *)
  | `DESCRIBED_BY (** Identifies the element (or elements)
that describes the object. Value type: reference *)
  | `DETAILS (** Identifies the element (or elements) that
provide additional information related to the object. Value type: reference *)
  | `ERROR_MESSAGE (** Identifies the element (or elements) that
provide an error message for an object. Value type: reference *)
  | `FLOW_TO (** Identifies the next element (or elements)
in an alternate reading order of content which, at the user's discretion,
allows assistive technology to override the general default of reading in
document source order. Value type: reference *)
  | `LABELLED_BY (** Identifies the element (or elements)
that labels the current element. Value type: reference *)
  | `OWNS (** Identifies an element (or elements) in order
to define a visual, functional, or contextual parent/child relationship
between elements where the widget hierarchy cannot be used to represent
the relationship. Value type: reference *)
  | `POS_IN_SET (** Defines an element's number or position
in the current set of listitems or treeitems. Value type: integer *)
  | `ROW_COUNT (** Defines the total number of rows in a table,
grid, or treegrid. Value type: integer *)
  | `ROW_INDEX (** Defines an element's row index or position
with respect to the total number of rows within a table, grid, or treegrid.
Value type: integer *)
  | `ROW_INDEX_TEXT (** Defines a human readable text
alternative of [Gtk.AccessibleRelation.ROW_INDEX]. Value type: string *)
  | `ROW_SPAN (** Defines the number of rows spanned by a
cell or gridcell within a table, grid, or treegrid. Value type: integer *)
  | `SET_SIZE (** Defines the number of items in the current
set of listitems or treeitems. Value type: integer *)
  | `LABEL_FOR (** Identifies the element (or elements) that are labeled by the
current element. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
  | `DESCRIPTION_FOR (** Identifies the element (or elements) that are described by
the current element. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
  | `CONTROLLED_BY (** Identifies the element (or elements) that the current
element is controlled by. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
  | `DETAILS_FOR (** Identifies the element (or elements) for which the current
element provides additional information. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
  | `ERROR_MESSAGE_FOR (** Identifies the element (or elements) for which the current
element provides an error message. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
  | `FLOW_FROM (** Identifies the previous element (or elements) in an alternate
reading order of content which, at the user's discretion, allows
assistive technology to override the general default of reading in
document source order. Value type: reference

This relation is managed by GTK and should not be set from application code. *)
]

val accessiblerelation_of_int : int -> accessiblerelation
val accessiblerelation_to_int : accessiblerelation -> int

(* AccessibleRole - enumeration *)
type accessiblerole = [
  | `ALERT (** An element with important, and usually
time-sensitive, information *)
  | `ALERT_DIALOG (** A type of dialog that contains an
alert message *)
  | `BANNER (** Unused *)
  | `BUTTON (** An input element that allows for
user-triggered actions when clicked or pressed *)
  | `CAPTION (** Unused *)
  | `CELL (** Unused *)
  | `CHECKBOX (** A checkable input element that has
three possible values: [true], [false], or [mixed] *)
  | `COLUMN_HEADER (** A header in a columned list. *)
  | `COMBO_BOX (** An input that controls another element,
such as a list or a grid, that can dynamically pop up to help the user
set the value of the input *)
  | `COMMAND (** Abstract role. *)
  | `COMPOSITE (** Abstract role. *)
  | `DIALOG (** A dialog is a window that is designed to interrupt
the current processing of an application in order to prompt the user to enter
information or require a response. *)
  | `DOCUMENT (** Content that assistive technology users may want to
browse in a reading mode. *)
  | `FEED (** Unused *)
  | `FORM (** Unused *)
  | `GENERIC (** A nameless container that has no semantic meaning
of its own. This is the role that GTK uses by default for widgets. *)
  | `GRID (** A grid of items. *)
  | `GRID_CELL (** An item in a grid or tree grid. *)
  | `GROUP (** An element that groups multiple related widgets. GTK uses
this role for various containers, like [Gtk.HeaderBar] or [Gtk.Notebook]. *)
  | `HEADING (** Unused *)
  | `IMG (** An image. *)
  | `INPUT (** Abstract role. *)
  | `LABEL (** A visible name or caption for a user interface component. *)
  | `LANDMARK (** Abstract role. *)
  | `LEGEND (** Unused *)
  | `LINK (** A clickable link. *)
  | `LIST (** A list of items. *)
  | `LIST_BOX (** Unused. *)
  | `LIST_ITEM (** An item in a list. *)
  | `LOG (** Unused *)
  | `MAIN (** Unused *)
  | `MARQUEE (** Unused *)
  | `MATH (** Unused *)
  | `METER (** An element that represents a value within a known range. *)
  | `MENU (** A menu. *)
  | `MENU_BAR (** A menubar. *)
  | `MENU_ITEM (** An item in a menu. *)
  | `MENU_ITEM_CHECKBOX (** A check item in a menu. *)
  | `MENU_ITEM_RADIO (** A radio item in a menu. *)
  | `NAVIGATION (** Unused *)
  | `NONE (** An element that is not represented to accessibility technologies.
This role is synonymous to \@GTK_ACCESSIBLE_ROLE_PRESENTATION. *)
  | `NOTE (** Unused *)
  | `OPTION (** Unused *)
  | `PRESENTATION (** An element that is not represented to accessibility technologies.
This role is synonymous to \@GTK_ACCESSIBLE_ROLE_NONE. *)
  | `PROGRESS_BAR (** An element that displays the progress
status for tasks that take a long time. *)
  | `RADIO (** A checkable input in a group of radio roles,
only one of which can be checked at a time. *)
  | `RADIO_GROUP (** Unused *)
  | `RANGE (** Abstract role. *)
  | `REGION (** Unused *)
  | `ROW (** A row in a columned list. *)
  | `ROW_GROUP (** Unused *)
  | `ROW_HEADER (** Unused *)
  | `SCROLLBAR (** A graphical object that controls the scrolling
of content within a viewing area, regardless of whether the content is fully
displayed within the viewing area. *)
  | `SEARCH (** Unused *)
  | `SEARCH_BOX (** A type of textbox intended for specifying
search criteria. *)
  | `SECTION (** Abstract role. *)
  | `SECTION_HEAD (** Abstract role. *)
  | `SELECT (** Abstract role. *)
  | `SEPARATOR (** A divider that separates and distinguishes
sections of content or groups of menuitems. *)
  | `SLIDER (** A user input where the user selects a value
from within a given range. *)
  | `SPIN_BUTTON (** A form of range that expects the user to
select from among discrete choices. *)
  | `STATUS (** Unused *)
  | `STRUCTURE (** Abstract role. *)
  | `SWITCH (** A type of checkbox that represents on/off values,
as opposed to checked/unchecked values. *)
  | `TAB (** An item in a list of tab used for switching pages. *)
  | `TABLE (** Unused *)
  | `TAB_LIST (** A list of tabs for switching pages. *)
  | `TAB_PANEL (** A page in a notebook or stack. *)
  | `TEXT_BOX (** A type of input that allows free-form text
as its value. *)
  | `TIME (** Unused *)
  | `TIMER (** Unused *)
  | `TOOLBAR (** Unused *)
  | `TOOLTIP (** Unused *)
  | `TREE (** Unused *)
  | `TREE_GRID (** A treeview-like, columned list. *)
  | `TREE_ITEM (** Unused *)
  | `WIDGET (** Abstract role for interactive components of a
graphical user interface *)
  | `WINDOW (** Abstract role for windows. *)
  | `TOGGLE_BUTTON (** A type of push button which stays pressed until depressed by a second
activation. *)
  | `APPLICATION (** A toplevel element of a graphical user interface.

This is the role that GTK uses by default for windows. *)
  | `PARAGRAPH (** A paragraph of content. *)
  | `BLOCK_QUOTE (** A section of content that is quoted from another source. *)
  | `ARTICLE (** A section of a page that consists of a composition that forms an independent
part of a document, page, or site. *)
  | `COMMENT (** A comment contains content expressing reaction to other content. *)
  | `TERMINAL (** A virtual terminal. *)
]

val accessiblerole_of_int : int -> accessiblerole
val accessiblerole_to_int : accessiblerole -> int

(* AccessibleSort - enumeration *)
type accessiblesort = [
  | `NONE (** There is no defined sort applied to the column. *)
  | `ASCENDING (** Items are sorted in ascending order by this column. *)
  | `DESCENDING (** Items are sorted in descending order by this column. *)
  | `OTHER (** A sort algorithm other than ascending or
descending has been applied. *)
]

val accessiblesort_of_int : int -> accessiblesort
val accessiblesort_to_int : accessiblesort -> int

(* AccessibleState - enumeration *)
type accessiblestate = [
  | `BUSY (** A “busy” state. This state has boolean values *)
  | `CHECKED (** A “checked” state; indicates the current
state of a [CheckButton]. Value type: [AccessibleTristate] *)
  | `DISABLED (** A “disabled” state; corresponds to the
[Widget:sensitive] property. It indicates a UI element
that is perceivable, but not editable or operable. Value type: boolean *)
  | `EXPANDED (** An “expanded” state; corresponds to the
[Expander:expanded] property. Value type: boolean
or undefined *)
  | `HIDDEN (** A “hidden” state; corresponds to the
[Widget:visible] property. You can use this state
explicitly on UI elements that should not be exposed to an assistive
technology. Value type: boolean
See also: [GTK_ACCESSIBLE_STATE_DISABLED] *)
  | `INVALID (** An “invalid” state; set when a widget
is showing an error. Value type: [AccessibleInvalidState] *)
  | `PRESSED (** A “pressed” state; indicates the current
state of a [ToggleButton]. Value type: [AccessibleTristate]
enumeration *)
  | `SELECTED (** A “selected” state; set when a widget
is selected. Value type: boolean or undefined *)
  | `VISITED (** Indicates that a widget with the GTK_ACCESSIBLE_ROLE_LINK has been visited.
Value type: boolean. *)
]

val accessiblestate_of_int : int -> accessiblestate
val accessiblestate_to_int : accessiblestate -> int

(* AccessibleTextContentChange - enumeration *)
type accessibletextcontentchange = [
  | `INSERT (** contents change as the result of
an insert operation *)
  | `REMOVE (** contents change as the result of
a remove operation *)
]

val accessibletextcontentchange_of_int : int -> accessibletextcontentchange
val accessibletextcontentchange_to_int : accessibletextcontentchange -> int

(* AccessibleTextGranularity - enumeration *)
type accessibletextgranularity = [
  | `CHARACTER (** Use the boundary between
characters (including non-printing characters) *)
  | `WORD (** Use the boundary between words,
starting from the beginning of the current word and ending at the
beginning of the next word *)
  | `SENTENCE (** Use the boundary between
sentences, starting from the beginning of the current sentence and
ending at the beginning of the next sentence *)
  | `LINE (** Use the boundary between lines,
starting from the beginning of the current line and ending at the
beginning of the next line *)
  | `PARAGRAPH (** Use the boundary between
paragraphs, starting from the beginning of the current paragraph and
ending at the beginning of the next paragraph *)
]

val accessibletextgranularity_of_int : int -> accessibletextgranularity
val accessibletextgranularity_to_int : accessibletextgranularity -> int

(* AccessibleTristate - enumeration *)
type accessibletristate = [
  | `FALSE (** The state is [false] *)
  | `TRUE (** The state is [true] *)
  | `MIXED (** The state is [mixed] *)
]

val accessibletristate_of_int : int -> accessibletristate
val accessibletristate_to_int : accessibletristate -> int

(* Align - enumeration *)
type align = [
  | `FILL (** stretch to fill all space if possible, center if
no meaningful way to stretch *)
  | `START (** snap to left or top side, leaving space on right or bottom *)
  | `END (** snap to right or bottom side, leaving space on left or top *)
  | `CENTER (** center natural width of widget inside the allocation *)
  | `BASELINE_FILL (** a different name for [GTK_ALIGN_BASELINE]. *)
  | `BASELINE (** align the widget according to the baseline. *)
  | `BASELINE_CENTER (** stretch to fill all space, but align the baseline. *)
]

val align_of_int : int -> align
val align_to_int : align -> int

(* ArrowType - enumeration *)
type arrowtype = [
  | `UP (** Represents an upward pointing arrow. *)
  | `DOWN (** Represents a downward pointing arrow. *)
  | `LEFT (** Represents a left pointing arrow. *)
  | `RIGHT (** Represents a right pointing arrow. *)
  | `NONE (** No arrow. *)
]

val arrowtype_of_int : int -> arrowtype
val arrowtype_to_int : arrowtype -> int

(* AssistantPageType - enumeration *)
type assistantpagetype = [
  | `CONTENT (** The page has regular contents. Both the
Back and forward buttons will be shown. *)
  | `INTRO (** The page contains an introduction to the
assistant task. Only the Forward button will be shown if there is a
next page. *)
  | `CONFIRM (** The page lets the user confirm or deny the
changes. The Back and Apply buttons will be shown. *)
  | `SUMMARY (** The page informs the user of the changes
done. Only the Close button will be shown. *)
  | `PROGRESS (** Used for tasks that take a long time to
complete, blocks the assistant until the page is marked as complete.
Only the back button will be shown. *)
  | `CUSTOM (** Used for when other page types are not
appropriate. No buttons will be shown, and the application must
add its own buttons through gtk_assistant_add_action_widget(). *)
]

val assistantpagetype_of_int : int -> assistantpagetype
val assistantpagetype_to_int : assistantpagetype -> int

(* BaselinePosition - enumeration *)
type baselineposition = [
  | `TOP (** Align the baseline at the top *)
  | `CENTER (** Center the baseline *)
  | `BOTTOM (** Align the baseline at the bottom *)
]

val baselineposition_of_int : int -> baselineposition
val baselineposition_to_int : baselineposition -> int

(* BorderStyle - enumeration *)
type borderstyle = [
  | `NONE (** No visible border *)
  | `HIDDEN (** Same as [GTK_BORDER_STYLE_NONE] *)
  | `SOLID (** A single line segment *)
  | `INSET (** Looks as if the content is sunken into the canvas *)
  | `OUTSET (** Looks as if the content is coming out of the canvas *)
  | `DOTTED (** A series of round dots *)
  | `DASHED (** A series of square-ended dashes *)
  | `DOUBLE (** Two parallel lines with some space between them *)
  | `GROOVE (** Looks as if it were carved in the canvas *)
  | `RIDGE (** Looks as if it were coming out of the canvas *)
]

val borderstyle_of_int : int -> borderstyle
val borderstyle_to_int : borderstyle -> int

(* BuilderError - enumeration *)
type buildererror = [
  | `INVALID_TYPE_FUNCTION (** A type-func attribute didn’t name
a function that returns a [GType]. *)
  | `UNHANDLED_TAG (** The input contained a tag that [GtkBuilder]
can’t handle. *)
  | `MISSING_ATTRIBUTE (** An attribute that is required by
[GtkBuilder] was missing. *)
  | `INVALID_ATTRIBUTE (** [GtkBuilder] found an attribute that
it doesn’t understand. *)
  | `INVALID_TAG (** [GtkBuilder] found a tag that
it doesn’t understand. *)
  | `MISSING_PROPERTY_VALUE (** A required property value was
missing. *)
  | `INVALID_VALUE (** [GtkBuilder] couldn’t parse
some attribute value. *)
  | `VERSION_MISMATCH (** The input file requires a newer version
of GTK. *)
  | `DUPLICATE_ID (** An object id occurred twice. *)
  | `OBJECT_TYPE_REFUSED (** A specified object type is of the same type or
derived from the type of the composite class being extended with builder XML. *)
  | `TEMPLATE_MISMATCH (** The wrong type was specified in a composite class’s template XML *)
  | `INVALID_PROPERTY (** The specified property is unknown for the object class. *)
  | `INVALID_SIGNAL (** The specified signal is unknown for the object class. *)
  | `INVALID_ID (** An object id is unknown. *)
  | `INVALID_FUNCTION (** A function could not be found. This often happens
when symbols are set to be kept private. Compiling code with -rdynamic or using the
[gmodule-export-2.0] pkgconfig module can fix this problem. *)
]

val buildererror_of_int : int -> buildererror
val buildererror_to_int : buildererror -> int

(* ButtonsType - enumeration *)
type buttonstype = [
  | `NONE (** no buttons at all *)
  | `OK (** an OK button *)
  | `CLOSE (** a Close button *)
  | `CANCEL (** a Cancel button *)
  | `YES_NO (** Yes and No buttons *)
  | `OK_CANCEL (** OK and Cancel buttons *)
]

val buttonstype_of_int : int -> buttonstype
val buttonstype_to_int : buttonstype -> int

(* CellRendererAccelMode - enumeration *)
type cellrendereraccelmode = [
  | `GTK (** GTK accelerators mode *)
  | `OTHER (** Other accelerator mode *)
]

val cellrendereraccelmode_of_int : int -> cellrendereraccelmode
val cellrendereraccelmode_to_int : cellrendereraccelmode -> int

(* CellRendererMode - enumeration *)
type cellrenderermode = [
  | `INERT (** The cell is just for display
and cannot be interacted with.  Note that this doesn’t mean that eg. the
row being drawn can’t be selected -- just that a particular element of
it cannot be individually modified. *)
  | `ACTIVATABLE (** The cell can be clicked. *)
  | `EDITABLE (** The cell can be edited or otherwise modified. *)
]

val cellrenderermode_of_int : int -> cellrenderermode
val cellrenderermode_to_int : cellrenderermode -> int

(* Collation - enumeration *)
type collation = [
  | `NONE (** Don't do any collation *)
  | `UNICODE (** Use [GLib.utf8_collate_key] *)
  | `FILENAME (** Use [GLib.utf8_collate_key_for_filename] *)
]

val collation_of_int : int -> collation
val collation_to_int : collation -> int

(* ConstraintAttribute - enumeration *)
type constraintattribute = [
  | `NONE (** No attribute, used for constant
relations *)
  | `LEFT (** The left edge of a widget, regardless of
text direction *)
  | `RIGHT (** The right edge of a widget, regardless
of text direction *)
  | `TOP (** The top edge of a widget *)
  | `BOTTOM (** The bottom edge of a widget *)
  | `START (** The leading edge of a widget, depending
on text direction; equivalent to [GTK_CONSTRAINT_ATTRIBUTE_LEFT] for LTR
languages, and [GTK_CONSTRAINT_ATTRIBUTE_RIGHT] for RTL ones *)
  | `END (** The trailing edge of a widget, depending
on text direction; equivalent to [GTK_CONSTRAINT_ATTRIBUTE_RIGHT] for LTR
languages, and [GTK_CONSTRAINT_ATTRIBUTE_LEFT] for RTL ones *)
  | `WIDTH (** The width of a widget *)
  | `HEIGHT (** The height of a widget *)
  | `CENTER_X (** The center of a widget, on the
horizontal axis *)
  | `CENTER_Y (** The center of a widget, on the
vertical axis *)
  | `BASELINE (** The baseline of a widget *)
]

val constraintattribute_of_int : int -> constraintattribute
val constraintattribute_to_int : constraintattribute -> int

(* ConstraintRelation - enumeration *)
type constraintrelation = [
  | `LE (** Less than, or equal *)
  | `EQ (** Equal *)
  | `GE (** Greater than, or equal *)
]

val constraintrelation_of_int : int -> constraintrelation
val constraintrelation_to_int : constraintrelation -> int

(* ConstraintStrength - enumeration *)
type constraintstrength = [
  | `REQUIRED (** The constraint is required towards solving the layout *)
  | `STRONG (** A strong constraint *)
  | `MEDIUM (** A medium constraint *)
  | `WEAK (** A weak constraint *)
]

val constraintstrength_of_int : int -> constraintstrength
val constraintstrength_to_int : constraintstrength -> int

(* ConstraintVflParserError - enumeration *)
type constraintvflparsererror = [
  | `SYMBOL (** Invalid or unknown symbol *)
  | `ATTRIBUTE (** Invalid or unknown attribute *)
  | `VIEW (** Invalid or unknown view *)
  | `METRIC (** Invalid or unknown metric *)
  | `PRIORITY (** Invalid or unknown priority *)
  | `RELATION (** Invalid or unknown relation *)
]

val constraintvflparsererror_of_int : int -> constraintvflparsererror
val constraintvflparsererror_to_int : constraintvflparsererror -> int

(* ContentFit - enumeration *)
type contentfit = [
  | `FILL (** Make the content fill the entire allocation,
without taking its aspect ratio in consideration. The resulting
content will appear as stretched if its aspect ratio is different
from the allocation aspect ratio. *)
  | `CONTAIN (** Scale the content to fit the allocation,
while taking its aspect ratio in consideration. The resulting
content will appear as letterboxed if its aspect ratio is different
from the allocation aspect ratio. *)
  | `COVER (** Cover the entire allocation, while taking
the content aspect ratio in consideration. The resulting content
will appear as clipped if its aspect ratio is different from the
allocation aspect ratio. *)
  | `SCALE_DOWN (** The content is scaled down to fit the
allocation, if needed, otherwise its original size is used. *)
]

val contentfit_of_int : int -> contentfit
val contentfit_to_int : contentfit -> int

(* CornerType - enumeration *)
type cornertype = [
  | `TOP_LEFT (** Place the scrollbars on the right and bottom of the
widget (default behaviour). *)
  | `BOTTOM_LEFT (** Place the scrollbars on the top and right of the
widget. *)
  | `TOP_RIGHT (** Place the scrollbars on the left and bottom of the
widget. *)
  | `BOTTOM_RIGHT (** Place the scrollbars on the top and left of the
widget. *)
]

val cornertype_of_int : int -> cornertype
val cornertype_to_int : cornertype -> int

(* CssParserError - enumeration *)
type cssparsererror = [
  | `FAILED (** Unknown failure. *)
  | `SYNTAX (** The given text does not form valid syntax *)
  | `IMPORT (** Failed to import a resource *)
  | `NAME (** The given name has not been defined *)
  | `UNKNOWN_VALUE (** The given value is not correct *)
]

val cssparsererror_of_int : int -> cssparsererror
val cssparsererror_to_int : cssparsererror -> int

(* CssParserWarning - enumeration *)
type cssparserwarning = [
  | `DEPRECATED (** The given construct is
deprecated and will be removed in a future version *)
  | `SYNTAX (** A syntax construct was used
that should be avoided *)
  | `UNIMPLEMENTED (** A feature is not implemented *)
]

val cssparserwarning_of_int : int -> cssparserwarning
val cssparserwarning_to_int : cssparserwarning -> int

(* DeleteType - enumeration *)
type deletetype = [
  | `CHARS (** Delete characters. *)
  | `WORD_ENDS (** Delete only the portion of the word to the
left/right of cursor if we’re in the middle of a word. *)
  | `WORDS (** Delete words. *)
  | `DISPLAY_LINES (** Delete display-lines. Display-lines
refers to the visible lines, with respect to the current line
breaks. As opposed to paragraphs, which are defined by line
breaks in the input. *)
  | `DISPLAY_LINE_ENDS (** Delete only the portion of the
display-line to the left/right of cursor. *)
  | `PARAGRAPH_ENDS (** Delete to the end of the
paragraph. Like C-k in Emacs (or its reverse). *)
  | `PARAGRAPHS (** Delete entire line. Like C-k in pico. *)
  | `WHITESPACE (** Delete only whitespace. Like M-\ in Emacs. *)
]

val deletetype_of_int : int -> deletetype
val deletetype_to_int : deletetype -> int

(* DialogError - enumeration *)
type dialogerror = [
  | `FAILED (** Generic error condition for when
an operation fails and no more specific code is applicable *)
  | `CANCELLED (** The async function call was cancelled
via its [GCancellable] *)
  | `DISMISSED (** The operation was cancelled
by the user (via a Cancel or Close button) *)
]

val dialogerror_of_int : int -> dialogerror
val dialogerror_to_int : dialogerror -> int

(* DirectionType - enumeration *)
type directiontype = [
  | `TAB_FORWARD (** Move forward. *)
  | `TAB_BACKWARD (** Move backward. *)
  | `UP (** Move up. *)
  | `DOWN (** Move down. *)
  | `LEFT (** Move left. *)
  | `RIGHT (** Move right. *)
]

val directiontype_of_int : int -> directiontype
val directiontype_to_int : directiontype -> int

(* EditableProperties - enumeration *)
type editableproperties = [
  | `PROP_TEXT (** the property id for [Gtk.Editable:text] *)
  | `PROP_CURSOR_POSITION (** the property id for [Gtk.Editable:cursor-position] *)
  | `PROP_SELECTION_BOUND (** the property id for [Gtk.Editable:selection-bound] *)
  | `PROP_EDITABLE (** the property id for [Gtk.Editable:editable] *)
  | `PROP_WIDTH_CHARS (** the property id for [Gtk.Editable:width-chars] *)
  | `PROP_MAX_WIDTH_CHARS (** the property id for [Gtk.Editable:max-width-chars] *)
  | `PROP_XALIGN (** the property id for [Gtk.Editable:xalign] *)
  | `PROP_ENABLE_UNDO (** the property id for [Gtk.Editable:enable-undo] *)
  | `NUM_PROPERTIES (** the number of properties *)
]

val editableproperties_of_int : int -> editableproperties
val editableproperties_to_int : editableproperties -> int

(* EntryIconPosition - enumeration *)
type entryiconposition = [
  | `PRIMARY (** At the beginning of the entry (depending on the text direction). *)
  | `SECONDARY (** At the end of the entry (depending on the text direction). *)
]

val entryiconposition_of_int : int -> entryiconposition
val entryiconposition_to_int : entryiconposition -> int

(* EventSequenceState - enumeration *)
type eventsequencestate = [
  | `NONE (** The sequence is handled, but not grabbed. *)
  | `CLAIMED (** The sequence is handled and grabbed. *)
  | `DENIED (** The sequence is denied. *)
]

val eventsequencestate_of_int : int -> eventsequencestate
val eventsequencestate_to_int : eventsequencestate -> int

(* FileChooserAction - enumeration *)
type filechooseraction = [
  | `OPEN (** Indicates open mode.  The file chooser
will only let the user pick an existing file. *)
  | `SAVE (** Indicates save mode.  The file chooser
will let the user pick an existing file, or type in a new
filename. *)
  | `SELECT_FOLDER (** Indicates an Open mode for
selecting folders.  The file chooser will let the user pick an
existing folder. *)
]

val filechooseraction_of_int : int -> filechooseraction
val filechooseraction_to_int : filechooseraction -> int

(* FileChooserError - enumeration *)
type filechoosererror = [
  | `NONEXISTENT (** Indicates that a file does not exist. *)
  | `BAD_FILENAME (** Indicates a malformed filename. *)
  | `ALREADY_EXISTS (** Indicates a duplicate path (e.g. when
adding a bookmark). *)
  | `INCOMPLETE_HOSTNAME [@ocaml.doc "Indicates an incomplete hostname
(e.g. \"http://foo\" without a slash after that)."]
]

val filechoosererror_of_int : int -> filechoosererror
val filechoosererror_to_int : filechoosererror -> int

(* FilterChange - enumeration *)
type filterchange = [
  | `DIFFERENT (** The filter change cannot be
described with any of the other enumeration values *)
  | `LESS_STRICT (** The filter is less strict than
it was before: All items that it used to return true
still return true, others now may, too. *)
  | `MORE_STRICT (** The filter is more strict than
it was before: All items that it used to return false
still return false, others now may, too. *)
  | `DIFFERENT_REWATCH (** Similar to [Gtk.FilterChange.DIFFERENT],
but signs that item watches should be recreated. This is used by
[Gtk.FilterListModel] to keep the list up-to-date when items
change. *)
  | `LESS_STRICT_REWATCH (** Similar to [Gtk.FilterChange.LESS_STRICT],
but signs that item watches should be recreated. This is used by
[Gtk.FilterListModel] to keep the list up-to-date when items
change. *)
  | `MORE_STRICT_REWATCH (** Similar to [Gtk.FilterChange.MORE_STRICT],
but signs that item watches should be recreated. This is used by
[Gtk.FilterListModel] to keep the list up-to-date when items
change. *)
]

val filterchange_of_int : int -> filterchange
val filterchange_to_int : filterchange -> int

(* FilterMatch - enumeration *)
type filtermatch = [
  | `SOME (** The filter matches some items,
[Gtk.Filter.match] may return true or false *)
  | `NONE (** The filter does not match any item,
[Gtk.Filter.match] will always return false *)
  | `ALL (** The filter matches all items,
[Gtk.Filter.match] will alays return true *)
]

val filtermatch_of_int : int -> filtermatch
val filtermatch_to_int : filtermatch -> int

(* FontLevel - enumeration *)
type fontlevel = [
  | `FAMILY (** Select a font family *)
  | `FACE (** Select a font face (i.e. a family and a style) *)
  | `FONT (** Select a font (i.e. a face with a size, and possibly font variations) *)
  | `FEATURES (** Select a font and font features *)
]

val fontlevel_of_int : int -> fontlevel
val fontlevel_to_int : fontlevel -> int

(* FontRendering - enumeration *)
type fontrendering = [
  | `AUTOMATIC (** Set up font rendering automatically,
taking factors like screen resolution and scale into account *)
  | `MANUAL (** Follow low-level font-related settings
when configuring font rendering *)
]

val fontrendering_of_int : int -> fontrendering
val fontrendering_to_int : fontrendering -> int

(* GraphicsOffloadEnabled - enumeration *)
type graphicsoffloadenabled = [
  | `ENABLED (** Graphics offloading is enabled. *)
  | `DISABLED (** Graphics offloading is disabled. *)
]

val graphicsoffloadenabled_of_int : int -> graphicsoffloadenabled
val graphicsoffloadenabled_to_int : graphicsoffloadenabled -> int

(* IconSize - enumeration *)
type iconsize = [
  | `INHERIT (** Keep the size of the parent element *)
  | `NORMAL (** Size similar to text size *)
  | `LARGE (** Large size, for example in an icon view *)
]

val iconsize_of_int : int -> iconsize
val iconsize_to_int : iconsize -> int

(* IconThemeError - enumeration *)
type iconthemeerror = [
  | `NOT_FOUND (** The icon specified does not exist in the theme *)
  | `FAILED (** An unspecified error occurred. *)
]

val iconthemeerror_of_int : int -> iconthemeerror
val iconthemeerror_to_int : iconthemeerror -> int

(* IconViewDropPosition - enumeration *)
type iconviewdropposition = [
  | `NO_DROP (** no drop possible *)
  | `DROP_INTO (** dropped item replaces the item *)
  | `DROP_LEFT (** dropped item is inserted to the left *)
  | `DROP_RIGHT (** dropped item is inserted to the right *)
  | `DROP_ABOVE (** dropped item is inserted above *)
  | `DROP_BELOW (** dropped item is inserted below *)
]

val iconviewdropposition_of_int : int -> iconviewdropposition
val iconviewdropposition_to_int : iconviewdropposition -> int

(* ImageType - enumeration *)
type imagetype = [
  | `EMPTY (** there is no image displayed by the widget *)
  | `ICON_NAME (** the widget contains a named icon *)
  | `GICON (** the widget contains a [GIcon] *)
  | `PAINTABLE (** the widget contains a [GdkPaintable] *)
]

val imagetype_of_int : int -> imagetype
val imagetype_to_int : imagetype -> int

(* InputPurpose - enumeration *)
type inputpurpose = [
  | `FREE_FORM (** Allow any character *)
  | `ALPHA (** Allow only alphabetic characters *)
  | `DIGITS (** Allow only digits *)
  | `NUMBER (** Edited field expects numbers *)
  | `PHONE (** Edited field expects phone number *)
  | `URL (** Edited field expects URL *)
  | `EMAIL (** Edited field expects email address *)
  | `NAME (** Edited field expects the name of a person *)
  | `PASSWORD (** Like [GTK_INPUT_PURPOSE_FREE_FORM], but characters are hidden *)
  | `PIN (** Like [GTK_INPUT_PURPOSE_DIGITS], but characters are hidden *)
  | `TERMINAL (** Allow any character, in addition to control codes *)
]

val inputpurpose_of_int : int -> inputpurpose
val inputpurpose_to_int : inputpurpose -> int

(* InscriptionOverflow - enumeration *)
type inscriptionoverflow = [
  | `CLIP (** Clip the remaining text *)
  | `ELLIPSIZE_START (** Omit characters at the start of the text *)
  | `ELLIPSIZE_MIDDLE (** Omit characters at the middle of the text *)
  | `ELLIPSIZE_END (** Omit characters at the end of the text *)
]

val inscriptionoverflow_of_int : int -> inscriptionoverflow
val inscriptionoverflow_to_int : inscriptionoverflow -> int

(* InterfaceColorScheme - enumeration *)
type interfacecolorscheme = [
  | `UNSUPPORTED (** The system doesn't support color schemes *)
  | `DEFAULT (** The default color scheme is used *)
  | `DARK (** A dark color scheme is used *)
  | `LIGHT (** A light color scheme is used *)
]

val interfacecolorscheme_of_int : int -> interfacecolorscheme
val interfacecolorscheme_to_int : interfacecolorscheme -> int

(* InterfaceContrast - enumeration *)
type interfacecontrast = [
  | `UNSUPPORTED (** The system doesn't support contrast levels *)
  | `NO_PREFERENCE (** No particular preference for contrast *)
  | `MORE (** More contrast is preferred *)
  | `LESS (** Less contrast is preferred *)
]

val interfacecontrast_of_int : int -> interfacecontrast
val interfacecontrast_to_int : interfacecontrast -> int

(* Justification - enumeration *)
type justification = [
  | `LEFT (** The text is placed at the left edge of the label. *)
  | `RIGHT (** The text is placed at the right edge of the label. *)
  | `CENTER (** The text is placed in the center of the label. *)
  | `FILL (** The text is placed is distributed across the label. *)
]

val justification_of_int : int -> justification
val justification_to_int : justification -> int

(* LevelBarMode - enumeration *)
type levelbarmode = [
  | `CONTINUOUS (** the bar has a continuous mode *)
  | `DISCRETE (** the bar has a discrete mode *)
]

val levelbarmode_of_int : int -> levelbarmode
val levelbarmode_to_int : levelbarmode -> int

(* ListTabBehavior - enumeration *)
type listtabbehavior = [
  | `ALL (** Cycle through all focusable items of the list *)
  | `ITEM (** Cycle through a single list element, then move
focus out of the list. Moving focus between items needs to be
done with the arrow keys. *)
  | `CELL (** Cycle only through a single cell, then
move focus out of the list. Moving focus between cells needs to
be done with the arrow keys. This is only relevant for
cell-based widgets like [GtkColumnView], otherwise it behaves
like [GTK_LIST_TAB_ITEM]. *)
]

val listtabbehavior_of_int : int -> listtabbehavior
val listtabbehavior_to_int : listtabbehavior -> int

(* MessageType - enumeration *)
type messagetype = [
  | `INFO (** Informational message *)
  | `WARNING (** Non-fatal warning message *)
  | `QUESTION (** Question requiring a choice *)
  | `ERROR (** Fatal error message *)
  | `OTHER (** None of the above *)
]

val messagetype_of_int : int -> messagetype
val messagetype_to_int : messagetype -> int

(* MovementStep - enumeration *)
type movementstep = [
  | `LOGICAL_POSITIONS (** Move forward or back by graphemes *)
  | `VISUAL_POSITIONS (** Move left or right by graphemes *)
  | `WORDS (** Move forward or back by words *)
  | `DISPLAY_LINES (** Move up or down lines (wrapped lines) *)
  | `DISPLAY_LINE_ENDS (** Move to either end of a line *)
  | `PARAGRAPHS (** Move up or down paragraphs (newline-ended lines) *)
  | `PARAGRAPH_ENDS (** Move to either end of a paragraph *)
  | `PAGES (** Move by pages *)
  | `BUFFER_ENDS (** Move to ends of the buffer *)
  | `HORIZONTAL_PAGES (** Move horizontally by pages *)
]

val movementstep_of_int : int -> movementstep
val movementstep_to_int : movementstep -> int

(* NaturalWrapMode - enumeration *)
type naturalwrapmode = [
  | `INHERIT (** Inherit the minimum size request.
In particular, this should be used with [PANGO_WRAP_CHAR]. *)
  | `NONE (** Try not to wrap the text. This mode is the
closest to GTK3's behavior but can lead to a wide label leaving
lots of empty space below the text. *)
  | `WORD (** Attempt to wrap at word boundaries. This
is useful in particular when using [PANGO_WRAP_WORD_CHAR] as the
wrap mode. *)
]

val naturalwrapmode_of_int : int -> naturalwrapmode
val naturalwrapmode_to_int : naturalwrapmode -> int

(* NotebookTab - enumeration *)
type notebooktab = [
  | `FIRST (** the first tab in the notebook *)
  | `LAST (** the last tab in the notebook *)
]

val notebooktab_of_int : int -> notebooktab
val notebooktab_to_int : notebooktab -> int

(* NumberUpLayout - enumeration *)
type numberuplayout = [
  | `LRTB
  | `LRBT
  | `RLTB
  | `RLBT
  | `TBLR
  | `TBRL
  | `BTLR
  | `BTRL
]

val numberuplayout_of_int : int -> numberuplayout
val numberuplayout_to_int : numberuplayout -> int

(* Ordering - enumeration *)
type ordering = [
  | `SMALLER (** the first value is smaller than the second *)
  | `EQUAL (** the two values are equal *)
  | `LARGER (** the first value is larger than the second *)
]

val ordering_of_int : int -> ordering
val ordering_to_int : ordering -> int

(* Orientation - enumeration *)
type orientation = [
  | `HORIZONTAL (** The element is in horizontal orientation. *)
  | `VERTICAL (** The element is in vertical orientation. *)
]

val orientation_of_int : int -> orientation
val orientation_to_int : orientation -> int

(* Overflow - enumeration *)
type overflow = [
  | `VISIBLE (** No change is applied. Content is drawn at the specified
position. *)
  | `HIDDEN (** Content is clipped to the bounds of the area. Content
outside the area is not drawn and cannot be interacted with. *)
]

val overflow_of_int : int -> overflow
val overflow_to_int : overflow -> int

(* PackType - enumeration *)
type packtype = [
  | `START (** The child is packed into the start of the widget *)
  | `END (** The child is packed into the end of the widget *)
]

val packtype_of_int : int -> packtype
val packtype_to_int : packtype -> int

(* PadActionType - enumeration *)
type padactiontype = [
  | `BUTTON (** Action is triggered by a pad button *)
  | `RING (** Action is triggered by a pad ring *)
  | `STRIP (** Action is triggered by a pad strip *)
  | `DIAL (** Action is triggered by a pad dial *)
]

val padactiontype_of_int : int -> padactiontype
val padactiontype_to_int : padactiontype -> int

(* PageOrientation - enumeration *)
type pageorientation = [
  | `PORTRAIT (** Portrait mode. *)
  | `LANDSCAPE (** Landscape mode. *)
  | `REVERSE_PORTRAIT (** Reverse portrait mode. *)
  | `REVERSE_LANDSCAPE (** Reverse landscape mode. *)
]

val pageorientation_of_int : int -> pageorientation
val pageorientation_to_int : pageorientation -> int

(* PageSet - enumeration *)
type pageset = [
  | `ALL (** All pages. *)
  | `EVEN (** Even pages. *)
  | `ODD (** Odd pages. *)
]

val pageset_of_int : int -> pageset
val pageset_to_int : pageset -> int

(* PanDirection - enumeration *)
type pandirection = [
  | `LEFT (** panned towards the left *)
  | `RIGHT (** panned towards the right *)
  | `UP (** panned upwards *)
  | `DOWN (** panned downwards *)
]

val pandirection_of_int : int -> pandirection
val pandirection_to_int : pandirection -> int

(* PolicyType - enumeration *)
type policytype = [
  | `ALWAYS (** The scrollbar is always visible. The view size is
independent of the content. *)
  | `AUTOMATIC (** The scrollbar will appear and disappear as necessary.
For example, when all of a [GtkTreeView] can not be seen. *)
  | `NEVER (** The scrollbar should never appear. In this mode the
content determines the size. *)
  | `EXTERNAL (** Don't show a scrollbar, but don't force the
size to follow the content. This can be used e.g. to make multiple
scrolled windows share a scrollbar. *)
]

val policytype_of_int : int -> policytype
val policytype_to_int : policytype -> int

(* PositionType - enumeration *)
type positiontype = [
  | `LEFT (** The feature is at the left edge. *)
  | `RIGHT (** The feature is at the right edge. *)
  | `TOP (** The feature is at the top edge. *)
  | `BOTTOM (** The feature is at the bottom edge. *)
]

val positiontype_of_int : int -> positiontype
val positiontype_to_int : positiontype -> int

(* PrintDuplex - enumeration *)
type printduplex = [
  | `SIMPLEX (** No duplex. *)
  | `HORIZONTAL (** Horizontal duplex. *)
  | `VERTICAL (** Vertical duplex. *)
]

val printduplex_of_int : int -> printduplex
val printduplex_to_int : printduplex -> int

(* PrintError - enumeration *)
type printerror = [
  | `GENERAL (** An unspecified error occurred. *)
  | `INTERNAL_ERROR (** An internal error occurred. *)
  | `NOMEM (** A memory allocation failed. *)
  | `INVALID_FILE (** An error occurred while loading a page setup
or paper size from a key file. *)
]

val printerror_of_int : int -> printerror
val printerror_to_int : printerror -> int

(* PrintOperationAction - enumeration *)
type printoperationaction = [
  | `PRINT_DIALOG (** Show the print dialog. *)
  | `PRINT (** Start to print without showing
the print dialog, based on the current print settings, if possible.
Depending on the platform, a print dialog might appear anyway. *)
  | `PREVIEW (** Show the print preview. *)
  | `EXPORT (** Export to a file. This requires
the export-filename property to be set. *)
]

val printoperationaction_of_int : int -> printoperationaction
val printoperationaction_to_int : printoperationaction -> int

(* PrintOperationResult - enumeration *)
type printoperationresult = [
  | `ERROR (** An error has occurred. *)
  | `APPLY (** The print settings should be stored. *)
  | `CANCEL (** The print operation has been canceled,
the print settings should not be stored. *)
  | `IN_PROGRESS (** The print operation is not complete
yet. This value will only be returned when running asynchronously. *)
]

val printoperationresult_of_int : int -> printoperationresult
val printoperationresult_to_int : printoperationresult -> int

(* PrintPages - enumeration *)
type printpages = [
  | `ALL (** All pages. *)
  | `CURRENT (** Current page. *)
  | `RANGES (** Range of pages. *)
  | `SELECTION (** Selected pages. *)
]

val printpages_of_int : int -> printpages
val printpages_to_int : printpages -> int

(* PrintQuality - enumeration *)
type printquality = [
  | `LOW (** Low quality. *)
  | `NORMAL (** Normal quality. *)
  | `HIGH (** High quality. *)
  | `DRAFT (** Draft quality. *)
]

val printquality_of_int : int -> printquality
val printquality_to_int : printquality -> int

(* PrintStatus - enumeration *)
type printstatus = [
  | `INITIAL (** The printing has not started yet; this
status is set initially, and while the print dialog is shown. *)
  | `PREPARING (** This status is set while the begin-print
signal is emitted and during pagination. *)
  | `GENERATING_DATA (** This status is set while the
pages are being rendered. *)
  | `SENDING_DATA (** The print job is being sent off to the
printer. *)
  | `PENDING (** The print job has been sent to the printer,
but is not printed for some reason, e.g. the printer may be stopped. *)
  | `PENDING_ISSUE (** Some problem has occurred during
printing, e.g. a paper jam. *)
  | `PRINTING (** The printer is processing the print job. *)
  | `FINISHED (** The printing has been completed successfully. *)
  | `FINISHED_ABORTED (** The printing has been aborted. *)
]

val printstatus_of_int : int -> printstatus
val printstatus_to_int : printstatus -> int

(* PropagationLimit - enumeration *)
type propagationlimit = [
  | `NONE (** Events are handled regardless of what their
target is. *)
  | `SAME_NATIVE (** Events are only handled if their target is in
the same [Native] (or widget with [Gtk.Widget:limit-events]
set) as the event controllers widget.
Note that some event types have two targets (origin and destination). *)
]

val propagationlimit_of_int : int -> propagationlimit
val propagationlimit_to_int : propagationlimit -> int

(* PropagationPhase - enumeration *)
type propagationphase = [
  | `NONE (** Events are not delivered. *)
  | `CAPTURE (** Events are delivered in the capture phase. The
capture phase happens before the bubble phase, runs from the toplevel down
to the event widget. This option should only be used on containers that
might possibly handle events before their children do. *)
  | `BUBBLE (** Events are delivered in the bubble phase. The bubble
phase happens after the capture phase, and before the default handlers
are run. This phase runs from the event widget, up to the toplevel. *)
  | `TARGET (** Events are delivered in the default widget event handlers,
note that widget implementations must chain up on button, motion, touch and
grab broken handlers for controllers in this phase to be run. *)
]

val propagationphase_of_int : int -> propagationphase
val propagationphase_to_int : propagationphase -> int

(* RecentManagerError - enumeration *)
type recentmanagererror = [
  | `NOT_FOUND (** the URI specified does not exists in
the recently used resources list. *)
  | `INVALID_URI (** the URI specified is not valid. *)
  | `INVALID_ENCODING (** the supplied string is not
UTF-8 encoded. *)
  | `NOT_REGISTERED (** no application has registered
the specified item. *)
  | `READ (** failure while reading the recently used
resources file. *)
  | `WRITE (** failure while writing the recently used
resources file. *)
  | `UNKNOWN (** unspecified error. *)
]

val recentmanagererror_of_int : int -> recentmanagererror
val recentmanagererror_to_int : recentmanagererror -> int

(* ResponseType - enumeration *)
type responsetype = [
  | `NONE (** Returned if an action widget has no response id,
or if the dialog gets programmatically hidden or destroyed *)
  | `REJECT (** Generic response id, not used by GTK dialogs *)
  | `ACCEPT (** Generic response id, not used by GTK dialogs *)
  | `DELETE_EVENT (** Returned if the dialog is deleted *)
  | `OK (** Returned by OK buttons in GTK dialogs *)
  | `CANCEL (** Returned by Cancel buttons in GTK dialogs *)
  | `CLOSE (** Returned by Close buttons in GTK dialogs *)
  | `YES (** Returned by Yes buttons in GTK dialogs *)
  | `NO (** Returned by No buttons in GTK dialogs *)
  | `APPLY (** Returned by Apply buttons in GTK dialogs *)
  | `HELP (** Returned by Help buttons in GTK dialogs *)
]

val responsetype_of_int : int -> responsetype
val responsetype_to_int : responsetype -> int

(* RevealerTransitionType - enumeration *)
type revealertransitiontype = [
  | `NONE (** No transition *)
  | `CROSSFADE (** Fade in *)
  | `SLIDE_RIGHT (** Slide in from the left *)
  | `SLIDE_LEFT (** Slide in from the right *)
  | `SLIDE_UP (** Slide in from the bottom *)
  | `SLIDE_DOWN (** Slide in from the top *)
  | `SWING_RIGHT (** Floop in from the left *)
  | `SWING_LEFT (** Floop in from the right *)
  | `SWING_UP (** Floop in from the bottom *)
  | `SWING_DOWN (** Floop in from the top *)
]

val revealertransitiontype_of_int : int -> revealertransitiontype
val revealertransitiontype_to_int : revealertransitiontype -> int

(* ScrollStep - enumeration *)
type scrollstep = [
  | `STEPS (** Scroll in steps. *)
  | `PAGES (** Scroll by pages. *)
  | `ENDS (** Scroll to ends. *)
  | `HORIZONTAL_STEPS (** Scroll in horizontal steps. *)
  | `HORIZONTAL_PAGES (** Scroll by horizontal pages. *)
  | `HORIZONTAL_ENDS (** Scroll to the horizontal ends. *)
]

val scrollstep_of_int : int -> scrollstep
val scrollstep_to_int : scrollstep -> int

(* ScrollType - enumeration *)
type scrolltype = [
  | `NONE (** No scrolling. *)
  | `JUMP (** Jump to new location. *)
  | `STEP_BACKWARD (** Step backward. *)
  | `STEP_FORWARD (** Step forward. *)
  | `PAGE_BACKWARD (** Page backward. *)
  | `PAGE_FORWARD (** Page forward. *)
  | `STEP_UP (** Step up. *)
  | `STEP_DOWN (** Step down. *)
  | `PAGE_UP (** Page up. *)
  | `PAGE_DOWN (** Page down. *)
  | `STEP_LEFT (** Step to the left. *)
  | `STEP_RIGHT (** Step to the right. *)
  | `PAGE_LEFT (** Page to the left. *)
  | `PAGE_RIGHT (** Page to the right. *)
  | `START (** Scroll to start. *)
  | `END (** Scroll to end. *)
]

val scrolltype_of_int : int -> scrolltype
val scrolltype_to_int : scrolltype -> int

(* ScrollablePolicy - enumeration *)
type scrollablepolicy = [
  | `MINIMUM (** Scrollable adjustments are based on the minimum size *)
  | `NATURAL (** Scrollable adjustments are based on the natural size *)
]

val scrollablepolicy_of_int : int -> scrollablepolicy
val scrollablepolicy_to_int : scrollablepolicy -> int

(* SelectionMode - enumeration *)
type selectionmode = [
  | `NONE (** No selection is possible. *)
  | `SINGLE (** Zero or one element may be selected. *)
  | `BROWSE (** Exactly one element is selected.
In some circumstances, such as initially or during a search
operation, it’s possible for no element to be selected with
[GTK_SELECTION_BROWSE]. What is really enforced is that the user
can’t deselect a currently selected element except by selecting
another element. *)
  | `MULTIPLE (** Any number of elements may be selected.
The Ctrl key may be used to enlarge the selection, and Shift
key to select between the focus and the child pointed to.
Some widgets may also allow Click-drag to select a range of elements. *)
]

val selectionmode_of_int : int -> selectionmode
val selectionmode_to_int : selectionmode -> int

(* SensitivityType - enumeration *)
type sensitivitytype = [
  | `AUTO (** The control is made insensitive if no
action can be triggered *)
  | `ON (** The control is always sensitive *)
  | `OFF (** The control is always insensitive *)
]

val sensitivitytype_of_int : int -> sensitivitytype
val sensitivitytype_to_int : sensitivitytype -> int

(* ShortcutScope - enumeration *)
type shortcutscope = [
  | `LOCAL (** Shortcuts are handled inside
the widget the controller belongs to. *)
  | `MANAGED (** Shortcuts are handled by
the first ancestor that is a [ShortcutManager] *)
  | `GLOBAL (** Shortcuts are handled by
the root widget. *)
]

val shortcutscope_of_int : int -> shortcutscope
val shortcutscope_to_int : shortcutscope -> int

(* ShortcutType - enumeration *)
type shortcuttype = [
  | `ACCELERATOR (** The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
property will be used. *)
  | `GESTURE_PINCH (** The shortcut is a pinch gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_STRETCH (** The shortcut is a stretch gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_ROTATE_CLOCKWISE (** The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_ROTATE_COUNTERCLOCKWISE (** The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_TWO_FINGER_SWIPE_LEFT (** The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_TWO_FINGER_SWIPE_RIGHT (** The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE (** The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
used. *)
  | `GESTURE_SWIPE_LEFT (** The shortcut is a swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_SWIPE_RIGHT (** The shortcut is a swipe gesture. GTK provides an icon and subtitle. *)
]

val shortcuttype_of_int : int -> shortcuttype
val shortcuttype_to_int : shortcuttype -> int

(* SizeGroupMode - enumeration *)
type sizegroupmode = [
  | `NONE (** group has no effect *)
  | `HORIZONTAL (** group affects horizontal requisition *)
  | `VERTICAL (** group affects vertical requisition *)
  | `BOTH (** group affects both horizontal and vertical requisition *)
]

val sizegroupmode_of_int : int -> sizegroupmode
val sizegroupmode_to_int : sizegroupmode -> int

(* SizeRequestMode - enumeration *)
type sizerequestmode = [
  | `HEIGHT_FOR_WIDTH (** Prefer height-for-width geometry management *)
  | `WIDTH_FOR_HEIGHT (** Prefer width-for-height geometry management *)
  | `CONSTANT_SIZE (** Don’t trade height-for-width or width-for-height *)
]

val sizerequestmode_of_int : int -> sizerequestmode
val sizerequestmode_to_int : sizerequestmode -> int

(* SortType - enumeration *)
type sorttype = [
  | `ASCENDING (** Sorting is in ascending order. *)
  | `DESCENDING (** Sorting is in descending order. *)
]

val sorttype_of_int : int -> sorttype
val sorttype_to_int : sorttype -> int

(* SorterChange - enumeration *)
type sorterchange = [
  | `DIFFERENT (** The sorter change cannot be described
by any of the other enumeration values *)
  | `INVERTED (** The sort order was inverted. Comparisons
that returned [GTK_ORDERING_SMALLER] now return [GTK_ORDERING_LARGER]
and vice versa. Other comparisons return the same values as before. *)
  | `LESS_STRICT (** The sorter is less strict: Comparisons
may now return [GTK_ORDERING_EQUAL] that did not do so before. *)
  | `MORE_STRICT (** The sorter is more strict: Comparisons
that did return [GTK_ORDERING_EQUAL] may not do so anymore. *)
]

val sorterchange_of_int : int -> sorterchange
val sorterchange_to_int : sorterchange -> int

(* SorterOrder - enumeration *)
type sorterorder = [
  | `PARTIAL (** A partial order. Any [GtkOrdering] is possible. *)
  | `NONE (** No order, all elements are considered equal.
gtk_sorter_compare() will only return [GTK_ORDERING_EQUAL]. *)
  | `TOTAL (** A total order. gtk_sorter_compare() will only
return [GTK_ORDERING_EQUAL] if an item is compared with itself. Two
different items will never cause this value to be returned. *)
]

val sorterorder_of_int : int -> sorterorder
val sorterorder_to_int : sorterorder -> int

(* SpinButtonUpdatePolicy - enumeration *)
type spinbuttonupdatepolicy = [
  | `ALWAYS (** When refreshing your [GtkSpinButton], the value is
always displayed *)
  | `IF_VALID (** When refreshing your [GtkSpinButton], the value is
only displayed if it is valid within the bounds of the spin button's
adjustment *)
]

val spinbuttonupdatepolicy_of_int : int -> spinbuttonupdatepolicy
val spinbuttonupdatepolicy_to_int : spinbuttonupdatepolicy -> int

(* SpinType - enumeration *)
type spintype = [
  | `STEP_FORWARD (** Increment by the adjustments step increment. *)
  | `STEP_BACKWARD (** Decrement by the adjustments step increment. *)
  | `PAGE_FORWARD (** Increment by the adjustments page increment. *)
  | `PAGE_BACKWARD (** Decrement by the adjustments page increment. *)
  | `HOME (** Go to the adjustments lower bound. *)
  | `END (** Go to the adjustments upper bound. *)
  | `USER_DEFINED (** Change by a specified amount. *)
]

val spintype_of_int : int -> spintype
val spintype_to_int : spintype -> int

(* StackTransitionType - enumeration *)
type stacktransitiontype = [
  | `NONE (** No transition *)
  | `CROSSFADE (** A cross-fade *)
  | `SLIDE_RIGHT (** Slide from left to right *)
  | `SLIDE_LEFT (** Slide from right to left *)
  | `SLIDE_UP (** Slide from bottom up *)
  | `SLIDE_DOWN (** Slide from top down *)
  | `SLIDE_LEFT_RIGHT (** Slide from left or right according to the children order *)
  | `SLIDE_UP_DOWN (** Slide from top down or bottom up according to the order *)
  | `OVER_UP (** Cover the old page by sliding up *)
  | `OVER_DOWN (** Cover the old page by sliding down *)
  | `OVER_LEFT (** Cover the old page by sliding to the left *)
  | `OVER_RIGHT (** Cover the old page by sliding to the right *)
  | `UNDER_UP (** Uncover the new page by sliding up *)
  | `UNDER_DOWN (** Uncover the new page by sliding down *)
  | `UNDER_LEFT (** Uncover the new page by sliding to the left *)
  | `UNDER_RIGHT (** Uncover the new page by sliding to the right *)
  | `OVER_UP_DOWN (** Cover the old page sliding up or uncover the new page sliding down, according to order *)
  | `OVER_DOWN_UP (** Cover the old page sliding down or uncover the new page sliding up, according to order *)
  | `OVER_LEFT_RIGHT (** Cover the old page sliding left or uncover the new page sliding right, according to order *)
  | `OVER_RIGHT_LEFT (** Cover the old page sliding right or uncover the new page sliding left, according to order *)
  | `ROTATE_LEFT (** Pretend the pages are sides of a cube and rotate that cube to the left *)
  | `ROTATE_RIGHT (** Pretend the pages are sides of a cube and rotate that cube to the right *)
  | `ROTATE_LEFT_RIGHT (** Pretend the pages are sides of a cube and rotate that cube to the left or right according to the children order *)
]

val stacktransitiontype_of_int : int -> stacktransitiontype
val stacktransitiontype_to_int : stacktransitiontype -> int

(* StringFilterMatchMode - enumeration *)
type stringfiltermatchmode = [
  | `EXACT (** The search string and
text must match exactly *)
  | `SUBSTRING (** The search string
must be contained as a substring inside the text *)
  | `PREFIX (** The text must begin
with the search string *)
]

val stringfiltermatchmode_of_int : int -> stringfiltermatchmode
val stringfiltermatchmode_to_int : stringfiltermatchmode -> int

(* SymbolicColor - enumeration *)
type symboliccolor = [
  | `FOREGROUND (** The default foreground color *)
  | `ERROR (** Indication color for errors *)
  | `WARNING (** Indication color for warnings *)
  | `SUCCESS (** Indication color for success *)
]

val symboliccolor_of_int : int -> symboliccolor
val symboliccolor_to_int : symboliccolor -> int

(* SystemSetting - enumeration *)
type systemsetting = [
  | `DPI (** the [Gtk.Settings:gtk-xft-dpi] setting has changed *)
  | `FONT_NAME (** The [Gtk.Settings:gtk-font-name] setting has changed *)
  | `FONT_CONFIG (** The font configuration has changed in a way that
requires text to be redrawn. This can be any of the
[Gtk.Settings:gtk-xft-antialias],
[Gtk.Settings:gtk-xft-hinting],
[Gtk.Settings:gtk-xft-hintstyle],
[Gtk.Settings:gtk-xft-rgba] or
[Gtk.Settings:gtk-fontconfig-timestamp] settings *)
  | `DISPLAY (** The display has changed *)
  | `ICON_THEME (** The icon theme has changed in a way that requires
icons to be looked up again *)
]

val systemsetting_of_int : int -> systemsetting
val systemsetting_to_int : systemsetting -> int

(* TextDirection - enumeration *)
type textdirection = [
  | `NONE (** No direction. *)
  | `LTR (** Left to right text direction. *)
  | `RTL (** Right to left text direction. *)
]

val textdirection_of_int : int -> textdirection
val textdirection_to_int : textdirection -> int

(* TextExtendSelection - enumeration *)
type textextendselection = [
  | `WORD (** Selects the current word. It is triggered by
a double-click for example. *)
  | `LINE (** Selects the current line. It is triggered by
a triple-click for example. *)
]

val textextendselection_of_int : int -> textextendselection
val textextendselection_to_int : textextendselection -> int

(* TextViewLayer - enumeration *)
type textviewlayer = [
  | `BELOW_TEXT (** The layer rendered below the text (but above the background). *)
  | `ABOVE_TEXT (** The layer rendered above the text. *)
]

val textviewlayer_of_int : int -> textviewlayer
val textviewlayer_to_int : textviewlayer -> int

(* TextWindowType - enumeration *)
type textwindowtype = [
  | `WIDGET (** Window that floats over scrolling areas. *)
  | `TEXT (** Scrollable text window. *)
  | `LEFT (** Left side border window. *)
  | `RIGHT (** Right side border window. *)
  | `TOP (** Top border window. *)
  | `BOTTOM (** Bottom border window. *)
]

val textwindowtype_of_int : int -> textwindowtype
val textwindowtype_to_int : textwindowtype -> int

(* TreeViewColumnSizing - enumeration *)
type treeviewcolumnsizing = [
  | `GROW_ONLY (** Columns only get bigger in reaction to changes in the model *)
  | `AUTOSIZE (** Columns resize to be the optimal size every time the model changes. *)
  | `FIXED (** Columns are a fixed numbers of pixels wide. *)
]

val treeviewcolumnsizing_of_int : int -> treeviewcolumnsizing
val treeviewcolumnsizing_to_int : treeviewcolumnsizing -> int

(* TreeViewDropPosition - enumeration *)
type treeviewdropposition = [
  | `BEFORE (** dropped row is inserted before *)
  | `AFTER (** dropped row is inserted after *)
  | `INTO_OR_BEFORE (** dropped row becomes a child or is inserted before *)
  | `INTO_OR_AFTER (** dropped row becomes a child or is inserted after *)
]

val treeviewdropposition_of_int : int -> treeviewdropposition
val treeviewdropposition_to_int : treeviewdropposition -> int

(* TreeViewGridLines - enumeration *)
type treeviewgridlines = [
  | `NONE (** No grid lines. *)
  | `HORIZONTAL (** Horizontal grid lines. *)
  | `VERTICAL (** Vertical grid lines. *)
  | `BOTH (** Horizontal and vertical grid lines. *)
]

val treeviewgridlines_of_int : int -> treeviewgridlines
val treeviewgridlines_to_int : treeviewgridlines -> int

(* Unit - enumeration *)
type unit = [
  | `NONE (** No units. *)
  | `POINTS (** Dimensions in points. *)
  | `INCH (** Dimensions in inches. *)
  | `MM (** Dimensions in millimeters *)
]

val unit_of_int : int -> unit
val unit_to_int : unit -> int

(* WindowGravity - enumeration *)
type windowgravity = [
  | `TOP_LEFT (** The top left corner *)
  | `TOP (** The top edge *)
  | `TOP_RIGHT (** The top right corner *)
  | `LEFT (** The left edge *)
  | `CENTER (** The center pointer *)
  | `RIGHT (** The right edge *)
  | `BOTTOM_LEFT (** The bottom left corner *)
  | `BOTTOM (** the bottom edge *)
  | `BOTTOM_RIGHT (** The bottom right corner *)
  | `TOP_START (** The top left or top right corner,
depending on the text direction *)
  | `TOP_END (** The top right or top left corner,
depending on the text direction *)
  | `START (** The left or right edge,
depending on the text direction *)
  | `END (** The right or left edge,
depending on the text direction *)
  | `BOTTOM_START (** The bottom left or top right corner,
depending on the text direction *)
  | `BOTTOM_END (** The bottom right or top left corner,
depending on the text direction *)
]

val windowgravity_of_int : int -> windowgravity
val windowgravity_to_int : windowgravity -> int

(* WrapMode - enumeration *)
type wrapmode = [
  | `NONE (** do not wrap lines; just make the text area wider *)
  | `CHAR (** wrap text, breaking lines anywhere the cursor can
appear (between characters, usually - if you want to be technical,
between graphemes, see pango_get_log_attrs()) *)
  | `WORD (** wrap text, breaking lines in between words *)
  | `WORD_CHAR (** wrap text, breaking lines in between words, or if
that is not enough, also between graphemes *)
]

val wrapmode_of_int : int -> wrapmode
val wrapmode_to_int : wrapmode -> int

(* ApplicationInhibitFlags - bitfield/flags *)
type applicationinhibitflags_flag = [
  | `LOGOUT (** Inhibit ending the user session
by logging out or by shutting down the computer *)
  | `SWITCH (** Inhibit user switching *)
  | `SUSPEND (** Inhibit suspending the
session or computer *)
  | `IDLE (** Inhibit the session being
marked as idle (and possibly locked) *)
]

type applicationinhibitflags = applicationinhibitflags_flag list

val applicationinhibitflags_of_int : int -> applicationinhibitflags
val applicationinhibitflags_to_int : applicationinhibitflags -> int

(* BuilderClosureFlags - bitfield/flags *)
type builderclosureflags_flag = [
  | `SWAPPED (** The closure should be created swapped. See
g_cclosure_new_swap() for details. *)
]

type builderclosureflags = builderclosureflags_flag list

val builderclosureflags_of_int : int -> builderclosureflags
val builderclosureflags_to_int : builderclosureflags -> int

(* CellRendererState - bitfield/flags *)
type cellrendererstate_flag = [
  | `SELECTED (** The cell is currently selected, and
probably has a selection colored background to render to. *)
  | `PRELIT (** The mouse is hovering over the cell. *)
  | `INSENSITIVE (** The cell is drawn in an insensitive manner *)
  | `SORTED (** The cell is in a sorted row *)
  | `FOCUSED (** The cell is in the focus row. *)
  | `EXPANDABLE (** The cell is in a row that can be expanded *)
  | `EXPANDED (** The cell is in a row that is expanded *)
]

type cellrendererstate = cellrendererstate_flag list

val cellrendererstate_of_int : int -> cellrendererstate
val cellrendererstate_to_int : cellrendererstate -> int

(* DebugFlags - bitfield/flags *)
type debugflags_flag = [
  | `TEXT (** Information about GtkTextView *)
  | `TREE (** Information about GtkTreeView *)
  | `KEYBINDINGS (** Information about keyboard shortcuts *)
  | `MODULES (** Information about modules and extensions *)
  | `GEOMETRY (** Information about size allocation *)
  | `ICONTHEME (** Information about icon themes *)
  | `PRINTING (** Information about printing *)
  | `BUILDER_TRACE (** Trace GtkBuilder operation *)
  | `SIZE_REQUEST (** Information about size requests *)
  | `NO_CSS_CACHE (** Disable the style property cache *)
  | `INTERACTIVE (** Open the GTK inspector *)
  | `TOUCHSCREEN (** Show touch UI elements for pointer events. *)
  | `ACTIONS (** Information about actions and menu models *)
  | `LAYOUT (** Information from layout managers *)
  | `SNAPSHOT (** Include debug render nodes in the generated snapshots *)
  | `CONSTRAINTS (** Information from the constraints solver *)
  | `BUILDER_OBJECTS (** Log unused GtkBuilder objects *)
  | `A11Y (** Information about accessibility state changes *)
  | `ICONFALLBACK (** Information about icon fallback. *)
  | `INVERT_TEXT_DIR (** Inverts the default text-direction. *)
  | `CSS (** Information about deprecated CSS features. *)
  | `BUILDER (** Information about deprecated GtkBuilder features. *)
]

type debugflags = debugflags_flag list

val debugflags_of_int : int -> debugflags
val debugflags_to_int : debugflags -> int

(* DialogFlags - bitfield/flags *)
type dialogflags_flag = [
  | `MODAL (** Make the constructed dialog modal *)
  | `DESTROY_WITH_PARENT (** Destroy the dialog when its parent is destroyed *)
  | `USE_HEADER_BAR (** Create dialog with actions in header
bar instead of action area *)
]

type dialogflags = dialogflags_flag list

val dialogflags_of_int : int -> dialogflags
val dialogflags_to_int : dialogflags -> int

(* EventControllerScrollFlags - bitfield/flags *)
type eventcontrollerscrollflags_flag = [
  | `NONE (** Don't emit scroll. *)
  | `VERTICAL (** Emit scroll with vertical deltas. *)
  | `HORIZONTAL (** Emit scroll with horizontal deltas. *)
  | `DISCRETE (** Only emit deltas that are multiples of 1. *)
  | `KINETIC (** Emit ::decelerate after continuous scroll finishes. *)
  | `PHYSICAL_DIRECTION (** A [GtkEventControllerScrollFlags] value to prefer physical direction over
logical direction (i.e. oblivious to natural scroll). *)
  | `BOTH_AXES (** Emit scroll on both axes. *)
]

type eventcontrollerscrollflags = eventcontrollerscrollflags_flag list

val eventcontrollerscrollflags_of_int : int -> eventcontrollerscrollflags
val eventcontrollerscrollflags_to_int : eventcontrollerscrollflags -> int

(* FontChooserLevel - bitfield/flags *)
type fontchooserlevel_flag = [
  | `FAMILY (** Allow selecting a font family *)
  | `STYLE (** Allow selecting a specific font face *)
  | `SIZE (** Allow selecting a specific font size *)
  | `VARIATIONS (** Allow changing OpenType font variation axes *)
  | `FEATURES (** Allow selecting specific OpenType font features *)
]

type fontchooserlevel = fontchooserlevel_flag list

val fontchooserlevel_of_int : int -> fontchooserlevel
val fontchooserlevel_to_int : fontchooserlevel -> int

(* IconLookupFlags - bitfield/flags *)
type iconlookupflags_flag = [
  | `NONE (** Perform a regular lookup. *)
  | `FORCE_REGULAR (** Try to always load regular icons, even
when symbolic icon names are given *)
  | `FORCE_SYMBOLIC (** Try to always load symbolic icons, even
when regular icon names are given *)
  | `PRELOAD (** Starts loading the texture in the background
so it is ready when later needed. *)
]

type iconlookupflags = iconlookupflags_flag list

val iconlookupflags_of_int : int -> iconlookupflags
val iconlookupflags_to_int : iconlookupflags -> int

(* InputHints - bitfield/flags *)
type inputhints_flag = [
  | `NONE (** No special behaviour suggested *)
  | `SPELLCHECK (** Suggest checking for typos *)
  | `NO_SPELLCHECK (** Suggest not checking for typos *)
  | `WORD_COMPLETION (** Suggest word completion *)
  | `LOWERCASE (** Suggest to convert all text to lowercase *)
  | `UPPERCASE_CHARS (** Suggest to capitalize all text *)
  | `UPPERCASE_WORDS (** Suggest to capitalize the first
character of each word *)
  | `UPPERCASE_SENTENCES (** Suggest to capitalize the
first word of each sentence *)
  | `INHIBIT_OSK (** Suggest to not show an onscreen keyboard
(e.g for a calculator that already has all the keys). *)
  | `VERTICAL_WRITING (** The text is vertical *)
  | `EMOJI (** Suggest offering Emoji support *)
  | `NO_EMOJI (** Suggest not offering Emoji support *)
  | `PRIVATE (** Request that the input method should not
update personalized data (like typing history) *)
]

type inputhints = inputhints_flag list

val inputhints_of_int : int -> inputhints
val inputhints_to_int : inputhints -> int

(* ListScrollFlags - bitfield/flags *)
type listscrollflags_flag = [
  | `NONE (** Don't do anything extra *)
  | `FOCUS (** Focus the target item *)
  | `SELECT (** Select the target item and
unselect all other items. *)
]

type listscrollflags = listscrollflags_flag list

val listscrollflags_of_int : int -> listscrollflags
val listscrollflags_to_int : listscrollflags -> int

(* PickFlags - bitfield/flags *)
type pickflags_flag = [
  | `DEFAULT (** The default behavior, include widgets that are receiving events *)
  | `INSENSITIVE (** Include widgets that are insensitive *)
  | `NON_TARGETABLE (** Include widgets that are marked as non-targetable. See [Widget:can-target] *)
]

type pickflags = pickflags_flag list

val pickflags_of_int : int -> pickflags
val pickflags_to_int : pickflags -> int

(* PopoverMenuFlags - bitfield/flags *)
type popovermenuflags_flag = [
  | `SLIDING (** Submenus are presented as sliding submenus that replace the main menu. *)
  | `NESTED (** Submenus are presented as traditional, nested
popovers. *)
]

type popovermenuflags = popovermenuflags_flag list

val popovermenuflags_of_int : int -> popovermenuflags
val popovermenuflags_to_int : popovermenuflags -> int

(* ShortcutActionFlags - bitfield/flags *)
type shortcutactionflags_flag = [
  | `EXCLUSIVE (** The action is the only
action that can be activated. If this flag is not set,
a future activation may select a different action. *)
]

type shortcutactionflags = shortcutactionflags_flag list

val shortcutactionflags_of_int : int -> shortcutactionflags
val shortcutactionflags_to_int : shortcutactionflags -> int

(* StateFlags - bitfield/flags *)
type stateflags_flag = [
  | `NORMAL (** State during normal operation *)
  | `ACTIVE (** Widget is active *)
  | `PRELIGHT (** Widget has a mouse pointer over it *)
  | `SELECTED (** Widget is selected *)
  | `INSENSITIVE (** Widget is insensitive *)
  | `INCONSISTENT (** Widget is inconsistent *)
  | `FOCUSED (** Widget has the keyboard focus *)
  | `BACKDROP (** Widget is in a background toplevel window *)
  | `DIR_LTR (** Widget is in left-to-right text direction *)
  | `DIR_RTL (** Widget is in right-to-left text direction *)
  | `LINK (** Widget is a link *)
  | `VISITED (** The location the widget points to has already been visited *)
  | `CHECKED (** Widget is checked *)
  | `DROP_ACTIVE (** Widget is highlighted as a drop target for DND *)
  | `FOCUS_VISIBLE (** Widget has the visible focus *)
  | `FOCUS_WITHIN (** Widget contains the keyboard focus *)
]

type stateflags = stateflags_flag list

val stateflags_of_int : int -> stateflags
val stateflags_to_int : stateflags -> int

(* StyleContextPrintFlags - bitfield/flags *)
type stylecontextprintflags_flag = [
  | `NONE (** Default value. *)
  | `RECURSE (** Print the entire tree of
CSS nodes starting at the style context's node *)
  | `SHOW_STYLE (** Show the values of the
CSS properties for each node *)
  | `SHOW_CHANGE (** Show information about
what changes affect the styles *)
]

type stylecontextprintflags = stylecontextprintflags_flag list

val stylecontextprintflags_of_int : int -> stylecontextprintflags
val stylecontextprintflags_to_int : stylecontextprintflags -> int

(* TextBufferNotifyFlags - bitfield/flags *)
type textbuffernotifyflags_flag = [
  | `BEFORE_INSERT (** Be notified before text
is inserted into the underlying buffer. *)
  | `AFTER_INSERT (** Be notified after text
has been inserted into the underlying buffer. *)
  | `BEFORE_DELETE (** Be notified before text
is deleted from the underlying buffer. *)
  | `AFTER_DELETE (** Be notified after text
has been deleted from the underlying buffer. *)
]

type textbuffernotifyflags = textbuffernotifyflags_flag list

val textbuffernotifyflags_of_int : int -> textbuffernotifyflags
val textbuffernotifyflags_to_int : textbuffernotifyflags -> int

(* TextSearchFlags - bitfield/flags *)
type textsearchflags_flag = [
  | `VISIBLE_ONLY (** Search only visible data. A search match may
have invisible text interspersed. *)
  | `TEXT_ONLY (** Search only text. A match may have paintables or
child widgets mixed inside the matched range. *)
  | `CASE_INSENSITIVE (** The text will be matched regardless of
what case it is in. *)
]

type textsearchflags = textsearchflags_flag list

val textsearchflags_of_int : int -> textsearchflags
val textsearchflags_to_int : textsearchflags -> int

(* TreeModelFlags - bitfield/flags *)
type treemodelflags_flag = [
  | `ITERS_PERSIST (** iterators survive all signals
emitted by the tree *)
  | `LIST_ONLY (** the model is a list only, and never
has children *)
]

type treemodelflags = treemodelflags_flag list

val treemodelflags_of_int : int -> treemodelflags
val treemodelflags_to_int : treemodelflags -> int

