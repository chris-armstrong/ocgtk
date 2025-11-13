(** Comprehensive enum tests for all GTK4 subsystems

    This test suite validates enum conversions across all modules:
    - GTK4: Widget and UI enums
    - GDK4: Display server, events, input
    - GLib: Core library enums
    - Pango: Text rendering enums
    - GObject: Type system enums

    Each enum is tested for:
    1. Round-trip conversion (OCaml → C → OCaml)
    2. Value distinctness (injection property)
*)

(** Module type for enum test helpers *)
module type ENUM_TEST = sig
  type t
  val conv : (int -> t) * (t -> int)
  val values : t list
  val name : string
  val pp : Format.formatter -> t -> unit
end

(** Helper to test enum round-trip conversion *)
let test_enum_roundtrip (module E : ENUM_TEST) () =
  let (decode, encode) = E.conv in
  List.iter (fun v ->
    let i = encode v in
    let v' = decode i in
    Alcotest.(check (of_pp E.pp))
      (Format.asprintf "roundtrip %a" E.pp v)
      v v'
  ) E.values

(** Helper to test enum value distinctness *)
let test_enum_distinct (module E : ENUM_TEST) () =
  let (_, encode) = E.conv in
  let integers = List.map encode E.values in
  let unique = List.sort_uniq compare integers in
  Alcotest.(check int)
    (E.name ^ " values map to distinct integers")
    (List.length E.values) (List.length unique)

(** GTK4 Enum Test Modules *)

module TestGtkAlign = struct
  type t = Gtk4Enums.align
  let conv = Gtk4Enums.Conv.align
  let values = [`FILL; `START; `END; `CENTER; `BASELINE]
  let name = "GtkAlign"
  let pp fmt = function
    | `FILL -> Format.fprintf fmt "FILL"
    | `START -> Format.fprintf fmt "START"
    | `END -> Format.fprintf fmt "END"
    | `CENTER -> Format.fprintf fmt "CENTER"
    | `BASELINE -> Format.fprintf fmt "BASELINE"
end

module TestGtkOrientation = struct
  type t = Gtk4Enums.orientation
  let conv = Gtk4Enums.Conv.orientation
  let values = [`HORIZONTAL; `VERTICAL]
  let name = "GtkOrientation"
  let pp fmt = function
    | `HORIZONTAL -> Format.fprintf fmt "HORIZONTAL"
    | `VERTICAL -> Format.fprintf fmt "VERTICAL"
end

module TestGtkJustification = struct
  type t = Gtk4Enums.justification
  let conv = Gtk4Enums.Conv.justification
  let values = [`LEFT; `RIGHT; `CENTER; `FILL]
  let name = "GtkJustification"
  let pp fmt = function
    | `LEFT -> Format.fprintf fmt "LEFT"
    | `RIGHT -> Format.fprintf fmt "RIGHT"
    | `CENTER -> Format.fprintf fmt "CENTER"
    | `FILL -> Format.fprintf fmt "FILL"
end

module TestGtkMessageType = struct
  type t = Gtk4Enums.message_type
  let conv = Gtk4Enums.Conv.message_type
  let values = [`INFO; `WARNING; `QUESTION; `ERROR; `OTHER]
  let name = "GtkMessageType"
  let pp fmt = function
    | `INFO -> Format.fprintf fmt "INFO"
    | `WARNING -> Format.fprintf fmt "WARNING"
    | `QUESTION -> Format.fprintf fmt "QUESTION"
    | `ERROR -> Format.fprintf fmt "ERROR"
    | `OTHER -> Format.fprintf fmt "OTHER"
end

module TestGtkSelectionMode = struct
  type t = Gtk4Enums.selection_mode
  let conv = Gtk4Enums.Conv.selection_mode
  let values = [`NONE; `SINGLE; `BROWSE; `MULTIPLE]
  let name = "GtkSelectionMode"
  let pp fmt = function
    | `NONE -> Format.fprintf fmt "NONE"
    | `SINGLE -> Format.fprintf fmt "SINGLE"
    | `BROWSE -> Format.fprintf fmt "BROWSE"
    | `MULTIPLE -> Format.fprintf fmt "MULTIPLE"
end

(** GDK4 Enum Test Modules *)

module TestGdkModifierType = struct
  type t = Gdk4Enums.modifier_type
  let conv = Gdk4Enums.Conv.modifier_type
  let values = [
    `SHIFT_MASK; `LOCK_MASK; `CONTROL_MASK;
    `ALT_MASK; `SUPER_MASK; `META_MASK;
    `BUTTON1_MASK; `BUTTON2_MASK; `BUTTON3_MASK;
    `BUTTON4_MASK; `BUTTON5_MASK
  ]
  let name = "GdkModifierType"
  let pp fmt = function
    | `SHIFT_MASK -> Format.fprintf fmt "SHIFT_MASK"
    | `LOCK_MASK -> Format.fprintf fmt "LOCK_MASK"
    | `CONTROL_MASK -> Format.fprintf fmt "CONTROL_MASK"
    | `ALT_MASK -> Format.fprintf fmt "ALT_MASK"
    | `SUPER_MASK -> Format.fprintf fmt "SUPER_MASK"
    | `META_MASK -> Format.fprintf fmt "META_MASK"
    | `HYPER_MASK -> Format.fprintf fmt "HYPER_MASK"
    | `BUTTON1_MASK -> Format.fprintf fmt "BUTTON1_MASK"
    | `BUTTON2_MASK -> Format.fprintf fmt "BUTTON2_MASK"
    | `BUTTON3_MASK -> Format.fprintf fmt "BUTTON3_MASK"
    | `BUTTON4_MASK -> Format.fprintf fmt "BUTTON4_MASK"
    | `BUTTON5_MASK -> Format.fprintf fmt "BUTTON5_MASK"
end

module TestGdkScrollDirection = struct
  type t = Gdk4Enums.scroll_direction
  let conv = Gdk4Enums.Conv.scroll_direction
  let values = [`UP; `DOWN; `LEFT; `RIGHT; `SMOOTH]
  let name = "GdkScrollDirection"
  let pp fmt = function
    | `UP -> Format.fprintf fmt "UP"
    | `DOWN -> Format.fprintf fmt "DOWN"
    | `LEFT -> Format.fprintf fmt "LEFT"
    | `RIGHT -> Format.fprintf fmt "RIGHT"
    | `SMOOTH -> Format.fprintf fmt "SMOOTH"
end

(** GLib Enum Test Modules *)

module TestGlibLogLevel = struct
  type t = GlibEnums.log_level
  let conv = GlibEnums.Conv.log_level
  let values = [
    `ERROR; `CRITICAL; `WARNING; `MESSAGE; `INFO; `DEBUG;
    `FLAG_RECURSION; `FLAG_FATAL
  ]
  let name = "GLogLevelFlags"
  let pp fmt = function
    | `ERROR -> Format.fprintf fmt "ERROR"
    | `CRITICAL -> Format.fprintf fmt "CRITICAL"
    | `WARNING -> Format.fprintf fmt "WARNING"
    | `MESSAGE -> Format.fprintf fmt "MESSAGE"
    | `INFO -> Format.fprintf fmt "INFO"
    | `DEBUG -> Format.fprintf fmt "DEBUG"
    | `FLAG_RECURSION -> Format.fprintf fmt "FLAG_RECURSION"
    | `FLAG_FATAL -> Format.fprintf fmt "FLAG_FATAL"
end

module TestGlibIoCondition = struct
  type t = GlibEnums.io_condition
  let conv = GlibEnums.Conv.io_condition
  let values = [`IN; `OUT; `PRI; `ERR; `HUP; `NVAL]
  let name = "GIOCondition"
  let pp fmt = function
    | `IN -> Format.fprintf fmt "IN"
    | `OUT -> Format.fprintf fmt "OUT"
    | `PRI -> Format.fprintf fmt "PRI"
    | `ERR -> Format.fprintf fmt "ERR"
    | `HUP -> Format.fprintf fmt "HUP"
    | `NVAL -> Format.fprintf fmt "NVAL"
end

(** Pango Enum Test Modules *)

module TestPangoStyle = struct
  type t = PangoEnums.style
  let conv = PangoEnums.Conv.style
  let values = [`NORMAL; `OBLIQUE; `ITALIC]
  let name = "PangoStyle"
  let pp fmt = function
    | `NORMAL -> Format.fprintf fmt "NORMAL"
    | `OBLIQUE -> Format.fprintf fmt "OBLIQUE"
    | `ITALIC -> Format.fprintf fmt "ITALIC"
end

module TestPangoWeight = struct
  type t = PangoEnums.weight
  let conv = PangoEnums.Conv.weight
  let values = [
    `THIN; `ULTRALIGHT; `LIGHT; `BOOK; `NORMAL; `MEDIUM;
    `SEMIBOLD; `BOLD; `ULTRABOLD; `HEAVY; `ULTRAHEAVY
  ]
  let name = "PangoWeight"
  let pp fmt = function
    | `THIN -> Format.fprintf fmt "THIN"
    | `ULTRALIGHT -> Format.fprintf fmt "ULTRALIGHT"
    | `LIGHT -> Format.fprintf fmt "LIGHT"
    | `BOOK -> Format.fprintf fmt "BOOK"
    | `NORMAL -> Format.fprintf fmt "NORMAL"
    | `MEDIUM -> Format.fprintf fmt "MEDIUM"
    | `SEMIBOLD -> Format.fprintf fmt "SEMIBOLD"
    | `BOLD -> Format.fprintf fmt "BOLD"
    | `ULTRABOLD -> Format.fprintf fmt "ULTRABOLD"
    | `HEAVY -> Format.fprintf fmt "HEAVY"
    | `ULTRAHEAVY -> Format.fprintf fmt "ULTRAHEAVY"
end

module TestPangoWrapMode = struct
  type t = PangoEnums.wrap_mode
  let conv = PangoEnums.Conv.wrap_mode
  let values = [`WORD; `CHAR; `WORD_CHAR]
  let name = "PangoWrapMode"
  let pp fmt = function
    | `WORD -> Format.fprintf fmt "WORD"
    | `CHAR -> Format.fprintf fmt "CHAR"
    | `WORD_CHAR -> Format.fprintf fmt "WORD_CHAR"
end

(** GObject Enum Test Modules *)

module TestGObjectSignalType = struct
  type t = GobjectEnums.signal_type
  let conv = GobjectEnums.Conv.signal_type
  let values = [`RUN_FIRST; `RUN_LAST; `NO_RECURSE; `ACTION; `NO_HOOKS]
  let name = "GSignalFlags"
  let pp fmt = function
    | `RUN_FIRST -> Format.fprintf fmt "RUN_FIRST"
    | `RUN_LAST -> Format.fprintf fmt "RUN_LAST"
    | `NO_RECURSE -> Format.fprintf fmt "NO_RECURSE"
    | `ACTION -> Format.fprintf fmt "ACTION"
    | `NO_HOOKS -> Format.fprintf fmt "NO_HOOKS"
end

(** Test Suite *)

let () =
  Alcotest.run "All Enum Conversions" [
    (* GTK4 Enums *)
    "GTK4/Align", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGtkAlign));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGtkAlign));
    ];
    "GTK4/Orientation", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGtkOrientation));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGtkOrientation));
    ];
    "GTK4/Justification", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGtkJustification));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGtkJustification));
    ];
    "GTK4/MessageType", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGtkMessageType));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGtkMessageType));
    ];
    "GTK4/SelectionMode", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGtkSelectionMode));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGtkSelectionMode));
    ];

    (* GDK4 Enums *)
    "GDK4/ModifierType", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGdkModifierType));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGdkModifierType));
    ];
    "GDK4/ScrollDirection", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGdkScrollDirection));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGdkScrollDirection));
    ];

    (* GLib Enums *)
    "GLib/LogLevel", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGlibLogLevel));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGlibLogLevel));
    ];
    "GLib/IoCondition", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGlibIoCondition));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGlibIoCondition));
    ];

    (* Pango Enums *)
    "Pango/Style", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestPangoStyle));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestPangoStyle));
    ];
    "Pango/Weight", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestPangoWeight));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestPangoWeight));
    ];
    "Pango/WrapMode", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestPangoWrapMode));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestPangoWrapMode));
    ];

    (* GObject Enums *)
    "GObject/SignalType", [
      Alcotest.test_case "roundtrip" `Quick (test_enum_roundtrip (module TestGObjectSignalType));
      Alcotest.test_case "distinct" `Quick (test_enum_distinct (module TestGObjectSignalType));
    ];
  ]
