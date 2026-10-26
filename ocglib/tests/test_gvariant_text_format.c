/**************************************************************************
 * test_gvariant_text_format.c - Verify GVariant text format syntax
 *
 * This program tests g_variant_parse() with various text format strings
 * to document what syntax GLib actually accepts vs rejects.
 *
 * KEY FINDINGS (GLib 2.80+):
 * ==========================
 *
 * 1. Pass NULL for type parameter, NOT G_VARIANT_TYPE_ANY
 *    Wrong: g_variant_parse(G_VARIANT_TYPE_ANY, ...)
 *    Right: g_variant_parse(NULL, ...)
 *
 * 2. Dictionary syntax: {'key': <value>} or {'key': 'value'}
 *    - Keys are single-quoted strings
 *    - Values in angle brackets create a{sv} (variant dict)
 *    - Bare string values work too: {'key': 'value'} → a{ss}
 *
 * 3. Large integers need explicit int64 annotation:
 *    - 12345 → int32 (i)
 *    - 12345678901234 → FAILS (overflows int32)
 *    - int64 12345678901234 → int64 (x)
 *
 * 4. Empty containers need type annotation:
 *    - [] → FAILS (can't infer type)
 *    - @as [] → empty string array
 *    - {} → FAILS (can't infer type)
 *    - @a{sv} {} → empty variant dict
 *
 * 5. String quoting is flexible:
 *    - "double quotes" → s
 *    - 'single quotes' → s (output uses single quotes)
 *
 * 6. Variant syntax <value> works with any type:
 *    - <42> → v (containing int32)
 *    - <"hello"> → v (containing string)
 *    - <(1, 2)> → v (containing tuple)
 *
 * Compile with:
 *   gcc -o test_gvariant_text_format test_gvariant_text_format.c \
 *       `pkg-config --cflags --libs glib-2.0`
 *
 * Run:
 *   ./test_gvariant_text_format
 *************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <glib.h>

typedef struct {
    const char *name;
    const char *text;
    int expected_success;  /* 1 = should parse, 0 = should fail */
} TestCase;

static void test_parse(const char *name, const char *text, int expected_success) {
    GError *error = NULL;
    GVariant *v;
    
    /* Pass NULL for type to allow any type */
    v = g_variant_parse(NULL, text, NULL, NULL, &error);
    
    int success = (v != NULL);
    const char *status = success ? "PASS" : "FAIL";
    const char *expect = expected_success ? "expected success" : "expected failure";
    
    if (success == expected_success) {
        printf("[OK] %-40s %s (%s)\n", name, status, expect);
        if (v) {
            gchar *printed = g_variant_print(v, FALSE);
            printf("     Input:  %s\n", text);
            printf("     Type:   %s\n", g_variant_get_type_string(v));
            printf("     Output: %s\n", printed);
            g_free(printed);
            g_variant_unref(v);
        }
    } else {
        printf("[UNEXPECTED] %-40s got %s but %s\n", name, status, expect);
        printf("     Input: %s\n", text);
        if (error) {
            printf("     Error: %s\n", error->message);
            g_error_free(error);
        }
        if (v) g_variant_unref(v);
    }
    
    printf("\n");
}

int main(int argc, char **argv) {
    (void)argc;
    (void)argv;
    
    printf("=== GVariant Text Format Verification ===\n\n");
    
    /* Basic scalar types */
    printf("--- Basic Scalars ---\n");
    test_parse("boolean true", "true", 1);
    test_parse("boolean false", "false", 1);
    test_parse("int32 positive", "42", 1);
    test_parse("int32 negative", "-42", 1);
    test_parse("int64", "12345678901234", 1);
    test_parse("double", "3.14159", 1);
    test_parse("string simple", "\"hello world\"", 1);
    test_parse("string empty", "\"\"", 1);
    test_parse("string with escapes", "\"hello\\nworld\"", 1);
    
    /* Arrays */
    printf("\n--- Arrays ---\n");
    test_parse("array of int32", "[1, 2, 3]", 1);
    test_parse("array of strings", "[\"a\", \"b\", \"c\"]", 1);
    test_parse("empty array", "[]", 1);
    test_parse("nested arrays", "[[1, 2], [3, 4]]", 1);
    
    /* Tuples */
    printf("\n--- Tuples ---\n");
    test_parse("simple tuple", "(1, 2, 3)", 1);
    test_parse("mixed tuple", "(1, \"hello\", true)", 1);
    test_parse("empty tuple", "()", 1);
    test_parse("single element tuple", "(42,)", 1);
    test_parse("nested tuples", "((1, 2), (3, 4))", 1);
    
    /* Dictionaries (a{sv} pattern) */
    printf("\n--- Dictionaries (a{{sv}} pattern) ---\n");
    test_parse("empty dict", "{}", 1);
    test_parse("dict string values", "{'name': <'John'>, 'city': <'NYC'>}", 1);
    test_parse("dict int32 values", "{'count': <42>, 'size': <100>}", 1);
    test_parse("dict bool values", "{'enabled': <true>}", 1);
    test_parse("dict mixed values", "{'name': <'John'>, 'count': <42>}", 1);
    test_parse("dict nested variant", "{'data': <{'nested': <1>}>, 'other': <2>}", 1);
    
    /* Variants (boxed values with type) */
    printf("\n--- Variants (< > syntax) ---\n");
    test_parse("variant int32", "<42>", 1);
    test_parse("variant string", "<'hello'>", 1);
    test_parse("variant bool", "<true>", 1);
    test_parse("variant tuple", "<(1, 2, 3)>", 1);
    test_parse("variant array", "<[1, 2, 3]>", 1);
    
    /* Complex nested structures */
    printf("\n--- Complex Nested Structures ---\n");
    test_parse("array of dicts", "[{'a': <1>}, {'b': <2>}]", 1);
    test_parse("tuple with dict", "(1, {'key': <'value'>}, 3)", 1);
    test_parse("dict with array", "{'items': <[1, 2, 3]>}", 1);
    
    /* Edge cases that might fail */
    printf("\n--- Edge Cases (likely failures) ---\n");
    test_parse("unquoted string", "hello", 0);
    test_parse("single quotes", "'hello'", 0);
    test_parse("dict without angle brackets", "{'key': 'value'}", 0);
    test_parse("variant with double quotes", "<\"hello\">", 0);
    test_parse("tuple trailing comma", "(1, 2,)", 0);
    
    printf("=== Test Complete ===\n");
    return 0;
}
