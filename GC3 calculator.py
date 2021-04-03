import os
import io
import glob
import re
from Bio.Seq import Seq

from Bio.SeqUtils import GC123
import pandas as pd


# This function extracts the genome sequence block at the end of the annotation
def extract_seq(file_path):
    with open(file_path) as file:
        genome_sequence = str()
        # True runs forever
        while True:
            # skips lines, if the line starts with origin, it stops, leaving us a line after
            line = file.readline()
            if line.startswith("ORIGIN"):
                break
        for line in file.readlines():
            # replace spaces with nothing
            line = line.replace(" ", "")
            # starts at 0, continues until the end of the line (genome sequence)
            for i in range(0, len(line)):
                # checks if chararacters are actg
                if line[i] in "actg":
                    genome_sequence += (line[i])
    return genome_sequence


end_file = "/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/GC3 and tRNA GC of trio/tRNA"

#This extracts the genes using start and stop positions from the main sequence
def extract_genes2(SSL_list, genome_sequence, id):
    gc3_list = []
    item = []
    for item in SSL_list:
        is_complement = item.pop()
        gene = []
        for i in range(0, len(item), 2):
            start = item[i]
            stop = item[i+1]
            # extracts start:stop gene from the sequence
            if start > stop:
                substring = genome_sequence[start-1:stop]
            else:
                substring = genome_sequence[start-1:stop]
            gene.append(substring)
        gene_substring = "".join(gene)
        if is_complement:
            gene_substring = complement(gene_substring)
        if len(gene_substring) == 0:
            print(f"problem gene: {id}")
            exit(1)

        gc3 = GC123(gene_substring)[3]
        gc3_list.append(gc3)
    return gc3_list

#This calculates the reverse/complement of genes
def complement(seq):
    my_dna = Seq(seq)
    return str(my_dna.reverse_complement())


p = re.compile('\d+')  # \d means digit and + means one or more

#Extracts CDS from the annotation and corrects complement sequences
def extract_CDS(path):
    with io.open(path, mode="r", encoding="utf-8") as file:
        cds_list = []
        genome = file.readlines()
        for line in genome:
            if "CDS " in line[0:21]:
                m = p.findall(line)
                assert len(m) % 2 == 0, line
                m = [int(x) for x in m]
                is_complement = "complement" in line
                cds_list.append(m + [is_complement])
            if line.startswith("//"):
                break
    return cds_list


GC3_list = list()
ID_list = list()

#Apply the functions
genome_dir = "/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/problem"
for path in glob.glob(os.path.join(genome_dir, "*.gbff")):
    print(path)
    SSL_list2 = extract_CDS(path)
    sequences = extract_seq(path)
    id = os.path.splitext(os.path.basename(path))[0]
    gc3_list = extract_genes2(SSL_list2, sequences, id)

    GC3_list += gc3_list
    ID_list += len(gc3_list) * [id]

#Write results to a CSV
df = pd.DataFrame({'ID': ID_list, 'mean GC3 %': GC3_list})
df = df.groupby('ID', as_index=False)['mean GC3 %'].mean()
df.to_csv(
    r'/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/GC3 and tRNA GC of trio/GC3_trio.csv',
    index=False)
print(df)