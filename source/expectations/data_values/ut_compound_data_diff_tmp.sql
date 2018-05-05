create global temporary table ut_compound_data_diff_tmp(
  /*
  utPLSQL - Version 3
  Copyright 2016 - 2017 utPLSQL Project
  Licensed under the Apache License, Version 2.0 (the "License"):
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
      http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */
  diff_id    raw(128),
  item_no    integer,
  item_hash  raw(128),
  duplicate_no integer,
  constraint ut_compound_data_diff_tmp_uk1 unique (diff_id, item_no, item_hash, duplicate_no),
  constraint ut_compound_data_diff_tmp_chk check(
   item_no is not null and item_hash is null and duplicate_no is null
   or item_no is null and item_hash is not null and duplicate_no is not null
   )
) on commit preserve rows;
