/* GENERATED CODE - DO NOT EDIT */
/* GObject enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib-object.h>
/* Convert GBindingFlags to OCaml flag list */
value Val_GObjectBindingFlags(GBindingFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_BINDING_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BINDING_BIDIRECTIONAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BIDIRECTIONAL"))); /* `BIDIRECTIONAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BINDING_SYNC_CREATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SYNC_CREATE"))); /* `SYNC_CREATE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BINDING_INVERT_BOOLEAN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INVERT_BOOLEAN"))); /* `INVERT_BOOLEAN */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GBindingFlags */
GBindingFlags GObjectBindingFlags_val(value list) {
  GBindingFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("DEFAULT")) result |= G_BINDING_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("BIDIRECTIONAL")) result |= G_BINDING_BIDIRECTIONAL; /* `BIDIRECTIONAL */
    else if (tag == caml_hash_variant("SYNC_CREATE")) result |= G_BINDING_SYNC_CREATE; /* `SYNC_CREATE */
    else if (tag == caml_hash_variant("INVERT_BOOLEAN")) result |= G_BINDING_INVERT_BOOLEAN; /* `INVERT_BOOLEAN */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GConnectFlags to OCaml flag list */
value Val_GObjectConnectFlags(GConnectFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_CONNECT_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_CONNECT_AFTER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AFTER"))); /* `AFTER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_CONNECT_SWAPPED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SWAPPED"))); /* `SWAPPED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GConnectFlags */
GConnectFlags GObjectConnectFlags_val(value list) {
  GConnectFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("DEFAULT")) result |= G_CONNECT_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("AFTER")) result |= G_CONNECT_AFTER; /* `AFTER */
    else if (tag == caml_hash_variant("SWAPPED")) result |= G_CONNECT_SWAPPED; /* `SWAPPED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GIOCondition to OCaml flag list */
value Val_GObjectIOCondition(GIOCondition flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_IO_IN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IN"))); /* `IN */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_OUT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("OUT"))); /* `OUT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_PRI) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRI"))); /* `PRI */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_ERR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ERR"))); /* `ERR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_HUP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HUP"))); /* `HUP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_NVAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NVAL"))); /* `NVAL */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GIOCondition */
GIOCondition GObjectIOCondition_val(value list) {
  GIOCondition result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("IN")) result |= G_IO_IN; /* `IN */
    else if (tag == caml_hash_variant("OUT")) result |= G_IO_OUT; /* `OUT */
    else if (tag == caml_hash_variant("PRI")) result |= G_IO_PRI; /* `PRI */
    else if (tag == caml_hash_variant("ERR")) result |= G_IO_ERR; /* `ERR */
    else if (tag == caml_hash_variant("HUP")) result |= G_IO_HUP; /* `HUP */
    else if (tag == caml_hash_variant("NVAL")) result |= G_IO_NVAL; /* `NVAL */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GParamFlags to OCaml flag list */
value Val_GObjectParamFlags(GParamFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_PARAM_READABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("READABLE"))); /* `READABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_WRITABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WRITABLE"))); /* `WRITABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_READWRITE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("READWRITE"))); /* `READWRITE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_CONSTRUCT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONSTRUCT"))); /* `CONSTRUCT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_CONSTRUCT_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CONSTRUCT_ONLY"))); /* `CONSTRUCT_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_LAX_VALIDATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("LAX_VALIDATION"))); /* `LAX_VALIDATION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_STATIC_NAME) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STATIC_NAME"))); /* `STATIC_NAME */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_PRIVATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRIVATE"))); /* `PRIVATE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_STATIC_NICK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STATIC_NICK"))); /* `STATIC_NICK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_STATIC_BLURB) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STATIC_BLURB"))); /* `STATIC_BLURB */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_EXPLICIT_NOTIFY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("EXPLICIT_NOTIFY"))); /* `EXPLICIT_NOTIFY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_PARAM_DEPRECATED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEPRECATED"))); /* `DEPRECATED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GParamFlags */
GParamFlags GObjectParamFlags_val(value list) {
  GParamFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("READABLE")) result |= G_PARAM_READABLE; /* `READABLE */
    else if (tag == caml_hash_variant("WRITABLE")) result |= G_PARAM_WRITABLE; /* `WRITABLE */
    else if (tag == caml_hash_variant("READWRITE")) result |= G_PARAM_READWRITE; /* `READWRITE */
    else if (tag == caml_hash_variant("CONSTRUCT")) result |= G_PARAM_CONSTRUCT; /* `CONSTRUCT */
    else if (tag == caml_hash_variant("CONSTRUCT_ONLY")) result |= G_PARAM_CONSTRUCT_ONLY; /* `CONSTRUCT_ONLY */
    else if (tag == caml_hash_variant("LAX_VALIDATION")) result |= G_PARAM_LAX_VALIDATION; /* `LAX_VALIDATION */
    else if (tag == caml_hash_variant("STATIC_NAME")) result |= G_PARAM_STATIC_NAME; /* `STATIC_NAME */
    else if (tag == caml_hash_variant("PRIVATE")) result |= G_PARAM_PRIVATE; /* `PRIVATE */
    else if (tag == caml_hash_variant("STATIC_NICK")) result |= G_PARAM_STATIC_NICK; /* `STATIC_NICK */
    else if (tag == caml_hash_variant("STATIC_BLURB")) result |= G_PARAM_STATIC_BLURB; /* `STATIC_BLURB */
    else if (tag == caml_hash_variant("EXPLICIT_NOTIFY")) result |= G_PARAM_EXPLICIT_NOTIFY; /* `EXPLICIT_NOTIFY */
    else if (tag == caml_hash_variant("DEPRECATED")) result |= G_PARAM_DEPRECATED; /* `DEPRECATED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GSignalFlags to OCaml flag list */
value Val_GObjectSignalFlags(GSignalFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_SIGNAL_RUN_FIRST) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RUN_FIRST"))); /* `RUN_FIRST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_RUN_LAST) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RUN_LAST"))); /* `RUN_LAST */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_RUN_CLEANUP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RUN_CLEANUP"))); /* `RUN_CLEANUP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_NO_RECURSE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_RECURSE"))); /* `NO_RECURSE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_DETAILED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DETAILED"))); /* `DETAILED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_ACTION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ACTION"))); /* `ACTION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_NO_HOOKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_HOOKS"))); /* `NO_HOOKS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MUST_COLLECT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MUST_COLLECT"))); /* `MUST_COLLECT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_DEPRECATED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEPRECATED"))); /* `DEPRECATED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_ACCUMULATOR_FIRST_RUN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ACCUMULATOR_FIRST_RUN"))); /* `ACCUMULATOR_FIRST_RUN */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GSignalFlags */
GSignalFlags GObjectSignalFlags_val(value list) {
  GSignalFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("RUN_FIRST")) result |= G_SIGNAL_RUN_FIRST; /* `RUN_FIRST */
    else if (tag == caml_hash_variant("RUN_LAST")) result |= G_SIGNAL_RUN_LAST; /* `RUN_LAST */
    else if (tag == caml_hash_variant("RUN_CLEANUP")) result |= G_SIGNAL_RUN_CLEANUP; /* `RUN_CLEANUP */
    else if (tag == caml_hash_variant("NO_RECURSE")) result |= G_SIGNAL_NO_RECURSE; /* `NO_RECURSE */
    else if (tag == caml_hash_variant("DETAILED")) result |= G_SIGNAL_DETAILED; /* `DETAILED */
    else if (tag == caml_hash_variant("ACTION")) result |= G_SIGNAL_ACTION; /* `ACTION */
    else if (tag == caml_hash_variant("NO_HOOKS")) result |= G_SIGNAL_NO_HOOKS; /* `NO_HOOKS */
    else if (tag == caml_hash_variant("MUST_COLLECT")) result |= G_SIGNAL_MUST_COLLECT; /* `MUST_COLLECT */
    else if (tag == caml_hash_variant("DEPRECATED")) result |= G_SIGNAL_DEPRECATED; /* `DEPRECATED */
    else if (tag == caml_hash_variant("ACCUMULATOR_FIRST_RUN")) result |= G_SIGNAL_ACCUMULATOR_FIRST_RUN; /* `ACCUMULATOR_FIRST_RUN */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GSignalMatchType to OCaml flag list */
value Val_GObjectSignalMatchType(GSignalMatchType flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_SIGNAL_MATCH_ID) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ID"))); /* `ID */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MATCH_DETAIL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DETAIL"))); /* `DETAIL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MATCH_CLOSURE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLOSURE"))); /* `CLOSURE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MATCH_FUNC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FUNC"))); /* `FUNC */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MATCH_DATA) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DATA"))); /* `DATA */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SIGNAL_MATCH_UNBLOCKED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UNBLOCKED"))); /* `UNBLOCKED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GSignalMatchType */
GSignalMatchType GObjectSignalMatchType_val(value list) {
  GSignalMatchType result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("ID")) result |= G_SIGNAL_MATCH_ID; /* `ID */
    else if (tag == caml_hash_variant("DETAIL")) result |= G_SIGNAL_MATCH_DETAIL; /* `DETAIL */
    else if (tag == caml_hash_variant("CLOSURE")) result |= G_SIGNAL_MATCH_CLOSURE; /* `CLOSURE */
    else if (tag == caml_hash_variant("FUNC")) result |= G_SIGNAL_MATCH_FUNC; /* `FUNC */
    else if (tag == caml_hash_variant("DATA")) result |= G_SIGNAL_MATCH_DATA; /* `DATA */
    else if (tag == caml_hash_variant("UNBLOCKED")) result |= G_SIGNAL_MATCH_UNBLOCKED; /* `UNBLOCKED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTypeDebugFlags to OCaml flag list */
value Val_GObjectTypeDebugFlags(GTypeDebugFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TYPE_DEBUG_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_DEBUG_OBJECTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("OBJECTS"))); /* `OBJECTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_DEBUG_SIGNALS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SIGNALS"))); /* `SIGNALS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_DEBUG_INSTANCE_COUNT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSTANCE_COUNT"))); /* `INSTANCE_COUNT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_DEBUG_MASK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MASK"))); /* `MASK */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTypeDebugFlags */
GTypeDebugFlags GObjectTypeDebugFlags_val(value list) {
  GTypeDebugFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_TYPE_DEBUG_NONE; /* `NONE */
    else if (tag == caml_hash_variant("OBJECTS")) result |= G_TYPE_DEBUG_OBJECTS; /* `OBJECTS */
    else if (tag == caml_hash_variant("SIGNALS")) result |= G_TYPE_DEBUG_SIGNALS; /* `SIGNALS */
    else if (tag == caml_hash_variant("INSTANCE_COUNT")) result |= G_TYPE_DEBUG_INSTANCE_COUNT; /* `INSTANCE_COUNT */
    else if (tag == caml_hash_variant("MASK")) result |= G_TYPE_DEBUG_MASK; /* `MASK */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTypeFlags to OCaml flag list */
value Val_GObjectTypeFlags(GTypeFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TYPE_FLAG_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_ABSTRACT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ABSTRACT"))); /* `ABSTRACT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_VALUE_ABSTRACT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VALUE_ABSTRACT"))); /* `VALUE_ABSTRACT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_FINAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FINAL"))); /* `FINAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_DEPRECATED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEPRECATED"))); /* `DEPRECATED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTypeFlags */
GTypeFlags GObjectTypeFlags_val(value list) {
  GTypeFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_TYPE_FLAG_NONE; /* `NONE */
    else if (tag == caml_hash_variant("ABSTRACT")) result |= G_TYPE_FLAG_ABSTRACT; /* `ABSTRACT */
    else if (tag == caml_hash_variant("VALUE_ABSTRACT")) result |= G_TYPE_FLAG_VALUE_ABSTRACT; /* `VALUE_ABSTRACT */
    else if (tag == caml_hash_variant("FINAL")) result |= G_TYPE_FLAG_FINAL; /* `FINAL */
    else if (tag == caml_hash_variant("DEPRECATED")) result |= G_TYPE_FLAG_DEPRECATED; /* `DEPRECATED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTypeFundamentalFlags to OCaml flag list */
value Val_GObjectTypeFundamentalFlags(GTypeFundamentalFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TYPE_FLAG_CLASSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLASSED"))); /* `CLASSED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_INSTANTIATABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSTANTIATABLE"))); /* `INSTANTIATABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_DERIVABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DERIVABLE"))); /* `DERIVABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TYPE_FLAG_DEEP_DERIVABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEEP_DERIVABLE"))); /* `DEEP_DERIVABLE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTypeFundamentalFlags */
GTypeFundamentalFlags GObjectTypeFundamentalFlags_val(value list) {
  GTypeFundamentalFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("CLASSED")) result |= G_TYPE_FLAG_CLASSED; /* `CLASSED */
    else if (tag == caml_hash_variant("INSTANTIATABLE")) result |= G_TYPE_FLAG_INSTANTIATABLE; /* `INSTANTIATABLE */
    else if (tag == caml_hash_variant("DERIVABLE")) result |= G_TYPE_FLAG_DERIVABLE; /* `DERIVABLE */
    else if (tag == caml_hash_variant("DEEP_DERIVABLE")) result |= G_TYPE_FLAG_DEEP_DERIVABLE; /* `DEEP_DERIVABLE */
    list = Field(list, 1);
  }
  return result;
}

