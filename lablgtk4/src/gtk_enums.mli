(* GENERATED CODE - DO NOT EDIT *)
(* GTK4 Enumeration and Bitfield Types *)

(* AccessibleAnnouncementPriority - enumeration *)
type accessibleannouncementpriority = [
  | `LOW
  | `MEDIUM
  | `HIGH
]

(* AccessibleAutocomplete - enumeration *)
type accessibleautocomplete = [
  | `NONE
  | `INLINE
  | `LIST
  | `BOTH
]

(* AccessibleInvalidState - enumeration *)
type accessibleinvalidstate = [
  | `FALSE
  | `TRUE
  | `GRAMMAR
  | `SPELLING
]

(* AccessiblePlatformState - enumeration *)
type accessibleplatformstate = [
  | `FOCUSABLE
  | `FOCUSED
  | `ACTIVE
]

(* AccessibleProperty - enumeration *)
type accessibleproperty = [
  | `AUTOCOMPLETE
  | `DESCRIPTION
  | `HAS_POPUP
  | `KEY_SHORTCUTS
  | `LABEL
  | `LEVEL
  | `MODAL
  | `MULTI_LINE
  | `MULTI_SELECTABLE
  | `ORIENTATION
  | `PLACEHOLDER
  | `READ_ONLY
  | `REQUIRED
  | `ROLE_DESCRIPTION
  | `SORT
  | `VALUE_MAX
  | `VALUE_MIN
  | `VALUE_NOW
  | `VALUE_TEXT
]

(* AccessibleRelation - enumeration *)
type accessiblerelation = [
  | `ACTIVE_DESCENDANT
  | `COL_COUNT
  | `COL_INDEX
  | `COL_INDEX_TEXT
  | `COL_SPAN
  | `CONTROLS
  | `DESCRIBED_BY
  | `DETAILS
  | `ERROR_MESSAGE
  | `FLOW_TO
  | `LABELLED_BY
  | `OWNS
  | `POS_IN_SET
  | `ROW_COUNT
  | `ROW_INDEX
  | `ROW_INDEX_TEXT
  | `ROW_SPAN
  | `SET_SIZE
]

(* AccessibleRole - enumeration *)
type accessiblerole = [
  | `ALERT
  | `ALERT_DIALOG
  | `BANNER
  | `BUTTON
  | `CAPTION
  | `CELL
  | `CHECKBOX
  | `COLUMN_HEADER
  | `COMBO_BOX
  | `COMMAND
  | `COMPOSITE
  | `DIALOG
  | `DOCUMENT
  | `FEED
  | `FORM
  | `GENERIC
  | `GRID
  | `GRID_CELL
  | `GROUP
  | `HEADING
  | `IMG
  | `INPUT
  | `LABEL
  | `LANDMARK
  | `LEGEND
  | `LINK
  | `LIST
  | `LIST_BOX
  | `LIST_ITEM
  | `LOG
  | `MAIN
  | `MARQUEE
  | `MATH
  | `METER
  | `MENU
  | `MENU_BAR
  | `MENU_ITEM
  | `MENU_ITEM_CHECKBOX
  | `MENU_ITEM_RADIO
  | `NAVIGATION
  | `NONE
  | `NOTE
  | `OPTION
  | `PRESENTATION
  | `PROGRESS_BAR
  | `RADIO
  | `RADIO_GROUP
  | `RANGE
  | `REGION
  | `ROW
  | `ROW_GROUP
  | `ROW_HEADER
  | `SCROLLBAR
  | `SEARCH
  | `SEARCH_BOX
  | `SECTION
  | `SECTION_HEAD
  | `SELECT
  | `SEPARATOR
  | `SLIDER
  | `SPIN_BUTTON
  | `STATUS
  | `STRUCTURE
  | `SWITCH
  | `TAB
  | `TABLE
  | `TAB_LIST
  | `TAB_PANEL
  | `TEXT_BOX
  | `TIME
  | `TIMER
  | `TOOLBAR
  | `TOOLTIP
  | `TREE
  | `TREE_GRID
  | `TREE_ITEM
  | `WIDGET
  | `WINDOW
  | `TOGGLE_BUTTON
  | `APPLICATION
  | `PARAGRAPH
  | `BLOCK_QUOTE
  | `ARTICLE
  | `COMMENT
  | `TERMINAL
]

(* AccessibleSort - enumeration *)
type accessiblesort = [
  | `NONE
  | `ASCENDING
  | `DESCENDING
  | `OTHER
]

(* AccessibleState - enumeration *)
type accessiblestate = [
  | `BUSY
  | `CHECKED
  | `DISABLED
  | `EXPANDED
  | `HIDDEN
  | `INVALID
  | `PRESSED
  | `SELECTED
  | `VISITED
]

(* AccessibleTextContentChange - enumeration *)
type accessibletextcontentchange = [
  | `INSERT
  | `REMOVE
]

(* AccessibleTextGranularity - enumeration *)
type accessibletextgranularity = [
  | `CHARACTER
  | `WORD
  | `SENTENCE
  | `LINE
  | `PARAGRAPH
]

(* AccessibleTristate - enumeration *)
type accessibletristate = [
  | `FALSE
  | `TRUE
  | `MIXED
]

(* Align - enumeration *)
type align = [
  | `FILL
  | `START
  | `END
  | `CENTER
  | `BASELINE_FILL
  | `BASELINE
  | `BASELINE_CENTER
]

(* ArrowType - enumeration *)
type arrowtype = [
  | `UP
  | `DOWN
  | `LEFT
  | `RIGHT
  | `NONE
]

(* AssistantPageType - enumeration *)
type assistantpagetype = [
  | `CONTENT
  | `INTRO
  | `CONFIRM
  | `SUMMARY
  | `PROGRESS
  | `CUSTOM
]

(* BaselinePosition - enumeration *)
type baselineposition = [
  | `TOP
  | `CENTER
  | `BOTTOM
]

(* BorderStyle - enumeration *)
type borderstyle = [
  | `NONE
  | `HIDDEN
  | `SOLID
  | `INSET
  | `OUTSET
  | `DOTTED
  | `DASHED
  | `DOUBLE
  | `GROOVE
  | `RIDGE
]

(* BuilderError - enumeration *)
type buildererror = [
  | `INVALID_TYPE_FUNCTION
  | `UNHANDLED_TAG
  | `MISSING_ATTRIBUTE
  | `INVALID_ATTRIBUTE
  | `INVALID_TAG
  | `MISSING_PROPERTY_VALUE
  | `INVALID_VALUE
  | `VERSION_MISMATCH
  | `DUPLICATE_ID
  | `OBJECT_TYPE_REFUSED
  | `TEMPLATE_MISMATCH
  | `INVALID_PROPERTY
  | `INVALID_SIGNAL
  | `INVALID_ID
  | `INVALID_FUNCTION
]

(* ButtonsType - enumeration *)
type buttonstype = [
  | `NONE
  | `OK
  | `CLOSE
  | `CANCEL
  | `YES_NO
  | `OK_CANCEL
]

(* CellRendererAccelMode - enumeration *)
type cellrendereraccelmode = [
  | `GTK
  | `OTHER
]

(* CellRendererMode - enumeration *)
type cellrenderermode = [
  | `INERT
  | `ACTIVATABLE
  | `EDITABLE
]

(* Collation - enumeration *)
type collation = [
  | `NONE
  | `UNICODE
  | `FILENAME
]

(* ConstraintAttribute - enumeration *)
type constraintattribute = [
  | `NONE
  | `LEFT
  | `RIGHT
  | `TOP
  | `BOTTOM
  | `START
  | `END
  | `WIDTH
  | `HEIGHT
  | `CENTER_X
  | `CENTER_Y
  | `BASELINE
]

(* ConstraintRelation - enumeration *)
type constraintrelation = [
  | `LE
  | `EQ
  | `GE
]

(* ConstraintStrength - enumeration *)
type constraintstrength = [
  | `REQUIRED
  | `STRONG
  | `MEDIUM
  | `WEAK
]

(* ConstraintVflParserError - enumeration *)
type constraintvflparsererror = [
  | `SYMBOL
  | `ATTRIBUTE
  | `VIEW
  | `METRIC
  | `PRIORITY
  | `RELATION
]

(* ContentFit - enumeration *)
type contentfit = [
  | `FILL
  | `CONTAIN
  | `COVER
  | `SCALE_DOWN
]

(* CornerType - enumeration *)
type cornertype = [
  | `TOP_LEFT
  | `BOTTOM_LEFT
  | `TOP_RIGHT
  | `BOTTOM_RIGHT
]

(* CssParserError - enumeration *)
type cssparsererror = [
  | `FAILED
  | `SYNTAX
  | `IMPORT
  | `NAME
  | `UNKNOWN_VALUE
]

(* CssParserWarning - enumeration *)
type cssparserwarning = [
  | `DEPRECATED
  | `SYNTAX
  | `UNIMPLEMENTED
]

(* DeleteType - enumeration *)
type deletetype = [
  | `CHARS
  | `WORD_ENDS
  | `WORDS
  | `DISPLAY_LINES
  | `DISPLAY_LINE_ENDS
  | `PARAGRAPH_ENDS
  | `PARAGRAPHS
  | `WHITESPACE
]

(* DialogError - enumeration *)
type dialogerror = [
  | `FAILED
  | `CANCELLED
  | `DISMISSED
]

(* DirectionType - enumeration *)
type directiontype = [
  | `TAB_FORWARD
  | `TAB_BACKWARD
  | `UP
  | `DOWN
  | `LEFT
  | `RIGHT
]

(* EditableProperties - enumeration *)
type editableproperties = [
  | `PROP_TEXT
  | `PROP_CURSOR_POSITION
  | `PROP_SELECTION_BOUND
  | `PROP_EDITABLE
  | `PROP_WIDTH_CHARS
  | `PROP_MAX_WIDTH_CHARS
  | `PROP_XALIGN
  | `PROP_ENABLE_UNDO
  | `NUM_PROPERTIES
]

(* EntryIconPosition - enumeration *)
type entryiconposition = [
  | `PRIMARY
  | `SECONDARY
]

(* EventSequenceState - enumeration *)
type eventsequencestate = [
  | `NONE
  | `CLAIMED
  | `DENIED
]

(* FileChooserAction - enumeration *)
type filechooseraction = [
  | `OPEN
  | `SAVE
  | `SELECT_FOLDER
]

(* FileChooserError - enumeration *)
type filechoosererror = [
  | `NONEXISTENT
  | `BAD_FILENAME
  | `ALREADY_EXISTS
  | `INCOMPLETE_HOSTNAME
]

(* FilterChange - enumeration *)
type filterchange = [
  | `DIFFERENT
  | `LESS_STRICT
  | `MORE_STRICT
]

(* FilterMatch - enumeration *)
type filtermatch = [
  | `SOME
  | `NONE
  | `ALL
]

(* FontLevel - enumeration *)
type fontlevel = [
  | `FAMILY
  | `FACE
  | `FONT
  | `FEATURES
]

(* GraphicsOffloadEnabled - enumeration *)
type graphicsoffloadenabled = [
  | `ENABLED
  | `DISABLED
]

(* IconSize - enumeration *)
type iconsize = [
  | `INHERIT
  | `NORMAL
  | `LARGE
]

(* IconThemeError - enumeration *)
type iconthemeerror = [
  | `NOT_FOUND
  | `FAILED
]

(* IconViewDropPosition - enumeration *)
type iconviewdropposition = [
  | `NO_DROP
  | `DROP_INTO
  | `DROP_LEFT
  | `DROP_RIGHT
  | `DROP_ABOVE
  | `DROP_BELOW
]

(* ImageType - enumeration *)
type imagetype = [
  | `EMPTY
  | `ICON_NAME
  | `GICON
  | `PAINTABLE
]

(* InputPurpose - enumeration *)
type inputpurpose = [
  | `FREE_FORM
  | `ALPHA
  | `DIGITS
  | `NUMBER
  | `PHONE
  | `URL
  | `EMAIL
  | `NAME
  | `PASSWORD
  | `PIN
  | `TERMINAL
]

(* InscriptionOverflow - enumeration *)
type inscriptionoverflow = [
  | `CLIP
  | `ELLIPSIZE_START
  | `ELLIPSIZE_MIDDLE
  | `ELLIPSIZE_END
]

(* Justification - enumeration *)
type justification = [
  | `LEFT
  | `RIGHT
  | `CENTER
  | `FILL
]

(* LevelBarMode - enumeration *)
type levelbarmode = [
  | `CONTINUOUS
  | `DISCRETE
]

(* ListTabBehavior - enumeration *)
type listtabbehavior = [
  | `ALL
  | `ITEM
  | `CELL
]

(* MessageType - enumeration *)
type messagetype = [
  | `INFO
  | `WARNING
  | `QUESTION
  | `ERROR
  | `OTHER
]

(* MovementStep - enumeration *)
type movementstep = [
  | `LOGICAL_POSITIONS
  | `VISUAL_POSITIONS
  | `WORDS
  | `DISPLAY_LINES
  | `DISPLAY_LINE_ENDS
  | `PARAGRAPHS
  | `PARAGRAPH_ENDS
  | `PAGES
  | `BUFFER_ENDS
  | `HORIZONTAL_PAGES
]

(* NaturalWrapMode - enumeration *)
type naturalwrapmode = [
  | `INHERIT
  | `NONE
  | `WORD
]

(* NotebookTab - enumeration *)
type notebooktab = [
  | `FIRST
  | `LAST
]

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

(* Ordering - enumeration *)
type ordering = [
  | `SMALLER
  | `EQUAL
  | `LARGER
]

(* Orientation - enumeration *)
type orientation = [
  | `HORIZONTAL
  | `VERTICAL
]

(* Overflow - enumeration *)
type overflow = [
  | `VISIBLE
  | `HIDDEN
]

(* PackType - enumeration *)
type packtype = [
  | `START
  | `END
]

(* PadActionType - enumeration *)
type padactiontype = [
  | `BUTTON
  | `RING
  | `STRIP
]

(* PageOrientation - enumeration *)
type pageorientation = [
  | `PORTRAIT
  | `LANDSCAPE
  | `REVERSE_PORTRAIT
  | `REVERSE_LANDSCAPE
]

(* PageSet - enumeration *)
type pageset = [
  | `ALL
  | `EVEN
  | `ODD
]

(* PanDirection - enumeration *)
type pandirection = [
  | `LEFT
  | `RIGHT
  | `UP
  | `DOWN
]

(* PolicyType - enumeration *)
type policytype = [
  | `ALWAYS
  | `AUTOMATIC
  | `NEVER
  | `EXTERNAL
]

(* PositionType - enumeration *)
type positiontype = [
  | `LEFT
  | `RIGHT
  | `TOP
  | `BOTTOM
]

(* PrintDuplex - enumeration *)
type printduplex = [
  | `SIMPLEX
  | `HORIZONTAL
  | `VERTICAL
]

(* PrintError - enumeration *)
type printerror = [
  | `GENERAL
  | `INTERNAL_ERROR
  | `NOMEM
  | `INVALID_FILE
]

(* PrintOperationAction - enumeration *)
type printoperationaction = [
  | `PRINT_DIALOG
  | `PRINT
  | `PREVIEW
  | `EXPORT
]

(* PrintOperationResult - enumeration *)
type printoperationresult = [
  | `ERROR
  | `APPLY
  | `CANCEL
  | `IN_PROGRESS
]

(* PrintPages - enumeration *)
type printpages = [
  | `ALL
  | `CURRENT
  | `RANGES
  | `SELECTION
]

(* PrintQuality - enumeration *)
type printquality = [
  | `LOW
  | `NORMAL
  | `HIGH
  | `DRAFT
]

(* PrintStatus - enumeration *)
type printstatus = [
  | `INITIAL
  | `PREPARING
  | `GENERATING_DATA
  | `SENDING_DATA
  | `PENDING
  | `PENDING_ISSUE
  | `PRINTING
  | `FINISHED
  | `FINISHED_ABORTED
]

(* PropagationLimit - enumeration *)
type propagationlimit = [
  | `NONE
  | `SAME_NATIVE
]

(* PropagationPhase - enumeration *)
type propagationphase = [
  | `NONE
  | `CAPTURE
  | `BUBBLE
  | `TARGET
]

(* RecentManagerError - enumeration *)
type recentmanagererror = [
  | `NOT_FOUND
  | `INVALID_URI
  | `INVALID_ENCODING
  | `NOT_REGISTERED
  | `READ
  | `WRITE
  | `UNKNOWN
]

(* ResponseType - enumeration *)
type responsetype = [
  | `NONE
  | `REJECT
  | `ACCEPT
  | `DELETE_EVENT
  | `OK
  | `CANCEL
  | `CLOSE
  | `YES
  | `NO
  | `APPLY
  | `HELP
]

(* RevealerTransitionType - enumeration *)
type revealertransitiontype = [
  | `NONE
  | `CROSSFADE
  | `SLIDE_RIGHT
  | `SLIDE_LEFT
  | `SLIDE_UP
  | `SLIDE_DOWN
  | `SWING_RIGHT
  | `SWING_LEFT
  | `SWING_UP
  | `SWING_DOWN
]

(* ScrollStep - enumeration *)
type scrollstep = [
  | `STEPS
  | `PAGES
  | `ENDS
  | `HORIZONTAL_STEPS
  | `HORIZONTAL_PAGES
  | `HORIZONTAL_ENDS
]

(* ScrollType - enumeration *)
type scrolltype = [
  | `NONE
  | `JUMP
  | `STEP_BACKWARD
  | `STEP_FORWARD
  | `PAGE_BACKWARD
  | `PAGE_FORWARD
  | `STEP_UP
  | `STEP_DOWN
  | `PAGE_UP
  | `PAGE_DOWN
  | `STEP_LEFT
  | `STEP_RIGHT
  | `PAGE_LEFT
  | `PAGE_RIGHT
  | `START
  | `END
]

(* ScrollablePolicy - enumeration *)
type scrollablepolicy = [
  | `MINIMUM
  | `NATURAL
]

(* SelectionMode - enumeration *)
type selectionmode = [
  | `NONE
  | `SINGLE
  | `BROWSE
  | `MULTIPLE
]

(* SensitivityType - enumeration *)
type sensitivitytype = [
  | `AUTO
  | `ON
  | `OFF
]

(* ShortcutScope - enumeration *)
type shortcutscope = [
  | `LOCAL
  | `MANAGED
  | `GLOBAL
]

(* ShortcutType - enumeration *)
type shortcuttype = [
  | `ACCELERATOR
  | `GESTURE_PINCH
  | `GESTURE_STRETCH
  | `GESTURE_ROTATE_CLOCKWISE
  | `GESTURE_ROTATE_COUNTERCLOCKWISE
  | `GESTURE_TWO_FINGER_SWIPE_LEFT
  | `GESTURE_TWO_FINGER_SWIPE_RIGHT
  | `GESTURE
  | `GESTURE_SWIPE_LEFT
  | `GESTURE_SWIPE_RIGHT
]

(* SizeGroupMode - enumeration *)
type sizegroupmode = [
  | `NONE
  | `HORIZONTAL
  | `VERTICAL
  | `BOTH
]

(* SizeRequestMode - enumeration *)
type sizerequestmode = [
  | `HEIGHT_FOR_WIDTH
  | `WIDTH_FOR_HEIGHT
  | `CONSTANT_SIZE
]

(* SortType - enumeration *)
type sorttype = [
  | `ASCENDING
  | `DESCENDING
]

(* SorterChange - enumeration *)
type sorterchange = [
  | `DIFFERENT
  | `INVERTED
  | `LESS_STRICT
  | `MORE_STRICT
]

(* SorterOrder - enumeration *)
type sorterorder = [
  | `PARTIAL
  | `NONE
  | `TOTAL
]

(* SpinButtonUpdatePolicy - enumeration *)
type spinbuttonupdatepolicy = [
  | `ALWAYS
  | `IF_VALID
]

(* SpinType - enumeration *)
type spintype = [
  | `STEP_FORWARD
  | `STEP_BACKWARD
  | `PAGE_FORWARD
  | `PAGE_BACKWARD
  | `HOME
  | `END
  | `USER_DEFINED
]

(* StackTransitionType - enumeration *)
type stacktransitiontype = [
  | `NONE
  | `CROSSFADE
  | `SLIDE_RIGHT
  | `SLIDE_LEFT
  | `SLIDE_UP
  | `SLIDE_DOWN
  | `SLIDE_LEFT_RIGHT
  | `SLIDE_UP_DOWN
  | `OVER_UP
  | `OVER_DOWN
  | `OVER_LEFT
  | `OVER_RIGHT
  | `UNDER_UP
  | `UNDER_DOWN
  | `UNDER_LEFT
  | `UNDER_RIGHT
  | `OVER_UP_DOWN
  | `OVER_DOWN_UP
  | `OVER_LEFT_RIGHT
  | `OVER_RIGHT_LEFT
  | `ROTATE_LEFT
  | `ROTATE_RIGHT
  | `ROTATE_LEFT_RIGHT
]

(* StringFilterMatchMode - enumeration *)
type stringfiltermatchmode = [
  | `EXACT
  | `SUBSTRING
  | `PREFIX
]

(* SymbolicColor - enumeration *)
type symboliccolor = [
  | `FOREGROUND
  | `ERROR
  | `WARNING
  | `SUCCESS
]

(* SystemSetting - enumeration *)
type systemsetting = [
  | `DPI
  | `FONT_NAME
  | `FONT_CONFIG
  | `DISPLAY
  | `ICON_THEME
]

(* TextDirection - enumeration *)
type textdirection = [
  | `NONE
  | `LTR
  | `RTL
]

(* TextExtendSelection - enumeration *)
type textextendselection = [
  | `WORD
  | `LINE
]

(* TextViewLayer - enumeration *)
type textviewlayer = [
  | `BELOW_TEXT
  | `ABOVE_TEXT
]

(* TextWindowType - enumeration *)
type textwindowtype = [
  | `WIDGET
  | `TEXT
  | `LEFT
  | `RIGHT
  | `TOP
  | `BOTTOM
]

(* TreeViewColumnSizing - enumeration *)
type treeviewcolumnsizing = [
  | `GROW_ONLY
  | `AUTOSIZE
  | `FIXED
]

(* TreeViewDropPosition - enumeration *)
type treeviewdropposition = [
  | `BEFORE
  | `AFTER
  | `INTO_OR_BEFORE
  | `INTO_OR_AFTER
]

(* TreeViewGridLines - enumeration *)
type treeviewgridlines = [
  | `NONE
  | `HORIZONTAL
  | `VERTICAL
  | `BOTH
]

(* Unit - enumeration *)
type unit = [
  | `NONE
  | `POINTS
  | `INCH
  | `MM
]

(* WrapMode - enumeration *)
type wrapmode = [
  | `NONE
  | `CHAR
  | `WORD
  | `WORD_CHAR
]

(* ApplicationInhibitFlags - bitfield/flags *)
type applicationinhibitflags_flag = [
  | `LOGOUT
  | `SWITCH
  | `SUSPEND
  | `IDLE
]

type applicationinhibitflags = applicationinhibitflags_flag list

(* BuilderClosureFlags - bitfield/flags *)
type builderclosureflags_flag = [
  | `SWAPPED
]

type builderclosureflags = builderclosureflags_flag list

(* CellRendererState - bitfield/flags *)
type cellrendererstate_flag = [
  | `SELECTED
  | `PRELIT
  | `INSENSITIVE
  | `SORTED
  | `FOCUSED
  | `EXPANDABLE
  | `EXPANDED
]

type cellrendererstate = cellrendererstate_flag list

(* DebugFlags - bitfield/flags *)
type debugflags_flag = [
  | `TEXT
  | `TREE
  | `KEYBINDINGS
  | `MODULES
  | `GEOMETRY
  | `ICONTHEME
  | `PRINTING
  | `BUILDER
  | `SIZE_REQUEST
  | `NO_CSS_CACHE
  | `INTERACTIVE
  | `ACTIONS
  | `LAYOUT
  | `SNAPSHOT
  | `CONSTRAINTS
  | `BUILDER_OBJECTS
  | `A11Y
  | `ICONFALLBACK
  | `INVERT_TEXT_DIR
]

type debugflags = debugflags_flag list

(* DialogFlags - bitfield/flags *)
type dialogflags_flag = [
  | `MODAL
  | `DESTROY_WITH_PARENT
  | `USE_HEADER_BAR
]

type dialogflags = dialogflags_flag list

(* EventControllerScrollFlags - bitfield/flags *)
type eventcontrollerscrollflags_flag = [
  | `NONE
  | `VERTICAL
  | `HORIZONTAL
  | `DISCRETE
  | `KINETIC
  | `BOTH_AXES
]

type eventcontrollerscrollflags = eventcontrollerscrollflags_flag list

(* FontChooserLevel - bitfield/flags *)
type fontchooserlevel_flag = [
  | `FAMILY
  | `STYLE
  | `SIZE
  | `VARIATIONS
  | `FEATURES
]

type fontchooserlevel = fontchooserlevel_flag list

(* IconLookupFlags - bitfield/flags *)
type iconlookupflags_flag = [
  | `FORCE_REGULAR
  | `FORCE_SYMBOLIC
  | `PRELOAD
]

type iconlookupflags = iconlookupflags_flag list

(* InputHints - bitfield/flags *)
type inputhints_flag = [
  | `NONE
  | `SPELLCHECK
  | `NO_SPELLCHECK
  | `WORD_COMPLETION
  | `LOWERCASE
  | `UPPERCASE_CHARS
  | `UPPERCASE_WORDS
  | `UPPERCASE_SENTENCES
  | `INHIBIT_OSK
  | `VERTICAL_WRITING
  | `EMOJI
  | `NO_EMOJI
  | `PRIVATE
]

type inputhints = inputhints_flag list

(* ListScrollFlags - bitfield/flags *)
type listscrollflags_flag = [
  | `NONE
  | `FOCUS
  | `SELECT
]

type listscrollflags = listscrollflags_flag list

(* PickFlags - bitfield/flags *)
type pickflags_flag = [
  | `DEFAULT
  | `INSENSITIVE
  | `NON_TARGETABLE
]

type pickflags = pickflags_flag list

(* PopoverMenuFlags - bitfield/flags *)
type popovermenuflags_flag = [
  | `SLIDING
  | `NESTED
]

type popovermenuflags = popovermenuflags_flag list

(* ShortcutActionFlags - bitfield/flags *)
type shortcutactionflags_flag = [
  | `EXCLUSIVE
]

type shortcutactionflags = shortcutactionflags_flag list

(* StateFlags - bitfield/flags *)
type stateflags_flag = [
  | `NORMAL
  | `ACTIVE
  | `PRELIGHT
  | `SELECTED
  | `INSENSITIVE
  | `INCONSISTENT
  | `FOCUSED
  | `BACKDROP
  | `DIR_LTR
  | `DIR_RTL
  | `LINK
  | `VISITED
  | `CHECKED
  | `DROP_ACTIVE
  | `FOCUS_VISIBLE
  | `FOCUS_WITHIN
]

type stateflags = stateflags_flag list

(* StyleContextPrintFlags - bitfield/flags *)
type stylecontextprintflags_flag = [
  | `NONE
  | `RECURSE
  | `SHOW_STYLE
  | `SHOW_CHANGE
]

type stylecontextprintflags = stylecontextprintflags_flag list

(* TextSearchFlags - bitfield/flags *)
type textsearchflags_flag = [
  | `VISIBLE_ONLY
  | `TEXT_ONLY
  | `CASE_INSENSITIVE
]

type textsearchflags = textsearchflags_flag list

(* TreeModelFlags - bitfield/flags *)
type treemodelflags_flag = [
  | `ITERS_PERSIST
  | `LIST_ONLY
]

type treemodelflags = treemodelflags_flag list

