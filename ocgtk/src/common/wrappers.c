/**************************************************************************/
/*                ocgtk - OCaml bindings for GTK4                         */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License version 2, as published by the           */
/*    Free Software Foundation with the exception described in file       */
/*    COPYING which comes with the library.                               */
/*                                                                        */
/*    Based on lablgtk3 /https://github.com/garrigue/lablgtk/             */
/*                                                                        */
/**************************************************************************/

#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <glib.h>

#include "wrappers.h"
#include "value_kinds.h"

/* Read a lookup_info pointer from a 1-word Abstract block. The matching
 * writer is unused — generated enum tables are compiled-in C arrays, not
 * OCaml-side allocations. */
static inline const lookup_info *lookup_info_val(value v) {
    return *((const lookup_info **)Data_abstract_val(v));
}

/* Enum/variant conversion functions */

/* Internal C variant - accepts lookup table pointer directly
 * Converts C enum value to OCaml polymorphic variant
 */
value lookup_from_c_direct (const lookup_info *table, int data)
{
    int i;
    for (i = table[0].data; i > 0; i--)
	if (table[i].data == data) return table[i].key;
    caml_invalid_argument ("lookup_from_c_direct");
}

/* Internal C variant - accepts lookup table pointer directly
 * Converts OCaml polymorphic variant to C enum value
 */
int lookup_to_c_direct (const lookup_info *table, value key)
{
    int first = 1, last = table[0].data, current;
    while (first < last) {
	/* Avoid integer overflow in midpoint calculation */
	current = first + (last - first) / 2;
	if (table[current].key >= key) last = current;
	else first = current + 1;
    }
    if (table[first].key == key) return table[first].data;
    caml_invalid_argument ("lookup_to_c_direct");
}

/* External OCaml FFI variant - accepts lookup table as OCaml value
 * Converts C enum value to OCaml polymorphic variant
 */
CAMLexport value ml_lookup_from_c (value table_val, value data_val)
{
    CAMLparam2(table_val, data_val);
    const lookup_info *table = lookup_info_val(table_val);
    int data = Int_val(data_val);
    CAMLreturn(lookup_from_c_direct(table, data));
}

/* External OCaml FFI variant - accepts lookup table as OCaml value
 * Converts OCaml polymorphic variant to C enum value
 */
CAMLexport value ml_lookup_to_c (value table_val, value key)
{
    CAMLparam2(table_val, key);
    const lookup_info *table = lookup_info_val(table_val);
    CAMLreturn(Val_int(lookup_to_c_direct(table, key)));
}

/* ==================================================================== */
/* GIR record helpers                                                   */
/* ==================================================================== */

/* Custom-block payload: GType captured at allocation time + boxed pointer.
 * type == 0 means "no registered GType" — the finalizer falls back to
 * g_free, preserving the historical behaviour for plain (non-boxed)
 * records. When type is set and registered as a boxed type, the
 * finalizer dispatches to g_boxed_free so per-type destructors run
 * (e.g. gtk_tree_path_free, not g_free). */
typedef struct {
    GType type;
    void *ptr;
} gir_record_box;

static void finalize_gir_record(value v) {
    gir_record_box *box = (gir_record_box*)Data_custom_val(v);
    if (box->ptr == NULL) return;
    if (box->type != 0 && G_TYPE_IS_BOXED(box->type)) {
        g_boxed_free(box->type, box->ptr);
    } else {
        g_free(box->ptr);
    }
}

struct custom_operations ocgtk_gir_record_ops = {
    "ocgtk.gir_record",
    finalize_gir_record,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default
};

CAMLexport value ml_gir_record_val_ptr_with_type(GType type, const void *src) {
    CAMLparam0();
    CAMLlocal1(v);

    if (src == NULL) caml_failwith("ml_gir_record_val_ptr_with_type: NULL source");

    v = caml_alloc_custom(&ocgtk_gir_record_ops, sizeof(gir_record_box), 0, 1);
    gir_record_box *box = (gir_record_box*)Data_custom_val(v);
    box->type = type;
    box->ptr = (void*)src;

    CAMLreturn(v);
}

CAMLexport value ml_gir_record_val_ptr(const void *src) {
    return ml_gir_record_val_ptr_with_type(0, src);
}

CAMLexport const void *ml_gir_record_ptr_val(value v, const char *type_name) {
    CAMLparam1(v);

    if (Tag_val(v) != Custom_tag ||
        Custom_ops_val(v) != &ocgtk_gir_record_ops) {
        char msg[256];
        const char *actual =
            (Tag_val(v) == Custom_tag)
            ? Custom_ops_val(v)->identifier
            : "non-custom block";
        snprintf(msg, sizeof(msg),
            "ml_gir_record_ptr_val: expected gir_record custom block for %s, got %s",
            type_name, actual);
        caml_failwith(msg);
    }

    const gir_record_box *box = (const gir_record_box*)Data_custom_val(v);
    if (box->ptr == NULL)
        caml_failwith("ml_gir_record_ptr_val: NULL record pointer");

    CAMLreturnT(const void*, box->ptr);
}

/* ==================================================================== */
/* GObject helpers with automatic reference counting                    */
/* ==================================================================== */

static void finalize_gobject(value v) {
    void *ptr = *((void**)Data_custom_val(v));
    if (ptr != NULL) {
        g_object_unref(G_OBJECT(ptr));
    }
}

/* Pointer-identity compare for Gobject custom blocks. Two values compare
 * equal iff they wrap the same underlying GObject pointer. Returning the
 * sign of an unsigned uintptr_t subtraction would be UB; instead compare
 * directly and yield -1 / 0 / 1. */
static int compare_gobject(value a, value b) {
    void *pa = *((void**)Data_custom_val(a));
    void *pb = *((void**)Data_custom_val(b));
    if (pa == pb) return 0;
    return (pa < pb) ? -1 : 1;
}

/* Hash function: derive a stable hash from the pointer value. Wide
 * pointers are folded into intnat by XOR of high/low halves on 64-bit
 * platforms; on 32-bit the cast is lossless. */
static intnat hash_gobject(value v) {
    uintptr_t p = (uintptr_t)*((void**)Data_custom_val(v));
#if UINTPTR_MAX > 0xFFFFFFFFu
    return (intnat)((p ^ (p >> 32)) & 0x7FFFFFFFu);
#else
    return (intnat)(p & 0x7FFFFFFFu);
#endif
}

struct custom_operations ocgtk_gobject_ops = {
    "ocgtk.gobject",
    finalize_gobject,
    compare_gobject,
    hash_gobject,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

/* Pointer-identity equality between two Gobject.obj custom blocks.
 * Distinct from [Stdlib.(=)] only in being explicit about identity
 * semantics — both now agree because compare_gobject is installed,
 * but [same] documents the intent at the call site. */
CAMLprim value ml_gobject_same(value a, value b) {
    CAMLparam2(a, b);
    void *pa = *((void**)Data_custom_val(a));
    void *pb = *((void**)Data_custom_val(b));
    CAMLreturn(Val_bool(pa == pb));
}

CAMLexport value ml_gobject_val_of_ext(const void *gobject) {
    CAMLparam0();
    CAMLlocal1(v);

    if (gobject == NULL) {
        caml_failwith("ml_gobject_val_of_ext: NULL GObject");
    }

    /* Just wrap the pointer in a custom block with finalizer.
       Caller is responsible for managing refcount based on transfer-ownership. */
    v = caml_alloc_custom(&ocgtk_gobject_ops, sizeof(void*), 0, 1);
    *((void**)Data_custom_val(v)) = (void*)gobject;

    CAMLreturn(v);
}

CAMLexport const void* ml_gobject_ext_of_val(value val) {
    CAMLparam1(val);
    CAMLreturnT(const void*, *((const void**)Data_custom_val(val)));
}

CAMLexport value ml_gobject_val_of_ext_option(const void *gobject) {
    CAMLparam0();
    CAMLlocal1(some);

    if (gobject == NULL) {
        CAMLreturn(Val_none);
    }

    some = caml_alloc(1, 0);
    Store_field(some, 0, ml_gobject_val_of_ext(gobject));
    CAMLreturn(some);
}

/* ========================================================================= */
/* Error Handling - Result type support for GError                          */
/* ========================================================================= */

/* Construct an Ok result value */
value Res_Ok(value v) {
    CAMLparam1(v);
    CAMLlocal1(result);
    result = caml_alloc(1, 0);  /* Ok is tag 0 */
    Store_field(result, 0, v);
    CAMLreturn(result);
}

/* Construct an Error result value */
value Res_Error(value v) {
    CAMLparam1(v);
    CAMLlocal1(result);
    result = caml_alloc(1, 1);  /* Error is tag 1 */
    Store_field(result, 0, v);
    CAMLreturn(result);
}

/* ==================================================================== */
/* Value-kinds registry classifier                                      */
/* ==================================================================== */

/* Returns the kind of an arbitrary OCaml value.
 * Fast path: Is_long for immediates. Custom blocks dispatch by ops-pointer
 * identity against the seven registered structs. Any other heap block
 * returns OCGTK_KIND_OPAQUE_BLOCK. Safe to call on any value. */
CAMLprim value caml_ocgtk_classify(value v)
{
    CAMLparam1(v);
    CAMLreturn(Val_int((int)ocgtk_classify(v)));
}

ocgtk_kind ocgtk_classify(value v)
{
    if (Is_long(v))
        return OCGTK_KIND_INT;

    if (Is_block(v) && Tag_val(v) == Custom_tag) {
        const struct custom_operations *ops = Custom_ops_val(v);
        if (ops == &ocgtk_gobject_ops)       return OCGTK_KIND_GOBJECT;
        if (ops == &ocgtk_gir_record_ops)    return OCGTK_KIND_GIR_RECORD;
        if (ops == &ocgtk_gvariant_ops)      return OCGTK_KIND_GVARIANT;
        if (ops == &ocgtk_gvariant_type_ops) return OCGTK_KIND_GVARIANT_TYPE;
        if (ops == &ocgtk_gbytes_ops)        return OCGTK_KIND_GBYTES;
        if (ops == &ocgtk_gvalue_ops)        return OCGTK_KIND_GVALUE;
        if (ops == &ocgtk_gclosure_ops)      return OCGTK_KIND_GCLOSURE;
    }

    return OCGTK_KIND_OPAQUE_BLOCK;
}

/* Convert GError to OCaml GError.t record and free the GError */
value Val_GError(GError *error) {
    CAMLparam0();
    CAMLlocal1(v);

    if (error == NULL) {
        /* Should not happen, but handle gracefully */
        v = caml_alloc(3, 0);
        Store_field(v, 0, Val_int(0));  /* domain */
        Store_field(v, 1, Val_int(0));  /* code */
        Store_field(v, 2, caml_copy_string("Unknown error"));  /* message */
    } else {
        v = caml_alloc(3, 0);
        Store_field(v, 0, Val_int(error->domain));  /* domain (GQuark) */
        Store_field(v, 1, Val_int(error->code));    /* code */
        Store_field(v, 2, caml_copy_string(error->message ? error->message : "")); /* message */
        g_error_free(error);  /* Free the GError as it's been converted */
    }

    CAMLreturn(v);
}
