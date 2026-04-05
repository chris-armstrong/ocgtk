(* GENERATED CODE - DO NOT EDIT *)
(* GObject Enumeration and Bitfield Types *)

(* BindingFlags - bitfield/flags *)
type bindingflags_flag = [
  (** The default binding; if the source property
  changes, the target property is updated with its value. *)
  | `DEFAULT
  (** Bidirectional binding; if either the
  property of the source or the property of the target changes,
  the other is updated. *)
  | `BIDIRECTIONAL
  (** Synchronize the values of the source and
  target properties when creating the binding; the direction of
  the synchronization is always from the source to the target. *)
  | `SYNC_CREATE
  (** If the two properties being bound are
  booleans, setting one to %TRUE will result in the other being
  set to %FALSE and vice versa. This flag will only work for
  boolean properties, and cannot be used when passing custom
  transformation functions to g_object_bind_property_full(). *)
  | `INVERT_BOOLEAN
]

type bindingflags = bindingflags_flag list

(* ConnectFlags - bitfield/flags *)
type connectflags_flag = [
  (** Default behaviour (no special flags). Since: 2.74 *)
  | `DEFAULT
  (** If set, the handler should be called after the
 default handler of the signal. Normally, the handler is called before
 the default handler. *)
  | `AFTER
  (** If set, the instance and data should be swapped when
 calling the handler; see g_signal_connect_swapped() for an example. *)
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
  (** the parameter is readable *)
  | `READABLE
  (** the parameter is writable *)
  | `WRITABLE
  (** alias for %G_PARAM_READABLE | %G_PARAM_WRITABLE *)
  | `READWRITE
  (** the parameter will be set upon object construction *)
  | `CONSTRUCT
  (** the parameter can only be set upon object construction *)
  | `CONSTRUCT_ONLY
  (** upon parameter conversion (see g_param_value_convert())
 strict validation is not required *)
  | `LAX_VALIDATION
  (** the string used as name when constructing the
 parameter is guaranteed to remain valid and
 unmodified for the lifetime of the parameter.
 Since 2.8 *)
  | `STATIC_NAME
  (** internal *)
  | `PRIVATE
  (** the string used as nick when constructing the
 parameter is guaranteed to remain valid and
 unmmodified for the lifetime of the parameter.
 Since 2.8 *)
  | `STATIC_NICK
  (** the string used as blurb when constructing the
 parameter is guaranteed to remain valid and
 unmodified for the lifetime of the parameter.
 Since 2.8 *)
  | `STATIC_BLURB
  (** calls to g_object_set_property() for this
  property will not automatically result in a "notify" signal being
  emitted: the implementation must call g_object_notify() themselves
  in case the property actually changes.  Since: 2.42. *)
  | `EXPLICIT_NOTIFY
  (** the parameter is deprecated and will be removed
 in a future version. A warning will be generated if it is used
 while running with G_ENABLE_DIAGNOSTIC=1.
 Since 2.26 *)
  | `DEPRECATED
]

type paramflags = paramflags_flag list

(* SignalFlags - bitfield/flags *)
type signalflags_flag = [
  (** Invoke the object method handler in the first emission stage. *)
  | `RUN_FIRST
  (** Invoke the object method handler in the third emission stage. *)
  | `RUN_LAST
  (** Invoke the object method handler in the last emission stage. *)
  | `RUN_CLEANUP
  (** Signals being emitted for an object while currently being in
 emission for this very object will not be emitted recursively,
 but instead cause the first emission to be restarted. *)
  | `NO_RECURSE
  (** This signal supports "::detail" appendices to the signal name
 upon handler connections and emissions. *)
  | `DETAILED
  (** Action signals are signals that may freely be emitted on alive
 objects from user code via g_signal_emit() and friends, without
 the need of being embedded into extra code that performs pre or
 post emission adjustments on the object. They can also be thought
 of as object methods which can be called generically by
 third-party code. *)
  | `ACTION
  (** No emissions hooks are supported for this signal. *)
  | `NO_HOOKS
  (** Varargs signal emission will always collect the
  arguments, even if there are no signal handlers connected.  Since 2.30. *)
  | `MUST_COLLECT
  (** The signal is deprecated and will be removed
  in a future version. A warning will be generated if it is connected while
  running with G_ENABLE_DIAGNOSTIC=1.  Since 2.32. *)
  | `DEPRECATED
  (** Only used in #GSignalAccumulator accumulator
  functions for the #GSignalInvocationHint::run_type field to mark the first
  call to the accumulator function for a signal emission.  Since 2.68. *)
  | `ACCUMULATOR_FIRST_RUN
]

type signalflags = signalflags_flag list

(* SignalMatchType - bitfield/flags *)
type signalmatchtype_flag = [
  (** The signal id must be equal. *)
  | `ID
  (** The signal detail must be equal. *)
  | `DETAIL
  (** The closure must be the same. *)
  | `CLOSURE
  (** The C closure callback must be the same. *)
  | `FUNC
  (** The closure data must be the same. *)
  | `DATA
  (** Only unblocked signals may be matched. *)
  | `UNBLOCKED
]

type signalmatchtype = signalmatchtype_flag list

(* TypeDebugFlags - bitfield/flags *)
type typedebugflags_flag = [
  (** Print no messages *)
  | `NONE
  (** Print messages about object bookkeeping *)
  | `OBJECTS
  (** Print messages about signal emissions *)
  | `SIGNALS
  (** Keep a count of instances of each type *)
  | `INSTANCE_COUNT
  (** Mask covering all debug flags *)
  | `MASK
]

type typedebugflags = typedebugflags_flag list

(* TypeFlags - bitfield/flags *)
type typeflags_flag = [
  (** No special flags. Since: 2.74 *)
  | `NONE
  (** Indicates an abstract type. No instances can be
 created for an abstract type *)
  | `ABSTRACT
  (** Indicates an abstract value type, i.e. a type
 that introduces a value table, but can't be used for
 g_value_init() *)
  | `VALUE_ABSTRACT
  (** Indicates a final type. A final type is a non-derivable
 leaf node in a deep derivable type hierarchy tree. Since: 2.70 *)
  | `FINAL
  (** The type is deprecated and may be removed in a
 future version. A warning will be emitted if it is instantiated while
 running with `G_ENABLE_DIAGNOSTIC=1`. Since 2.76 *)
  | `DEPRECATED
]

type typeflags = typeflags_flag list

(* TypeFundamentalFlags - bitfield/flags *)
type typefundamentalflags_flag = [
  (** Indicates a classed type *)
  | `CLASSED
  (** Indicates an instantiatable type (implies classed) *)
  | `INSTANTIATABLE
  (** Indicates a flat derivable type *)
  | `DERIVABLE
  (** Indicates a deep derivable type (implies derivable) *)
  | `DEEP_DERIVABLE
]

type typefundamentalflags = typefundamentalflags_flag list

