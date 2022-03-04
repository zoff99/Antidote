// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

/*
 * Tri-planar 30x30 YUV stream but backwards
 * (negative strides)
 */

uint8_t test_backwards_3p_y[] = {
    186, 173, 174, 174, 203, 211, 196, 188, 188, 182, 168, 203, 171, 180, 210, 194, 190, 173, 179, 194, 191, 160, 125, 129, 171, 146,  76,  61, 128, 205,
    214, 188, 184, 204, 211, 182, 208, 208, 181, 180, 176, 200, 168, 181, 188, 211, 194, 181, 168, 145, 154, 181, 195, 208, 207, 206, 198, 148,  86, 112,
    213, 211, 211, 209, 184, 181, 195, 196, 194, 179, 176, 196, 172, 155, 187, 211, 201, 167, 163, 176, 204, 206, 206, 206, 206, 205, 204, 203, 203, 147,
    202, 209, 208, 203, 190, 190, 180, 182, 199, 174, 176, 197, 160, 146, 193, 200, 167, 185, 204, 204, 204, 204, 205, 205, 205, 203, 203, 202, 201, 201,
    207, 208, 207, 206, 194, 182, 185, 186, 194, 171, 175, 203, 161, 148, 208, 171, 166, 203, 203, 203, 203, 197, 184, 186, 189, 189, 186, 188, 197, 201,
    209, 201, 200, 205, 203, 189, 187, 193, 201, 174, 171, 202, 157, 160, 208, 176, 199, 202, 202, 202, 202, 195, 183, 194, 198, 196, 189, 182, 178, 192,
    195, 191, 193, 195, 204, 203, 196, 197, 201, 183, 171, 200, 153, 165, 207, 183, 196, 196, 195, 201, 202, 202, 202, 202, 201, 201, 200, 199, 198, 199,
    194, 195, 196, 196, 198, 203, 202, 200, 201, 180, 168, 200, 153, 177, 198, 175, 170, 167, 168, 179, 200, 201, 202, 202, 201, 200, 199, 198, 181, 176,
    202, 201, 201, 202, 201, 200, 201, 201, 201, 178, 165, 200, 160, 168, 199, 188, 167, 173, 173, 186, 198, 201, 198, 183, 197, 200, 199, 198, 172, 157,
    207, 204,  59, 203,  58, 201, 201, 201, 200, 187, 173, 200, 146, 153, 207, 160, 172, 199, 179, 198, 200, 201, 197, 184, 198, 200, 199, 198, 198, 188,
    208, 205, 204, 203, 203, 202, 201, 200, 200, 189, 188, 174, 125, 138, 187, 156, 170, 192, 166, 191, 200, 201, 201, 201, 200, 199, 199, 198, 198, 196,
    208, 205,  59, 203,  57, 202, 201, 201, 195, 161, 178, 181, 150, 131, 190, 171, 168, 178, 145, 179, 195, 199, 200, 199, 199, 199, 197, 196, 193, 169,
    207, 204,  58, 203,  56, 201, 200, 200, 185, 146, 182, 193, 132, 185, 206, 146, 174, 178,  85,  75, 147, 203, 204, 204, 203, 201, 201, 202, 186, 130,
    209, 206,  60, 204,  58, 203, 202, 201, 176, 157, 200, 181, 137, 198, 200, 154, 160, 106,  61,  60, 136, 206, 206, 207, 207, 204, 205, 198, 199,  94,
    216, 212, 213, 212, 210, 211, 210, 208, 182, 168, 208, 179, 158, 206, 181, 148, 179,  66,  69, 129, 200, 208, 207, 209, 208, 202, 167, 170, 148,  62,
    209, 205,  60, 203, 203,  57, 201, 200, 174, 166, 200, 177, 177, 202, 196, 113, 180, 120,  56, 109, 201, 201, 201, 202, 193, 166, 133, 184, 160,  65,
    207, 204,  58, 202,  57, 200, 195, 191, 182, 189, 198, 188, 194, 201, 207, 137, 117, 159, 122,  91, 165, 200, 198, 165, 171, 182, 158, 162, 215, 116,
    208, 204,  58,  57, 202, 201, 188, 177, 179, 198, 199, 198, 200, 200, 196, 196, 165, 126, 147, 140, 171, 200, 169, 139, 197, 200, 151, 164, 151, 132,
    208, 204,  58, 203,  57, 201, 194, 184, 169, 185, 199, 192, 197, 202, 207, 200, 185, 190, 187, 200, 200, 200, 147, 168, 200, 187, 154, 180, 162, 107,
    208, 204,  59, 203, 202,  56, 196, 179, 172, 186, 199, 187, 191, 201, 207, 206, 178, 180, 200, 200, 200, 182, 148, 190, 200, 173, 154, 194, 168, 159,
    208, 204, 203, 203, 202, 201, 197, 184, 177, 190, 199, 192, 192, 201, 207, 199, 189, 174, 196, 200, 194, 161, 177, 201, 199, 178, 181, 192, 158, 180,
    207, 204, 203,  57,  56, 201, 200, 192, 178, 169, 199, 198, 201, 203, 207, 201, 184, 165, 172, 194, 179, 170, 196, 201, 198, 192, 200, 171, 178, 199,
    207, 204,  58, 203, 202,  56, 200, 185, 193, 176, 185, 198, 200, 200, 206, 205, 198, 181, 163, 184, 175, 193, 200, 201, 198, 196, 198, 159, 184, 183,
    208, 204,  59, 203, 202,  56, 201, 194, 185, 199, 190, 199, 201, 202, 207, 206, 197, 200, 179, 174, 180, 201, 201, 201, 200, 201, 193, 167, 188, 171,
    208, 205,  58, 203, 202,  56, 200, 200, 181, 186, 199, 199, 202, 203, 208, 207, 197, 200, 189, 155, 187, 201, 201, 202, 201, 201, 187, 171, 199, 188,
    208, 204,  59, 202, 202,  56, 200, 200, 195, 169, 193, 199, 200, 199, 206, 206, 198, 200, 201, 154, 174, 201, 202, 202, 202, 201, 192, 184, 200, 196,
    207, 203, 202,  56,  56, 200, 199, 199, 199, 181, 184, 197, 199, 202, 206, 205, 196, 199, 199, 183, 182, 200, 201, 202, 201, 200, 195, 195, 199, 200,
    205, 201, 200, 199, 199, 198, 198, 197, 196, 192, 178, 195, 198, 201, 205, 204, 191, 195, 198, 198, 199, 199, 199, 200, 200, 200, 190, 191, 198, 200,
    200, 199, 199, 198, 198, 196, 196, 195, 195, 195, 180, 179, 196, 198, 204, 201, 209, 210, 194, 197, 197, 198, 199, 199, 199, 199, 181, 187, 198, 197,
    204, 201, 199, 198, 197, 197, 196, 196, 195, 195, 194, 176, 189, 191, 206, 206, 204, 206, 195, 197, 198, 199, 199, 200, 200, 200, 187, 193, 199, 199,
};

uint8_t test_backwards_3p_u[] = {
    99,  99,  99, 101, 105, 110, 117, 124, 130, 137, 144, 151, 153, 154, 155,
    100, 101, 101, 102, 107, 112, 118, 125, 131, 139, 146, 152, 155, 156, 156,
    101, 101, 102, 103, 107, 112, 120, 127, 134, 140, 147, 154, 156, 157, 157,
    101, 102, 102, 103, 108, 113, 120, 127, 134, 141, 148, 155, 157, 158, 158,
    101, 102, 102, 103, 108, 114, 120, 127, 134, 141, 148, 155, 158, 158, 158,
    101, 101, 102, 103, 108, 113, 120, 127, 134, 142, 148, 156, 158, 159, 159,
    101, 102, 102, 103, 107, 114, 120, 127, 134, 140, 146, 153, 155, 155, 157,
    103, 104, 104, 105, 109, 114, 121, 127, 134, 141, 147, 153, 155, 156, 151,
    101, 100, 101, 103, 107, 113, 120, 127, 134, 141, 148, 155, 158, 158, 156,
    101, 101, 102, 102, 107, 114, 120, 128, 135, 141, 148, 155, 157, 158, 159,
    101, 101, 101, 103, 108, 114, 121, 127, 134, 141, 148, 155, 157, 158, 158,
    101, 101, 101, 103, 108, 114, 121, 127, 134, 141, 148, 155, 157, 158, 158,
    102, 102, 102, 103, 108, 113, 121, 127, 134, 141, 148, 155, 157, 157, 158,
    103, 103, 103, 104, 109, 115, 122, 128, 136, 142, 149, 156, 157, 158, 158,
    104, 105, 105, 106, 111, 117, 124, 130, 135, 143, 150, 156, 158, 158, 158,
};

uint8_t test_backwards_3p_v[] = {
    90,  91,  91,  92,  92,  93,  92,  97,  93,  94,  95,  95,  96,  97,  98,
    92,  92,  94,  94,  94,  95,  94,  99,  94,  95,  96,  96,  97,  98,  99,
    95,  95,  96,  97,  98,  97,  97, 102,  98,  98,  99,  99, 100, 101, 103,
    100, 101, 101, 103, 103, 103, 103, 106, 103, 104, 103, 104, 105, 105, 107,
    105, 106, 108, 108, 109, 109, 109, 111, 109, 109, 110, 110, 110, 112, 112,
    112, 113, 114, 115, 116, 116, 115, 117, 115, 116, 116, 116, 117, 118, 118,
    119, 120, 121, 122, 122, 122, 123, 123, 123, 123, 123, 122, 124, 124, 125,
    126, 127, 128, 129, 129, 129, 129, 129, 129, 129, 129, 129, 129, 131, 131,
    132, 133, 135, 135, 136, 136, 136, 135, 136, 136, 136, 136, 137, 137, 137,
    139, 140, 141, 142, 143, 143, 142, 141, 143, 143, 143, 142, 143, 144, 145,
    145, 147, 148, 149, 150, 150, 149, 147, 150, 150, 150, 149, 150, 151, 151,
    152, 154, 155, 156, 157, 157, 156, 153, 157, 156, 156, 155, 157, 157, 158,
    159, 161, 162, 163, 164, 164, 162, 159, 165, 163, 163, 163, 163, 164, 164,
    163, 164, 165, 167, 167, 167, 166, 162, 169, 167, 166, 165, 166, 166, 166,
    164, 166, 167, 168, 168, 169, 169, 162, 160, 168, 167, 166, 166, 166, 167,
};
