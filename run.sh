#! /usr/bin/env bash

datasets=/Users/jonny/data-sets

# Q1 Which state has the lowest murder rate?

states=$datasets/misc/states.tab.gz

ansQ1=$(gzcat $states \
    | sort -k6,6g \
    | grep -v "^#" \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g;s/_/ /')

echo "answer-1:" $ansQ1   

# for future questions add >> to append not rewrite the answers.yml file
# each time; also the answers.yml file is in data-sets

# Question 1 Which state in states.tab.gz has the lowest murder rate?

# Question 2 How many sequence records are in the sample.fa file?

fasta=$datasets/fasta/sample.fa

ansQ2=$(cat $fasta \
    | grep "^>" \
    | wc -l)

echo "answer-2:" $ansQ2


# Question 3 How many unique CpG IDs are in cpg.bed.gz?

cpgid=$datasets/bed/cpg.bed.gz

ansQ3=$(gzcat $cpgid \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l)

echo "answer-3:" $ansQ3

# Question 4 How many sequence records are in the SP1.fq file?

seqrec=$datasets/fastq/SP1.fq

ansQ4=$(cat $seqrec \
    | grep "^@cluster" \
    | wc -l)

echo "answer-4:" $ansQ4

#Question 5 How many words are on lines containing the word bloody in hamlet.txt?
#(Hint: use wc to count words).

hamlet=$datasets/misc/hamlet.txt

ansQ5=$(cat $hamlet \
    | grep -i bloody \
    | wc -w)

echo "answer-5:" $ansQ5

#Question 6 What is the length of the sequence in the first record of sample.fa?
#(Hint: use wc to count characters).

ansQ6=$(cat $fasta \
    | grep -v "^>" \
    | head -n1 \
    | tr -d '\n\r'\
    | wc -c)

echo "answer-6:" $ansQ6


#Question 7 What is the name of the longest gene in genes.hg19.bed.gz?

genes=$datasets/bed/genes.hg19.bed.gz

ansQ7=$(gzcat $genes \
    | awk '{print $4, $3 - $2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d ' ')

echo "answer-7:" $ansQ7

#Question 8 How many unique chromosomes are in genes.hg19.bed.gz?

ansQ8=$(gzcat $genes \
    | cut -f1 \
    | uniq \
    | wc -l)

echo "answer-8:" $ansQ8

#Question 9 How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?

peaks=$datasets/bed/peaks.chr22.bed.gz

ansQ9=$(gzcat $peaks \
    | grep "CTCF" \
    | grep -v "CTCFL" \
    | wc -l)

echo "answer-9:" $ansQ9

#Question 10 On what chromosome is the largest interval in lamina.bed?

lamina=$datasets/bed/lamina.bed

ansQ10=$( cat $lamina \
    | awk 'BEGIN {OFS="\t"} {print $1, $3-$2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1)

echo "answer-10:" $ansQ10
