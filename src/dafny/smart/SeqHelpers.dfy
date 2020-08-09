/*
 * Copyright 2020 ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may 
 * not use this file except in compliance with the License. You may obtain 
 * a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software dis-
 * tributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
 * License for the specific language governing permissions and limitations 
 * under the License.
 */

/**
 *  Provide useful lemmas on sequences.
 */
module SeqHelpers {

    /** 
     *  Concatenation is associative and length sums up.
     */
    lemma seqAssoc<T>(a: seq<T>, b : seq<T>, c: seq<T>) 
        ensures a + b + c == (a + b) + c == a + (b + c) == (a + b + c)
        ensures |a + b + c| == |a| + |b| + |c|
    {}

     /**
     *  Split of sequences.
     */
    lemma splitSeq<T>(s: seq<T>, t: seq<T>, u : seq<T>)
        requires s == t + u
        ensures s[..|t|] == t
        ensures s[|t|..] == u
    {   //  Thanks Dafny 
    }

    /**
     *  Prefixes of tail of sequence are slices 1.. 
     */
    lemma prefixOfSuffix<T>(s : seq<T>, i : nat)
        requires 1 <= i < |s|
        ensures s[1..][..i] == s[1..i + 1]
    {} 


}