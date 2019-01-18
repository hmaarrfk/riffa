// ----------------------------------------------------------------------
// Copyright (c) 2016, The Regents of the University of California All
// rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
// 
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
// 
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
// 
//     * Neither the name of The Regents of the University of California
//       nor the names of its contributors may be used to endorse or
//       promote products derived from this software without specific
//       prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL REGENTS OF THE
// UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
// OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
// TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
// USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
// DAMAGE.
// ----------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			functions.vh
// Version:				1.00
// Verilog Standard:	Verilog-2005
// Description:         A simple file containing clog2 function declarations
// Author:				Dustin Richmond (@darichmond)
//-----------------------------------------------------------------------------
`ifndef __FUNCTIONS_VH
`define __FUNCTIONS_VH 1
// `clog2s -- calculate the ceiling log2 value, min return is 1 (safe).
// adapted from
// https://stackoverflow.com/questions/5269634/address-width-from-ram-depth
`define clog2s(x) \
   (x <= 2) ? 1 : \
   (x <= 4) ? 2 : \
   (x <= 8) ? 3 : \
   (x <= 16) ? 4 : \
   (x <= 32) ? 5 : \
   (x <= 64) ? 6 : \
   (x <= 128) ? 7 : \
   (x <= 256) ? 8 : \
   (x <= 512) ? 9 : \
   (x <= 1024) ? 10 : \
   (x <= 2048) ? 11 : \
   (x <= 4096) ? 12 : \
   (x <= 8192) ? 13 : \
   (x <= 2**14) ? 14 : \
   (x <= 2**15) ? 15 : \
   (x <= 2**16) ? 16 : \
   (x <= 2**17) ? 17 : \
   (x <= 2**18) ? 18 : \
   (x <= 2**19) ? 19 : \
   (x <= 2**20) ? 20 : \
   (x <= 2**21) ? 21 : \
   (x <= 2**22) ? 22 : \
   (x <= 2**23) ? 23 : \
   (x <= 2**24) ? 24 : \
   (x <= 2**25) ? 25 : \
   (x <= 2**26) ? 26 : \
   (x <= 2**27) ? 27 : \
   (x <= 2**28) ? 28 : \
   (x <= 2**29) ? 29 : \
   (x <= 2**30) ? 30 : \
   (x <= 2**31) ? 31 : \
   (x <= 2**32) ? 32 : \
   (x <= 2**33) ? 33 : \
   (x <= 2**34) ? 34 : \
   -1

`endif
