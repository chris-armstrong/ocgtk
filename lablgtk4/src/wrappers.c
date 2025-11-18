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

CAMLexport value ml_lookup_from_c (value table_val, value data_val)
{
    CAMLparam2(table_val, data_val);
    const lookup_info *table = Lookup_info_val(table_val);
    int data = Int_val(data_val);
    int i;
    for (i = table[0].data; i > 0; i--)
	if (table[i].data == data) CAMLreturn(table[i].key);
    caml_invalid_argument ("ml_lookup_from_c");
}

CAMLexport value ml_lookup_to_c (value table_val, value key)
{
    CAMLparam2(table_val, key);
    const lookup_info *table = Lookup_info_val(table_val);
    int first = 1, last = table[0].data, current;
    while (first < last) {
	/* Avoid integer overflow in midpoint calculation */
	current = first + (last - first) / 2;
	if (table[current].key >= key) last = current;
	else first = current + 1;
    }
    if (table[first].key == key) CAMLreturn(Val_int(table[first].data));
    caml_invalid_argument ("ml_lookup_to_c");
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

value val_of_ext(void *widget) {
    CAMLparam0();
    CAMLlocal1(v);
    v = caml_alloc(1, Abstract_tag);
    *((void**)Data_abstract_val(v)) = widget;
    CAMLreturn(v);
}

void* ext_of_val(value val) {
    CAMLparam1(val);
    CAMLreturnT(void*, *((void**)Data_abstract_val(val)));
}
