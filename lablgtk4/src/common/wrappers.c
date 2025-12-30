/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
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

/* Copy a C struct into an OCaml abstract block
 * Layout: [header | unused | marker=2 | data...]
 * Field 0: unused (for alignment/compatibility)
 * Field 1: marker value 2
 * Field 2+: actual struct data
 */
CAMLexport value copy_memblock_indirected(void *src, asize_t size)
{
    CAMLparam0();
    CAMLlocal1(ret);
    mlsize_t wosize;

    if (!src) caml_failwith("copy_memblock_indirected: NULL pointer");

    /* Calculate size in words for the data */
    wosize = (size + sizeof(value) - 1) / sizeof(value);

    /* Allocate: 1 unused + 1 marker + wosize for data = wosize + 2 */
    ret = caml_alloc(wosize + 2, Abstract_tag);
    Field(ret, 1) = (value)2;  /* Marker at Field 1 */
    memcpy((void*)&Field(ret, 2), src, size);  /* Data starts at Field 2 */

    CAMLreturn(ret);
}

/* ==================================================================== */
/* GIR record helpers                                                   */
/* ==================================================================== */

static void finalize_gir_record(value v) {
    void *ptr = *((void**)Data_custom_val(v));
    printf("[d] %p\n", (void*)v);
    if (ptr != NULL) g_free(ptr);
}

static struct custom_operations gir_record_custom_ops = {
    "lablgtk4.gir_record",
    finalize_gir_record,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default
};

CAMLexport value ml_gir_record_alloc(const void *src, size_t size, const char *type_name, void *(*copy_fn)(const void *)) {
    CAMLparam0();
    CAMLlocal1(v);

    (void)type_name;
    if (src == NULL) caml_failwith("ml_gir_record_alloc: NULL source");
    
    void *copy = NULL;
    if (copy_fn != NULL) {
        copy = copy_fn(src);
    } else {
        copy = g_memdup2(src, size);
    }
    if (copy == NULL) caml_failwith("ml_gir_record_alloc: allocation failed");
    
    v = caml_alloc_custom(&gir_record_custom_ops, sizeof(void*), 0, 1);
    *((void**)Data_custom_val(v)) = copy;
    
    printf("[a]  %s %p\n", type_name, copy);
    CAMLreturn(v);
}

CAMLexport void *ml_gir_record_ptr_val(value v, const char *type_name) {
    CAMLparam1(v);
    void *ptr;

    (void)type_name;

    if (Tag_val(v) == Custom_tag)
        ptr = *((void**)Data_custom_val(v));
    else
        ptr = ext_of_val(v);

    if (ptr == NULL)
        caml_failwith("ml_gir_record_ptr_val: NULL record pointer");

    CAMLreturnT(void*, ptr);
}

/* ==================================================================== */
/* GObject helpers with automatic reference counting                    */
/* ==================================================================== */

static void finalize_gobject(value v) {
    void *ptr = *((void**)Data_custom_val(v));
    if (ptr != NULL) {
        GObject* gobj = G_OBJECT(ptr);
        GType type = G_OBJECT_TYPE(gobj);
        g_object_unref(gobj);
        printf("[f][obj]  %s %p\n", g_type_name(type), ptr);
    }
}

static struct custom_operations gobject_custom_ops = {
    "lablgtk4.gobject",
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

CAMLexport void* ml_gobject_ext_of_val(const value val) {
    CAMLparam1(val);
    CAMLreturnT(void*, *((void**)Data_custom_val(val)));
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

/* Wrap a C pointer in an Abstract block for OCaml 5.0+ compatibility.
 * This prevents the GC from scanning C pointers as if they were heap values.
 * Layout: [header | unused | pointer]
 * Field 0: unused (for alignment)
 * Field 1: the actual C pointer
 */
CAMLexport value Val_pointer(void *ptr)
{
    CAMLparam0();
    CAMLlocal1(ret);
    ret = caml_alloc_small(2, Abstract_tag);
    Field(ret, 1) = (value)ptr;
    CAMLreturn(ret);
}

value val_of_ext(const void *widget) {
    CAMLparam0();
    CAMLlocal1(v);
    v = caml_alloc(1, Abstract_tag);
    *((void**)Data_abstract_val(v)) = widget;
    CAMLreturn(v);
}

void* ext_of_val(const value val) {
    CAMLparam1(val);
    CAMLreturnT(void*, *((void**)Data_abstract_val(val)));
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
