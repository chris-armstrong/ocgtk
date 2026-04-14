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

/* GBytes C bindings for ocgtk
 *
 * Implements an opaque OCaml wrapper for GBytes (GLib's immutable
 * reference-counted byte buffer).
 */

#include <string.h>
#include <glib.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include "wrappers.h"

/* ==================================================================== */
/* GBytes custom block with reference counting                          */
/* ==================================================================== */

static void finalize_gbytes(value v) {
    GBytes *bytes = GBytes_val(v);
    if (bytes != NULL) {
        g_bytes_unref(bytes);
    }
}

static int compare_gbytes(value v1, value v2) {
    return g_bytes_compare(GBytes_val(v1), GBytes_val(v2));
}

static intnat hash_gbytes(value v) {
    return (intnat)g_bytes_hash(GBytes_val(v));
}

static struct custom_operations gbytes_custom_ops = {
    "ocgtk.gbytes",
    finalize_gbytes,
    compare_gbytes,
    hash_gbytes,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

/* Val_GBytes: wrap a GBytes pointer, taking a reference.
 *
 * Ownership rules:
 *   transfer-full return  -> pass directly: Val_GBytes(result)
 *   transfer-none return  -> caller must ref first: Val_GBytes(g_bytes_ref(result))
 */
CAMLexport value Val_GBytes(GBytes *bytes) {
    CAMLparam0();
    CAMLlocal1(result);

    if (bytes == NULL) {
        caml_failwith("Val_GBytes: NULL bytes");
    }

    result = caml_alloc_custom(&gbytes_custom_ops, sizeof(GBytes*), 0, 1);
    *((GBytes**)Data_custom_val(result)) = bytes;

    CAMLreturn(result);
}

/* ==================================================================== */
/* ml_g_bytes_new: create GBytes from OCaml string                     */
/* ==================================================================== */

/* GC safety: read string data and length BEFORE any OCaml allocation.
 * g_bytes_new copies the data (pure C allocation, no GC), so ml_str
 * may be moved by GC only after g_bytes_new returns safely.
 */
CAMLprim value ml_g_bytes_new(value ml_str) {
    CAMLparam1(ml_str);
    CAMLlocal1(result);

    /* Read string data before any allocation */
    const char *data = String_val(ml_str);
    mlsize_t len = caml_string_length(ml_str);

    /* g_bytes_new copies the data - pure C allocation, no OCaml GC */
    GBytes *bytes = g_bytes_new(data, (gsize)len);

    /* Now allocate the custom block - takes ownership, no extra ref needed */
    result = caml_alloc_custom(&gbytes_custom_ops, sizeof(GBytes*), 0, 1);
    *((GBytes**)Data_custom_val(result)) = bytes;

    CAMLreturn(result);
}

/* ==================================================================== */
/* ml_g_bytes_get_data_as_string: copy GBytes data to OCaml string     */
/* ==================================================================== */

/* GC safety: call g_bytes_get_data first (no OCaml alloc), then
 * caml_alloc_string (may trigger GC), then memcpy.
 * The data pointer from g_bytes_get_data is stable because GBytes is
 * immutable and ref-counted - the GC will not touch it.
 */
CAMLprim value ml_g_bytes_get_data_as_string(value ml_bytes) {
    CAMLparam1(ml_bytes);
    CAMLlocal1(result);

    GBytes *bytes = GBytes_val(ml_bytes);
    gsize size;
    const void *data = g_bytes_get_data(bytes, &size);

    result = caml_alloc_string(size);
    if (size > 0) {
        memcpy(Bytes_val(result), data, size);
    }

    CAMLreturn(result);
}

/* ==================================================================== */
/* ml_g_bytes_get_size: get size of GBytes                             */
/* ==================================================================== */

CAMLprim value ml_g_bytes_get_size(value ml_bytes) {
    CAMLparam1(ml_bytes);
    GBytes *bytes = GBytes_val(ml_bytes);
    gsize size = g_bytes_get_size(bytes);
    CAMLreturn(Val_long((long)size));
}
