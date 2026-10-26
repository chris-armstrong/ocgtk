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

#ifndef OCGTK_VALUE_KINDS_H
#define OCGTK_VALUE_KINDS_H

#include <assert.h>
#include <caml/custom.h>
#include <caml/mlvalues.h>

/* Stable custom_operations structs — one per OCaml-visible FFI kind.
 * Pointer identity (Custom_ops_val(v) == &ocgtk_<kind>_ops) is the
 * canonical discriminator; it is faster and stronger than string
 * comparison and sufficient because ocgtk has no dynamic loading. */
extern struct custom_operations ocgtk_gobject_ops;       /* "ocgtk.gobject"       */
extern struct custom_operations ocgtk_gir_record_ops;    /* "ocgtk.gir_record"    */
extern struct custom_operations ocgtk_gvariant_ops;      /* "ocgtk.gvariant"      */
extern struct custom_operations ocgtk_gvariant_type_ops; /* "ocgtk.gvariant_type" */
extern struct custom_operations ocgtk_gbytes_ops;        /* "ocgtk.gbytes"        */
extern struct custom_operations ocgtk_gvalue_ops;        /* "ocgtk.gvalue"        */
extern struct custom_operations ocgtk_gclosure_ops;      /* "ocgtk.gclosure"      */

typedef enum {
    OCGTK_KIND_INT,            /* Is_long(v) */
    OCGTK_KIND_GOBJECT,
    OCGTK_KIND_GIR_RECORD,
    OCGTK_KIND_GVARIANT,
    OCGTK_KIND_GVARIANT_TYPE,
    OCGTK_KIND_GBYTES,
    OCGTK_KIND_GVALUE,
    OCGTK_KIND_GCLOSURE,
    OCGTK_KIND_OPAQUE_BLOCK    /* a heap block that is not one of ours */
} ocgtk_kind;

/* Classify an arbitrary OCaml value.
 * INT is fast-pathed via Is_long; other kinds dispatch on
 * Custom_ops_val pointer identity against the seven registered ops
 * structs above. Safe to call on any value without crashing. */
ocgtk_kind ocgtk_classify(value v);

/* Asserting accessor: confirm that [v] is a Custom block with the
 * given ops struct. In NDEBUG builds the assertion compiles away;
 * the load is the same single pointer comparison as today. */
#define OCGTK_ASSERT_OPS(v, ops_ptr) \
    assert(Tag_val(v) == Custom_tag && Custom_ops_val(v) == &(ops_ptr))

#endif /* OCGTK_VALUE_KINDS_H */
