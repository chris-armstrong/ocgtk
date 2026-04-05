(* GENERATED CODE - DO NOT EDIT *)
(* Gtk Enumeration and Bitfield Types *)

(* AccessibleAnnouncementPriority - enumeration *)
type accessibleannouncementpriority = [
  | `LOW
  | `MEDIUM
  | `HIGH
]

(* AccessibleAutocomplete - enumeration *)
type accessibleautocomplete = [
  (** Automatic suggestions are not displayed. *)
  | `NONE
  (** When a user is providing input, text
   suggesting one way to complete the provided input may be dynamically
   inserted after the caret. *)
  | `INLINE
  (** When a user is providing input, an element
   containing a collection of values that could complete the provided input
   may be displayed. *)
  | `LIST
  (** When a user is providing input, an element
   containing a collection of values that could complete the provided input
   may be displayed. If displayed, one value in the collection is automatically
   selected, and the text needed to complete the automatically selected value
   appears after the caret in the input. *)
  | `BOTH
]

(* AccessibleInvalidState - enumeration *)
type accessibleinvalidstate = [
  (** There are no detected errors in the value *)
  | `FALSE
  (** The value entered by the user has failed validation *)
  | `TRUE
  (** A grammatical error was detected *)
  | `GRAMMAR
  (** A spelling error was detected *)
  | `SPELLING
]

(* AccessiblePlatformState - enumeration *)
type accessibleplatformstate = [
  (** whether the accessible can be focused *)
  | `FOCUSABLE
  (** whether the accessible has focus *)
  | `FOCUSED
  (** whether the accessible is active *)
  | `ACTIVE
]

(* AccessibleProperty - enumeration *)
type accessibleproperty = [
  (** Indicates whether inputting text
   could trigger display of one or more predictions of the user's intended
   value for a combobox, searchbox, or textbox and specifies how predictions
   would be presented if they were made. Value type: [enum@AccessibleAutocomplete] *)
  | `AUTOCOMPLETE
  (** Defines a string value that describes
   or annotates the current element. Value type: string *)
  | `DESCRIPTION
  (** Indicates the availability and type of
   interactive popup element, such as menu or dialog, that can be triggered
   by an element. *)
  | `HAS_POPUP
  (** Indicates keyboard shortcuts that an
   author has implemented to activate or give focus to an element. Value type:
   string *)
  | `KEY_SHORTCUTS
  (** Defines a string value that labels the current
   element. Value type: string *)
  | `LABEL
  (** Defines the hierarchical level of an element
   within a structure. Value type: integer *)
  | `LEVEL
  (** Indicates whether an element is modal when
   displayed. Value type: boolean *)
  | `MODAL
  (** Indicates whether a text box accepts
   multiple lines of input or only a single line. Value type: boolean *)
  | `MULTI_LINE
  (** Indicates that the user may select
   more than one item from the current selectable descendants. Value type:
   boolean *)
  | `MULTI_SELECTABLE
  (** Indicates whether the element's
   orientation is horizontal, vertical, or unknown/ambiguous. Value type:
   [enum@Orientation] *)
  | `ORIENTATION
  (** Defines a short hint (a word or short
   phrase) intended to aid the user with data entry when the control has no
   value. A hint could be a sample value or a brief description of the expected
   format. Value type: string *)
  | `PLACEHOLDER
  (** Indicates that the element is not editable,
   but is otherwise operable. Value type: boolean *)
  | `READ_ONLY
  (** Indicates that user input is required on
   the element before a form may be submitted. Value type: boolean *)
  | `REQUIRED
  (** Defines a human-readable,
   author-localized description for the role of an element. Value type: string *)
  | `ROLE_DESCRIPTION
  (** Indicates if items in a table or grid are
   sorted in ascending or descending order. Value type: [enum@AccessibleSort] *)
  | `SORT
  (** Defines the maximum allowed value for a
   range widget. Value type: double *)
  | `VALUE_MAX
  (** Defines the minimum allowed value for a
   range widget. Value type: double *)
  | `VALUE_MIN
  (** Defines the current value for a range widget.
   Value type: double *)
  | `VALUE_NOW
  (** Defines the human readable text alternative
   of aria-valuenow for a range widget. Value type: string *)
  | `VALUE_TEXT
]

(* AccessibleRelation - enumeration *)
type accessiblerelation = [
  (** Identifies the currently active
   element when focus is on a composite widget, combobox, textbox, group,
   or application. Value type: reference *)
  | `ACTIVE_DESCENDANT
  (** Defines the total number of columns
   in a table, grid, or treegrid. Value type: integer *)
  | `COL_COUNT
  (** Defines an element's column index or
   position with respect to the total number of columns within a table,
   grid, or treegrid. Value type: integer *)
  | `COL_INDEX
  (** Defines a human readable text
  alternative of %GTK_ACCESSIBLE_RELATION_COL_INDEX. Value type: string *)
  | `COL_INDEX_TEXT
  (** Defines the number of columns spanned
  by a cell or gridcell within a table, grid, or treegrid. Value type: integer *)
  | `COL_SPAN
  (** Identifies the element (or elements) whose
   contents or presence are controlled by the current element. Value type: reference *)
  | `CONTROLS
  (** Identifies the element (or elements)
   that describes the object. Value type: reference *)
  | `DESCRIBED_BY
  (** Identifies the element (or elements) that
   provide additional information related to the object. Value type: reference *)
  | `DETAILS
  (** Identifies the element that provides
   an error message for an object. Value type: reference *)
  | `ERROR_MESSAGE
  (** Identifies the next element (or elements)
   in an alternate reading order of content which, at the user's discretion,
   allows assistive technology to override the general default of reading in
   document source order. Value type: reference *)
  | `FLOW_TO
  (** Identifies the element (or elements)
   that labels the current element. Value type: reference *)
  | `LABELLED_BY
  (** Identifies an element (or elements) in order
   to define a visual, functional, or contextual parent/child relationship
   between elements where the widget hierarchy cannot be used to represent
   the relationship. Value type: reference *)
  | `OWNS
  (** Defines an element's number or position
   in the current set of listitems or treeitems. Value type: integer *)
  | `POS_IN_SET
  (** Defines the total number of rows in a table,
   grid, or treegrid. Value type: integer *)
  | `ROW_COUNT
  (** Defines an element's row index or position
   with respect to the total number of rows within a table, grid, or treegrid.
   Value type: integer *)
  | `ROW_INDEX
  (** Defines a human readable text
   alternative of aria-rowindex. Value type: string *)
  | `ROW_INDEX_TEXT
  (** Defines the number of rows spanned by a
   cell or gridcell within a table, grid, or treegrid. Value type: integer *)
  | `ROW_SPAN
  (** Defines the number of items in the current
   set of listitems or treeitems. Value type: integer *)
  | `SET_SIZE
]

(* AccessibleRole - enumeration *)
type accessiblerole = [
  (** An element with important, and usually
  time-sensitive, information *)
  | `ALERT
  (** A type of dialog that contains an
  alert message *)
  | `ALERT_DIALOG
  (** Unused *)
  | `BANNER
  (** An input element that allows for
  user-triggered actions when clicked or pressed *)
  | `BUTTON
  (** Unused *)
  | `CAPTION
  (** Unused *)
  | `CELL
  (** A checkable input element that has
  three possible values: `true`, `false`, or `mixed` *)
  | `CHECKBOX
  (** A header in a columned list. *)
  | `COLUMN_HEADER
  (** An input that controls another element,
  such as a list or a grid, that can dynamically pop up to help the user
  set the value of the input *)
  | `COMBO_BOX
  (** Abstract role. *)
  | `COMMAND
  (** Abstract role. *)
  | `COMPOSITE
  (** A dialog is a window that is designed to interrupt
  the current processing of an application in order to prompt the user to enter
  information or require a response. *)
  | `DIALOG
  (** Content that assistive technology users may want to
  browse in a reading mode. *)
  | `DOCUMENT
  (** Unused *)
  | `FEED
  (** Unused *)
  | `FORM
  (** A nameless container that has no semantic meaning
  of its own. This is the role that GTK uses by default for widgets. *)
  | `GENERIC
  (** A grid of items. *)
  | `GRID
  (** An item in a grid or tree grid. *)
  | `GRID_CELL
  (** An element that groups multiple related widgets. GTK uses
  this role for various containers, like [class@Gtk.HeaderBar] or [class@Gtk.Notebook]. *)
  | `GROUP
  (** Unused *)
  | `HEADING
  (** An image. *)
  | `IMG
  (** Abstract role. *)
  | `INPUT
  (** A visible name or caption for a user interface component. *)
  | `LABEL
  (** Abstract role. *)
  | `LANDMARK
  (** Unused *)
  | `LEGEND
  (** A clickable link. *)
  | `LINK
  (** A list of items. *)
  | `LIST
  (** Unused. *)
  | `LIST_BOX
  (** An item in a list. *)
  | `LIST_ITEM
  (** Unused *)
  | `LOG
  (** Unused *)
  | `MAIN
  (** Unused *)
  | `MARQUEE
  (** Unused *)
  | `MATH
  (** An element that represents a value within a known range. *)
  | `METER
  (** A menu. *)
  | `MENU
  (** A menubar. *)
  | `MENU_BAR
  (** An item in a menu. *)
  | `MENU_ITEM
  (** A check item in a menu. *)
  | `MENU_ITEM_CHECKBOX
  (** A radio item in a menu. *)
  | `MENU_ITEM_RADIO
  (** Unused *)
  | `NAVIGATION
  (** An element that is not represented to accessibility technologies.
  This role is synonymous to @GTK_ACCESSIBLE_ROLE_PRESENTATION. *)
  | `NONE
  (** Unused *)
  | `NOTE
  (** Unused *)
  | `OPTION
  (** An element that is not represented to accessibility technologies.
  This role is synonymous to @GTK_ACCESSIBLE_ROLE_NONE. *)
  | `PRESENTATION
  (** An element that displays the progress
  status for tasks that take a long time. *)
  | `PROGRESS_BAR
  (** A checkable input in a group of radio roles,
  only one of which can be checked at a time. *)
  | `RADIO
  (** Unused *)
  | `RADIO_GROUP
  (** Abstract role. *)
  | `RANGE
  (** Unused *)
  | `REGION
  (** A row in a columned list. *)
  | `ROW
  (** Unused *)
  | `ROW_GROUP
  (** Unused *)
  | `ROW_HEADER
  (** A graphical object that controls the scrolling
  of content within a viewing area, regardless of whether the content is fully
  displayed within the viewing area. *)
  | `SCROLLBAR
  (** Unused *)
  | `SEARCH
  (** A type of textbox intended for specifying
  search criteria. *)
  | `SEARCH_BOX
  (** Abstract role. *)
  | `SECTION
  (** Abstract role. *)
  | `SECTION_HEAD
  (** Abstract role. *)
  | `SELECT
  (** A divider that separates and distinguishes
  sections of content or groups of menuitems. *)
  | `SEPARATOR
  (** A user input where the user selects a value
  from within a given range. *)
  | `SLIDER
  (** A form of range that expects the user to
  select from among discrete choices. *)
  | `SPIN_BUTTON
  (** Unused *)
  | `STATUS
  (** Abstract role. *)
  | `STRUCTURE
  (** A type of checkbox that represents on/off values,
  as opposed to checked/unchecked values. *)
  | `SWITCH
  (** An item in a list of tab used for switching pages. *)
  | `TAB
  (** Unused *)
  | `TABLE
  (** A list of tabs for switching pages. *)
  | `TAB_LIST
  (** A page in a notebook or stack. *)
  | `TAB_PANEL
  (** A type of input that allows free-form text
  as its value. *)
  | `TEXT_BOX
  (** Unused *)
  | `TIME
  (** Unused *)
  | `TIMER
  (** Unused *)
  | `TOOLBAR
  (** Unused *)
  | `TOOLTIP
  (** Unused *)
  | `TREE
  (** A treeview-like, columned list. *)
  | `TREE_GRID
  (** Unused *)
  | `TREE_ITEM
  (** Abstract role for interactive components of a
  graphical user interface *)
  | `WIDGET
  (** Abstract role for windows. *)
  | `WINDOW
  (** A type of push button which stays pressed until depressed by a second
activation. *)
  | `TOGGLE_BUTTON
  (** A toplevel element of a graphical user interface.

This is the role that GTK uses by default for windows. *)
  | `APPLICATION
  (** A paragraph of content. *)
  | `PARAGRAPH
  (** A section of content that is quoted from another source. *)
  | `BLOCK_QUOTE
  (** A section of a page that consists of a composition that forms an independent
part of a document, page, or site. *)
  | `ARTICLE
  (** A comment contains content expressing reaction to other content. *)
  | `COMMENT
  (** A virtual terminal. *)
  | `TERMINAL
]

(* AccessibleSort - enumeration *)
type accessiblesort = [
  (** There is no defined sort applied to the column. *)
  | `NONE
  (** Items are sorted in ascending order by this column. *)
  | `ASCENDING
  (** Items are sorted in descending order by this column. *)
  | `DESCENDING
  (** A sort algorithm other than ascending or
   descending has been applied. *)
  | `OTHER
]

(* AccessibleState - enumeration *)
type accessiblestate = [
  (** A “busy” state. This state has boolean values *)
  | `BUSY
  (** A “checked” state; indicates the current
  state of a [class@CheckButton]. Value type: [enum@AccessibleTristate] *)
  | `CHECKED
  (** A “disabled” state; corresponds to the
  [property@Widget:sensitive] property. It indicates a UI element
  that is perceivable, but not editable or operable. Value type: boolean *)
  | `DISABLED
  (** An “expanded” state; corresponds to the
  [property@Expander:expanded] property. Value type: boolean
  or undefined *)
  | `EXPANDED
  (** A “hidden” state; corresponds to the
  [property@Widget:visible] property. You can use this state
  explicitly on UI elements that should not be exposed to an assistive
  technology. Value type: boolean
  See also: %GTK_ACCESSIBLE_STATE_DISABLED *)
  | `HIDDEN
  (** An “invalid” state; set when a widget
  is showing an error. Value type: [enum@AccessibleInvalidState] *)
  | `INVALID
  (** A “pressed” state; indicates the current
  state of a [class@ToggleButton]. Value type: [enum@AccessibleTristate]
  enumeration *)
  | `PRESSED
  (** A “selected” state; set when a widget
  is selected. Value type: boolean or undefined *)
  | `SELECTED
  (** Indicates that a widget with the GTK_ACCESSIBLE_ROLE_LINK has been visited.
Value type: boolean. *)
  | `VISITED
]

(* AccessibleTextContentChange - enumeration *)
type accessibletextcontentchange = [
  (** contents change as the result of
  an insert operation *)
  | `INSERT
  (** contents change as the result of
  a remove operation *)
  | `REMOVE
]

(* AccessibleTextGranularity - enumeration *)
type accessibletextgranularity = [
  (** Use the boundary between
  characters (including non-printing characters) *)
  | `CHARACTER
  (** Use the boundary between words,
  starting from the beginning of the current word and ending at the
  beginning of the next word *)
  | `WORD
  (** Use the boundary between
  sentences, starting from the beginning of the current sentence and
  ending at the beginning of the next sentence *)
  | `SENTENCE
  (** Use the boundary between lines,
  starting from the beginning of the current line and ending at the
  beginning of the next line *)
  | `LINE
  (** Use the boundary between
  paragraphs, starting from the beginning of the current paragraph and
  ending at the beginning of the next paragraph *)
  | `PARAGRAPH
]

(* AccessibleTristate - enumeration *)
type accessibletristate = [
  (** The state is `false` *)
  | `FALSE
  (** The state is `true` *)
  | `TRUE
  (** The state is `mixed` *)
  | `MIXED
]

(* Align - enumeration *)
type align = [
  (** stretch to fill all space if possible, center if
  no meaningful way to stretch *)
  | `FILL
  (** snap to left or top side, leaving space on right or bottom *)
  | `START
  (** snap to right or bottom side, leaving space on left or top *)
  | `END
  (** center natural width of widget inside the allocation *)
  | `CENTER
  (** a different name for `GTK_ALIGN_BASELINE`. *)
  | `BASELINE_FILL
  (** align the widget according to the baseline. *)
  | `BASELINE
  (** stretch to fill all space, but align the baseline. *)
  | `BASELINE_CENTER
]

(* ArrowType - enumeration *)
type arrowtype = [
  (** Represents an upward pointing arrow. *)
  | `UP
  (** Represents a downward pointing arrow. *)
  | `DOWN
  (** Represents a left pointing arrow. *)
  | `LEFT
  (** Represents a right pointing arrow. *)
  | `RIGHT
  (** No arrow. *)
  | `NONE
]

(* AssistantPageType - enumeration *)
type assistantpagetype = [
  (** The page has regular contents. Both the
 Back and forward buttons will be shown. *)
  | `CONTENT
  (** The page contains an introduction to the
 assistant task. Only the Forward button will be shown if there is a
  next page. *)
  | `INTRO
  (** The page lets the user confirm or deny the
 changes. The Back and Apply buttons will be shown. *)
  | `CONFIRM
  (** The page informs the user of the changes
 done. Only the Close button will be shown. *)
  | `SUMMARY
  (** Used for tasks that take a long time to
 complete, blocks the assistant until the page is marked as complete.
  Only the back button will be shown. *)
  | `PROGRESS
  (** Used for when other page types are not
 appropriate. No buttons will be shown, and the application must
 add its own buttons through gtk_assistant_add_action_widget(). *)
  | `CUSTOM
]

(* BaselinePosition - enumeration *)
type baselineposition = [
  (** Align the baseline at the top *)
  | `TOP
  (** Center the baseline *)
  | `CENTER
  (** Align the baseline at the bottom *)
  | `BOTTOM
]

(* BorderStyle - enumeration *)
type borderstyle = [
  (** No visible border *)
  | `NONE
  (** Same as %GTK_BORDER_STYLE_NONE *)
  | `HIDDEN
  (** A single line segment *)
  | `SOLID
  (** Looks as if the content is sunken into the canvas *)
  | `INSET
  (** Looks as if the content is coming out of the canvas *)
  | `OUTSET
  (** A series of round dots *)
  | `DOTTED
  (** A series of square-ended dashes *)
  | `DASHED
  (** Two parallel lines with some space between them *)
  | `DOUBLE
  (** Looks as if it were carved in the canvas *)
  | `GROOVE
  (** Looks as if it were coming out of the canvas *)
  | `RIDGE
]

(* BuilderError - enumeration *)
type buildererror = [
  (** A type-func attribute didn’t name
 a function that returns a `GType`. *)
  | `INVALID_TYPE_FUNCTION
  (** The input contained a tag that `GtkBuilder`
 can’t handle. *)
  | `UNHANDLED_TAG
  (** An attribute that is required by
 `GtkBuilder` was missing. *)
  | `MISSING_ATTRIBUTE
  (** `GtkBuilder` found an attribute that
 it doesn’t understand. *)
  | `INVALID_ATTRIBUTE
  (** `GtkBuilder` found a tag that
 it doesn’t understand. *)
  | `INVALID_TAG
  (** A required property value was
 missing. *)
  | `MISSING_PROPERTY_VALUE
  (** `GtkBuilder` couldn’t parse
 some attribute value. *)
  | `INVALID_VALUE
  (** The input file requires a newer version
 of GTK. *)
  | `VERSION_MISMATCH
  (** An object id occurred twice. *)
  | `DUPLICATE_ID
  (** A specified object type is of the same type or
 derived from the type of the composite class being extended with builder XML. *)
  | `OBJECT_TYPE_REFUSED
  (** The wrong type was specified in a composite class’s template XML *)
  | `TEMPLATE_MISMATCH
  (** The specified property is unknown for the object class. *)
  | `INVALID_PROPERTY
  (** The specified signal is unknown for the object class. *)
  | `INVALID_SIGNAL
  (** An object id is unknown. *)
  | `INVALID_ID
  (** A function could not be found. This often happens
  when symbols are set to be kept private. Compiling code with -rdynamic or using the
  `gmodule-export-2.0` pkgconfig module can fix this problem. *)
  | `INVALID_FUNCTION
]

(* ButtonsType - enumeration *)
type buttonstype = [
  (** no buttons at all *)
  | `NONE
  (** an OK button *)
  | `OK
  (** a Close button *)
  | `CLOSE
  (** a Cancel button *)
  | `CANCEL
  (** Yes and No buttons *)
  | `YES_NO
  (** OK and Cancel buttons *)
  | `OK_CANCEL
]

(* CellRendererAccelMode - enumeration *)
type cellrendereraccelmode = [
  (** GTK accelerators mode *)
  | `GTK
  (** Other accelerator mode *)
  | `OTHER
]

(* CellRendererMode - enumeration *)
type cellrenderermode = [
  (** The cell is just for display
 and cannot be interacted with.  Note that this doesn’t mean that eg. the
 row being drawn can’t be selected -- just that a particular element of
 it cannot be individually modified. *)
  | `INERT
  (** The cell can be clicked. *)
  | `ACTIVATABLE
  (** The cell can be edited or otherwise modified. *)
  | `EDITABLE
]

(* Collation - enumeration *)
type collation = [
  (** Don't do any collation *)
  | `NONE
  (** Use [func@GLib.utf8_collate_key] *)
  | `UNICODE
  (** Use [func@GLib.utf8_collate_key_for_filename] *)
  | `FILENAME
]

(* ConstraintAttribute - enumeration *)
type constraintattribute = [
  (** No attribute, used for constant
  relations *)
  | `NONE
  (** The left edge of a widget, regardless of
  text direction *)
  | `LEFT
  (** The right edge of a widget, regardless
  of text direction *)
  | `RIGHT
  (** The top edge of a widget *)
  | `TOP
  (** The bottom edge of a widget *)
  | `BOTTOM
  (** The leading edge of a widget, depending
  on text direction; equivalent to %GTK_CONSTRAINT_ATTRIBUTE_LEFT for LTR
  languages, and %GTK_CONSTRAINT_ATTRIBUTE_RIGHT for RTL ones *)
  | `START
  (** The trailing edge of a widget, depending
  on text direction; equivalent to %GTK_CONSTRAINT_ATTRIBUTE_RIGHT for LTR
  languages, and %GTK_CONSTRAINT_ATTRIBUTE_LEFT for RTL ones *)
  | `END
  (** The width of a widget *)
  | `WIDTH
  (** The height of a widget *)
  | `HEIGHT
  (** The center of a widget, on the
  horizontal axis *)
  | `CENTER_X
  (** The center of a widget, on the
  vertical axis *)
  | `CENTER_Y
  (** The baseline of a widget *)
  | `BASELINE
]

(* ConstraintRelation - enumeration *)
type constraintrelation = [
  (** Less than, or equal *)
  | `LE
  (** Equal *)
  | `EQ
  (** Greater than, or equal *)
  | `GE
]

(* ConstraintStrength - enumeration *)
type constraintstrength = [
  (** The constraint is required towards solving the layout *)
  | `REQUIRED
  (** A strong constraint *)
  | `STRONG
  (** A medium constraint *)
  | `MEDIUM
  (** A weak constraint *)
  | `WEAK
]

(* ConstraintVflParserError - enumeration *)
type constraintvflparsererror = [
  (** Invalid or unknown symbol *)
  | `SYMBOL
  (** Invalid or unknown attribute *)
  | `ATTRIBUTE
  (** Invalid or unknown view *)
  | `VIEW
  (** Invalid or unknown metric *)
  | `METRIC
  (** Invalid or unknown priority *)
  | `PRIORITY
  (** Invalid or unknown relation *)
  | `RELATION
]

(* ContentFit - enumeration *)
type contentfit = [
  (** Make the content fill the entire allocation,
  without taking its aspect ratio in consideration. The resulting
  content will appear as stretched if its aspect ratio is different
  from the allocation aspect ratio. *)
  | `FILL
  (** Scale the content to fit the allocation,
  while taking its aspect ratio in consideration. The resulting
  content will appear as letterboxed if its aspect ratio is different
  from the allocation aspect ratio. *)
  | `CONTAIN
  (** Cover the entire allocation, while taking
  the content aspect ratio in consideration. The resulting content
  will appear as clipped if its aspect ratio is different from the
  allocation aspect ratio. *)
  | `COVER
  (** The content is scaled down to fit the
  allocation, if needed, otherwise its original size is used. *)
  | `SCALE_DOWN
]

(* CornerType - enumeration *)
type cornertype = [
  (** Place the scrollbars on the right and bottom of the
  widget (default behaviour). *)
  | `TOP_LEFT
  (** Place the scrollbars on the top and right of the
  widget. *)
  | `BOTTOM_LEFT
  (** Place the scrollbars on the left and bottom of the
  widget. *)
  | `TOP_RIGHT
  (** Place the scrollbars on the top and left of the
  widget. *)
  | `BOTTOM_RIGHT
]

(* CssParserError - enumeration *)
type cssparsererror = [
  (** Unknown failure. *)
  | `FAILED
  (** The given text does not form valid syntax *)
  | `SYNTAX
  (** Failed to import a resource *)
  | `IMPORT
  (** The given name has not been defined *)
  | `NAME
  (** The given value is not correct *)
  | `UNKNOWN_VALUE
]

(* CssParserWarning - enumeration *)
type cssparserwarning = [
  (** The given construct is
  deprecated and will be removed in a future version *)
  | `DEPRECATED
  (** A syntax construct was used
  that should be avoided *)
  | `SYNTAX
  (** A feature is not implemented *)
  | `UNIMPLEMENTED
]

(* DeleteType - enumeration *)
type deletetype = [
  (** Delete characters. *)
  | `CHARS
  (** Delete only the portion of the word to the
  left/right of cursor if we’re in the middle of a word. *)
  | `WORD_ENDS
  (** Delete words. *)
  | `WORDS
  (** Delete display-lines. Display-lines
  refers to the visible lines, with respect to the current line
  breaks. As opposed to paragraphs, which are defined by line
  breaks in the input. *)
  | `DISPLAY_LINES
  (** Delete only the portion of the
  display-line to the left/right of cursor. *)
  | `DISPLAY_LINE_ENDS
  (** Delete to the end of the
  paragraph. Like C-k in Emacs (or its reverse). *)
  | `PARAGRAPH_ENDS
  (** Delete entire line. Like C-k in pico. *)
  | `PARAGRAPHS
  (** Delete only whitespace. Like M-\ in Emacs. *)
  | `WHITESPACE
]

(* DialogError - enumeration *)
type dialogerror = [
  (** Generic error condition for when
  an operation fails and no more specific code is applicable *)
  | `FAILED
  (** The async function call was cancelled
  via its `GCancellable` *)
  | `CANCELLED
  (** The operation was cancelled
  by the user (via a Cancel or Close button) *)
  | `DISMISSED
]

(* DirectionType - enumeration *)
type directiontype = [
  (** Move forward. *)
  | `TAB_FORWARD
  (** Move backward. *)
  | `TAB_BACKWARD
  (** Move up. *)
  | `UP
  (** Move down. *)
  | `DOWN
  (** Move left. *)
  | `LEFT
  (** Move right. *)
  | `RIGHT
]

(* EditableProperties - enumeration *)
type editableproperties = [
  (** the property id for [property@Gtk.Editable:text] *)
  | `PROP_TEXT
  (** the property id for [property@Gtk.Editable:cursor-position] *)
  | `PROP_CURSOR_POSITION
  (** the property id for [property@Gtk.Editable:selection-bound] *)
  | `PROP_SELECTION_BOUND
  (** the property id for [property@Gtk.Editable:editable] *)
  | `PROP_EDITABLE
  (** the property id for [property@Gtk.Editable:width-chars] *)
  | `PROP_WIDTH_CHARS
  (** the property id for [property@Gtk.Editable:max-width-chars] *)
  | `PROP_MAX_WIDTH_CHARS
  (** the property id for [property@Gtk.Editable:xalign] *)
  | `PROP_XALIGN
  (** the property id for [property@Gtk.Editable:enable-undo] *)
  | `PROP_ENABLE_UNDO
  (** the number of properties *)
  | `NUM_PROPERTIES
]

(* EntryIconPosition - enumeration *)
type entryiconposition = [
  (** At the beginning of the entry (depending on the text direction). *)
  | `PRIMARY
  (** At the end of the entry (depending on the text direction). *)
  | `SECONDARY
]

(* EventSequenceState - enumeration *)
type eventsequencestate = [
  (** The sequence is handled, but not grabbed. *)
  | `NONE
  (** The sequence is handled and grabbed. *)
  | `CLAIMED
  (** The sequence is denied. *)
  | `DENIED
]

(* FileChooserAction - enumeration *)
type filechooseraction = [
  (** Indicates open mode.  The file chooser
 will only let the user pick an existing file. *)
  | `OPEN
  (** Indicates save mode.  The file chooser
 will let the user pick an existing file, or type in a new
 filename. *)
  | `SAVE
  (** Indicates an Open mode for
 selecting folders.  The file chooser will let the user pick an
 existing folder. *)
  | `SELECT_FOLDER
]

(* FileChooserError - enumeration *)
type filechoosererror = [
  (** Indicates that a file does not exist. *)
  | `NONEXISTENT
  (** Indicates a malformed filename. *)
  | `BAD_FILENAME
  (** Indicates a duplicate path (e.g. when
 adding a bookmark). *)
  | `ALREADY_EXISTS
  (** Indicates an incomplete hostname
 (e.g. "http://foo" without a slash after that). *)
  | `INCOMPLETE_HOSTNAME
]

(* FilterChange - enumeration *)
type filterchange = [
  (** The filter change cannot be
  described with any of the other enumeration values. *)
  | `DIFFERENT
  (** The filter is less strict than
  it was before: All items that it used to return %TRUE for
  still return %TRUE, others now may, too. *)
  | `LESS_STRICT
  (** The filter is more strict than
  it was before: All items that it used to return %FALSE for
  still return %FALSE, others now may, too. *)
  | `MORE_STRICT
]

(* FilterMatch - enumeration *)
type filtermatch = [
  (** The filter matches some items,
  gtk_filter_match() may return %TRUE or %FALSE *)
  | `SOME
  (** The filter does not match any item,
  gtk_filter_match() will always return %FALSE. *)
  | `NONE
  (** The filter matches all items,
  gtk_filter_match() will alays return %TRUE. *)
  | `ALL
]

(* FontLevel - enumeration *)
type fontlevel = [
  (** Select a font family *)
  | `FAMILY
  (** Select a font face (i.e. a family and a style) *)
  | `FACE
  (** Select a font (i.e. a face with a size, and possibly font variations) *)
  | `FONT
  (** Select a font and font features *)
  | `FEATURES
]

(* GraphicsOffloadEnabled - enumeration *)
type graphicsoffloadenabled = [
  (** Graphics offloading is enabled. *)
  | `ENABLED
  (** Graphics offloading is disabled. *)
  | `DISABLED
]

(* IconSize - enumeration *)
type iconsize = [
  (** Keep the size of the parent element *)
  | `INHERIT
  (** Size similar to text size *)
  | `NORMAL
  (** Large size, for example in an icon view *)
  | `LARGE
]

(* IconThemeError - enumeration *)
type iconthemeerror = [
  (** The icon specified does not exist in the theme *)
  | `NOT_FOUND
  (** An unspecified error occurred. *)
  | `FAILED
]

(* IconViewDropPosition - enumeration *)
type iconviewdropposition = [
  (** no drop possible *)
  | `NO_DROP
  (** dropped item replaces the item *)
  | `DROP_INTO
  (** dropped item is inserted to the left *)
  | `DROP_LEFT
  (** dropped item is inserted to the right *)
  | `DROP_RIGHT
  (** dropped item is inserted above *)
  | `DROP_ABOVE
  (** dropped item is inserted below *)
  | `DROP_BELOW
]

(* ImageType - enumeration *)
type imagetype = [
  (** there is no image displayed by the widget *)
  | `EMPTY
  (** the widget contains a named icon *)
  | `ICON_NAME
  (** the widget contains a `GIcon` *)
  | `GICON
  (** the widget contains a `GdkPaintable` *)
  | `PAINTABLE
]

(* InputPurpose - enumeration *)
type inputpurpose = [
  (** Allow any character *)
  | `FREE_FORM
  (** Allow only alphabetic characters *)
  | `ALPHA
  (** Allow only digits *)
  | `DIGITS
  (** Edited field expects numbers *)
  | `NUMBER
  (** Edited field expects phone number *)
  | `PHONE
  (** Edited field expects URL *)
  | `URL
  (** Edited field expects email address *)
  | `EMAIL
  (** Edited field expects the name of a person *)
  | `NAME
  (** Like %GTK_INPUT_PURPOSE_FREE_FORM, but characters are hidden *)
  | `PASSWORD
  (** Like %GTK_INPUT_PURPOSE_DIGITS, but characters are hidden *)
  | `PIN
  (** Allow any character, in addition to control codes *)
  | `TERMINAL
]

(* InscriptionOverflow - enumeration *)
type inscriptionoverflow = [
  (** Clip the remaining text *)
  | `CLIP
  (** Omit characters at the start of the text *)
  | `ELLIPSIZE_START
  (** Omit characters at the middle of the text *)
  | `ELLIPSIZE_MIDDLE
  (** Omit characters at the end of the text *)
  | `ELLIPSIZE_END
]

(* Justification - enumeration *)
type justification = [
  (** The text is placed at the left edge of the label. *)
  | `LEFT
  (** The text is placed at the right edge of the label. *)
  | `RIGHT
  (** The text is placed in the center of the label. *)
  | `CENTER
  (** The text is placed is distributed across the label. *)
  | `FILL
]

(* LevelBarMode - enumeration *)
type levelbarmode = [
  (** the bar has a continuous mode *)
  | `CONTINUOUS
  (** the bar has a discrete mode *)
  | `DISCRETE
]

(* ListTabBehavior - enumeration *)
type listtabbehavior = [
  (** Cycle through all focusable items of the list *)
  | `ALL
  (** Cycle through a single list element, then move
  focus out of the list. Moving focus between items needs to be
  done with the arrow keys. *)
  | `ITEM
  (** Cycle only through a single cell, then
  move focus out of the list. Moving focus between cells needs to
  be done with the arrow keys. This is only relevant for
  cell-based widgets like #GtkColumnView, otherwise it behaves
  like `GTK_LIST_TAB_ITEM`. *)
  | `CELL
]

(* MessageType - enumeration *)
type messagetype = [
  (** Informational message *)
  | `INFO
  (** Non-fatal warning message *)
  | `WARNING
  (** Question requiring a choice *)
  | `QUESTION
  (** Fatal error message *)
  | `ERROR
  (** None of the above *)
  | `OTHER
]

(* MovementStep - enumeration *)
type movementstep = [
  (** Move forward or back by graphemes *)
  | `LOGICAL_POSITIONS
  (** Move left or right by graphemes *)
  | `VISUAL_POSITIONS
  (** Move forward or back by words *)
  | `WORDS
  (** Move up or down lines (wrapped lines) *)
  | `DISPLAY_LINES
  (** Move to either end of a line *)
  | `DISPLAY_LINE_ENDS
  (** Move up or down paragraphs (newline-ended lines) *)
  | `PARAGRAPHS
  (** Move to either end of a paragraph *)
  | `PARAGRAPH_ENDS
  (** Move by pages *)
  | `PAGES
  (** Move to ends of the buffer *)
  | `BUFFER_ENDS
  (** Move horizontally by pages *)
  | `HORIZONTAL_PAGES
]

(* NaturalWrapMode - enumeration *)
type naturalwrapmode = [
  (** Inherit the minimum size request.
  In particular, this should be used with %PANGO_WRAP_CHAR. *)
  | `INHERIT
  (** Try not to wrap the text. This mode is the
  closest to GTK3's behavior but can lead to a wide label leaving
  lots of empty space below the text. *)
  | `NONE
  (** Attempt to wrap at word boundaries. This
  is useful in particular when using %PANGO_WRAP_WORD_CHAR as the
  wrap mode. *)
  | `WORD
]

(* NotebookTab - enumeration *)
type notebooktab = [
  (** the first tab in the notebook *)
  | `FIRST
  (** the last tab in the notebook *)
  | `LAST
]

(* NumberUpLayout - enumeration *)
type numberuplayout = [
  (** ![](layout-lrtb.png) *)
  | `LRTB
  (** ![](layout-lrbt.png) *)
  | `LRBT
  (** ![](layout-rltb.png) *)
  | `RLTB
  (** ![](layout-rlbt.png) *)
  | `RLBT
  (** ![](layout-tblr.png) *)
  | `TBLR
  (** ![](layout-tbrl.png) *)
  | `TBRL
  (** ![](layout-btlr.png) *)
  | `BTLR
  (** ![](layout-btrl.png) *)
  | `BTRL
]

(* Ordering - enumeration *)
type ordering = [
  (** the first value is smaller than the second *)
  | `SMALLER
  (** the two values are equal *)
  | `EQUAL
  (** the first value is larger than the second *)
  | `LARGER
]

(* Orientation - enumeration *)
type orientation = [
  (** The element is in horizontal orientation. *)
  | `HORIZONTAL
  (** The element is in vertical orientation. *)
  | `VERTICAL
]

(* Overflow - enumeration *)
type overflow = [
  (** No change is applied. Content is drawn at the specified
  position. *)
  | `VISIBLE
  (** Content is clipped to the bounds of the area. Content
  outside the area is not drawn and cannot be interacted with. *)
  | `HIDDEN
]

(* PackType - enumeration *)
type packtype = [
  (** The child is packed into the start of the widget *)
  | `START
  (** The child is packed into the end of the widget *)
  | `END
]

(* PadActionType - enumeration *)
type padactiontype = [
  (** Action is triggered by a pad button *)
  | `BUTTON
  (** Action is triggered by a pad ring *)
  | `RING
  (** Action is triggered by a pad strip *)
  | `STRIP
]

(* PageOrientation - enumeration *)
type pageorientation = [
  (** Portrait mode. *)
  | `PORTRAIT
  (** Landscape mode. *)
  | `LANDSCAPE
  (** Reverse portrait mode. *)
  | `REVERSE_PORTRAIT
  (** Reverse landscape mode. *)
  | `REVERSE_LANDSCAPE
]

(* PageSet - enumeration *)
type pageset = [
  (** All pages. *)
  | `ALL
  (** Even pages. *)
  | `EVEN
  (** Odd pages. *)
  | `ODD
]

(* PanDirection - enumeration *)
type pandirection = [
  (** panned towards the left *)
  | `LEFT
  (** panned towards the right *)
  | `RIGHT
  (** panned upwards *)
  | `UP
  (** panned downwards *)
  | `DOWN
]

(* PolicyType - enumeration *)
type policytype = [
  (** The scrollbar is always visible. The view size is
  independent of the content. *)
  | `ALWAYS
  (** The scrollbar will appear and disappear as necessary.
  For example, when all of a `GtkTreeView` can not be seen. *)
  | `AUTOMATIC
  (** The scrollbar should never appear. In this mode the
  content determines the size. *)
  | `NEVER
  (** Don't show a scrollbar, but don't force the
  size to follow the content. This can be used e.g. to make multiple
  scrolled windows share a scrollbar. *)
  | `EXTERNAL
]

(* PositionType - enumeration *)
type positiontype = [
  (** The feature is at the left edge. *)
  | `LEFT
  (** The feature is at the right edge. *)
  | `RIGHT
  (** The feature is at the top edge. *)
  | `TOP
  (** The feature is at the bottom edge. *)
  | `BOTTOM
]

(* PrintDuplex - enumeration *)
type printduplex = [
  (** No duplex. *)
  | `SIMPLEX
  (** Horizontal duplex. *)
  | `HORIZONTAL
  (** Vertical duplex. *)
  | `VERTICAL
]

(* PrintError - enumeration *)
type printerror = [
  (** An unspecified error occurred. *)
  | `GENERAL
  (** An internal error occurred. *)
  | `INTERNAL_ERROR
  (** A memory allocation failed. *)
  | `NOMEM
  (** An error occurred while loading a page setup
  or paper size from a key file. *)
  | `INVALID_FILE
]

(* PrintOperationAction - enumeration *)
type printoperationaction = [
  (** Show the print dialog. *)
  | `PRINT_DIALOG
  (** Start to print without showing
  the print dialog, based on the current print settings. *)
  | `PRINT
  (** Show the print preview. *)
  | `PREVIEW
  (** Export to a file. This requires
  the export-filename property to be set. *)
  | `EXPORT
]

(* PrintOperationResult - enumeration *)
type printoperationresult = [
  (** An error has occurred. *)
  | `ERROR
  (** The print settings should be stored. *)
  | `APPLY
  (** The print operation has been canceled,
  the print settings should not be stored. *)
  | `CANCEL
  (** The print operation is not complete
  yet. This value will only be returned when running asynchronously. *)
  | `IN_PROGRESS
]

(* PrintPages - enumeration *)
type printpages = [
  (** All pages. *)
  | `ALL
  (** Current page. *)
  | `CURRENT
  (** Range of pages. *)
  | `RANGES
  (** Selected pages. *)
  | `SELECTION
]

(* PrintQuality - enumeration *)
type printquality = [
  (** Low quality. *)
  | `LOW
  (** Normal quality. *)
  | `NORMAL
  (** High quality. *)
  | `HIGH
  (** Draft quality. *)
  | `DRAFT
]

(* PrintStatus - enumeration *)
type printstatus = [
  (** The printing has not started yet; this
  status is set initially, and while the print dialog is shown. *)
  | `INITIAL
  (** This status is set while the begin-print
  signal is emitted and during pagination. *)
  | `PREPARING
  (** This status is set while the
  pages are being rendered. *)
  | `GENERATING_DATA
  (** The print job is being sent off to the
  printer. *)
  | `SENDING_DATA
  (** The print job has been sent to the printer,
  but is not printed for some reason, e.g. the printer may be stopped. *)
  | `PENDING
  (** Some problem has occurred during
  printing, e.g. a paper jam. *)
  | `PENDING_ISSUE
  (** The printer is processing the print job. *)
  | `PRINTING
  (** The printing has been completed successfully. *)
  | `FINISHED
  (** The printing has been aborted. *)
  | `FINISHED_ABORTED
]

(* PropagationLimit - enumeration *)
type propagationlimit = [
  (** Events are handled regardless of what their
  target is. *)
  | `NONE
  (** Events are only handled if their target
  is in the same [iface@Native] as the event controllers widget. Note
  that some event types have two targets (origin and destination). *)
  | `SAME_NATIVE
]

(* PropagationPhase - enumeration *)
type propagationphase = [
  (** Events are not delivered. *)
  | `NONE
  (** Events are delivered in the capture phase. The
  capture phase happens before the bubble phase, runs from the toplevel down
  to the event widget. This option should only be used on containers that
  might possibly handle events before their children do. *)
  | `CAPTURE
  (** Events are delivered in the bubble phase. The bubble
  phase happens after the capture phase, and before the default handlers
  are run. This phase runs from the event widget, up to the toplevel. *)
  | `BUBBLE
  (** Events are delivered in the default widget event handlers,
  note that widget implementations must chain up on button, motion, touch and
  grab broken handlers for controllers in this phase to be run. *)
  | `TARGET
]

(* RecentManagerError - enumeration *)
type recentmanagererror = [
  (** the URI specified does not exists in
  the recently used resources list. *)
  | `NOT_FOUND
  (** the URI specified is not valid. *)
  | `INVALID_URI
  (** the supplied string is not
  UTF-8 encoded. *)
  | `INVALID_ENCODING
  (** no application has registered
  the specified item. *)
  | `NOT_REGISTERED
  (** failure while reading the recently used
  resources file. *)
  | `READ
  (** failure while writing the recently used
  resources file. *)
  | `WRITE
  (** unspecified error. *)
  | `UNKNOWN
]

(* ResponseType - enumeration *)
type responsetype = [
  (** Returned if an action widget has no response id,
  or if the dialog gets programmatically hidden or destroyed *)
  | `NONE
  (** Generic response id, not used by GTK dialogs *)
  | `REJECT
  (** Generic response id, not used by GTK dialogs *)
  | `ACCEPT
  (** Returned if the dialog is deleted *)
  | `DELETE_EVENT
  (** Returned by OK buttons in GTK dialogs *)
  | `OK
  (** Returned by Cancel buttons in GTK dialogs *)
  | `CANCEL
  (** Returned by Close buttons in GTK dialogs *)
  | `CLOSE
  (** Returned by Yes buttons in GTK dialogs *)
  | `YES
  (** Returned by No buttons in GTK dialogs *)
  | `NO
  (** Returned by Apply buttons in GTK dialogs *)
  | `APPLY
  (** Returned by Help buttons in GTK dialogs *)
  | `HELP
]

(* RevealerTransitionType - enumeration *)
type revealertransitiontype = [
  (** No transition *)
  | `NONE
  (** Fade in *)
  | `CROSSFADE
  (** Slide in from the left *)
  | `SLIDE_RIGHT
  (** Slide in from the right *)
  | `SLIDE_LEFT
  (** Slide in from the bottom *)
  | `SLIDE_UP
  (** Slide in from the top *)
  | `SLIDE_DOWN
  (** Floop in from the left *)
  | `SWING_RIGHT
  (** Floop in from the right *)
  | `SWING_LEFT
  (** Floop in from the bottom *)
  | `SWING_UP
  (** Floop in from the top *)
  | `SWING_DOWN
]

(* ScrollStep - enumeration *)
type scrollstep = [
  (** Scroll in steps. *)
  | `STEPS
  (** Scroll by pages. *)
  | `PAGES
  (** Scroll to ends. *)
  | `ENDS
  (** Scroll in horizontal steps. *)
  | `HORIZONTAL_STEPS
  (** Scroll by horizontal pages. *)
  | `HORIZONTAL_PAGES
  (** Scroll to the horizontal ends. *)
  | `HORIZONTAL_ENDS
]

(* ScrollType - enumeration *)
type scrolltype = [
  (** No scrolling. *)
  | `NONE
  (** Jump to new location. *)
  | `JUMP
  (** Step backward. *)
  | `STEP_BACKWARD
  (** Step forward. *)
  | `STEP_FORWARD
  (** Page backward. *)
  | `PAGE_BACKWARD
  (** Page forward. *)
  | `PAGE_FORWARD
  (** Step up. *)
  | `STEP_UP
  (** Step down. *)
  | `STEP_DOWN
  (** Page up. *)
  | `PAGE_UP
  (** Page down. *)
  | `PAGE_DOWN
  (** Step to the left. *)
  | `STEP_LEFT
  (** Step to the right. *)
  | `STEP_RIGHT
  (** Page to the left. *)
  | `PAGE_LEFT
  (** Page to the right. *)
  | `PAGE_RIGHT
  (** Scroll to start. *)
  | `START
  (** Scroll to end. *)
  | `END
]

(* ScrollablePolicy - enumeration *)
type scrollablepolicy = [
  (** Scrollable adjustments are based on the minimum size *)
  | `MINIMUM
  (** Scrollable adjustments are based on the natural size *)
  | `NATURAL
]

(* SelectionMode - enumeration *)
type selectionmode = [
  (** No selection is possible. *)
  | `NONE
  (** Zero or one element may be selected. *)
  | `SINGLE
  (** Exactly one element is selected.
  In some circumstances, such as initially or during a search
  operation, it’s possible for no element to be selected with
  %GTK_SELECTION_BROWSE. What is really enforced is that the user
  can’t deselect a currently selected element except by selecting
  another element. *)
  | `BROWSE
  (** Any number of elements may be selected.
  The Ctrl key may be used to enlarge the selection, and Shift
  key to select between the focus and the child pointed to.
  Some widgets may also allow Click-drag to select a range of elements. *)
  | `MULTIPLE
]

(* SensitivityType - enumeration *)
type sensitivitytype = [
  (** The control is made insensitive if no
  action can be triggered *)
  | `AUTO
  (** The control is always sensitive *)
  | `ON
  (** The control is always insensitive *)
  | `OFF
]

(* ShortcutScope - enumeration *)
type shortcutscope = [
  (** Shortcuts are handled inside
  the widget the controller belongs to. *)
  | `LOCAL
  (** Shortcuts are handled by
  the first ancestor that is a [iface@ShortcutManager] *)
  | `MANAGED
  (** Shortcuts are handled by
  the root widget. *)
  | `GLOBAL
]

(* ShortcutType - enumeration *)
type shortcuttype = [
  (** The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
  property will be used. *)
  | `ACCELERATOR
  (** The shortcut is a pinch gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_PINCH
  (** The shortcut is a stretch gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_STRETCH
  (** The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_ROTATE_CLOCKWISE
  (** The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_ROTATE_COUNTERCLOCKWISE
  (** The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_TWO_FINGER_SWIPE_LEFT
  (** The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_TWO_FINGER_SWIPE_RIGHT
  (** The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
  used. *)
  | `GESTURE
  (** The shortcut is a swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_SWIPE_LEFT
  (** The shortcut is a swipe gesture. GTK provides an icon and subtitle. *)
  | `GESTURE_SWIPE_RIGHT
]

(* SizeGroupMode - enumeration *)
type sizegroupmode = [
  (** group has no effect *)
  | `NONE
  (** group affects horizontal requisition *)
  | `HORIZONTAL
  (** group affects vertical requisition *)
  | `VERTICAL
  (** group affects both horizontal and vertical requisition *)
  | `BOTH
]

(* SizeRequestMode - enumeration *)
type sizerequestmode = [
  (** Prefer height-for-width geometry management *)
  | `HEIGHT_FOR_WIDTH
  (** Prefer width-for-height geometry management *)
  | `WIDTH_FOR_HEIGHT
  (** Don’t trade height-for-width or width-for-height *)
  | `CONSTANT_SIZE
]

(* SortType - enumeration *)
type sorttype = [
  (** Sorting is in ascending order. *)
  | `ASCENDING
  (** Sorting is in descending order. *)
  | `DESCENDING
]

(* SorterChange - enumeration *)
type sorterchange = [
  (** The sorter change cannot be described
  by any of the other enumeration values *)
  | `DIFFERENT
  (** The sort order was inverted. Comparisons
  that returned %GTK_ORDERING_SMALLER now return %GTK_ORDERING_LARGER
  and vice versa. Other comparisons return the same values as before. *)
  | `INVERTED
  (** The sorter is less strict: Comparisons
  may now return %GTK_ORDERING_EQUAL that did not do so before. *)
  | `LESS_STRICT
  (** The sorter is more strict: Comparisons
  that did return %GTK_ORDERING_EQUAL may not do so anymore. *)
  | `MORE_STRICT
]

(* SorterOrder - enumeration *)
type sorterorder = [
  (** A partial order. Any `GtkOrdering` is possible. *)
  | `PARTIAL
  (** No order, all elements are considered equal.
  gtk_sorter_compare() will only return %GTK_ORDERING_EQUAL. *)
  | `NONE
  (** A total order. gtk_sorter_compare() will only
  return %GTK_ORDERING_EQUAL if an item is compared with itself. Two
  different items will never cause this value to be returned. *)
  | `TOTAL
]

(* SpinButtonUpdatePolicy - enumeration *)
type spinbuttonupdatepolicy = [
  (** When refreshing your `GtkSpinButton`, the value is
  always displayed *)
  | `ALWAYS
  (** When refreshing your `GtkSpinButton`, the value is
  only displayed if it is valid within the bounds of the spin button's
  adjustment *)
  | `IF_VALID
]

(* SpinType - enumeration *)
type spintype = [
  (** Increment by the adjustments step increment. *)
  | `STEP_FORWARD
  (** Decrement by the adjustments step increment. *)
  | `STEP_BACKWARD
  (** Increment by the adjustments page increment. *)
  | `PAGE_FORWARD
  (** Decrement by the adjustments page increment. *)
  | `PAGE_BACKWARD
  (** Go to the adjustments lower bound. *)
  | `HOME
  (** Go to the adjustments upper bound. *)
  | `END
  (** Change by a specified amount. *)
  | `USER_DEFINED
]

(* StackTransitionType - enumeration *)
type stacktransitiontype = [
  (** No transition *)
  | `NONE
  (** A cross-fade *)
  | `CROSSFADE
  (** Slide from left to right *)
  | `SLIDE_RIGHT
  (** Slide from right to left *)
  | `SLIDE_LEFT
  (** Slide from bottom up *)
  | `SLIDE_UP
  (** Slide from top down *)
  | `SLIDE_DOWN
  (** Slide from left or right according to the children order *)
  | `SLIDE_LEFT_RIGHT
  (** Slide from top down or bottom up according to the order *)
  | `SLIDE_UP_DOWN
  (** Cover the old page by sliding up *)
  | `OVER_UP
  (** Cover the old page by sliding down *)
  | `OVER_DOWN
  (** Cover the old page by sliding to the left *)
  | `OVER_LEFT
  (** Cover the old page by sliding to the right *)
  | `OVER_RIGHT
  (** Uncover the new page by sliding up *)
  | `UNDER_UP
  (** Uncover the new page by sliding down *)
  | `UNDER_DOWN
  (** Uncover the new page by sliding to the left *)
  | `UNDER_LEFT
  (** Uncover the new page by sliding to the right *)
  | `UNDER_RIGHT
  (** Cover the old page sliding up or uncover the new page sliding down, according to order *)
  | `OVER_UP_DOWN
  (** Cover the old page sliding down or uncover the new page sliding up, according to order *)
  | `OVER_DOWN_UP
  (** Cover the old page sliding left or uncover the new page sliding right, according to order *)
  | `OVER_LEFT_RIGHT
  (** Cover the old page sliding right or uncover the new page sliding left, according to order *)
  | `OVER_RIGHT_LEFT
  (** Pretend the pages are sides of a cube and rotate that cube to the left *)
  | `ROTATE_LEFT
  (** Pretend the pages are sides of a cube and rotate that cube to the right *)
  | `ROTATE_RIGHT
  (** Pretend the pages are sides of a cube and rotate that cube to the left or right according to the children order *)
  | `ROTATE_LEFT_RIGHT
]

(* StringFilterMatchMode - enumeration *)
type stringfiltermatchmode = [
  (** The search string and
  text must match exactly. *)
  | `EXACT
  (** The search string
  must be contained as a substring inside the text. *)
  | `SUBSTRING
  (** The text must begin
  with the search string. *)
  | `PREFIX
]

(* SymbolicColor - enumeration *)
type symboliccolor = [
  (** The default foreground color *)
  | `FOREGROUND
  (** Indication color for errors *)
  | `ERROR
  (** Indication color for warnings *)
  | `WARNING
  (** Indication color for success *)
  | `SUCCESS
]

(* SystemSetting - enumeration *)
type systemsetting = [
  (** the [property@Gtk.Settings:gtk-xft-dpi] setting has changed *)
  | `DPI
  (** The [property@Gtk.Settings:gtk-font-name] setting has changed *)
  | `FONT_NAME
  (** The font configuration has changed in a way that
  requires text to be redrawn. This can be any of the
  [property@Gtk.Settings:gtk-xft-antialias],
  [property@Gtk.Settings:gtk-xft-hinting],
  [property@Gtk.Settings:gtk-xft-hintstyle],
  [property@Gtk.Settings:gtk-xft-rgba] or
  [property@Gtk.Settings:gtk-fontconfig-timestamp] settings *)
  | `FONT_CONFIG
  (** The display has changed *)
  | `DISPLAY
  (** The icon theme has changed in a way that requires
  icons to be looked up again *)
  | `ICON_THEME
]

(* TextDirection - enumeration *)
type textdirection = [
  (** No direction. *)
  | `NONE
  (** Left to right text direction. *)
  | `LTR
  (** Right to left text direction. *)
  | `RTL
]

(* TextExtendSelection - enumeration *)
type textextendselection = [
  (** Selects the current word. It is triggered by
  a double-click for example. *)
  | `WORD
  (** Selects the current line. It is triggered by
  a triple-click for example. *)
  | `LINE
]

(* TextViewLayer - enumeration *)
type textviewlayer = [
  (** The layer rendered below the text (but above the background). *)
  | `BELOW_TEXT
  (** The layer rendered above the text. *)
  | `ABOVE_TEXT
]

(* TextWindowType - enumeration *)
type textwindowtype = [
  (** Window that floats over scrolling areas. *)
  | `WIDGET
  (** Scrollable text window. *)
  | `TEXT
  (** Left side border window. *)
  | `LEFT
  (** Right side border window. *)
  | `RIGHT
  (** Top border window. *)
  | `TOP
  (** Bottom border window. *)
  | `BOTTOM
]

(* TreeViewColumnSizing - enumeration *)
type treeviewcolumnsizing = [
  (** Columns only get bigger in reaction to changes in the model *)
  | `GROW_ONLY
  (** Columns resize to be the optimal size every time the model changes. *)
  | `AUTOSIZE
  (** Columns are a fixed numbers of pixels wide. *)
  | `FIXED
]

(* TreeViewDropPosition - enumeration *)
type treeviewdropposition = [
  (** dropped row is inserted before *)
  | `BEFORE
  (** dropped row is inserted after *)
  | `AFTER
  (** dropped row becomes a child or is inserted before *)
  | `INTO_OR_BEFORE
  (** dropped row becomes a child or is inserted after *)
  | `INTO_OR_AFTER
]

(* TreeViewGridLines - enumeration *)
type treeviewgridlines = [
  (** No grid lines. *)
  | `NONE
  (** Horizontal grid lines. *)
  | `HORIZONTAL
  (** Vertical grid lines. *)
  | `VERTICAL
  (** Horizontal and vertical grid lines. *)
  | `BOTH
]

(* Unit - enumeration *)
type unit = [
  (** No units. *)
  | `NONE
  (** Dimensions in points. *)
  | `POINTS
  (** Dimensions in inches. *)
  | `INCH
  (** Dimensions in millimeters *)
  | `MM
]

(* WrapMode - enumeration *)
type wrapmode = [
  (** do not wrap lines; just make the text area wider *)
  | `NONE
  (** wrap text, breaking lines anywhere the cursor can
  appear (between characters, usually - if you want to be technical,
  between graphemes, see pango_get_log_attrs()) *)
  | `CHAR
  (** wrap text, breaking lines in between words *)
  | `WORD
  (** wrap text, breaking lines in between words, or if
  that is not enough, also between graphemes *)
  | `WORD_CHAR
]

(* ApplicationInhibitFlags - bitfield/flags *)
type applicationinhibitflags_flag = [
  (** Inhibit ending the user session
  by logging out or by shutting down the computer *)
  | `LOGOUT
  (** Inhibit user switching *)
  | `SWITCH
  (** Inhibit suspending the
  session or computer *)
  | `SUSPEND
  (** Inhibit the session being
  marked as idle (and possibly locked) *)
  | `IDLE
]

type applicationinhibitflags = applicationinhibitflags_flag list

(* BuilderClosureFlags - bitfield/flags *)
type builderclosureflags_flag = [
  (** The closure should be created swapped. See
  g_cclosure_new_swap() for details. *)
  | `SWAPPED
]

type builderclosureflags = builderclosureflags_flag list

(* CellRendererState - bitfield/flags *)
type cellrendererstate_flag = [
  (** The cell is currently selected, and
 probably has a selection colored background to render to. *)
  | `SELECTED
  (** The mouse is hovering over the cell. *)
  | `PRELIT
  (** The cell is drawn in an insensitive manner *)
  | `INSENSITIVE
  (** The cell is in a sorted row *)
  | `SORTED
  (** The cell is in the focus row. *)
  | `FOCUSED
  (** The cell is in a row that can be expanded *)
  | `EXPANDABLE
  (** The cell is in a row that is expanded *)
  | `EXPANDED
]

type cellrendererstate = cellrendererstate_flag list

(* DebugFlags - bitfield/flags *)
type debugflags_flag = [
  (** Information about GtkTextView *)
  | `TEXT
  (** Information about GtkTreeView *)
  | `TREE
  (** Information about keyboard shortcuts *)
  | `KEYBINDINGS
  (** Information about modules and extensions *)
  | `MODULES
  (** Information about size allocation *)
  | `GEOMETRY
  (** Information about icon themes *)
  | `ICONTHEME
  (** Information about printing *)
  | `PRINTING
  (** Trace GtkBuilder operation *)
  | `BUILDER
  (** Information about size requests *)
  | `SIZE_REQUEST
  (** Disable the style property cache *)
  | `NO_CSS_CACHE
  (** Open the GTK inspector *)
  | `INTERACTIVE
  (** Information about actions and menu models *)
  | `ACTIONS
  (** Information from layout managers *)
  | `LAYOUT
  (** Include debug render nodes in the generated snapshots *)
  | `SNAPSHOT
  (** Information from the constraints solver *)
  | `CONSTRAINTS
  (** Log unused GtkBuilder objects *)
  | `BUILDER_OBJECTS
  (** Information about accessibility state changes *)
  | `A11Y
  (** Information about icon fallback. *)
  | `ICONFALLBACK
  (** Inverts the default text-direction. *)
  | `INVERT_TEXT_DIR
]

type debugflags = debugflags_flag list

(* DialogFlags - bitfield/flags *)
type dialogflags_flag = [
  (** Make the constructed dialog modal *)
  | `MODAL
  (** Destroy the dialog when its parent is destroyed *)
  | `DESTROY_WITH_PARENT
  (** Create dialog with actions in header
  bar instead of action area *)
  | `USE_HEADER_BAR
]

type dialogflags = dialogflags_flag list

(* EventControllerScrollFlags - bitfield/flags *)
type eventcontrollerscrollflags_flag = [
  (** Don't emit scroll. *)
  | `NONE
  (** Emit scroll with vertical deltas. *)
  | `VERTICAL
  (** Emit scroll with horizontal deltas. *)
  | `HORIZONTAL
  (** Only emit deltas that are multiples of 1. *)
  | `DISCRETE
  (** Emit ::decelerate after continuous scroll finishes. *)
  | `KINETIC
  (** Emit scroll on both axes. *)
  | `BOTH_AXES
]

type eventcontrollerscrollflags = eventcontrollerscrollflags_flag list

(* FontChooserLevel - bitfield/flags *)
type fontchooserlevel_flag = [
  (** Allow selecting a font family *)
  | `FAMILY
  (** Allow selecting a specific font face *)
  | `STYLE
  (** Allow selecting a specific font size *)
  | `SIZE
  (** Allow changing OpenType font variation axes *)
  | `VARIATIONS
  (** Allow selecting specific OpenType font features *)
  | `FEATURES
]

type fontchooserlevel = fontchooserlevel_flag list

(* IconLookupFlags - bitfield/flags *)
type iconlookupflags_flag = [
  (** Try to always load regular icons, even
  when symbolic icon names are given *)
  | `FORCE_REGULAR
  (** Try to always load symbolic icons, even
  when regular icon names are given *)
  | `FORCE_SYMBOLIC
  (** Starts loading the texture in the background
  so it is ready when later needed. *)
  | `PRELOAD
]

type iconlookupflags = iconlookupflags_flag list

(* InputHints - bitfield/flags *)
type inputhints_flag = [
  (** No special behaviour suggested *)
  | `NONE
  (** Suggest checking for typos *)
  | `SPELLCHECK
  (** Suggest not checking for typos *)
  | `NO_SPELLCHECK
  (** Suggest word completion *)
  | `WORD_COMPLETION
  (** Suggest to convert all text to lowercase *)
  | `LOWERCASE
  (** Suggest to capitalize all text *)
  | `UPPERCASE_CHARS
  (** Suggest to capitalize the first
  character of each word *)
  | `UPPERCASE_WORDS
  (** Suggest to capitalize the
  first word of each sentence *)
  | `UPPERCASE_SENTENCES
  (** Suggest to not show an onscreen keyboard
  (e.g for a calculator that already has all the keys). *)
  | `INHIBIT_OSK
  (** The text is vertical *)
  | `VERTICAL_WRITING
  (** Suggest offering Emoji support *)
  | `EMOJI
  (** Suggest not offering Emoji support *)
  | `NO_EMOJI
  (** Request that the input method should not
   update personalized data (like typing history) *)
  | `PRIVATE
]

type inputhints = inputhints_flag list

(* ListScrollFlags - bitfield/flags *)
type listscrollflags_flag = [
  (** Don't do anything extra *)
  | `NONE
  (** Focus the target item *)
  | `FOCUS
  (** Select the target item and
  unselect all other items. *)
  | `SELECT
]

type listscrollflags = listscrollflags_flag list

(* PickFlags - bitfield/flags *)
type pickflags_flag = [
  (** The default behavior, include widgets that are receiving events *)
  | `DEFAULT
  (** Include widgets that are insensitive *)
  | `INSENSITIVE
  (** Include widgets that are marked as non-targetable. See [property@Widget:can-target] *)
  | `NON_TARGETABLE
]

type pickflags = pickflags_flag list

(* PopoverMenuFlags - bitfield/flags *)
type popovermenuflags_flag = [
  (** Submenus are presented as sliding submenus that replace the main menu. *)
  | `SLIDING
  (** Submenus are presented as traditional, nested
  popovers. *)
  | `NESTED
]

type popovermenuflags = popovermenuflags_flag list

(* ShortcutActionFlags - bitfield/flags *)
type shortcutactionflags_flag = [
  (** The action is the only
  action that can be activated. If this flag is not set,
  a future activation may select a different action. *)
  | `EXCLUSIVE
]

type shortcutactionflags = shortcutactionflags_flag list

(* StateFlags - bitfield/flags *)
type stateflags_flag = [
  (** State during normal operation *)
  | `NORMAL
  (** Widget is active *)
  | `ACTIVE
  (** Widget has a mouse pointer over it *)
  | `PRELIGHT
  (** Widget is selected *)
  | `SELECTED
  (** Widget is insensitive *)
  | `INSENSITIVE
  (** Widget is inconsistent *)
  | `INCONSISTENT
  (** Widget has the keyboard focus *)
  | `FOCUSED
  (** Widget is in a background toplevel window *)
  | `BACKDROP
  (** Widget is in left-to-right text direction *)
  | `DIR_LTR
  (** Widget is in right-to-left text direction *)
  | `DIR_RTL
  (** Widget is a link *)
  | `LINK
  (** The location the widget points to has already been visited *)
  | `VISITED
  (** Widget is checked *)
  | `CHECKED
  (** Widget is highlighted as a drop target for DND *)
  | `DROP_ACTIVE
  (** Widget has the visible focus *)
  | `FOCUS_VISIBLE
  (** Widget contains the keyboard focus *)
  | `FOCUS_WITHIN
]

type stateflags = stateflags_flag list

(* StyleContextPrintFlags - bitfield/flags *)
type stylecontextprintflags_flag = [
  (** Default value. *)
  | `NONE
  (** Print the entire tree of
  CSS nodes starting at the style context's node *)
  | `RECURSE
  (** Show the values of the
  CSS properties for each node *)
  | `SHOW_STYLE
  (** Show information about
  what changes affect the styles *)
  | `SHOW_CHANGE
]

type stylecontextprintflags = stylecontextprintflags_flag list

(* TextSearchFlags - bitfield/flags *)
type textsearchflags_flag = [
  (** Search only visible data. A search match may
have invisible text interspersed. *)
  | `VISIBLE_ONLY
  (** Search only text. A match may have paintables or
child widgets mixed inside the matched range. *)
  | `TEXT_ONLY
  (** The text will be matched regardless of
what case it is in. *)
  | `CASE_INSENSITIVE
]

type textsearchflags = textsearchflags_flag list

(* TreeModelFlags - bitfield/flags *)
type treemodelflags_flag = [
  (** iterators survive all signals
  emitted by the tree *)
  | `ITERS_PERSIST
  (** the model is a list only, and never
  has children *)
  | `LIST_ONLY
]

type treemodelflags = treemodelflags_flag list

