-------------------------------------------------------------------------------
--
-- This MobilityDB code is provided under The PostgreSQL License.
-- Copyright (c) 2016-2022, Université libre de Bruxelles and MobilityDB
-- contributors
--
-- MobilityDB includes portions of PostGIS version 3 source code released
-- under the GNU General Public License (GPLv2 or later).
-- Copyright (c) 2001-2022, PostGIS contributors
--
-- Permission to use, copy, modify, and distribute this software and its
-- documentation for any purpose, without fee, and without a written
-- agreement is hereby granted, provided that the above copyright notice and
-- this paragraph and the following two paragraphs appear in all copies.
--
-- IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
-- DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
-- LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
-- EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY
-- OF SUCH DAMAGE.
--
-- UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES,
-- INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
-- AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
-- AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO
-- PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS. 
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Tests for the span set data type.
-- File spanset.c
--------------------------------------------------------------------------------
-- Send/receive functions

COPY tbl_intspanset TO '/tmp/tbl_intspanset' (FORMAT BINARY);
DROP TABLE IF EXISTS tbl_intspanset_tmp;
CREATE TABLE tbl_intspanset_tmp AS TABLE tbl_intspanset WITH NO DATA;
COPY tbl_intspanset_tmp FROM '/tmp/tbl_intspanset' (FORMAT BINARY);
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset_tmp t2 WHERE t1.k = t2.k AND t1.i <> t2.i;
DROP TABLE tbl_intspanset_tmp;

COPY tbl_bigintspanset TO '/tmp/tbl_bigintspanset' (FORMAT BINARY);
DROP TABLE IF EXISTS tbl_bigintspanset_tmp;
CREATE TABLE tbl_bigintspanset_tmp AS TABLE tbl_bigintspanset WITH NO DATA;
COPY tbl_bigintspanset_tmp FROM '/tmp/tbl_bigintspanset' (FORMAT BINARY);
SELECT COUNT(*) FROM tbl_bigintspanset t1, tbl_bigintspanset_tmp t2 WHERE t1.k = t2.k AND t1.b <> t2.b;
DROP TABLE tbl_bigintspanset_tmp;

COPY tbl_floatspanset TO '/tmp/tbl_floatspanset' (FORMAT BINARY);
DROP TABLE IF EXISTS tbl_floatspanset_tmp;
CREATE TABLE tbl_floatspanset_tmp AS TABLE tbl_floatspanset WITH NO DATA;
COPY tbl_floatspanset_tmp FROM '/tmp/tbl_floatspanset' (FORMAT BINARY);
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset_tmp t2 WHERE t1.k = t2.k AND t1.f <> t2.f;
DROP TABLE tbl_floatspanset_tmp;

COPY tbl_periodset TO '/tmp/tbl_periodset' (FORMAT BINARY);
DROP TABLE IF EXISTS tbl_periodset_tmp;
CREATE TABLE tbl_periodset_tmp AS TABLE tbl_periodset WITH NO DATA;
COPY tbl_periodset_tmp FROM '/tmp/tbl_periodset' (FORMAT BINARY);
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset_tmp t2 WHERE t1.k = t2.k AND t1.ps <> t2.ps;
DROP TABLE tbl_periodset_tmp;

-- Input/output from/to WKB and HexWKB

SELECT COUNT(*) FROM tbl_intspanset WHERE intspansetFromBinary(asBinary(i)) <> i;
SELECT COUNT(*) FROM tbl_bigintspanset WHERE bigintspansetFromBinary(asBinary(b)) <> b;
SELECT COUNT(*) FROM tbl_floatspanset WHERE floatspansetFromBinary(asBinary(f)) <> f;
SELECT COUNT(*) FROM tbl_periodset WHERE periodsetFromBinary(asBinary(ps)) <> ps;

SELECT COUNT(*) FROM tbl_intspanset WHERE intspansetFromHexWKB(asHexWKB(i)) <> i;
SELECT COUNT(*) FROM tbl_bigintspanset WHERE bigintspansetFromHexWKB(asHexWKB(b)) <> b;
SELECT COUNT(*) FROM tbl_floatspanset WHERE floatspansetFromHexWKB(asHexWKB(f)) <> f;
SELECT COUNT(*) FROM tbl_periodset WHERE periodsetFromHexWKB(asHexWKB(ps)) <> ps;

-------------------------------------------------------------------------------
-- Casting
-------------------------------------------------------------------------------

SELECT MAX(lower(intspanset(i))) FROM tbl_intspan;
SELECT MAX(lower(floatspanset(f))) FROM tbl_floatspan;
SELECT MAX(lower(periodset(p))) FROM tbl_period;

SELECT MAX(lower(intspan(i))) FROM tbl_intspanset;
SELECT MAX(lower(floatspan(f))) FROM tbl_floatspanset;
SELECT MAX(lower(period(ps))) FROM tbl_periodset;

-------------------------------------------------------------------------------
-- Transformation Functions
-------------------------------------------------------------------------------

SELECT MAX(lower(round(f, 6))) FROM tbl_floatspanset;

-------------------------------------------------------------------------------
-- Accessor Functions
-------------------------------------------------------------------------------

SELECT MAX(memorySize(i)) FROM tbl_intspanset;
SELECT MAX(memorySize(f)) FROM tbl_floatspanset;
SELECT MAX(memorySize(ps)) FROM tbl_periodset;

SELECT MAX(storageSize(i)) FROM tbl_intspanset;
SELECT MAX(storageSize(f)) FROM tbl_floatspanset;
SELECT MAX(storageSize(ps)) FROM tbl_periodset;

SELECT MAX(lower(i)) FROM tbl_intspanset;
SELECT round(MAX(lower(f))::numeric, 6) FROM tbl_floatspanset;
SELECT MAX(lower(ps)) FROM tbl_periodset;

SELECT MAX(upper(i)) FROM tbl_intspanset;
SELECT round(MAX(upper(f))::numeric, 6) FROM tbl_floatspanset;
SELECT MAX(upper(ps)) FROM tbl_periodset;

SELECT DISTINCT lower_inc(i) FROM tbl_intspanset;
SELECT DISTINCT lower_inc(f) FROM tbl_floatspanset;
SELECT DISTINCT lower_inc(ps) FROM tbl_periodset;

SELECT DISTINCT upper_inc(i) FROM tbl_intspanset;
SELECT DISTINCT upper_inc(f) FROM tbl_floatspanset;
SELECT DISTINCT upper_inc(ps) FROM tbl_periodset;

SELECT MAX(width(i)) FROM tbl_intspanset;
SELECT MAX(width(f)) FROM tbl_floatspanset;

SELECT MAX(duration(ps)) FROM tbl_periodset;
SELECT MAX(timespan(ps)) FROM tbl_periodset;

SELECT MAX(numSpans(i)) FROM tbl_intspanset;
SELECT MAX(lower(startSpan(i))) FROM tbl_intspanset;
SELECT MAX(lower(endSpan(i))) FROM tbl_intspanset;
SELECT MAX(lower(spanN(i, 1))) FROM tbl_intspanset;
SELECT MAX(array_length(spans(i),1)) FROM tbl_intspanset;

SELECT MAX(numSpans(f)) FROM tbl_floatspanset;
SELECT MAX(lower(startSpan(f))) FROM tbl_floatspanset;
SELECT MAX(lower(endSpan(f))) FROM tbl_floatspanset;
SELECT MAX(lower(spanN(f, 1))) FROM tbl_floatspanset;
SELECT MAX(array_length(spans(f),1)) FROM tbl_floatspanset;

SELECT MAX(numPeriods(ps)) FROM tbl_periodset;
SELECT MAX(lower(startPeriod(ps))) FROM tbl_periodset;
SELECT MAX(lower(endPeriod(ps))) FROM tbl_periodset;
SELECT MAX(lower(periodN(ps, 1))) FROM tbl_periodset;
SELECT MAX(array_length(periods(ps),1)) FROM tbl_periodset;

SELECT MAX(numTimestamps(ps)) FROM tbl_periodset;
SELECT MAX(startTimestamp(ps)) FROM tbl_periodset;
SELECT MAX(endTimestamp(ps)) FROM tbl_periodset;
SELECT MAX(timestampN(ps, 0)) FROM tbl_periodset;
SELECT MAX((timestamps(ps))[1]) FROM tbl_periodset;

SELECT MAX(startTimestamp(shift(ps, '5 min'))) FROM tbl_periodset;

SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE intspanset_cmp(t1.i, t2.i) = -1;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i = t2.i;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i <> t2.i;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i < t2.i;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i <= t2.i;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i > t2.i;
SELECT COUNT(*) FROM tbl_intspanset t1, tbl_intspanset t2 WHERE t1.i >= t2.i;

SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE floatspanset_cmp(t1.f, t2.f) = -1;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f = t2.f;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f <> t2.f;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f < t2.f;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f <= t2.f;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f > t2.f;
SELECT COUNT(*) FROM tbl_floatspanset t1, tbl_floatspanset t2 WHERE t1.f >= t2.f;

SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE periodset_cmp(t1.ps, t2.ps) = -1;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps = t2.ps;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps <> t2.ps;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps < t2.ps;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps <= t2.ps;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps > t2.ps;
SELECT COUNT(*) FROM tbl_periodset t1, tbl_periodset t2 WHERE t1.ps >= t2.ps;

SELECT MAX(periodset_hash(ps)) != 0 FROM tbl_periodset;
SELECT MAX(periodset_hash_extended(ps, 1)) != 0 FROM tbl_periodset;

-------------------------------------------------------------------------------
