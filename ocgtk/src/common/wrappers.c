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
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <glib.h>

#include "wrappers.h"

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
    const lookup_info *table = Lookup_info_val(table_val);
    int data = Int_val(data_val);
    CAMLreturn(lookup_from_c_direct(table, data));
}

/* External OCaml FFI variant - accepts lookup table as OCaml value
 * Converts OCaml polymorphic variant to C enum value
 */
CAMLexport value ml_lookup_to_c (value table_val, value key)
{
    CAMLparam2(table_val, key);
    const lookup_info *table = Lookup_info_val(table_val);
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

static struct custom_operations gir_record_custom_ops = {
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

    v = caml_alloc_custom(&gir_record_custom_ops, sizeof(gir_record_box), 0, 1);
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
    const void *ptr;

    (void)type_name;

    if (Tag_val(v) == Custom_tag)
        ptr = ((gir_record_box*)Data_custom_val(v))->ptr;
    else
        ptr = ext_of_val(v);

    if (ptr == NULL)
        caml_failwith("ml_gir_record_ptr_val: NULL record pointer");

    CAMLreturnT(const void*, ptr);
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

static struct custom_operations gobject_custom_ops = {
    "ocgtk.gobject",
    finalize_gobject,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

CAMLexport value ml_gobject_val_of_ext(const void *gobject) {
    CAMLparam0();
    CAMLlocal1(v);

    if (gobject == NULL) {
        caml_failwith("ml_gobject_val_of_ext: NULL GObject");
    }

    /* Just wrap the pointer in a custom block with finalizer.
       Caller is responsible for managing refcount based on transfer-ownership. */
    v = caml_alloc_custom(&gobject_custom_ops, sizeof(void*), 0, 1);
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

value val_of_ext(const void *widget) {
    CAMLparam0();
    CAMLlocal1(v);
    v = caml_alloc(1, Abstract_tag);
    /* Cast away const - safe because we only read via ext_of_val which preserves const */
    *((void**)Data_abstract_val(v)) = (void*)widget;
    CAMLreturn(v);
}

const void* ext_of_val(value val) {
    CAMLparam1(val);
    CAMLreturnT(const void*, *((const void**)Data_abstract_val(val)));
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
