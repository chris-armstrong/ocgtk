(* GENERATED CODE - DO NOT EDIT *)
(* Gtk Enumeration and Bitfield Converters *)

type accessibleannouncementpriority = [ `LOW | `MEDIUM | `HIGH ]

let accessibleannouncementpriority_of_int n =
  match n with
  | 0 -> `LOW
  | 1 -> `MEDIUM
  | 2 -> `HIGH
  | n ->
      failwith
        (Printf.sprintf "AccessibleAnnouncementPriority: unknown int %d" n)

let accessibleannouncementpriority_to_int v =
  match v with `LOW -> 0 | `MEDIUM -> 1 | `HIGH -> 2

type accessibleautocomplete = [ `NONE | `INLINE | `LIST | `BOTH ]

let accessibleautocomplete_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `INLINE
  | 2 -> `LIST
  | 3 -> `BOTH
  | n -> failwith (Printf.sprintf "AccessibleAutocomplete: unknown int %d" n)

let accessibleautocomplete_to_int v =
  match v with `NONE -> 0 | `INLINE -> 1 | `LIST -> 2 | `BOTH -> 3

type accessibleinvalidstate = [ `FALSE | `TRUE | `GRAMMAR | `SPELLING ]

let accessibleinvalidstate_of_int n =
  match n with
  | 0 -> `FALSE
  | 1 -> `TRUE
  | 2 -> `GRAMMAR
  | 3 -> `SPELLING
  | n -> failwith (Printf.sprintf "AccessibleInvalidState: unknown int %d" n)

let accessibleinvalidstate_to_int v =
  match v with `FALSE -> 0 | `TRUE -> 1 | `GRAMMAR -> 2 | `SPELLING -> 3

type accessibleplatformstate = [ `FOCUSABLE | `FOCUSED | `ACTIVE ]

let accessibleplatformstate_of_int n =
  match n with
  | 0 -> `FOCUSABLE
  | 1 -> `FOCUSED
  | 2 -> `ACTIVE
  | n -> failwith (Printf.sprintf "AccessiblePlatformState: unknown int %d" n)

let accessibleplatformstate_to_int v =
  match v with `FOCUSABLE -> 0 | `FOCUSED -> 1 | `ACTIVE -> 2

type accessibleproperty =
  [ `AUTOCOMPLETE
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
  | `VALUE_TEXT ]

let accessibleproperty_of_int n =
  match n with
  | 0 -> `AUTOCOMPLETE
  | 1 -> `DESCRIPTION
  | 2 -> `HAS_POPUP
  | 3 -> `KEY_SHORTCUTS
  | 4 -> `LABEL
  | 5 -> `LEVEL
  | 6 -> `MODAL
  | 7 -> `MULTI_LINE
  | 8 -> `MULTI_SELECTABLE
  | 9 -> `ORIENTATION
  | 10 -> `PLACEHOLDER
  | 11 -> `READ_ONLY
  | 12 -> `REQUIRED
  | 13 -> `ROLE_DESCRIPTION
  | 14 -> `SORT
  | 15 -> `VALUE_MAX
  | 16 -> `VALUE_MIN
  | 17 -> `VALUE_NOW
  | 18 -> `VALUE_TEXT
  | n -> failwith (Printf.sprintf "AccessibleProperty: unknown int %d" n)

let accessibleproperty_to_int v =
  match v with
  | `AUTOCOMPLETE -> 0
  | `DESCRIPTION -> 1
  | `HAS_POPUP -> 2
  | `KEY_SHORTCUTS -> 3
  | `LABEL -> 4
  | `LEVEL -> 5
  | `MODAL -> 6
  | `MULTI_LINE -> 7
  | `MULTI_SELECTABLE -> 8
  | `ORIENTATION -> 9
  | `PLACEHOLDER -> 10
  | `READ_ONLY -> 11
  | `REQUIRED -> 12
  | `ROLE_DESCRIPTION -> 13
  | `SORT -> 14
  | `VALUE_MAX -> 15
  | `VALUE_MIN -> 16
  | `VALUE_NOW -> 17
  | `VALUE_TEXT -> 18

type accessiblerelation =
  [ `ACTIVE_DESCENDANT
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
  | `SET_SIZE ]

let accessiblerelation_of_int n =
  match n with
  | 0 -> `ACTIVE_DESCENDANT
  | 1 -> `COL_COUNT
  | 2 -> `COL_INDEX
  | 3 -> `COL_INDEX_TEXT
  | 4 -> `COL_SPAN
  | 5 -> `CONTROLS
  | 6 -> `DESCRIBED_BY
  | 7 -> `DETAILS
  | 8 -> `ERROR_MESSAGE
  | 9 -> `FLOW_TO
  | 10 -> `LABELLED_BY
  | 11 -> `OWNS
  | 12 -> `POS_IN_SET
  | 13 -> `ROW_COUNT
  | 14 -> `ROW_INDEX
  | 15 -> `ROW_INDEX_TEXT
  | 16 -> `ROW_SPAN
  | 17 -> `SET_SIZE
  | n -> failwith (Printf.sprintf "AccessibleRelation: unknown int %d" n)

let accessiblerelation_to_int v =
  match v with
  | `ACTIVE_DESCENDANT -> 0
  | `COL_COUNT -> 1
  | `COL_INDEX -> 2
  | `COL_INDEX_TEXT -> 3
  | `COL_SPAN -> 4
  | `CONTROLS -> 5
  | `DESCRIBED_BY -> 6
  | `DETAILS -> 7
  | `ERROR_MESSAGE -> 8
  | `FLOW_TO -> 9
  | `LABELLED_BY -> 10
  | `OWNS -> 11
  | `POS_IN_SET -> 12
  | `ROW_COUNT -> 13
  | `ROW_INDEX -> 14
  | `ROW_INDEX_TEXT -> 15
  | `ROW_SPAN -> 16
  | `SET_SIZE -> 17

type accessiblerole =
  [ `ALERT
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
  | `TERMINAL ]

let accessiblerole_of_int n =
  match n with
  | 0 -> `ALERT
  | 1 -> `ALERT_DIALOG
  | 2 -> `BANNER
  | 3 -> `BUTTON
  | 4 -> `CAPTION
  | 5 -> `CELL
  | 6 -> `CHECKBOX
  | 7 -> `COLUMN_HEADER
  | 8 -> `COMBO_BOX
  | 9 -> `COMMAND
  | 10 -> `COMPOSITE
  | 11 -> `DIALOG
  | 12 -> `DOCUMENT
  | 13 -> `FEED
  | 14 -> `FORM
  | 15 -> `GENERIC
  | 16 -> `GRID
  | 17 -> `GRID_CELL
  | 18 -> `GROUP
  | 19 -> `HEADING
  | 20 -> `IMG
  | 21 -> `INPUT
  | 22 -> `LABEL
  | 23 -> `LANDMARK
  | 24 -> `LEGEND
  | 25 -> `LINK
  | 26 -> `LIST
  | 27 -> `LIST_BOX
  | 28 -> `LIST_ITEM
  | 29 -> `LOG
  | 30 -> `MAIN
  | 31 -> `MARQUEE
  | 32 -> `MATH
  | 33 -> `METER
  | 34 -> `MENU
  | 35 -> `MENU_BAR
  | 36 -> `MENU_ITEM
  | 37 -> `MENU_ITEM_CHECKBOX
  | 38 -> `MENU_ITEM_RADIO
  | 39 -> `NAVIGATION
  | 40 -> `NONE
  | 41 -> `NOTE
  | 42 -> `OPTION
  | 43 -> `PRESENTATION
  | 44 -> `PROGRESS_BAR
  | 45 -> `RADIO
  | 46 -> `RADIO_GROUP
  | 47 -> `RANGE
  | 48 -> `REGION
  | 49 -> `ROW
  | 50 -> `ROW_GROUP
  | 51 -> `ROW_HEADER
  | 52 -> `SCROLLBAR
  | 53 -> `SEARCH
  | 54 -> `SEARCH_BOX
  | 55 -> `SECTION
  | 56 -> `SECTION_HEAD
  | 57 -> `SELECT
  | 58 -> `SEPARATOR
  | 59 -> `SLIDER
  | 60 -> `SPIN_BUTTON
  | 61 -> `STATUS
  | 62 -> `STRUCTURE
  | 63 -> `SWITCH
  | 64 -> `TAB
  | 65 -> `TABLE
  | 66 -> `TAB_LIST
  | 67 -> `TAB_PANEL
  | 68 -> `TEXT_BOX
  | 69 -> `TIME
  | 70 -> `TIMER
  | 71 -> `TOOLBAR
  | 72 -> `TOOLTIP
  | 73 -> `TREE
  | 74 -> `TREE_GRID
  | 75 -> `TREE_ITEM
  | 76 -> `WIDGET
  | 77 -> `WINDOW
  | 78 -> `TOGGLE_BUTTON
  | 79 -> `APPLICATION
  | 80 -> `PARAGRAPH
  | 81 -> `BLOCK_QUOTE
  | 82 -> `ARTICLE
  | 83 -> `COMMENT
  | 84 -> `TERMINAL
  | n -> failwith (Printf.sprintf "AccessibleRole: unknown int %d" n)

let accessiblerole_to_int v =
  match v with
  | `ALERT -> 0
  | `ALERT_DIALOG -> 1
  | `BANNER -> 2
  | `BUTTON -> 3
  | `CAPTION -> 4
  | `CELL -> 5
  | `CHECKBOX -> 6
  | `COLUMN_HEADER -> 7
  | `COMBO_BOX -> 8
  | `COMMAND -> 9
  | `COMPOSITE -> 10
  | `DIALOG -> 11
  | `DOCUMENT -> 12
  | `FEED -> 13
  | `FORM -> 14
  | `GENERIC -> 15
  | `GRID -> 16
  | `GRID_CELL -> 17
  | `GROUP -> 18
  | `HEADING -> 19
  | `IMG -> 20
  | `INPUT -> 21
  | `LABEL -> 22
  | `LANDMARK -> 23
  | `LEGEND -> 24
  | `LINK -> 25
  | `LIST -> 26
  | `LIST_BOX -> 27
  | `LIST_ITEM -> 28
  | `LOG -> 29
  | `MAIN -> 30
  | `MARQUEE -> 31
  | `MATH -> 32
  | `METER -> 33
  | `MENU -> 34
  | `MENU_BAR -> 35
  | `MENU_ITEM -> 36
  | `MENU_ITEM_CHECKBOX -> 37
  | `MENU_ITEM_RADIO -> 38
  | `NAVIGATION -> 39
  | `NONE -> 40
  | `NOTE -> 41
  | `OPTION -> 42
  | `PRESENTATION -> 43
  | `PROGRESS_BAR -> 44
  | `RADIO -> 45
  | `RADIO_GROUP -> 46
  | `RANGE -> 47
  | `REGION -> 48
  | `ROW -> 49
  | `ROW_GROUP -> 50
  | `ROW_HEADER -> 51
  | `SCROLLBAR -> 52
  | `SEARCH -> 53
  | `SEARCH_BOX -> 54
  | `SECTION -> 55
  | `SECTION_HEAD -> 56
  | `SELECT -> 57
  | `SEPARATOR -> 58
  | `SLIDER -> 59
  | `SPIN_BUTTON -> 60
  | `STATUS -> 61
  | `STRUCTURE -> 62
  | `SWITCH -> 63
  | `TAB -> 64
  | `TABLE -> 65
  | `TAB_LIST -> 66
  | `TAB_PANEL -> 67
  | `TEXT_BOX -> 68
  | `TIME -> 69
  | `TIMER -> 70
  | `TOOLBAR -> 71
  | `TOOLTIP -> 72
  | `TREE -> 73
  | `TREE_GRID -> 74
  | `TREE_ITEM -> 75
  | `WIDGET -> 76
  | `WINDOW -> 77
  | `TOGGLE_BUTTON -> 78
  | `APPLICATION -> 79
  | `PARAGRAPH -> 80
  | `BLOCK_QUOTE -> 81
  | `ARTICLE -> 82
  | `COMMENT -> 83
  | `TERMINAL -> 84

type accessiblesort = [ `NONE | `ASCENDING | `DESCENDING | `OTHER ]

let accessiblesort_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `ASCENDING
  | 2 -> `DESCENDING
  | 3 -> `OTHER
  | n -> failwith (Printf.sprintf "AccessibleSort: unknown int %d" n)

let accessiblesort_to_int v =
  match v with `NONE -> 0 | `ASCENDING -> 1 | `DESCENDING -> 2 | `OTHER -> 3

type accessiblestate =
  [ `BUSY
  | `CHECKED
  | `DISABLED
  | `EXPANDED
  | `HIDDEN
  | `INVALID
  | `PRESSED
  | `SELECTED
  | `VISITED ]

let accessiblestate_of_int n =
  match n with
  | 0 -> `BUSY
  | 1 -> `CHECKED
  | 2 -> `DISABLED
  | 3 -> `EXPANDED
  | 4 -> `HIDDEN
  | 5 -> `INVALID
  | 6 -> `PRESSED
  | 7 -> `SELECTED
  | 8 -> `VISITED
  | n -> failwith (Printf.sprintf "AccessibleState: unknown int %d" n)

let accessiblestate_to_int v =
  match v with
  | `BUSY -> 0
  | `CHECKED -> 1
  | `DISABLED -> 2
  | `EXPANDED -> 3
  | `HIDDEN -> 4
  | `INVALID -> 5
  | `PRESSED -> 6
  | `SELECTED -> 7
  | `VISITED -> 8

type accessibletextcontentchange = [ `INSERT | `REMOVE ]

let accessibletextcontentchange_of_int n =
  match n with
  | 0 -> `INSERT
  | 1 -> `REMOVE
  | n ->
      failwith (Printf.sprintf "AccessibleTextContentChange: unknown int %d" n)

let accessibletextcontentchange_to_int v =
  match v with `INSERT -> 0 | `REMOVE -> 1

type accessibletextgranularity =
  [ `CHARACTER | `WORD | `SENTENCE | `LINE | `PARAGRAPH ]

let accessibletextgranularity_of_int n =
  match n with
  | 0 -> `CHARACTER
  | 1 -> `WORD
  | 2 -> `SENTENCE
  | 3 -> `LINE
  | 4 -> `PARAGRAPH
  | n -> failwith (Printf.sprintf "AccessibleTextGranularity: unknown int %d" n)

let accessibletextgranularity_to_int v =
  match v with
  | `CHARACTER -> 0
  | `WORD -> 1
  | `SENTENCE -> 2
  | `LINE -> 3
  | `PARAGRAPH -> 4

type accessibletristate = [ `FALSE | `TRUE | `MIXED ]

let accessibletristate_of_int n =
  match n with
  | 0 -> `FALSE
  | 1 -> `TRUE
  | 2 -> `MIXED
  | n -> failwith (Printf.sprintf "AccessibleTristate: unknown int %d" n)

let accessibletristate_to_int v =
  match v with `FALSE -> 0 | `TRUE -> 1 | `MIXED -> 2

type align =
  [ `FILL
  | `START
  | `END
  | `CENTER
  | `BASELINE_FILL
  | `BASELINE
  | `BASELINE_CENTER ]

let align_of_int n =
  match n with
  | 0 -> `FILL
  | 1 -> `START
  | 2 -> `END
  | 3 -> `CENTER
  | 4 -> `BASELINE_FILL
  | 5 -> `BASELINE_CENTER
  | n -> failwith (Printf.sprintf "Align: unknown int %d" n)

let align_to_int v =
  match v with
  | `FILL -> 0
  | `START -> 1
  | `END -> 2
  | `CENTER -> 3
  | `BASELINE_FILL -> 4
  | `BASELINE -> 4
  | `BASELINE_CENTER -> 5

type arrowtype = [ `UP | `DOWN | `LEFT | `RIGHT | `NONE ]

let arrowtype_of_int n =
  match n with
  | 0 -> `UP
  | 1 -> `DOWN
  | 2 -> `LEFT
  | 3 -> `RIGHT
  | 4 -> `NONE
  | n -> failwith (Printf.sprintf "ArrowType: unknown int %d" n)

let arrowtype_to_int v =
  match v with `UP -> 0 | `DOWN -> 1 | `LEFT -> 2 | `RIGHT -> 3 | `NONE -> 4

type assistantpagetype =
  [ `CONTENT | `INTRO | `CONFIRM | `SUMMARY | `PROGRESS | `CUSTOM ]

let assistantpagetype_of_int n =
  match n with
  | 0 -> `CONTENT
  | 1 -> `INTRO
  | 2 -> `CONFIRM
  | 3 -> `SUMMARY
  | 4 -> `PROGRESS
  | 5 -> `CUSTOM
  | n -> failwith (Printf.sprintf "AssistantPageType: unknown int %d" n)

let assistantpagetype_to_int v =
  match v with
  | `CONTENT -> 0
  | `INTRO -> 1
  | `CONFIRM -> 2
  | `SUMMARY -> 3
  | `PROGRESS -> 4
  | `CUSTOM -> 5

type baselineposition = [ `TOP | `CENTER | `BOTTOM ]

let baselineposition_of_int n =
  match n with
  | 0 -> `TOP
  | 1 -> `CENTER
  | 2 -> `BOTTOM
  | n -> failwith (Printf.sprintf "BaselinePosition: unknown int %d" n)

let baselineposition_to_int v =
  match v with `TOP -> 0 | `CENTER -> 1 | `BOTTOM -> 2

type borderstyle =
  [ `NONE
  | `HIDDEN
  | `SOLID
  | `INSET
  | `OUTSET
  | `DOTTED
  | `DASHED
  | `DOUBLE
  | `GROOVE
  | `RIDGE ]

let borderstyle_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `HIDDEN
  | 2 -> `SOLID
  | 3 -> `INSET
  | 4 -> `OUTSET
  | 5 -> `DOTTED
  | 6 -> `DASHED
  | 7 -> `DOUBLE
  | 8 -> `GROOVE
  | 9 -> `RIDGE
  | n -> failwith (Printf.sprintf "BorderStyle: unknown int %d" n)

let borderstyle_to_int v =
  match v with
  | `NONE -> 0
  | `HIDDEN -> 1
  | `SOLID -> 2
  | `INSET -> 3
  | `OUTSET -> 4
  | `DOTTED -> 5
  | `DASHED -> 6
  | `DOUBLE -> 7
  | `GROOVE -> 8
  | `RIDGE -> 9

type buildererror =
  [ `INVALID_TYPE_FUNCTION
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
  | `INVALID_FUNCTION ]

let buildererror_of_int n =
  match n with
  | 0 -> `INVALID_TYPE_FUNCTION
  | 1 -> `UNHANDLED_TAG
  | 2 -> `MISSING_ATTRIBUTE
  | 3 -> `INVALID_ATTRIBUTE
  | 4 -> `INVALID_TAG
  | 5 -> `MISSING_PROPERTY_VALUE
  | 6 -> `INVALID_VALUE
  | 7 -> `VERSION_MISMATCH
  | 8 -> `DUPLICATE_ID
  | 9 -> `OBJECT_TYPE_REFUSED
  | 10 -> `TEMPLATE_MISMATCH
  | 11 -> `INVALID_PROPERTY
  | 12 -> `INVALID_SIGNAL
  | 13 -> `INVALID_ID
  | 14 -> `INVALID_FUNCTION
  | n -> failwith (Printf.sprintf "BuilderError: unknown int %d" n)

let buildererror_to_int v =
  match v with
  | `INVALID_TYPE_FUNCTION -> 0
  | `UNHANDLED_TAG -> 1
  | `MISSING_ATTRIBUTE -> 2
  | `INVALID_ATTRIBUTE -> 3
  | `INVALID_TAG -> 4
  | `MISSING_PROPERTY_VALUE -> 5
  | `INVALID_VALUE -> 6
  | `VERSION_MISMATCH -> 7
  | `DUPLICATE_ID -> 8
  | `OBJECT_TYPE_REFUSED -> 9
  | `TEMPLATE_MISMATCH -> 10
  | `INVALID_PROPERTY -> 11
  | `INVALID_SIGNAL -> 12
  | `INVALID_ID -> 13
  | `INVALID_FUNCTION -> 14

type buttonstype = [ `NONE | `OK | `CLOSE | `CANCEL | `YES_NO | `OK_CANCEL ]

let buttonstype_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `OK
  | 2 -> `CLOSE
  | 3 -> `CANCEL
  | 4 -> `YES_NO
  | 5 -> `OK_CANCEL
  | n -> failwith (Printf.sprintf "ButtonsType: unknown int %d" n)

let buttonstype_to_int v =
  match v with
  | `NONE -> 0
  | `OK -> 1
  | `CLOSE -> 2
  | `CANCEL -> 3
  | `YES_NO -> 4
  | `OK_CANCEL -> 5

type cellrendereraccelmode = [ `GTK | `OTHER ]

let cellrendereraccelmode_of_int n =
  match n with
  | 0 -> `GTK
  | 1 -> `OTHER
  | n -> failwith (Printf.sprintf "CellRendererAccelMode: unknown int %d" n)

let cellrendereraccelmode_to_int v = match v with `GTK -> 0 | `OTHER -> 1

type cellrenderermode = [ `INERT | `ACTIVATABLE | `EDITABLE ]

let cellrenderermode_of_int n =
  match n with
  | 0 -> `INERT
  | 1 -> `ACTIVATABLE
  | 2 -> `EDITABLE
  | n -> failwith (Printf.sprintf "CellRendererMode: unknown int %d" n)

let cellrenderermode_to_int v =
  match v with `INERT -> 0 | `ACTIVATABLE -> 1 | `EDITABLE -> 2

type collation = [ `NONE | `UNICODE | `FILENAME ]

let collation_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `UNICODE
  | 2 -> `FILENAME
  | n -> failwith (Printf.sprintf "Collation: unknown int %d" n)

let collation_to_int v =
  match v with `NONE -> 0 | `UNICODE -> 1 | `FILENAME -> 2

type constraintattribute =
  [ `NONE
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
  | `BASELINE ]

let constraintattribute_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `LEFT
  | 2 -> `RIGHT
  | 3 -> `TOP
  | 4 -> `BOTTOM
  | 5 -> `START
  | 6 -> `END
  | 7 -> `WIDTH
  | 8 -> `HEIGHT
  | 9 -> `CENTER_X
  | 10 -> `CENTER_Y
  | 11 -> `BASELINE
  | n -> failwith (Printf.sprintf "ConstraintAttribute: unknown int %d" n)

let constraintattribute_to_int v =
  match v with
  | `NONE -> 0
  | `LEFT -> 1
  | `RIGHT -> 2
  | `TOP -> 3
  | `BOTTOM -> 4
  | `START -> 5
  | `END -> 6
  | `WIDTH -> 7
  | `HEIGHT -> 8
  | `CENTER_X -> 9
  | `CENTER_Y -> 10
  | `BASELINE -> 11

type constraintrelation = [ `LE | `EQ | `GE ]

let constraintrelation_of_int n =
  match n with
  | -1 -> `LE
  | 0 -> `EQ
  | 1 -> `GE
  | n -> failwith (Printf.sprintf "ConstraintRelation: unknown int %d" n)

let constraintrelation_to_int v = match v with `LE -> -1 | `EQ -> 0 | `GE -> 1

type constraintstrength = [ `REQUIRED | `STRONG | `MEDIUM | `WEAK ]

let constraintstrength_of_int n =
  match n with
  | 1001001000 -> `REQUIRED
  | 1000000000 -> `STRONG
  | 1000 -> `MEDIUM
  | 1 -> `WEAK
  | n -> failwith (Printf.sprintf "ConstraintStrength: unknown int %d" n)

let constraintstrength_to_int v =
  match v with
  | `REQUIRED -> 1001001000
  | `STRONG -> 1000000000
  | `MEDIUM -> 1000
  | `WEAK -> 1

type constraintvflparsererror =
  [ `SYMBOL | `ATTRIBUTE | `VIEW | `METRIC | `PRIORITY | `RELATION ]

let constraintvflparsererror_of_int n =
  match n with
  | 0 -> `SYMBOL
  | 1 -> `ATTRIBUTE
  | 2 -> `VIEW
  | 3 -> `METRIC
  | 4 -> `PRIORITY
  | 5 -> `RELATION
  | n -> failwith (Printf.sprintf "ConstraintVflParserError: unknown int %d" n)

let constraintvflparsererror_to_int v =
  match v with
  | `SYMBOL -> 0
  | `ATTRIBUTE -> 1
  | `VIEW -> 2
  | `METRIC -> 3
  | `PRIORITY -> 4
  | `RELATION -> 5

type contentfit = [ `FILL | `CONTAIN | `COVER | `SCALE_DOWN ]

let contentfit_of_int n =
  match n with
  | 0 -> `FILL
  | 1 -> `CONTAIN
  | 2 -> `COVER
  | 3 -> `SCALE_DOWN
  | n -> failwith (Printf.sprintf "ContentFit: unknown int %d" n)

let contentfit_to_int v =
  match v with `FILL -> 0 | `CONTAIN -> 1 | `COVER -> 2 | `SCALE_DOWN -> 3

type cornertype = [ `TOP_LEFT | `BOTTOM_LEFT | `TOP_RIGHT | `BOTTOM_RIGHT ]

let cornertype_of_int n =
  match n with
  | 0 -> `TOP_LEFT
  | 1 -> `BOTTOM_LEFT
  | 2 -> `TOP_RIGHT
  | 3 -> `BOTTOM_RIGHT
  | n -> failwith (Printf.sprintf "CornerType: unknown int %d" n)

let cornertype_to_int v =
  match v with
  | `TOP_LEFT -> 0
  | `BOTTOM_LEFT -> 1
  | `TOP_RIGHT -> 2
  | `BOTTOM_RIGHT -> 3

type cssparsererror = [ `FAILED | `SYNTAX | `IMPORT | `NAME | `UNKNOWN_VALUE ]

let cssparsererror_of_int n =
  match n with
  | 0 -> `FAILED
  | 1 -> `SYNTAX
  | 2 -> `IMPORT
  | 3 -> `NAME
  | 4 -> `UNKNOWN_VALUE
  | n -> failwith (Printf.sprintf "CssParserError: unknown int %d" n)

let cssparsererror_to_int v =
  match v with
  | `FAILED -> 0
  | `SYNTAX -> 1
  | `IMPORT -> 2
  | `NAME -> 3
  | `UNKNOWN_VALUE -> 4

type cssparserwarning = [ `DEPRECATED | `SYNTAX | `UNIMPLEMENTED ]

let cssparserwarning_of_int n =
  match n with
  | 0 -> `DEPRECATED
  | 1 -> `SYNTAX
  | 2 -> `UNIMPLEMENTED
  | n -> failwith (Printf.sprintf "CssParserWarning: unknown int %d" n)

let cssparserwarning_to_int v =
  match v with `DEPRECATED -> 0 | `SYNTAX -> 1 | `UNIMPLEMENTED -> 2

type deletetype =
  [ `CHARS
  | `WORD_ENDS
  | `WORDS
  | `DISPLAY_LINES
  | `DISPLAY_LINE_ENDS
  | `PARAGRAPH_ENDS
  | `PARAGRAPHS
  | `WHITESPACE ]

let deletetype_of_int n =
  match n with
  | 0 -> `CHARS
  | 1 -> `WORD_ENDS
  | 2 -> `WORDS
  | 3 -> `DISPLAY_LINES
  | 4 -> `DISPLAY_LINE_ENDS
  | 5 -> `PARAGRAPH_ENDS
  | 6 -> `PARAGRAPHS
  | 7 -> `WHITESPACE
  | n -> failwith (Printf.sprintf "DeleteType: unknown int %d" n)

let deletetype_to_int v =
  match v with
  | `CHARS -> 0
  | `WORD_ENDS -> 1
  | `WORDS -> 2
  | `DISPLAY_LINES -> 3
  | `DISPLAY_LINE_ENDS -> 4
  | `PARAGRAPH_ENDS -> 5
  | `PARAGRAPHS -> 6
  | `WHITESPACE -> 7

type dialogerror = [ `FAILED | `CANCELLED | `DISMISSED ]

let dialogerror_of_int n =
  match n with
  | 0 -> `FAILED
  | 1 -> `CANCELLED
  | 2 -> `DISMISSED
  | n -> failwith (Printf.sprintf "DialogError: unknown int %d" n)

let dialogerror_to_int v =
  match v with `FAILED -> 0 | `CANCELLED -> 1 | `DISMISSED -> 2

type directiontype =
  [ `TAB_FORWARD | `TAB_BACKWARD | `UP | `DOWN | `LEFT | `RIGHT ]

let directiontype_of_int n =
  match n with
  | 0 -> `TAB_FORWARD
  | 1 -> `TAB_BACKWARD
  | 2 -> `UP
  | 3 -> `DOWN
  | 4 -> `LEFT
  | 5 -> `RIGHT
  | n -> failwith (Printf.sprintf "DirectionType: unknown int %d" n)

let directiontype_to_int v =
  match v with
  | `TAB_FORWARD -> 0
  | `TAB_BACKWARD -> 1
  | `UP -> 2
  | `DOWN -> 3
  | `LEFT -> 4
  | `RIGHT -> 5

type editableproperties =
  [ `PROP_TEXT
  | `PROP_CURSOR_POSITION
  | `PROP_SELECTION_BOUND
  | `PROP_EDITABLE
  | `PROP_WIDTH_CHARS
  | `PROP_MAX_WIDTH_CHARS
  | `PROP_XALIGN
  | `PROP_ENABLE_UNDO
  | `NUM_PROPERTIES ]

let editableproperties_of_int n =
  match n with
  | 0 -> `PROP_TEXT
  | 1 -> `PROP_CURSOR_POSITION
  | 2 -> `PROP_SELECTION_BOUND
  | 3 -> `PROP_EDITABLE
  | 4 -> `PROP_WIDTH_CHARS
  | 5 -> `PROP_MAX_WIDTH_CHARS
  | 6 -> `PROP_XALIGN
  | 7 -> `PROP_ENABLE_UNDO
  | 8 -> `NUM_PROPERTIES
  | n -> failwith (Printf.sprintf "EditableProperties: unknown int %d" n)

let editableproperties_to_int v =
  match v with
  | `PROP_TEXT -> 0
  | `PROP_CURSOR_POSITION -> 1
  | `PROP_SELECTION_BOUND -> 2
  | `PROP_EDITABLE -> 3
  | `PROP_WIDTH_CHARS -> 4
  | `PROP_MAX_WIDTH_CHARS -> 5
  | `PROP_XALIGN -> 6
  | `PROP_ENABLE_UNDO -> 7
  | `NUM_PROPERTIES -> 8

type entryiconposition = [ `PRIMARY | `SECONDARY ]

let entryiconposition_of_int n =
  match n with
  | 0 -> `PRIMARY
  | 1 -> `SECONDARY
  | n -> failwith (Printf.sprintf "EntryIconPosition: unknown int %d" n)

let entryiconposition_to_int v = match v with `PRIMARY -> 0 | `SECONDARY -> 1

type eventsequencestate = [ `NONE | `CLAIMED | `DENIED ]

let eventsequencestate_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `CLAIMED
  | 2 -> `DENIED
  | n -> failwith (Printf.sprintf "EventSequenceState: unknown int %d" n)

let eventsequencestate_to_int v =
  match v with `NONE -> 0 | `CLAIMED -> 1 | `DENIED -> 2

type filechooseraction = [ `OPEN | `SAVE | `SELECT_FOLDER ]

let filechooseraction_of_int n =
  match n with
  | 0 -> `OPEN
  | 1 -> `SAVE
  | 2 -> `SELECT_FOLDER
  | n -> failwith (Printf.sprintf "FileChooserAction: unknown int %d" n)

let filechooseraction_to_int v =
  match v with `OPEN -> 0 | `SAVE -> 1 | `SELECT_FOLDER -> 2

type filechoosererror =
  [ `NONEXISTENT | `BAD_FILENAME | `ALREADY_EXISTS | `INCOMPLETE_HOSTNAME ]

let filechoosererror_of_int n =
  match n with
  | 0 -> `NONEXISTENT
  | 1 -> `BAD_FILENAME
  | 2 -> `ALREADY_EXISTS
  | 3 -> `INCOMPLETE_HOSTNAME
  | n -> failwith (Printf.sprintf "FileChooserError: unknown int %d" n)

let filechoosererror_to_int v =
  match v with
  | `NONEXISTENT -> 0
  | `BAD_FILENAME -> 1
  | `ALREADY_EXISTS -> 2
  | `INCOMPLETE_HOSTNAME -> 3

type filterchange = [ `DIFFERENT | `LESS_STRICT | `MORE_STRICT ]

let filterchange_of_int n =
  match n with
  | 0 -> `DIFFERENT
  | 1 -> `LESS_STRICT
  | 2 -> `MORE_STRICT
  | n -> failwith (Printf.sprintf "FilterChange: unknown int %d" n)

let filterchange_to_int v =
  match v with `DIFFERENT -> 0 | `LESS_STRICT -> 1 | `MORE_STRICT -> 2

type filtermatch = [ `SOME | `NONE | `ALL ]

let filtermatch_of_int n =
  match n with
  | 0 -> `SOME
  | 1 -> `NONE
  | 2 -> `ALL
  | n -> failwith (Printf.sprintf "FilterMatch: unknown int %d" n)

let filtermatch_to_int v = match v with `SOME -> 0 | `NONE -> 1 | `ALL -> 2

type fontlevel = [ `FAMILY | `FACE | `FONT | `FEATURES ]

let fontlevel_of_int n =
  match n with
  | 0 -> `FAMILY
  | 1 -> `FACE
  | 2 -> `FONT
  | 3 -> `FEATURES
  | n -> failwith (Printf.sprintf "FontLevel: unknown int %d" n)

let fontlevel_to_int v =
  match v with `FAMILY -> 0 | `FACE -> 1 | `FONT -> 2 | `FEATURES -> 3

type graphicsoffloadenabled = [ `ENABLED | `DISABLED ]

let graphicsoffloadenabled_of_int n =
  match n with
  | 0 -> `ENABLED
  | 1 -> `DISABLED
  | n -> failwith (Printf.sprintf "GraphicsOffloadEnabled: unknown int %d" n)

let graphicsoffloadenabled_to_int v =
  match v with `ENABLED -> 0 | `DISABLED -> 1

type iconsize = [ `INHERIT | `NORMAL | `LARGE ]

let iconsize_of_int n =
  match n with
  | 0 -> `INHERIT
  | 1 -> `NORMAL
  | 2 -> `LARGE
  | n -> failwith (Printf.sprintf "IconSize: unknown int %d" n)

let iconsize_to_int v =
  match v with `INHERIT -> 0 | `NORMAL -> 1 | `LARGE -> 2

type iconthemeerror = [ `NOT_FOUND | `FAILED ]

let iconthemeerror_of_int n =
  match n with
  | 0 -> `NOT_FOUND
  | 1 -> `FAILED
  | n -> failwith (Printf.sprintf "IconThemeError: unknown int %d" n)

let iconthemeerror_to_int v = match v with `NOT_FOUND -> 0 | `FAILED -> 1

type iconviewdropposition =
  [ `NO_DROP
  | `DROP_INTO
  | `DROP_LEFT
  | `DROP_RIGHT
  | `DROP_ABOVE
  | `DROP_BELOW ]

let iconviewdropposition_of_int n =
  match n with
  | 0 -> `NO_DROP
  | 1 -> `DROP_INTO
  | 2 -> `DROP_LEFT
  | 3 -> `DROP_RIGHT
  | 4 -> `DROP_ABOVE
  | 5 -> `DROP_BELOW
  | n -> failwith (Printf.sprintf "IconViewDropPosition: unknown int %d" n)

let iconviewdropposition_to_int v =
  match v with
  | `NO_DROP -> 0
  | `DROP_INTO -> 1
  | `DROP_LEFT -> 2
  | `DROP_RIGHT -> 3
  | `DROP_ABOVE -> 4
  | `DROP_BELOW -> 5

type imagetype = [ `EMPTY | `ICON_NAME | `GICON | `PAINTABLE ]

let imagetype_of_int n =
  match n with
  | 0 -> `EMPTY
  | 1 -> `ICON_NAME
  | 2 -> `GICON
  | 3 -> `PAINTABLE
  | n -> failwith (Printf.sprintf "ImageType: unknown int %d" n)

let imagetype_to_int v =
  match v with `EMPTY -> 0 | `ICON_NAME -> 1 | `GICON -> 2 | `PAINTABLE -> 3

type inputpurpose =
  [ `FREE_FORM
  | `ALPHA
  | `DIGITS
  | `NUMBER
  | `PHONE
  | `URL
  | `EMAIL
  | `NAME
  | `PASSWORD
  | `PIN
  | `TERMINAL ]

let inputpurpose_of_int n =
  match n with
  | 0 -> `FREE_FORM
  | 1 -> `ALPHA
  | 2 -> `DIGITS
  | 3 -> `NUMBER
  | 4 -> `PHONE
  | 5 -> `URL
  | 6 -> `EMAIL
  | 7 -> `NAME
  | 8 -> `PASSWORD
  | 9 -> `PIN
  | 10 -> `TERMINAL
  | n -> failwith (Printf.sprintf "InputPurpose: unknown int %d" n)

let inputpurpose_to_int v =
  match v with
  | `FREE_FORM -> 0
  | `ALPHA -> 1
  | `DIGITS -> 2
  | `NUMBER -> 3
  | `PHONE -> 4
  | `URL -> 5
  | `EMAIL -> 6
  | `NAME -> 7
  | `PASSWORD -> 8
  | `PIN -> 9
  | `TERMINAL -> 10

type inscriptionoverflow =
  [ `CLIP | `ELLIPSIZE_START | `ELLIPSIZE_MIDDLE | `ELLIPSIZE_END ]

let inscriptionoverflow_of_int n =
  match n with
  | 0 -> `CLIP
  | 1 -> `ELLIPSIZE_START
  | 2 -> `ELLIPSIZE_MIDDLE
  | 3 -> `ELLIPSIZE_END
  | n -> failwith (Printf.sprintf "InscriptionOverflow: unknown int %d" n)

let inscriptionoverflow_to_int v =
  match v with
  | `CLIP -> 0
  | `ELLIPSIZE_START -> 1
  | `ELLIPSIZE_MIDDLE -> 2
  | `ELLIPSIZE_END -> 3

type justification = [ `LEFT | `RIGHT | `CENTER | `FILL ]

let justification_of_int n =
  match n with
  | 0 -> `LEFT
  | 1 -> `RIGHT
  | 2 -> `CENTER
  | 3 -> `FILL
  | n -> failwith (Printf.sprintf "Justification: unknown int %d" n)

let justification_to_int v =
  match v with `LEFT -> 0 | `RIGHT -> 1 | `CENTER -> 2 | `FILL -> 3

type levelbarmode = [ `CONTINUOUS | `DISCRETE ]

let levelbarmode_of_int n =
  match n with
  | 0 -> `CONTINUOUS
  | 1 -> `DISCRETE
  | n -> failwith (Printf.sprintf "LevelBarMode: unknown int %d" n)

let levelbarmode_to_int v = match v with `CONTINUOUS -> 0 | `DISCRETE -> 1

type listtabbehavior = [ `ALL | `ITEM | `CELL ]

let listtabbehavior_of_int n =
  match n with
  | 0 -> `ALL
  | 1 -> `ITEM
  | 2 -> `CELL
  | n -> failwith (Printf.sprintf "ListTabBehavior: unknown int %d" n)

let listtabbehavior_to_int v =
  match v with `ALL -> 0 | `ITEM -> 1 | `CELL -> 2

type messagetype = [ `INFO | `WARNING | `QUESTION | `ERROR | `OTHER ]

let messagetype_of_int n =
  match n with
  | 0 -> `INFO
  | 1 -> `WARNING
  | 2 -> `QUESTION
  | 3 -> `ERROR
  | 4 -> `OTHER
  | n -> failwith (Printf.sprintf "MessageType: unknown int %d" n)

let messagetype_to_int v =
  match v with
  | `INFO -> 0
  | `WARNING -> 1
  | `QUESTION -> 2
  | `ERROR -> 3
  | `OTHER -> 4

type movementstep =
  [ `LOGICAL_POSITIONS
  | `VISUAL_POSITIONS
  | `WORDS
  | `DISPLAY_LINES
  | `DISPLAY_LINE_ENDS
  | `PARAGRAPHS
  | `PARAGRAPH_ENDS
  | `PAGES
  | `BUFFER_ENDS
  | `HORIZONTAL_PAGES ]

let movementstep_of_int n =
  match n with
  | 0 -> `LOGICAL_POSITIONS
  | 1 -> `VISUAL_POSITIONS
  | 2 -> `WORDS
  | 3 -> `DISPLAY_LINES
  | 4 -> `DISPLAY_LINE_ENDS
  | 5 -> `PARAGRAPHS
  | 6 -> `PARAGRAPH_ENDS
  | 7 -> `PAGES
  | 8 -> `BUFFER_ENDS
  | 9 -> `HORIZONTAL_PAGES
  | n -> failwith (Printf.sprintf "MovementStep: unknown int %d" n)

let movementstep_to_int v =
  match v with
  | `LOGICAL_POSITIONS -> 0
  | `VISUAL_POSITIONS -> 1
  | `WORDS -> 2
  | `DISPLAY_LINES -> 3
  | `DISPLAY_LINE_ENDS -> 4
  | `PARAGRAPHS -> 5
  | `PARAGRAPH_ENDS -> 6
  | `PAGES -> 7
  | `BUFFER_ENDS -> 8
  | `HORIZONTAL_PAGES -> 9

type naturalwrapmode = [ `INHERIT | `NONE | `WORD ]

let naturalwrapmode_of_int n =
  match n with
  | 0 -> `INHERIT
  | 1 -> `NONE
  | 2 -> `WORD
  | n -> failwith (Printf.sprintf "NaturalWrapMode: unknown int %d" n)

let naturalwrapmode_to_int v =
  match v with `INHERIT -> 0 | `NONE -> 1 | `WORD -> 2

type notebooktab = [ `FIRST | `LAST ]

let notebooktab_of_int n =
  match n with
  | 0 -> `FIRST
  | 1 -> `LAST
  | n -> failwith (Printf.sprintf "NotebookTab: unknown int %d" n)

let notebooktab_to_int v = match v with `FIRST -> 0 | `LAST -> 1

type numberuplayout =
  [ `LRTB | `LRBT | `RLTB | `RLBT | `TBLR | `TBRL | `BTLR | `BTRL ]

let numberuplayout_of_int n =
  match n with
  | 0 -> `LRTB
  | 1 -> `LRBT
  | 2 -> `RLTB
  | 3 -> `RLBT
  | 4 -> `TBLR
  | 5 -> `TBRL
  | 6 -> `BTLR
  | 7 -> `BTRL
  | n -> failwith (Printf.sprintf "NumberUpLayout: unknown int %d" n)

let numberuplayout_to_int v =
  match v with
  | `LRTB -> 0
  | `LRBT -> 1
  | `RLTB -> 2
  | `RLBT -> 3
  | `TBLR -> 4
  | `TBRL -> 5
  | `BTLR -> 6
  | `BTRL -> 7

type ordering = [ `SMALLER | `EQUAL | `LARGER ]

let ordering_of_int n =
  match n with
  | -1 -> `SMALLER
  | 0 -> `EQUAL
  | 1 -> `LARGER
  | n -> failwith (Printf.sprintf "Ordering: unknown int %d" n)

let ordering_to_int v =
  match v with `SMALLER -> -1 | `EQUAL -> 0 | `LARGER -> 1

type orientation = [ `HORIZONTAL | `VERTICAL ]

let orientation_of_int n =
  match n with
  | 0 -> `HORIZONTAL
  | 1 -> `VERTICAL
  | n -> failwith (Printf.sprintf "Orientation: unknown int %d" n)

let orientation_to_int v = match v with `HORIZONTAL -> 0 | `VERTICAL -> 1

type overflow = [ `VISIBLE | `HIDDEN ]

let overflow_of_int n =
  match n with
  | 0 -> `VISIBLE
  | 1 -> `HIDDEN
  | n -> failwith (Printf.sprintf "Overflow: unknown int %d" n)

let overflow_to_int v = match v with `VISIBLE -> 0 | `HIDDEN -> 1

type packtype = [ `START | `END ]

let packtype_of_int n =
  match n with
  | 0 -> `START
  | 1 -> `END
  | n -> failwith (Printf.sprintf "PackType: unknown int %d" n)

let packtype_to_int v = match v with `START -> 0 | `END -> 1

type padactiontype = [ `BUTTON | `RING | `STRIP ]

let padactiontype_of_int n =
  match n with
  | 0 -> `BUTTON
  | 1 -> `RING
  | 2 -> `STRIP
  | n -> failwith (Printf.sprintf "PadActionType: unknown int %d" n)

let padactiontype_to_int v =
  match v with `BUTTON -> 0 | `RING -> 1 | `STRIP -> 2

type pageorientation =
  [ `PORTRAIT | `LANDSCAPE | `REVERSE_PORTRAIT | `REVERSE_LANDSCAPE ]

let pageorientation_of_int n =
  match n with
  | 0 -> `PORTRAIT
  | 1 -> `LANDSCAPE
  | 2 -> `REVERSE_PORTRAIT
  | 3 -> `REVERSE_LANDSCAPE
  | n -> failwith (Printf.sprintf "PageOrientation: unknown int %d" n)

let pageorientation_to_int v =
  match v with
  | `PORTRAIT -> 0
  | `LANDSCAPE -> 1
  | `REVERSE_PORTRAIT -> 2
  | `REVERSE_LANDSCAPE -> 3

type pageset = [ `ALL | `EVEN | `ODD ]

let pageset_of_int n =
  match n with
  | 0 -> `ALL
  | 1 -> `EVEN
  | 2 -> `ODD
  | n -> failwith (Printf.sprintf "PageSet: unknown int %d" n)

let pageset_to_int v = match v with `ALL -> 0 | `EVEN -> 1 | `ODD -> 2

type pandirection = [ `LEFT | `RIGHT | `UP | `DOWN ]

let pandirection_of_int n =
  match n with
  | 0 -> `LEFT
  | 1 -> `RIGHT
  | 2 -> `UP
  | 3 -> `DOWN
  | n -> failwith (Printf.sprintf "PanDirection: unknown int %d" n)

let pandirection_to_int v =
  match v with `LEFT -> 0 | `RIGHT -> 1 | `UP -> 2 | `DOWN -> 3

type policytype = [ `ALWAYS | `AUTOMATIC | `NEVER | `EXTERNAL ]

let policytype_of_int n =
  match n with
  | 0 -> `ALWAYS
  | 1 -> `AUTOMATIC
  | 2 -> `NEVER
  | 3 -> `EXTERNAL
  | n -> failwith (Printf.sprintf "PolicyType: unknown int %d" n)

let policytype_to_int v =
  match v with `ALWAYS -> 0 | `AUTOMATIC -> 1 | `NEVER -> 2 | `EXTERNAL -> 3

type positiontype = [ `LEFT | `RIGHT | `TOP | `BOTTOM ]

let positiontype_of_int n =
  match n with
  | 0 -> `LEFT
  | 1 -> `RIGHT
  | 2 -> `TOP
  | 3 -> `BOTTOM
  | n -> failwith (Printf.sprintf "PositionType: unknown int %d" n)

let positiontype_to_int v =
  match v with `LEFT -> 0 | `RIGHT -> 1 | `TOP -> 2 | `BOTTOM -> 3

type printduplex = [ `SIMPLEX | `HORIZONTAL | `VERTICAL ]

let printduplex_of_int n =
  match n with
  | 0 -> `SIMPLEX
  | 1 -> `HORIZONTAL
  | 2 -> `VERTICAL
  | n -> failwith (Printf.sprintf "PrintDuplex: unknown int %d" n)

let printduplex_to_int v =
  match v with `SIMPLEX -> 0 | `HORIZONTAL -> 1 | `VERTICAL -> 2

type printerror = [ `GENERAL | `INTERNAL_ERROR | `NOMEM | `INVALID_FILE ]

let printerror_of_int n =
  match n with
  | 0 -> `GENERAL
  | 1 -> `INTERNAL_ERROR
  | 2 -> `NOMEM
  | 3 -> `INVALID_FILE
  | n -> failwith (Printf.sprintf "PrintError: unknown int %d" n)

let printerror_to_int v =
  match v with
  | `GENERAL -> 0
  | `INTERNAL_ERROR -> 1
  | `NOMEM -> 2
  | `INVALID_FILE -> 3

type printoperationaction = [ `PRINT_DIALOG | `PRINT | `PREVIEW | `EXPORT ]

let printoperationaction_of_int n =
  match n with
  | 0 -> `PRINT_DIALOG
  | 1 -> `PRINT
  | 2 -> `PREVIEW
  | 3 -> `EXPORT
  | n -> failwith (Printf.sprintf "PrintOperationAction: unknown int %d" n)

let printoperationaction_to_int v =
  match v with `PRINT_DIALOG -> 0 | `PRINT -> 1 | `PREVIEW -> 2 | `EXPORT -> 3

type printoperationresult = [ `ERROR | `APPLY | `CANCEL | `IN_PROGRESS ]

let printoperationresult_of_int n =
  match n with
  | 0 -> `ERROR
  | 1 -> `APPLY
  | 2 -> `CANCEL
  | 3 -> `IN_PROGRESS
  | n -> failwith (Printf.sprintf "PrintOperationResult: unknown int %d" n)

let printoperationresult_to_int v =
  match v with `ERROR -> 0 | `APPLY -> 1 | `CANCEL -> 2 | `IN_PROGRESS -> 3

type printpages = [ `ALL | `CURRENT | `RANGES | `SELECTION ]

let printpages_of_int n =
  match n with
  | 0 -> `ALL
  | 1 -> `CURRENT
  | 2 -> `RANGES
  | 3 -> `SELECTION
  | n -> failwith (Printf.sprintf "PrintPages: unknown int %d" n)

let printpages_to_int v =
  match v with `ALL -> 0 | `CURRENT -> 1 | `RANGES -> 2 | `SELECTION -> 3

type printquality = [ `LOW | `NORMAL | `HIGH | `DRAFT ]

let printquality_of_int n =
  match n with
  | 0 -> `LOW
  | 1 -> `NORMAL
  | 2 -> `HIGH
  | 3 -> `DRAFT
  | n -> failwith (Printf.sprintf "PrintQuality: unknown int %d" n)

let printquality_to_int v =
  match v with `LOW -> 0 | `NORMAL -> 1 | `HIGH -> 2 | `DRAFT -> 3

type printstatus =
  [ `INITIAL
  | `PREPARING
  | `GENERATING_DATA
  | `SENDING_DATA
  | `PENDING
  | `PENDING_ISSUE
  | `PRINTING
  | `FINISHED
  | `FINISHED_ABORTED ]

let printstatus_of_int n =
  match n with
  | 0 -> `INITIAL
  | 1 -> `PREPARING
  | 2 -> `GENERATING_DATA
  | 3 -> `SENDING_DATA
  | 4 -> `PENDING
  | 5 -> `PENDING_ISSUE
  | 6 -> `PRINTING
  | 7 -> `FINISHED
  | 8 -> `FINISHED_ABORTED
  | n -> failwith (Printf.sprintf "PrintStatus: unknown int %d" n)

let printstatus_to_int v =
  match v with
  | `INITIAL -> 0
  | `PREPARING -> 1
  | `GENERATING_DATA -> 2
  | `SENDING_DATA -> 3
  | `PENDING -> 4
  | `PENDING_ISSUE -> 5
  | `PRINTING -> 6
  | `FINISHED -> 7
  | `FINISHED_ABORTED -> 8

type propagationlimit = [ `NONE | `SAME_NATIVE ]

let propagationlimit_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SAME_NATIVE
  | n -> failwith (Printf.sprintf "PropagationLimit: unknown int %d" n)

let propagationlimit_to_int v = match v with `NONE -> 0 | `SAME_NATIVE -> 1

type propagationphase = [ `NONE | `CAPTURE | `BUBBLE | `TARGET ]

let propagationphase_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `CAPTURE
  | 2 -> `BUBBLE
  | 3 -> `TARGET
  | n -> failwith (Printf.sprintf "PropagationPhase: unknown int %d" n)

let propagationphase_to_int v =
  match v with `NONE -> 0 | `CAPTURE -> 1 | `BUBBLE -> 2 | `TARGET -> 3

type recentmanagererror =
  [ `NOT_FOUND
  | `INVALID_URI
  | `INVALID_ENCODING
  | `NOT_REGISTERED
  | `READ
  | `WRITE
  | `UNKNOWN ]

let recentmanagererror_of_int n =
  match n with
  | 0 -> `NOT_FOUND
  | 1 -> `INVALID_URI
  | 2 -> `INVALID_ENCODING
  | 3 -> `NOT_REGISTERED
  | 4 -> `READ
  | 5 -> `WRITE
  | 6 -> `UNKNOWN
  | n -> failwith (Printf.sprintf "RecentManagerError: unknown int %d" n)

let recentmanagererror_to_int v =
  match v with
  | `NOT_FOUND -> 0
  | `INVALID_URI -> 1
  | `INVALID_ENCODING -> 2
  | `NOT_REGISTERED -> 3
  | `READ -> 4
  | `WRITE -> 5
  | `UNKNOWN -> 6

type responsetype =
  [ `NONE
  | `REJECT
  | `ACCEPT
  | `DELETE_EVENT
  | `OK
  | `CANCEL
  | `CLOSE
  | `YES
  | `NO
  | `APPLY
  | `HELP ]

let responsetype_of_int n =
  match n with
  | -1 -> `NONE
  | -2 -> `REJECT
  | -3 -> `ACCEPT
  | -4 -> `DELETE_EVENT
  | -5 -> `OK
  | -6 -> `CANCEL
  | -7 -> `CLOSE
  | -8 -> `YES
  | -9 -> `NO
  | -10 -> `APPLY
  | -11 -> `HELP
  | n -> failwith (Printf.sprintf "ResponseType: unknown int %d" n)

let responsetype_to_int v =
  match v with
  | `NONE -> -1
  | `REJECT -> -2
  | `ACCEPT -> -3
  | `DELETE_EVENT -> -4
  | `OK -> -5
  | `CANCEL -> -6
  | `CLOSE -> -7
  | `YES -> -8
  | `NO -> -9
  | `APPLY -> -10
  | `HELP -> -11

type revealertransitiontype =
  [ `NONE
  | `CROSSFADE
  | `SLIDE_RIGHT
  | `SLIDE_LEFT
  | `SLIDE_UP
  | `SLIDE_DOWN
  | `SWING_RIGHT
  | `SWING_LEFT
  | `SWING_UP
  | `SWING_DOWN ]

let revealertransitiontype_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `CROSSFADE
  | 2 -> `SLIDE_RIGHT
  | 3 -> `SLIDE_LEFT
  | 4 -> `SLIDE_UP
  | 5 -> `SLIDE_DOWN
  | 6 -> `SWING_RIGHT
  | 7 -> `SWING_LEFT
  | 8 -> `SWING_UP
  | 9 -> `SWING_DOWN
  | n -> failwith (Printf.sprintf "RevealerTransitionType: unknown int %d" n)

let revealertransitiontype_to_int v =
  match v with
  | `NONE -> 0
  | `CROSSFADE -> 1
  | `SLIDE_RIGHT -> 2
  | `SLIDE_LEFT -> 3
  | `SLIDE_UP -> 4
  | `SLIDE_DOWN -> 5
  | `SWING_RIGHT -> 6
  | `SWING_LEFT -> 7
  | `SWING_UP -> 8
  | `SWING_DOWN -> 9

type scrollstep =
  [ `STEPS
  | `PAGES
  | `ENDS
  | `HORIZONTAL_STEPS
  | `HORIZONTAL_PAGES
  | `HORIZONTAL_ENDS ]

let scrollstep_of_int n =
  match n with
  | 0 -> `STEPS
  | 1 -> `PAGES
  | 2 -> `ENDS
  | 3 -> `HORIZONTAL_STEPS
  | 4 -> `HORIZONTAL_PAGES
  | 5 -> `HORIZONTAL_ENDS
  | n -> failwith (Printf.sprintf "ScrollStep: unknown int %d" n)

let scrollstep_to_int v =
  match v with
  | `STEPS -> 0
  | `PAGES -> 1
  | `ENDS -> 2
  | `HORIZONTAL_STEPS -> 3
  | `HORIZONTAL_PAGES -> 4
  | `HORIZONTAL_ENDS -> 5

type scrolltype =
  [ `NONE
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
  | `END ]

let scrolltype_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `JUMP
  | 2 -> `STEP_BACKWARD
  | 3 -> `STEP_FORWARD
  | 4 -> `PAGE_BACKWARD
  | 5 -> `PAGE_FORWARD
  | 6 -> `STEP_UP
  | 7 -> `STEP_DOWN
  | 8 -> `PAGE_UP
  | 9 -> `PAGE_DOWN
  | 10 -> `STEP_LEFT
  | 11 -> `STEP_RIGHT
  | 12 -> `PAGE_LEFT
  | 13 -> `PAGE_RIGHT
  | 14 -> `START
  | 15 -> `END
  | n -> failwith (Printf.sprintf "ScrollType: unknown int %d" n)

let scrolltype_to_int v =
  match v with
  | `NONE -> 0
  | `JUMP -> 1
  | `STEP_BACKWARD -> 2
  | `STEP_FORWARD -> 3
  | `PAGE_BACKWARD -> 4
  | `PAGE_FORWARD -> 5
  | `STEP_UP -> 6
  | `STEP_DOWN -> 7
  | `PAGE_UP -> 8
  | `PAGE_DOWN -> 9
  | `STEP_LEFT -> 10
  | `STEP_RIGHT -> 11
  | `PAGE_LEFT -> 12
  | `PAGE_RIGHT -> 13
  | `START -> 14
  | `END -> 15

type scrollablepolicy = [ `MINIMUM | `NATURAL ]

let scrollablepolicy_of_int n =
  match n with
  | 0 -> `MINIMUM
  | 1 -> `NATURAL
  | n -> failwith (Printf.sprintf "ScrollablePolicy: unknown int %d" n)

let scrollablepolicy_to_int v = match v with `MINIMUM -> 0 | `NATURAL -> 1

type selectionmode = [ `NONE | `SINGLE | `BROWSE | `MULTIPLE ]

let selectionmode_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `SINGLE
  | 2 -> `BROWSE
  | 3 -> `MULTIPLE
  | n -> failwith (Printf.sprintf "SelectionMode: unknown int %d" n)

let selectionmode_to_int v =
  match v with `NONE -> 0 | `SINGLE -> 1 | `BROWSE -> 2 | `MULTIPLE -> 3

type sensitivitytype = [ `AUTO | `ON | `OFF ]

let sensitivitytype_of_int n =
  match n with
  | 0 -> `AUTO
  | 1 -> `ON
  | 2 -> `OFF
  | n -> failwith (Printf.sprintf "SensitivityType: unknown int %d" n)

let sensitivitytype_to_int v = match v with `AUTO -> 0 | `ON -> 1 | `OFF -> 2

type shortcutscope = [ `LOCAL | `MANAGED | `GLOBAL ]

let shortcutscope_of_int n =
  match n with
  | 0 -> `LOCAL
  | 1 -> `MANAGED
  | 2 -> `GLOBAL
  | n -> failwith (Printf.sprintf "ShortcutScope: unknown int %d" n)

let shortcutscope_to_int v =
  match v with `LOCAL -> 0 | `MANAGED -> 1 | `GLOBAL -> 2

type shortcuttype =
  [ `ACCELERATOR
  | `GESTURE_PINCH
  | `GESTURE_STRETCH
  | `GESTURE_ROTATE_CLOCKWISE
  | `GESTURE_ROTATE_COUNTERCLOCKWISE
  | `GESTURE_TWO_FINGER_SWIPE_LEFT
  | `GESTURE_TWO_FINGER_SWIPE_RIGHT
  | `GESTURE
  | `GESTURE_SWIPE_LEFT
  | `GESTURE_SWIPE_RIGHT ]

let shortcuttype_of_int n =
  match n with
  | 0 -> `ACCELERATOR
  | 1 -> `GESTURE_PINCH
  | 2 -> `GESTURE_STRETCH
  | 3 -> `GESTURE_ROTATE_CLOCKWISE
  | 4 -> `GESTURE_ROTATE_COUNTERCLOCKWISE
  | 5 -> `GESTURE_TWO_FINGER_SWIPE_LEFT
  | 6 -> `GESTURE_TWO_FINGER_SWIPE_RIGHT
  | 7 -> `GESTURE
  | 8 -> `GESTURE_SWIPE_LEFT
  | 9 -> `GESTURE_SWIPE_RIGHT
  | n -> failwith (Printf.sprintf "ShortcutType: unknown int %d" n)

let shortcuttype_to_int v =
  match v with
  | `ACCELERATOR -> 0
  | `GESTURE_PINCH -> 1
  | `GESTURE_STRETCH -> 2
  | `GESTURE_ROTATE_CLOCKWISE -> 3
  | `GESTURE_ROTATE_COUNTERCLOCKWISE -> 4
  | `GESTURE_TWO_FINGER_SWIPE_LEFT -> 5
  | `GESTURE_TWO_FINGER_SWIPE_RIGHT -> 6
  | `GESTURE -> 7
  | `GESTURE_SWIPE_LEFT -> 8
  | `GESTURE_SWIPE_RIGHT -> 9

type sizegroupmode = [ `NONE | `HORIZONTAL | `VERTICAL | `BOTH ]

let sizegroupmode_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `HORIZONTAL
  | 2 -> `VERTICAL
  | 3 -> `BOTH
  | n -> failwith (Printf.sprintf "SizeGroupMode: unknown int %d" n)

let sizegroupmode_to_int v =
  match v with `NONE -> 0 | `HORIZONTAL -> 1 | `VERTICAL -> 2 | `BOTH -> 3

type sizerequestmode = [ `HEIGHT_FOR_WIDTH | `WIDTH_FOR_HEIGHT | `CONSTANT_SIZE ]

let sizerequestmode_of_int n =
  match n with
  | 0 -> `HEIGHT_FOR_WIDTH
  | 1 -> `WIDTH_FOR_HEIGHT
  | 2 -> `CONSTANT_SIZE
  | n -> failwith (Printf.sprintf "SizeRequestMode: unknown int %d" n)

let sizerequestmode_to_int v =
  match v with
  | `HEIGHT_FOR_WIDTH -> 0
  | `WIDTH_FOR_HEIGHT -> 1
  | `CONSTANT_SIZE -> 2

type sorttype = [ `ASCENDING | `DESCENDING ]

let sorttype_of_int n =
  match n with
  | 0 -> `ASCENDING
  | 1 -> `DESCENDING
  | n -> failwith (Printf.sprintf "SortType: unknown int %d" n)

let sorttype_to_int v = match v with `ASCENDING -> 0 | `DESCENDING -> 1

type sorterchange = [ `DIFFERENT | `INVERTED | `LESS_STRICT | `MORE_STRICT ]

let sorterchange_of_int n =
  match n with
  | 0 -> `DIFFERENT
  | 1 -> `INVERTED
  | 2 -> `LESS_STRICT
  | 3 -> `MORE_STRICT
  | n -> failwith (Printf.sprintf "SorterChange: unknown int %d" n)

let sorterchange_to_int v =
  match v with
  | `DIFFERENT -> 0
  | `INVERTED -> 1
  | `LESS_STRICT -> 2
  | `MORE_STRICT -> 3

type sorterorder = [ `PARTIAL | `NONE | `TOTAL ]

let sorterorder_of_int n =
  match n with
  | 0 -> `PARTIAL
  | 1 -> `NONE
  | 2 -> `TOTAL
  | n -> failwith (Printf.sprintf "SorterOrder: unknown int %d" n)

let sorterorder_to_int v =
  match v with `PARTIAL -> 0 | `NONE -> 1 | `TOTAL -> 2

type spinbuttonupdatepolicy = [ `ALWAYS | `IF_VALID ]

let spinbuttonupdatepolicy_of_int n =
  match n with
  | 0 -> `ALWAYS
  | 1 -> `IF_VALID
  | n -> failwith (Printf.sprintf "SpinButtonUpdatePolicy: unknown int %d" n)

let spinbuttonupdatepolicy_to_int v =
  match v with `ALWAYS -> 0 | `IF_VALID -> 1

type spintype =
  [ `STEP_FORWARD
  | `STEP_BACKWARD
  | `PAGE_FORWARD
  | `PAGE_BACKWARD
  | `HOME
  | `END
  | `USER_DEFINED ]

let spintype_of_int n =
  match n with
  | 0 -> `STEP_FORWARD
  | 1 -> `STEP_BACKWARD
  | 2 -> `PAGE_FORWARD
  | 3 -> `PAGE_BACKWARD
  | 4 -> `HOME
  | 5 -> `END
  | 6 -> `USER_DEFINED
  | n -> failwith (Printf.sprintf "SpinType: unknown int %d" n)

let spintype_to_int v =
  match v with
  | `STEP_FORWARD -> 0
  | `STEP_BACKWARD -> 1
  | `PAGE_FORWARD -> 2
  | `PAGE_BACKWARD -> 3
  | `HOME -> 4
  | `END -> 5
  | `USER_DEFINED -> 6

type stacktransitiontype =
  [ `NONE
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
  | `ROTATE_LEFT_RIGHT ]

let stacktransitiontype_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `CROSSFADE
  | 2 -> `SLIDE_RIGHT
  | 3 -> `SLIDE_LEFT
  | 4 -> `SLIDE_UP
  | 5 -> `SLIDE_DOWN
  | 6 -> `SLIDE_LEFT_RIGHT
  | 7 -> `SLIDE_UP_DOWN
  | 8 -> `OVER_UP
  | 9 -> `OVER_DOWN
  | 10 -> `OVER_LEFT
  | 11 -> `OVER_RIGHT
  | 12 -> `UNDER_UP
  | 13 -> `UNDER_DOWN
  | 14 -> `UNDER_LEFT
  | 15 -> `UNDER_RIGHT
  | 16 -> `OVER_UP_DOWN
  | 17 -> `OVER_DOWN_UP
  | 18 -> `OVER_LEFT_RIGHT
  | 19 -> `OVER_RIGHT_LEFT
  | 20 -> `ROTATE_LEFT
  | 21 -> `ROTATE_RIGHT
  | 22 -> `ROTATE_LEFT_RIGHT
  | n -> failwith (Printf.sprintf "StackTransitionType: unknown int %d" n)

let stacktransitiontype_to_int v =
  match v with
  | `NONE -> 0
  | `CROSSFADE -> 1
  | `SLIDE_RIGHT -> 2
  | `SLIDE_LEFT -> 3
  | `SLIDE_UP -> 4
  | `SLIDE_DOWN -> 5
  | `SLIDE_LEFT_RIGHT -> 6
  | `SLIDE_UP_DOWN -> 7
  | `OVER_UP -> 8
  | `OVER_DOWN -> 9
  | `OVER_LEFT -> 10
  | `OVER_RIGHT -> 11
  | `UNDER_UP -> 12
  | `UNDER_DOWN -> 13
  | `UNDER_LEFT -> 14
  | `UNDER_RIGHT -> 15
  | `OVER_UP_DOWN -> 16
  | `OVER_DOWN_UP -> 17
  | `OVER_LEFT_RIGHT -> 18
  | `OVER_RIGHT_LEFT -> 19
  | `ROTATE_LEFT -> 20
  | `ROTATE_RIGHT -> 21
  | `ROTATE_LEFT_RIGHT -> 22

type stringfiltermatchmode = [ `EXACT | `SUBSTRING | `PREFIX ]

let stringfiltermatchmode_of_int n =
  match n with
  | 0 -> `EXACT
  | 1 -> `SUBSTRING
  | 2 -> `PREFIX
  | n -> failwith (Printf.sprintf "StringFilterMatchMode: unknown int %d" n)

let stringfiltermatchmode_to_int v =
  match v with `EXACT -> 0 | `SUBSTRING -> 1 | `PREFIX -> 2

type symboliccolor = [ `FOREGROUND | `ERROR | `WARNING | `SUCCESS ]

let symboliccolor_of_int n =
  match n with
  | 0 -> `FOREGROUND
  | 1 -> `ERROR
  | 2 -> `WARNING
  | 3 -> `SUCCESS
  | n -> failwith (Printf.sprintf "SymbolicColor: unknown int %d" n)

let symboliccolor_to_int v =
  match v with `FOREGROUND -> 0 | `ERROR -> 1 | `WARNING -> 2 | `SUCCESS -> 3

type systemsetting =
  [ `DPI | `FONT_NAME | `FONT_CONFIG | `DISPLAY | `ICON_THEME ]

let systemsetting_of_int n =
  match n with
  | 0 -> `DPI
  | 1 -> `FONT_NAME
  | 2 -> `FONT_CONFIG
  | 3 -> `DISPLAY
  | 4 -> `ICON_THEME
  | n -> failwith (Printf.sprintf "SystemSetting: unknown int %d" n)

let systemsetting_to_int v =
  match v with
  | `DPI -> 0
  | `FONT_NAME -> 1
  | `FONT_CONFIG -> 2
  | `DISPLAY -> 3
  | `ICON_THEME -> 4

type textdirection = [ `NONE | `LTR | `RTL ]

let textdirection_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `LTR
  | 2 -> `RTL
  | n -> failwith (Printf.sprintf "TextDirection: unknown int %d" n)

let textdirection_to_int v = match v with `NONE -> 0 | `LTR -> 1 | `RTL -> 2

type textextendselection = [ `WORD | `LINE ]

let textextendselection_of_int n =
  match n with
  | 0 -> `WORD
  | 1 -> `LINE
  | n -> failwith (Printf.sprintf "TextExtendSelection: unknown int %d" n)

let textextendselection_to_int v = match v with `WORD -> 0 | `LINE -> 1

type textviewlayer = [ `BELOW_TEXT | `ABOVE_TEXT ]

let textviewlayer_of_int n =
  match n with
  | 0 -> `BELOW_TEXT
  | 1 -> `ABOVE_TEXT
  | n -> failwith (Printf.sprintf "TextViewLayer: unknown int %d" n)

let textviewlayer_to_int v = match v with `BELOW_TEXT -> 0 | `ABOVE_TEXT -> 1

type textwindowtype = [ `WIDGET | `TEXT | `LEFT | `RIGHT | `TOP | `BOTTOM ]

let textwindowtype_of_int n =
  match n with
  | 1 -> `WIDGET
  | 2 -> `TEXT
  | 3 -> `LEFT
  | 4 -> `RIGHT
  | 5 -> `TOP
  | 6 -> `BOTTOM
  | n -> failwith (Printf.sprintf "TextWindowType: unknown int %d" n)

let textwindowtype_to_int v =
  match v with
  | `WIDGET -> 1
  | `TEXT -> 2
  | `LEFT -> 3
  | `RIGHT -> 4
  | `TOP -> 5
  | `BOTTOM -> 6

type treeviewcolumnsizing = [ `GROW_ONLY | `AUTOSIZE | `FIXED ]

let treeviewcolumnsizing_of_int n =
  match n with
  | 0 -> `GROW_ONLY
  | 1 -> `AUTOSIZE
  | 2 -> `FIXED
  | n -> failwith (Printf.sprintf "TreeViewColumnSizing: unknown int %d" n)

let treeviewcolumnsizing_to_int v =
  match v with `GROW_ONLY -> 0 | `AUTOSIZE -> 1 | `FIXED -> 2

type treeviewdropposition =
  [ `BEFORE | `AFTER | `INTO_OR_BEFORE | `INTO_OR_AFTER ]

let treeviewdropposition_of_int n =
  match n with
  | 0 -> `BEFORE
  | 1 -> `AFTER
  | 2 -> `INTO_OR_BEFORE
  | 3 -> `INTO_OR_AFTER
  | n -> failwith (Printf.sprintf "TreeViewDropPosition: unknown int %d" n)

let treeviewdropposition_to_int v =
  match v with
  | `BEFORE -> 0
  | `AFTER -> 1
  | `INTO_OR_BEFORE -> 2
  | `INTO_OR_AFTER -> 3

type treeviewgridlines = [ `NONE | `HORIZONTAL | `VERTICAL | `BOTH ]

let treeviewgridlines_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `HORIZONTAL
  | 2 -> `VERTICAL
  | 3 -> `BOTH
  | n -> failwith (Printf.sprintf "TreeViewGridLines: unknown int %d" n)

let treeviewgridlines_to_int v =
  match v with `NONE -> 0 | `HORIZONTAL -> 1 | `VERTICAL -> 2 | `BOTH -> 3

type unit = [ `NONE | `POINTS | `INCH | `MM ]

let unit_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `POINTS
  | 2 -> `INCH
  | 3 -> `MM
  | n -> failwith (Printf.sprintf "Unit: unknown int %d" n)

let unit_to_int v =
  match v with `NONE -> 0 | `POINTS -> 1 | `INCH -> 2 | `MM -> 3

type wrapmode = [ `NONE | `CHAR | `WORD | `WORD_CHAR ]

let wrapmode_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `CHAR
  | 2 -> `WORD
  | 3 -> `WORD_CHAR
  | n -> failwith (Printf.sprintf "WrapMode: unknown int %d" n)

let wrapmode_to_int v =
  match v with `NONE -> 0 | `CHAR -> 1 | `WORD -> 2 | `WORD_CHAR -> 3

type applicationinhibitflags_flag = [ `LOGOUT | `SWITCH | `SUSPEND | `IDLE ]
type applicationinhibitflags = applicationinhibitflags_flag list

let applicationinhibitflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `LOGOUT :: acc else acc in
  let acc = if flags land 2 <> 0 then `SWITCH :: acc else acc in
  let acc = if flags land 4 <> 0 then `SUSPEND :: acc else acc in
  let acc = if flags land 8 <> 0 then `IDLE :: acc else acc in
  acc

let applicationinhibitflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `LOGOUT -> acc lor 1
      | `SWITCH -> acc lor 2
      | `SUSPEND -> acc lor 4
      | `IDLE -> acc lor 8)
    0 flags

type builderclosureflags_flag = [ `SWAPPED ]
type builderclosureflags = builderclosureflags_flag list

let builderclosureflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `SWAPPED :: acc else acc in
  acc

let builderclosureflags_to_int flags =
  List.fold_left
    (fun acc flag -> match flag with `SWAPPED -> acc lor 1)
    0 flags

type cellrendererstate_flag =
  [ `SELECTED
  | `PRELIT
  | `INSENSITIVE
  | `SORTED
  | `FOCUSED
  | `EXPANDABLE
  | `EXPANDED ]

type cellrendererstate = cellrendererstate_flag list

let cellrendererstate_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `SELECTED :: acc else acc in
  let acc = if flags land 2 <> 0 then `PRELIT :: acc else acc in
  let acc = if flags land 4 <> 0 then `INSENSITIVE :: acc else acc in
  let acc = if flags land 8 <> 0 then `SORTED :: acc else acc in
  let acc = if flags land 16 <> 0 then `FOCUSED :: acc else acc in
  let acc = if flags land 32 <> 0 then `EXPANDABLE :: acc else acc in
  let acc = if flags land 64 <> 0 then `EXPANDED :: acc else acc in
  acc

let cellrendererstate_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `SELECTED -> acc lor 1
      | `PRELIT -> acc lor 2
      | `INSENSITIVE -> acc lor 4
      | `SORTED -> acc lor 8
      | `FOCUSED -> acc lor 16
      | `EXPANDABLE -> acc lor 32
      | `EXPANDED -> acc lor 64)
    0 flags

type debugflags_flag =
  [ `TEXT
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
  | `INVERT_TEXT_DIR ]

type debugflags = debugflags_flag list

let debugflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `TEXT :: acc else acc in
  let acc = if flags land 2 <> 0 then `TREE :: acc else acc in
  let acc = if flags land 4 <> 0 then `KEYBINDINGS :: acc else acc in
  let acc = if flags land 8 <> 0 then `MODULES :: acc else acc in
  let acc = if flags land 16 <> 0 then `GEOMETRY :: acc else acc in
  let acc = if flags land 32 <> 0 then `ICONTHEME :: acc else acc in
  let acc = if flags land 64 <> 0 then `PRINTING :: acc else acc in
  let acc = if flags land 128 <> 0 then `BUILDER :: acc else acc in
  let acc = if flags land 256 <> 0 then `SIZE_REQUEST :: acc else acc in
  let acc = if flags land 512 <> 0 then `NO_CSS_CACHE :: acc else acc in
  let acc = if flags land 1024 <> 0 then `INTERACTIVE :: acc else acc in
  let acc = if flags land 4096 <> 0 then `ACTIONS :: acc else acc in
  let acc = if flags land 8192 <> 0 then `LAYOUT :: acc else acc in
  let acc = if flags land 16384 <> 0 then `SNAPSHOT :: acc else acc in
  let acc = if flags land 32768 <> 0 then `CONSTRAINTS :: acc else acc in
  let acc = if flags land 65536 <> 0 then `BUILDER_OBJECTS :: acc else acc in
  let acc = if flags land 131072 <> 0 then `A11Y :: acc else acc in
  let acc = if flags land 262144 <> 0 then `ICONFALLBACK :: acc else acc in
  let acc = if flags land 524288 <> 0 then `INVERT_TEXT_DIR :: acc else acc in
  acc

let debugflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `TEXT -> acc lor 1
      | `TREE -> acc lor 2
      | `KEYBINDINGS -> acc lor 4
      | `MODULES -> acc lor 8
      | `GEOMETRY -> acc lor 16
      | `ICONTHEME -> acc lor 32
      | `PRINTING -> acc lor 64
      | `BUILDER -> acc lor 128
      | `SIZE_REQUEST -> acc lor 256
      | `NO_CSS_CACHE -> acc lor 512
      | `INTERACTIVE -> acc lor 1024
      | `ACTIONS -> acc lor 4096
      | `LAYOUT -> acc lor 8192
      | `SNAPSHOT -> acc lor 16384
      | `CONSTRAINTS -> acc lor 32768
      | `BUILDER_OBJECTS -> acc lor 65536
      | `A11Y -> acc lor 131072
      | `ICONFALLBACK -> acc lor 262144
      | `INVERT_TEXT_DIR -> acc lor 524288)
    0 flags

type dialogflags_flag = [ `MODAL | `DESTROY_WITH_PARENT | `USE_HEADER_BAR ]
type dialogflags = dialogflags_flag list

let dialogflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `MODAL :: acc else acc in
  let acc = if flags land 2 <> 0 then `DESTROY_WITH_PARENT :: acc else acc in
  let acc = if flags land 4 <> 0 then `USE_HEADER_BAR :: acc else acc in
  acc

let dialogflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `MODAL -> acc lor 1
      | `DESTROY_WITH_PARENT -> acc lor 2
      | `USE_HEADER_BAR -> acc lor 4)
    0 flags

type eventcontrollerscrollflags_flag =
  [ `NONE | `VERTICAL | `HORIZONTAL | `DISCRETE | `KINETIC | `BOTH_AXES ]

type eventcontrollerscrollflags = eventcontrollerscrollflags_flag list

let eventcontrollerscrollflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `VERTICAL :: acc else acc in
  let acc = if flags land 2 <> 0 then `HORIZONTAL :: acc else acc in
  let acc = if flags land 4 <> 0 then `DISCRETE :: acc else acc in
  let acc = if flags land 8 <> 0 then `KINETIC :: acc else acc in
  let acc = if flags land 3 <> 0 then `BOTH_AXES :: acc else acc in
  acc

let eventcontrollerscrollflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `VERTICAL -> acc lor 1
      | `HORIZONTAL -> acc lor 2
      | `DISCRETE -> acc lor 4
      | `KINETIC -> acc lor 8
      | `BOTH_AXES -> acc lor 3)
    0 flags

type fontchooserlevel_flag =
  [ `FAMILY | `STYLE | `SIZE | `VARIATIONS | `FEATURES ]

type fontchooserlevel = fontchooserlevel_flag list

let fontchooserlevel_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `FAMILY :: acc else acc in
  let acc = if flags land 1 <> 0 then `STYLE :: acc else acc in
  let acc = if flags land 2 <> 0 then `SIZE :: acc else acc in
  let acc = if flags land 4 <> 0 then `VARIATIONS :: acc else acc in
  let acc = if flags land 8 <> 0 then `FEATURES :: acc else acc in
  acc

let fontchooserlevel_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `FAMILY -> acc lor 0
      | `STYLE -> acc lor 1
      | `SIZE -> acc lor 2
      | `VARIATIONS -> acc lor 4
      | `FEATURES -> acc lor 8)
    0 flags

type iconlookupflags_flag = [ `FORCE_REGULAR | `FORCE_SYMBOLIC | `PRELOAD ]
type iconlookupflags = iconlookupflags_flag list

let iconlookupflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `FORCE_REGULAR :: acc else acc in
  let acc = if flags land 2 <> 0 then `FORCE_SYMBOLIC :: acc else acc in
  let acc = if flags land 4 <> 0 then `PRELOAD :: acc else acc in
  acc

let iconlookupflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `FORCE_REGULAR -> acc lor 1
      | `FORCE_SYMBOLIC -> acc lor 2
      | `PRELOAD -> acc lor 4)
    0 flags

type inputhints_flag =
  [ `NONE
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
  | `PRIVATE ]

type inputhints = inputhints_flag list

let inputhints_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `SPELLCHECK :: acc else acc in
  let acc = if flags land 2 <> 0 then `NO_SPELLCHECK :: acc else acc in
  let acc = if flags land 4 <> 0 then `WORD_COMPLETION :: acc else acc in
  let acc = if flags land 8 <> 0 then `LOWERCASE :: acc else acc in
  let acc = if flags land 16 <> 0 then `UPPERCASE_CHARS :: acc else acc in
  let acc = if flags land 32 <> 0 then `UPPERCASE_WORDS :: acc else acc in
  let acc = if flags land 64 <> 0 then `UPPERCASE_SENTENCES :: acc else acc in
  let acc = if flags land 128 <> 0 then `INHIBIT_OSK :: acc else acc in
  let acc = if flags land 256 <> 0 then `VERTICAL_WRITING :: acc else acc in
  let acc = if flags land 512 <> 0 then `EMOJI :: acc else acc in
  let acc = if flags land 1024 <> 0 then `NO_EMOJI :: acc else acc in
  let acc = if flags land 2048 <> 0 then `PRIVATE :: acc else acc in
  acc

let inputhints_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `SPELLCHECK -> acc lor 1
      | `NO_SPELLCHECK -> acc lor 2
      | `WORD_COMPLETION -> acc lor 4
      | `LOWERCASE -> acc lor 8
      | `UPPERCASE_CHARS -> acc lor 16
      | `UPPERCASE_WORDS -> acc lor 32
      | `UPPERCASE_SENTENCES -> acc lor 64
      | `INHIBIT_OSK -> acc lor 128
      | `VERTICAL_WRITING -> acc lor 256
      | `EMOJI -> acc lor 512
      | `NO_EMOJI -> acc lor 1024
      | `PRIVATE -> acc lor 2048)
    0 flags

type listscrollflags_flag = [ `NONE | `FOCUS | `SELECT ]
type listscrollflags = listscrollflags_flag list

let listscrollflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `FOCUS :: acc else acc in
  let acc = if flags land 2 <> 0 then `SELECT :: acc else acc in
  acc

let listscrollflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `FOCUS -> acc lor 1
      | `SELECT -> acc lor 2)
    0 flags

type pickflags_flag = [ `DEFAULT | `INSENSITIVE | `NON_TARGETABLE ]
type pickflags = pickflags_flag list

let pickflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `DEFAULT :: acc else acc in
  let acc = if flags land 1 <> 0 then `INSENSITIVE :: acc else acc in
  let acc = if flags land 2 <> 0 then `NON_TARGETABLE :: acc else acc in
  acc

let pickflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `DEFAULT -> acc lor 0
      | `INSENSITIVE -> acc lor 1
      | `NON_TARGETABLE -> acc lor 2)
    0 flags

type popovermenuflags_flag = [ `SLIDING | `NESTED ]
type popovermenuflags = popovermenuflags_flag list

let popovermenuflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `SLIDING :: acc else acc in
  let acc = if flags land 1 <> 0 then `NESTED :: acc else acc in
  acc

let popovermenuflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `SLIDING -> acc lor 0 | `NESTED -> acc lor 1)
    0 flags

type shortcutactionflags_flag = [ `EXCLUSIVE ]
type shortcutactionflags = shortcutactionflags_flag list

let shortcutactionflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `EXCLUSIVE :: acc else acc in
  acc

let shortcutactionflags_to_int flags =
  List.fold_left
    (fun acc flag -> match flag with `EXCLUSIVE -> acc lor 1)
    0 flags

type stateflags_flag =
  [ `NORMAL
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
  | `FOCUS_WITHIN ]

type stateflags = stateflags_flag list

let stateflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NORMAL :: acc else acc in
  let acc = if flags land 1 <> 0 then `ACTIVE :: acc else acc in
  let acc = if flags land 2 <> 0 then `PRELIGHT :: acc else acc in
  let acc = if flags land 4 <> 0 then `SELECTED :: acc else acc in
  let acc = if flags land 8 <> 0 then `INSENSITIVE :: acc else acc in
  let acc = if flags land 16 <> 0 then `INCONSISTENT :: acc else acc in
  let acc = if flags land 32 <> 0 then `FOCUSED :: acc else acc in
  let acc = if flags land 64 <> 0 then `BACKDROP :: acc else acc in
  let acc = if flags land 128 <> 0 then `DIR_LTR :: acc else acc in
  let acc = if flags land 256 <> 0 then `DIR_RTL :: acc else acc in
  let acc = if flags land 512 <> 0 then `LINK :: acc else acc in
  let acc = if flags land 1024 <> 0 then `VISITED :: acc else acc in
  let acc = if flags land 2048 <> 0 then `CHECKED :: acc else acc in
  let acc = if flags land 4096 <> 0 then `DROP_ACTIVE :: acc else acc in
  let acc = if flags land 8192 <> 0 then `FOCUS_VISIBLE :: acc else acc in
  let acc = if flags land 16384 <> 0 then `FOCUS_WITHIN :: acc else acc in
  acc

let stateflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NORMAL -> acc lor 0
      | `ACTIVE -> acc lor 1
      | `PRELIGHT -> acc lor 2
      | `SELECTED -> acc lor 4
      | `INSENSITIVE -> acc lor 8
      | `INCONSISTENT -> acc lor 16
      | `FOCUSED -> acc lor 32
      | `BACKDROP -> acc lor 64
      | `DIR_LTR -> acc lor 128
      | `DIR_RTL -> acc lor 256
      | `LINK -> acc lor 512
      | `VISITED -> acc lor 1024
      | `CHECKED -> acc lor 2048
      | `DROP_ACTIVE -> acc lor 4096
      | `FOCUS_VISIBLE -> acc lor 8192
      | `FOCUS_WITHIN -> acc lor 16384)
    0 flags

type stylecontextprintflags_flag =
  [ `NONE | `RECURSE | `SHOW_STYLE | `SHOW_CHANGE ]

type stylecontextprintflags = stylecontextprintflags_flag list

let stylecontextprintflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `RECURSE :: acc else acc in
  let acc = if flags land 2 <> 0 then `SHOW_STYLE :: acc else acc in
  let acc = if flags land 4 <> 0 then `SHOW_CHANGE :: acc else acc in
  acc

let stylecontextprintflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `RECURSE -> acc lor 1
      | `SHOW_STYLE -> acc lor 2
      | `SHOW_CHANGE -> acc lor 4)
    0 flags

type textsearchflags_flag = [ `VISIBLE_ONLY | `TEXT_ONLY | `CASE_INSENSITIVE ]
type textsearchflags = textsearchflags_flag list

let textsearchflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `VISIBLE_ONLY :: acc else acc in
  let acc = if flags land 2 <> 0 then `TEXT_ONLY :: acc else acc in
  let acc = if flags land 4 <> 0 then `CASE_INSENSITIVE :: acc else acc in
  acc

let textsearchflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `VISIBLE_ONLY -> acc lor 1
      | `TEXT_ONLY -> acc lor 2
      | `CASE_INSENSITIVE -> acc lor 4)
    0 flags

type treemodelflags_flag = [ `ITERS_PERSIST | `LIST_ONLY ]
type treemodelflags = treemodelflags_flag list

let treemodelflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `ITERS_PERSIST :: acc else acc in
  let acc = if flags land 2 <> 0 then `LIST_ONLY :: acc else acc in
  acc

let treemodelflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `ITERS_PERSIST -> acc lor 1 | `LIST_ONLY -> acc lor 2)
    0 flags
