(* GENERATED CODE - DO NOT EDIT *)
(* GObject Enumeration and Bitfield Types *)

(* BindingFlags - bitfield/flags *)
type bindingflags_flag = [
  | `DEFAULT
  | `BIDIRECTIONAL
  | `SYNC_CREATE
  | `INVERT_BOOLEAN
]

type bindingflags = bindingflags_flag list

(* ConnectFlags - bitfield/flags *)
type connectflags_flag = [
  | `DEFAULT
  | `AFTER
  | `SWAPPED
]

type connectflags = connectflags_flag list

(* IOCondition - bitfield/flags *)
type iocondition_flag = [
  | `IN
  | `OUT
  | `PRI
  | `ERR
  | `HUP
  | `NVAL
]

type iocondition = iocondition_flag list

(* ParamFlags - bitfield/flags *)
type paramflags_flag = [
  | `READABLE
  | `WRITABLE
  | `READWRITE
  | `CONSTRUCT
  | `CONSTRUCT_ONLY
  | `LAX_VALIDATION
  | `STATIC_NAME
  | `PRIVATE
  | `STATIC_NICK
  | `STATIC_BLURB
  | `EXPLICIT_NOTIFY
  | `DEPRECATED
]

type paramflags = paramflags_flag list

(* SignalFlags - bitfield/flags *)
type signalflags_flag = [
  | `RUN_FIRST
  | `RUN_LAST
  | `RUN_CLEANUP
  | `NO_RECURSE
  | `DETAILED
  | `ACTION
  | `NO_HOOKS
  | `MUST_COLLECT
  | `DEPRECATED
  | `ACCUMULATOR_FIRST_RUN
]

type signalflags = signalflags_flag list

(* SignalMatchType - bitfield/flags *)
type signalmatchtype_flag = [
  | `ID
  | `DETAIL
  | `CLOSURE
  | `FUNC
  | `DATA
  | `UNBLOCKED
]

type signalmatchtype = signalmatchtype_flag list

(* TypeDebugFlags - bitfield/flags *)
type typedebugflags_flag = [
  | `NONE
  | `OBJECTS
  | `SIGNALS
  | `INSTANCE_COUNT
  | `MASK
]

type typedebugflags = typedebugflags_flag list

(* TypeFlags - bitfield/flags *)
type typeflags_flag = [
  | `NONE
  | `ABSTRACT
  | `VALUE_ABSTRACT
  | `FINAL
  | `DEPRECATED
]

type typeflags = typeflags_flag list

(* TypeFundamentalFlags - bitfield/flags *)
type typefundamentalflags_flag = [
  | `CLASSED
  | `INSTANTIATABLE
  | `DERIVABLE
  | `DEEP_DERIVABLE
]

type typefundamentalflags = typefundamentalflags_flag list

